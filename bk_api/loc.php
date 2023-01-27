<?php
echo "sample";
require 'main.php';



$town=$_POST['town'];
$city=$_POST['city'];









  // Create.
  $sql = "INSERT INTO `locationtbl`(`town`,`city`) VALUES ('{$town}','{$city}')";
 
  if(mysqli_query($con,$sql))
  {
    http_response_code(201);
    $res = [
      
      'town' => $town,
      'city' => $city,
      
    ];
    echo json_encode($res);
  }
  else
  {
    http_response_code(422);
  }
 


?>