<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"  "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<?php
	$database_host = "localhost";
	$database_user = "root";
	$database_pass = "";
	$database_name = "carrental";
	$connection = mysqli_connect($database_host, $database_user, $database_pass, $database_name);
	if(mysqli_connect_errno()){
		die("Failed connecting to MySQL database. Invalid credentials" . mysqli_connect_error(). "(" .mysqli_connect_errno(). ")" ); }
	
?>
<center>
<table border='1'>
<tr>
<th>RID</th>
<th>Customer ID</th>
<th>Vehicle id</th>
<th>Car type</th>
<th>Rent type</th>
<th>Start Date</th>
<th>No of days</th>
<th>No of weeks</th>
</tr>
<?php
 {
$res2 = "SELECT * FROM rental";
$result2=mysqli_query($connection, $res2);
echo "<h1><center>Active & Scheduled Rentals</h1><br><br>";
if (mysqli_num_rows($result2) > 0){
while($row2 =mysqli_fetch_assoc($result2))
{
echo "<tr>";
echo "<td>" . $row2["Rid"] . "</td>";
echo "<td>" . $row2["cid"] . "</td>";
echo "<td>" . $row2["Vehicle_id"] . "</td>";
echo "<td>" . $row2["CType"] . "</td>";
echo "<td>" . $row2["RType"] . "</td>";
echo "<td>" . $row2["Rdate"] . "</td>";
echo "<td>" . $row2["Nodays"] . "</td>";
echo "<td>" . $row2["Noweeks"] . "</td>";
echo "</tr>";
}}
}
?>
</table>