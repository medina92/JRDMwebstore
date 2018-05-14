import java.sql.*;
import java.io.*;
import java.util.*;

/* SP data loader :
 *  The data for S, P, SP table are stored in sp_data.txt with the following format:
 Table name| S | 4
 s6|  Wang|           99| Bakersfield
 .....

 TABLENAME| P | 5
 p1|  Nut|            Red|       12| London
 ....

 TABLENAME| SP | 3
 s6| p6|  6
 ....

 The word "Table Name" or "TableName"  can be in any cases, and must
 not be preceeded by any other non white space letter.

 To insert Date, Time and Timestamp data, the following methods can be used:
 1. The Date, Time and Timestamp string should have the following
 format in your data file:
Date:		yyyy-mm-dd
Time:		hh:mm:ss
Timestamp:	yyyy-mm-dd hh:mm:dd.ffffffffff
where ffffffffff is nano seconds
2. Use Date, Time and Timestamp's static valueOf():
static Date valueOf( String dateString); 
static Time valueOf( String timeString); 
static Timestamp valueOf( String timestampString); 
to convert a date/time/timestamp string to a date, time or
a timestamp object, and then
3. Use the PreparedStatement's set functions to set the parameter:
preparedStmt.setDate( i, dateObject);
preparedStmt.setTime( i, timeObject);
preparedStmt.setTimestamp( i, timestampObject);
4. Notice that the DATE type of Oracle 8.05 is actually TIMESTAMP type,
and the format of date should be yyyy-mm-dd hh:mm:ss.ffffffffff.
*/

public class DataLoader {

    Connection		cnn = null;
    PreparedStatement	pStmt = null;
    Statement		stmt = null;
    ResultSet		res = null ;
    ResultSetMetaData	meta = null;
    String		tableName = null,
                colSepChars;
    int			fieldCount;
    int			insertSucc = 0, insertFail = 0, lineNo = 0;;

    String url = "jdbc:oracle:thin:@delphi.cs.csubak.edu:1521:dbs01";

    public DataLoader(String user, String passwd) {
        try {
            try { Class.forName("oracle.jdbc.driver.OracleDriver"); }
            catch (ClassNotFoundException ee) { ee.printStackTrace(); System.exit(-1); }
            cnn = DriverManager.getConnection(url, user, passwd);
        } catch (SQLException e ) { e.printStackTrace(); System.exit(-1); }
    }

    void buildPreparedStatement(String line) {
        StringTokenizer tkz = new StringTokenizer(line, colSepChars);
        /**
         *  Skip "TABLENAME", get table name and number of fields.
         *  Build INSERT statement, and prepare the insert statement.
         */
        tableName = tkz.nextToken();
        tableName = tkz.nextToken().trim();
        fieldCount = Integer.parseInt(tkz.nextToken().trim());
        StringBuffer buf = new StringBuffer();
        buf.append("INSERT INTO " + tableName + " VALUES(?");
        for ( int i = 1; i < fieldCount; i++ ) buf.append(", ?");
        buf.append(")");
        try {
            // if ( pStmt != null ) pStmt.close();
            pStmt = cnn.prepareStatement(buf.toString());
            // The Java document says that it is positive to access
            // ResultSetMeta data before the statement is executed. However,
            // Oracle 8.05 has not implemented that. The statement doesn't
            // work.  meta = pStmt.getMetaData(); 

            System.out.println("SQL statement: " + buf.toString());
            //
            // In order to know the types of columns, execute SELECT
            // statement. It is inefficient.
            if ( stmt == null ) stmt = cnn.createStatement();
            res  = stmt.executeQuery("select * from " + tableName);
            meta = res.getMetaData();
            res.close();
        } catch ( SQLException e ) { e.printStackTrace(); return; }

    }

    boolean addRecordToCurrentTable(int lineNo, String line ) {
        StringTokenizer tkz = new StringTokenizer(line, colSepChars);
        String colStr = null;
        try {
            pStmt.clearParameters();
            for ( int i = 1; i <= fieldCount; i ++ ) {
                colStr = tkz.nextToken().trim();
                switch( meta.getColumnType(i) ) {
                    case Types.DATE:
                        if ( colStr.compareTo("NULL") == 0 ) 
                            pStmt.setNull( i, Types.DATE );
                        else pStmt.setDate(i, java.sql.Date.valueOf(colStr));
                        break;
                    case Types.TIME:
                        pStmt.setTime(i, Time.valueOf( colStr));
                        break;
                    case Types.TIMESTAMP: // Oracle DATE type is TIMESTAMP type.
                        if ( colStr.compareTo("NULL") == 0 ) 
                            pStmt.setNull( i, Types.TIMESTAMP );
                        else pStmt.setTimestamp(i, Timestamp.valueOf( colStr ));
                        break;
                    default :
                        pStmt.setString(i, colStr);
                        break;
                }
            }
            pStmt.execute();
            return true;
        } catch ( SQLException e ) {
            if ( insertFail < 3 )  
                System.out.println( "\n\t" + e.getMessage() +
                        "\t on line " + lineNo + ": [" + line +
                        "] Column String = '" + colStr + "'");
            return false;
        }
    }

    public static void main(String argv[]) throws IOException {
        String user = null, passwd = null;
        user = ScreenIO.promptForString(  "        Oracle user name: ");
        passwd = ScreenIO.promptForString("    Oracle user password: ");
        DataLoader ldr = new DataLoader(user, passwd); // get connected, and create stmt.
        ldr.colSepChars = ScreenIO.promptForString("   Colum Separating char: ");
        boolean    succ;
        String  line = null, fileName = null;
        String  upperCaseLine = null;
        fileName = ScreenIO.promptForString("Enter the data file name: ");
        BufferedReader spFile = new BufferedReader(new FileReader(fileName));
        while ( (line = spFile.readLine()) != null ) {
            if ( line.trim().equals("") ) continue;      // skip blank line.
            upperCaseLine = line.trim().toUpperCase();
            if ( upperCaseLine.indexOf("TABLENAME") == 0 || 
                    upperCaseLine.indexOf("TABLE NAME") == 0 ) {
                ldr.printInsertionInfo();
                ldr.buildPreparedStatement(line);
                ldr.insertSucc = 0;
                ldr.insertFail = 0;
                    }
            else {
                succ = ldr.addRecordToCurrentTable(ldr.lineNo, line);
                if ( succ ) ldr.insertSucc ++;
                else ldr.insertFail ++;
            }
            ldr.lineNo ++;
        }
        ldr.printInsertionInfo();
        ldr.quit();
    }

    protected void printInsertionInfo() {
        System.out.println();
        if ( insertSucc > 0 )
            System.out.print( insertSucc + " records inserted " );
        if ( insertFail > 0 )
            System.out.print("  " + insertFail +  " records failed" );
        if ( insertSucc > 0 || insertFail > 0 ) 
            System.out.println(" in table " + tableName + "\n\n");
    }

    protected void quit() {
        try {
            pStmt.close();
            stmt.close();
            // res.close();
            cnn.close();
            System.exit(0);
        } catch (SQLException e) {}
        try { super.finalize(); } catch (Throwable e) {}
    }
}
