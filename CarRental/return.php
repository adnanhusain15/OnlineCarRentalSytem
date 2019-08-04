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
	$Rid=$_POST["rid"];
	$res="select Noweeks FROM rental,car where rental.rid='$Rid' and rental.CType=car.Ctype";
	$result=mysqli_query($connection,$res);
	if($result === FALSE) { 
    die(mysqli_error($connection)); 
}
	$row = mysqli_fetch_assoc($result);
		
			if ($row["Noweeks"]==0) {
			$res1="select rental.Nodays*rates.Drate AS Amount FROM rental,rates where rental.rid='$Rid' and rental.CType=rates.CType";
	$result1=mysqli_query($connection,$res1);
	if($result1 === FALSE) { 
    die(mysqli_error($connection)); 
}
	echo "<h1><center>Amount due</h1><br><br>";
	$row1 = mysqli_fetch_assoc($result1);
	echo "<h1>USD&nbsp".$row1["Amount"]."</h1>";
			}
			else{
			$res2="select rental.Noweeks*rates.Wrate AS Amount FROM rental, rates where rental.rid='$Rid' and rental.CType=rates.CType";
			
	$result2=mysqli_query($connection,$res2);
		if($result2 === FALSE) { 
		die(mysqli_error($connection)); 
		}

	echo "<h1><center>Amount due</h1><br><br>";
$masterquery = "select c.Cid , c.Fname ,r.Rdate,r.RType, c.Lname,c.Mobile,c.Age,c.Dno,c.Insno, v.Vehicle_id as Vehicle_ID , v.Model as Model , r.CType , r.Nodays  , r.Noweeks ,r.Rid from customer c join car v join rental r ON r.Rid='$Rid' and r.Vehicle_id = v.Vehicle_id And r.cid=c.Cid";
$masterresult = mysqli_query($connection, $masterquery);
if ($masterresult == false) {
    die(mysqli_error($connection));
}
$masterrow = mysqli_fetch_assoc($masterresult);
echo "<center>";
echo "<table border='1' cellspacing='0' >";
echo "<tr>";
echo "<td>";
echo "<h4><center>Customer Id</h4><br><br>";
echo "</td><td>";
echo $masterrow['Cid'];
echo "</td>";
echo "</tr><tr><td>";
echo "<h4><center>Customer Name</h4><br><br>";
echo "</td><td>";
echo $masterrow["Fname"] . " " . $masterrow["Lname"];
echo "</td>";
echo "</tr><tr><td>";
echo "<h4><center>Customer Mobile Number</h4><br><br>";
echo "</td><td>";
echo $masterrow["Mobile"];
echo "</td>";
echo "</tr><tr><td>";
echo "<h4><center>Customer Age</h4><br><br>";
echo "</td><td>";
echo $masterrow["Age"];
echo "</td>";
echo "</tr><tr><td>";
echo "<h4><center>Customer Driving License Number</h4><br><br>";
echo "</td><td>";
echo $masterrow["Dno"];
echo "</td>";
echo "</tr><tr><td>";
echo "<h4><center>Customer Insurance License Number</h4><br><br>";
echo "</td><td>";
echo $masterrow["Insno"];
echo "</td>";
echo "</tr><tr><td>";
echo "<h4><center>Vehicle Id</h4><br><br>";
echo "</td><td>";
echo $masterrow["Vehicle_ID"];
echo "</td>";
echo "</tr><tr><td>";
echo "<h4><center>Vehicle Model</h4><br><br>";
echo "</td><td>";
echo $masterrow["Model"];
echo "</td>";
echo "</tr><tr><td>";
echo "<h4><center>Vehicle Type</h4><br><br>";
echo "</td><td>";
echo $masterrow["CType"];
echo "</td>";
echo "</tr><tr><td>";
echo "<h4><center>Rental Id</h4><br><br>";
echo "</td><td>";
echo $masterrow["Rid"];
echo "</td>";
echo "</tr><tr><td>";
echo "<h4><center>No Of Weeks Of Rental</h4><br><br>";
echo "</td><td>";
echo $masterrow["Noweeks"];
echo "</td>";
echo "</tr><tr><td>";
echo "<h4><center>No Of days Of Rental</h4><br><br>";
echo "</td><td>";
echo $masterrow["Nodays"];
echo "</td>";
echo "</tr>";
echo "</table>";
$a=$masterrow["Rid"];
$b=$masterrow["Rdate"];
$c=$masterrow["Vehicle_ID"];
$d=$masterrow["CType"];
$e=$masterrow["Cid"];
$f=$masterrow["RType"];
$g=$masterrow["Nodays"];
$h=$masterrow["Noweeks"];
	$row2 = mysqli_fetch_assoc($result2);
	$i = $row2["Amount"];
	echo "<h1>USD&nbsp".$row2["Amount"]."</h1>";
	$logquery="INSERT INTO log(Bid,Rdate,Vehicle_id,CType,cid,RType,Nodays,Noweeks,Amount) VALUES('$a','$b','$c','$d','$e','$f','$g','$h','$i')";
mysqli_query($connection, $logquery);
			}
			$res2="delete FROM rental where rental.Rid='$Rid'";
			$res3="select Vehicle_id from rental where rental.Rid='$Rid'";
			$res4 = mysqli_query($connection,$res3);
			if ($res4 === false) {
    die(mysqli_error($connection));
}

			$result2=mysqli_query($connection,$res2);
			$row1 = mysqli_fetch_assoc($res4);
			$vid = $row1["Vehicle_id"];
			$res1 = "Update car set Status='Active' where Vehicle_id='$vid'";
			$result1 = mysqli_query($connection, $res1);

	if($result2 == FALSE) { 
    die(mysqli_error($connection)); 
}




?>
</body>
</html>
