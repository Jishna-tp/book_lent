<?php
echo "sample";
require 'main.php';



$town=$_POST['town'];
$city=$_POST['city'];


$r="SELECT * FROM `idtbl`";
    $r1=mysqli_query($con,$r);
    $ldd="";
    if($row=mysqli_fetch_assoc($r1))
    {
        $ldd=$row['loc_id'];
        
    }
    $ldd1=$ldd+1;
        $locreg="LOC00_".$ldd1;
    $_SESSION['locid'] = $ldd1;








  // Create.
  $sql = "INSERT INTO `locationtbl`(`location_id`,`town`,`city`) VALUES ('{$locreg}','{$town}','{$city}')";
 
  if(mysqli_query($con,$sql))
  {
    http_response_code(201);
    $res = [
      
      'location_id' =>$locreg,
      'town' => $town,
      'city' => $city,
      
    ];
    echo json_encode($res);
  }
  else
  {
    http_response_code(422);
  }
  $crm1=$_SESSION['locid'];
  $sql3=mysqli_query($con,"UPDATE `idtbl` SET loc_id='$crm1'");


?>