<?php 
	$server = "localhost";
	$user = "root";
	$pass = "";
	$dbname = "sales_co";

	$con = new MYSQLi($server,$user,$pass,$dbname);

	// if($con->connect_error)
			// echo "Error: ".$con->connect_error;
		// else
			// echo "connected";

	// $mysqli = new mysqli();
$x = 12;
$y = 3;
// $call = $mysqli->prepare('CALL calculate(?, ?, @sum, @product)');
// $call->bind_param('ii', $x, $y);
// $call->execute();

// $select = $mysqli->query('SELECT @sum, @product');
// $result = $select->fetch_assoc();
// $proc_sum     = $result['@sum'];
// $proc_product = $result['@product'];

// echo $proc_sum;
// echo $proc_product;


$mysqli = mysqli_connect();

$call = mysqli_prepare($mysqli, 'CALL calculate(?, @sum, ?, @product)');
mysqli_stmt_bind_param($call, 'ii', $x, $y,);
mysqli_stmt_execute($call);

$select = mysqli_query($mysqli, 'SELECT @sum, @product');
$result = mysqli_fetch_assoc($select);
$proc_sum     = $result['@sum'];
$proc_product = $result['@product'];
echo $proc_sum;
echo $proc_product;

 ?>