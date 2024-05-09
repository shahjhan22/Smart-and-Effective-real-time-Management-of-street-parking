<?php
session_start();
require 'mysqlConnect.php';
require 'update_slots.php';
require "driver.details.php";
if (!$_SESSION['driver_email']) {
  header("location: index.php");
}
else {

?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Smart Parking Web Portal</title>
    <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="datatable/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="datatable/keyTable.bootstrap.min.css" rel="stylesheet">
    <link href="custom.css" rel="stylesheet">
    <style>



.area{
  margin-bottom: 15px;
}

.cart-nav ul li {
  margin:3%;
  padding: 3%;
  color: #0000 !important;
}

.Head {
  text-transform: uppercase;
   
   color: 	#009688 !important;
}

.modal-backdrop {
    z-index: 1020 !important;
}

.parking_text {
  color: #2F4F4F !important;
  text-transform: uppercase;
}

.total {
  color: #FF0000 !important;
}
.modal { background: rgba(000, 000, 000, 0.8); min-height:1000000px; }

.fa-circle {
  color: green;
}

#flaskAppContainer {
            position: fixed;
            bottom: 10px;
            right: 10px;
            width: 735px;
            height: 385px;
            left: 680px;
            border: 1px solid #ccc;
            overflow: hidden;
        }

        #flaskAppFrame {
            width: 100%;
            height: 100%;
            border: none;
            /* transform: scale(1.9); /* Adjust the zoom level as needed */
            /* transform-origin: 0 0; */ */
        }



    </style>
</head>
<body>
    <div >
      <div class="container">
         <div class="col-md-3"></div>
         <div class="col-md-8">
                 <center><h1 class="colors"><a href="home.php" style="text-decoration: none; color:white;">SMART PARKING Portal</a></h1></center>

         </div>
         <div class="col-md-1"></div>
</div>

<div class="row">
   <div class="container">
     
         <div class="cart-nav col-xs-4">
           <ul>
             <li class="list-group-item" id="requests">           
                <div class="thumbnail">              
                      <div class="caption">
                      <center>
                        <h3><?=$name?></h3>
                        <p>(<?=$email?>)</p>
                        <p><i id="#online" class="fa fa-circle" aria-hidden="true"></i> Online</p>
                        <p><a href="logout.php"><i class="fa fa-power-off" aria-hidden="true"></i> lOGOUT</a></p>
                        </center>
                      </div>
                    </div>                   
             </li> 

             <li class="list-group-item" >
               <select class="form-control" onchange="filter_park()" id="city">
                 <option value="Old Faridabad">Old Faridabad</option>
               </select>
             </li>

             <li class="list-group-item">
               <select class="form-control" onchange="openFlaskApp();filter_park()" id="street">
                 <option value="">----[Search Street]----</option>
                 <option value="sec-11">sec-11</option>
                 <option value="sec-10">sec-10</option>
                 <option value="sec-12">sec-12</option>
               </select>
             </li>

             <li class="list-group-item" id="requests"><a><span class="glyphicon glyphicon-envelope"></span> Notifications</a></li>


             <!-- Button to open Flask app -->
<!-- <button onclick="openFlaskApp()">Open Flask Application</button> -->

<!-- Container for Flask app iframe -->
<div id="flaskAppContainer">
    <iframe id="flaskAppFrame" src="" allowfullscreen></iframe>
</div>

            
           </ul>
         </div>

         <div class="content col-xs-8">
            <div id = "home">

            </div>
         </div>

   </div>
</div>



    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="jquery/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

    <script>
$("#home").load("parkings/parkings.php");

  function filter_park(){
    var city1 = $("#city").val();
    var street1 = $("#street").val();
 $.post("parkings/parkings.php", {city:city1, street:street1}, function(data){
    $("#home").html(data);
 })

  }

  

  $("#requests").click(function(){
    $("#home").load("feedback/requests.php");  
  });

  $("#receipt").click(function(){
    $("#home").load("receipt/new.php");  
  });

  function openFlaskApp() {
    var selectedStreet = document.getElementById('street').value;
    var flaskAppFrame = document.getElementById('flaskAppFrame');

    if (selectedStreet === 'sec-11') {
        var flaskAppUrl = 'http://localhost:5000/videofeed?street=' + encodeURIComponent(selectedStreet);
        flaskAppFrame.src = flaskAppUrl;
        flaskAppFrame.style.display = 'block'; // Show the frame
        flaskAppFrame.contentWindow.document.body.innerHTML = ''; // Clear any previous message
    } else {
        flaskAppFrame.src = ''; // Clear the source to close the video
        flaskAppFrame.style.display = 'block'; // Show the frame
    }
}






    </script>
  </body>
</html>
<?php } ?>
