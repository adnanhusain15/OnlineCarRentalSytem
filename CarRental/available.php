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
	
$Cid=$_POST["cbid"];
$Sdate=$_POST["Sdate"];
$Ctype=$_POST["Ctype"];
$Rtype=$_POST["Rtype"];
$Nodays=$_POST["Days"];
$Noweeks=$_POST["Weeks"];
$Vehicle_id=$_POST["Vehicleid"];
?>
<table border='1'><tr><th>Vehicle ID</th><th>Model</th></tr>
<?php
$D2 ='0000-00-00';
$res="select vehicle_id , Model from car where ctype='$Ctype' and Status='Active'";
	$result=mysqli_query($connection,$res);
	if ($Noweeks>=1) {
		$num=$Noweeks*7;
		$D2=date('Y-m-d', strtotime($Sdate. ' + $num days'));
	}
    if($result === FALSE) { 
    die(mysqli_error($connection)); 
}

	if ((mysqli_num_rows($result) > 0) || (strtotime($Sdate) > strtotime($D2))) {
		echo "<br><h2>Congrats Vehicle is available</h2><br>";
		echo "<h3>List of Available vehicles</h3><br>";
		while($row = mysqli_fetch_assoc($result))
		{
			echo "<tr>"; echo "<td>" . $row["vehicle_id"] . "</td><td>" . $row["Model"] . "</td>";
			echo "</tr>";
		}
	}
	else
		echo "Car is not available";
?>
</table>
<?php

if($Vehicle_id!=null) {
	$check1="SELECT Status from car where Vehicle_id='$Vehicle_id'";
	$resultvehicle = mysqli_query($connection, $check1);
	if($resultvehicle === FALSE) { 
    die(mysqli_error($connection)); 
	}
	$rowvehiclestatus = mysqli_fetch_assoc($resultvehicle);
	if($rowvehiclestatus['Status']=='Active')
	{
	$res="INSERT into rental(Cid,Vehicle_id,Ctype,Rtype,Rdate,Nodays,Noweeks) values('$Cid','$Vehicle_id','$Ctype','$Rtype','$Sdate','$Nodays','$Noweeks')";
	$result=mysqli_query($connection,$res);
	$res1 = "Update car set Status='Hired' where Vehicle_id='$Vehicle_id'";
	$result1=mysqli_query($connection,$res1);
	if($result!=false)
	echo "Rental has been added";}
	
	else{
		echo "Selected Car Is Not Availiable";
	}
}
?>

<?php
$res2="SELECT Rid,Cid,Vehicle_id,Ctype,Rtype,Rdate,Nodays,Noweeks FROM rental";
	$result2=mysqli_query($connection,$res2);
	if($result === FALSE) { 
    die(mysqli_error($connection)); 
	}
	echo "<h1><center>Active & Scheduled Rentals</h1><br><br>";
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
if($result === FALSE) { 
    die(mysqli_error($connection)); 
}
if (mysqli_num_rows($result2) > 0) {
while($row2 = mysqli_fetch_assoc($result2))
{
echo "<tr>";
echo "<td>" . $row2["Rid"] . "</td>";
echo "<td>" . $row2["Cid"] . "</td>";
echo "<td>" . $row2["Vehicle_id"] . "</td>";
echo "<td>" . $row2["Ctype"] . "</td>";
echo "<td>" . $row2["Rtype"] . "</td>";
echo "<td>" . $row2["Rdate"] . "</td>";
echo "<td>" . $row2["Nodays"] . "</td>";
echo "<td>" . $row2["Noweeks"] . "</td>";
echo "</tr>";
}
}
?>
</table>
</body>
</html>