<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"  "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<?php
	$database_host = "localhost";
	$database_user = "root";
	$database_pass = "";
	$database_name = "carrental";
	$connection = mysqli_connect($database_host, $database_user, $database_pass, $database_name);
if (mysqli_connect_errno()) {
    die("Failed connecting to MySQL database. Invalid credentials" . mysqli_connect_error() . "(" . mysqli_connect_errno() . ")");}

	$result = "select * from log";
	$res = mysqli_query($connection,$result);
	if ($res === false) {
    die(mysqli_error($connection));
	}


?>
<center>
<table border = '1'>
	<tr><th>BID</th><th>RDATE</th><th>VEHICLE ID </th><th>CAR TYPE</th><th>CUSTOMER ID </th><th>RTYPE</th>
	<th>NO OF dAYS</th><th>NO OF WEEKS</th><th>AMOUNT</th></tr>
	<?php
	$total = 0;
		while($panel = mysqli_fetch_array($res)){
			$total = $total + $panel["Amount"];
		echo "<tr>";
		echo "<td>";
		echo $panel["Bid"];
		echo"</td><td>";
		echo $panel["Rdate"];
		echo "</td><td>";
		echo $panel["Vehicle_id"];
		echo "</td><td>";
		echo $panel["CType"];
		echo "</td><td>";
		echo $panel["cid"];
		echo "</td><td>";
		echo $panel["RType"];
		echo "</td><td>";
		echo $panel["Nodays"];
		echo "</td><td>";
		echo $panel["Noweeks"];
		echo "</td><td>";
		echo $panel["Amount"];
		echo "</td></tr>";
		}
		

?>
</table>
<?php
$an = "Total =".$total;
echo $an;
?>
</body>
</html>