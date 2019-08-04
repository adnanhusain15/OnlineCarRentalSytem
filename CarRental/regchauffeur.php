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
	
$Fname=$_POST["fname"];
$Lname=$_POST["lname"];
$Name = $Fname.$Lname;
$AGE=$_POST["age"];
$Mobile=$_POST["mobile"];
$Dlno=$_POST["dno1"];
	$result1="INSERT INTO driver(Dno) VALUES('$Dlno')";
	$result="INSERT INTO chauffeur(Name,AGE,Mobile,Dno) VALUES('$Name','$AGE','$Mobile','$Dlno')";
	mysqli_query($connection, $result1) or die(mysqli_error($connection));
	

$res11 = mysqli_query($connection, $result);

if ($res11 == false) {
    mysqli_query($connection, "delete from driver where Dno=$Dlno") or die(mysqli_error($connection));
    echo "<h3>New chauffeur has been unsuccessful</h3><br><br>";


} else {
    echo "<h3>New chauffeur has been successfully added</h3><br><br>";


}

?>

</body>
</html>
