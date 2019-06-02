<?php
    include "connect.php";
    session_start();
 if(isset($_SESSION["empid"]))
    {
        if($_SESSION["type"] != "Manager")
            header("Location:login.php");
    }

    $id = $_POST["empid"];

    $qry = "delete FROM employee WHERE emp_id = '".$id."'";
    $res = $con->query($qry);

    $msg = "";
    if($res->num_rows > 0)
    {
        //user exists
        $row = $res->fetch_assoc();
    }
    else
    {
        $msg = "The Employee id: ".$id." does not exist!";
        header("Location:manager.php?Message=$msg");
    }