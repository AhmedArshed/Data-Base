<?php 
include "connect.php";
  session_start();
 if(isset($_SESSION["empid"]))
    {
        if($_SESSION["type"] != "Worker")
            header("Location:login.php");
    }
 ?>
 <!DOCTYPE html>
 <html>
 <head>
 	<title>show schedule</title>
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
  top: 43%;
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
 	<form action="#" method="post" class="container bg-text">
        <div class="page-header mb-5" align="center">
 	<h3 class="set">Show Schedule</h3>

     <ul class='nave page-header' align='center'>
      <li class='nave'>
        <div class='topnav set2'>
          <a href='emp_profile.php' class='clgr active'>Profile</a>
          <a href='show_schedule.php' class='clgr'>Show Schedule</a>
          <a href='customer_registor.php' class='clgr'>Booking Ticket</a>
          <a href='show_ticket.php' class='clgr'>Show Tickets</a>
          <a href='logout.php' style='float:right' class='btnset'>Log Out</a>
        </div>
      </li>
    </ul>

<?php
            
            $qry = "SELECT * FROM train, time,station, train_time, train_in_station where time.station_id = station.station_id And train_time.ref_no = time.ref_no And train_time.train_id = train.train_id And train_in_station.station_id = station.station_id And train_in_station.train_id = train.train_id";
            $res = $con->query($qry);
			$result = "";
            $class = "set tblro";
            $flag = 1;

			if ($res->num_rows>0) {
                $result .= "<div class ='container'>";
				$result .= "<table align='center' class='table table-bordered'>";
				$result .= "<tr class='tblh'><th>Train Number</th><th>Train Name</th></th><th>City</th><th>Arrival Time</th><th>Departure Time</th></th><th>Station Name</th></tr>";
				while ($row = $res->fetch_assoc()) 
				{
					//one row
                    $result .= "<tr class ='".$class."'>
                                    <td>
                                        ".$row['train_id']."
                                    </td>
                                    <td>
                                        ".$row['train_name']."
                                    </td>
                                    <td>
                                        ".$row['city']."
                                    </td>
									
									<td>
										".$row['arrival_time']."
                                    </td>
                                    <td>
										".$row['dep_time']."
									</td>
                                    <td>
                                    ".$row['station_name']."
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
