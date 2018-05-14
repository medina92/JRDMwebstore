<?php

$conn = oci_connect('cs342', 'c3m4p2s');


if($conn){
    echo "Connected to database!";
}else{
    echo "Connection failed";
}

// Parse the statement. Note there is no final semi-colon in the SQL statemen$stid = oci_parse($conn, 'SELECT table_name FROM table_all');
$stid = oci_parse($conn, 'SELECT table_name FROM all_tables');
oci_execute($stid);

echo "<table border='1'>\n";
while ($row = oci_fetch_array($stid, OCI_ASSOC+OCI_RETURN_NULLS)) {
    echo "<tr>\n";
    foreach ($row as $item) {
        echo "    <td>" . ($item !== null ? htmlentities($item, ENT_QUOTES) : "&nbsp;") . "</td>\n";
    }
    echo "</tr>\n";
}
echo "</table>\n";

?>
