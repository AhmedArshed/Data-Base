<?php 
include "connect.php";
  session_start();
 if(isset($_SESSION["empid"]))
    {
        if($_SESSION["type"] != "Manager")
            header("Location:login.php");
    }
 ?>
 <!DOCTYPE html>
 <html>
 <head>
 	<title>Removing a recored of employee</title>
 	 <link href="css/bootstrap.min.css" rel="stylesheet">
    <style>

    .tblh{
            background: #616060;
            font-size: 14px;
            color: white;
        }
        .tblro{
            font-size: 12px;
        }
        .tblre{
            font-size: 12px;
            background: #E9E8E8;
        }

        .bg {
  background-image: url("new.jpg"); 
  height: 160vh;
  background-position: center;
  background-repeat: repeat;
  background-size: cover;
    filter: blur(8px);
  -webkit-filter: blur(8px);
}
body, html {
  height: 100%;
  margin: 0;
}
.set{
    color: #FFFFFF;
}

.bg-text {
  background-color: rgb(0,0,0); Fallback color
  background-color: rgba(0,0,0, 1); Black w/opacity/see-through
  color: white;
  font-weight: bold;
  border: 3px solid #f1f1f1;
  position: absolute;
  top: 40%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 2;
  width: 150%;
  height: 150%
  padding: 40px;
  text-align: center;
}
.nave{
      background-color: #000000;
      color: #FFFFFF;
    }
    .topnav {
  overflow: hidden;
  background-color: #333;
}

.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #4CAF50;
  color: white;
}

.clgr{
          color: #000000;
        }
.btnset{
     float: right;
  background-color: #ffae00;
  color: #000000;
}
ul {
    list-style-type: none;
}

    </style>
 </head>
 <body>
    <div class="bg"></div>
 	<form action="remove_employee_try.php" method="post" class="container bg-text">
        <div class="page-header mb-5" align="center">
 	<h3 class="set">Employee's Information</h3>
<br>
     <ul class='nave page-header' align='center'>
      <li class='nave'>
        <div class='topnav set2'>
          <a href='emp_profile.php' class='clgr active'>Profile</a>
          <a href='employee_register.php' class='clgr'>Add new Employees</a>
          <a href='update_employee.php' class='clgr'>Update Employee</a>
          <a href='search_employee.php' class='clgr'>Search Employee</a>
          <a href='logout.php' style='float:right' class='btnset'>Log Out</a>
        </div>
      </li>
    </ul>
    <br>

     <?php
            
            $qry = "SELECT * FROM employee where type != 'Manager'";
            $res = $con->query($qry);
			$result = "";
            $class = "set tblro";
            $flag = 1;

			if ($res->num_rows>0) {
                $result .= "<div class ='container'>";
				$result .= "<table align='center' class='table table-bordered'>";
				$result .= "<tr class='tblh'><th>CNIC</th><th>Full Name</th><th>Duty Shift</th><th>Type</th><th>Salary</th><th>Change Duty</th><th>Change Salary</th><th>Remove Employee</th></tr>";
				while ($row = $res->fetch_assoc()) 
				{
					//one row
					$result .= "<tr class ='".$class."'>
									<td>
										".$row['emp_id']."
									</td>
									<td>
										".$row['emp_name']."
									</td>
									<td>
										".$row['duty_shift']."
									</td>
									<td>
										".$row['type']."
									</td>
									<td>
										".$row['salary']."
                                    </td>
                                    <td>
                                    "."<span><a class='btn btn-success' href='update_duty.php?cnic={$row['emp_id']}'>Update</a></span>" ."
									</td>
									<td>
                                    "."<span><a class='btn btn-success' href='update_salary.php?cnic={$row['emp_id']}'>Update</a></span>" ."
									</td>
									<td>
                                    "."<span><a class='btn btn-success' href='remove_employee.php?cnic={$row['emp_id']}'>Delete</a></span>" ."
									</td>
                                    
									
								</tr>";
                    
                    $flag++;
         
                    if(($flag)%2==0)
                        $class = "tblre";
                    else
                        $class = "set tblro";
				}
				$result .= "</table></div>";
			}
			echo $result;
		
	?>

 </body>
 </html>
