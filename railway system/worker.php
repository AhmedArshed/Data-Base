<?php 
include "connect.php";
  session_start();
 if(isset($_SESSION["emp_email"]))
    {
        if($_SESSION["type"] != "Worker")
            header("Location:login.php");
	}
	
	$_SESSION["back"] = "worker.php";
 ?>

 <!DOCTYPE html>
 <html>
 <head>
 	<title>Employee start</title>
 	<link href="css/bootstrap.min.css" rel="stylesheet">
 	<style>
.bg {
  background-image: url("new.jpg");
  height: 100%; 
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
.bg-text {
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0, 1); /* Black w/opacity/see-through */
  color: white;
  font-weight: bold;
  border: 3px solid #f1f1f1;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 2;
  width: 80%;
  padding: 20px;
  text-align: center;
}
        .clgr{
        	color: #000000;
        }
        .nave{
			background-color: #000000;
			color: #FFFFFF;
		}
		ul {
			  list-style-type: none;
			  margin: 0;
			  padding: 0;
			  overflow: hidden;
			  background-color: #333;
		}

	/*	li {
  			float: left;
		}*/

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

.set2{
  margin-top: 30px;
}

* {box-sizing: border-box}
body {font-family: Verdana, sans-serif; margin:0}
.mySlides {display: none}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}
.btnset{
     float: right;
  background-color: #ffae00;
  color: #000000;
}
    </style>
 </head>
 <body>
    <?php 
    echo "<ul class='nave page-header' align='center'>"."<li>"."<a>"."<h1>". "Welcome " . $_SESSION["name"]."</h1>"."</a>"."</li>";
      echo "<li class='nave'>"."<div class='topnav set2'>"."<a href='emp_profile.php' class='clgr active'>"."Profile"."</a>";
     echo "<a href='show_schedule.php' class='clgr'>"."Show Schedule"."</a>";
     echo "<a href='customer_registor.php' class='clgr'>"."Booking Ticket"."</a>";
     echo "<a href='show_ticket.php' class='clgr'>"."Show Tickets"."</a>";
     echo "<a href='logout.php' style='float:right' class='btnset'>"."Log Out"."</a>"."</li>"."</ul>";
     echo "</div>";

   ?>
<div class="slideshow set4">
<div class="mySlides fa">
  <!-- <div class="numbertext"></div> -->
  <img src="r1.jpg" style="width:100%" height="550">
</div>
<div class="mySlides fa">
  <!-- <div class="numbertext"></div> -->
  <img src="r2.jpg" style="width:100%" height="550">
</div>

<div class="mySlides fa">
  <!-- <div class="numbertext"></div> -->
  <img src="r3.jpg" style="width:100%" height="550">
</div>

<div class="mySlides fa">
  <!-- <div class="numbertext">4 / 4</div> -->
  <img src="r4.jpeg" style="width:100%" height="550">
</div>
<br>
<div style="text-align:center">
  <span class="dot"></span>
  <span class="dot"></span>
  <span class="dot"></span>
  <span class="dot"></span>
</div>
</div>

<script>
var slideIndex = 0;
showSlides();

function showSlides() {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 2000); // Change image every 2 seconds
}
</script>
 	<div class="form-group row">
            <div class="col-sm-4"></div>
                <?php
                    if (isset($_GET["Message"])) {
                        echo "<div class='col-sm-4 alert alert-danger' align='center'>";
                        echo $_GET["Message"];
                        echo "</div>";
                    }
                ?>
    </div>
        <div class="col-sm-4"></div>
 </body>
 </html>
