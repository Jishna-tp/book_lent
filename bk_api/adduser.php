<?php
echo "sample";
require 'main.php';



$name = $_POST['name'];
$username=$_POST['username'];
$phone=$_POST['phone'];
$email=$_POST['email'];
$password=$_POST['password'];
$confirmpassword=$_POST['confirmpassword'];

$p="SELECT * FROM `idtbl`";
    $p1=mysqli_query($con,$p);
    $uidd="";
    if($row=mysqli_fetch_assoc($p1))
    {
        $uidd=$row['user_id'];
        
    }
    $uidd1=$uidd+1;
        $usrreg="USR00_".$uidd1;
    $_SESSION['useid'] = $uidd1;








  // Create.
  $sql = "INSERT INTO `usertbl`(`user_id`,`name`,`username`,`phone_no`,`email_id`,`password`,`confirm_password`) VALUES ('{$usrreg}','{$name}','{$username}','{$phone}','{$email}','{$password}','{$confirmpassword}')";
 
  if(mysqli_query($con,$sql))
  {
    http_response_code(201);
    $res = [
      'user_id' => $usrreg,
      'name' => $name,
      'username' => $username,
      'phone_no' => $phone,
      'email_id' => $email,
      'password' => $password,
      'confirm_password' => $confirmpassword,
      
    ];
    echo json_encode($res);
  }
  else
  {
    http_response_code(422);
  }
$cat="user";
  $sql = "INSERT INTO `logintbl`(`category`,`username`,`password`) VALUES ('{$cat}','{$username}','{$password}')";
 
  if(mysqli_query($con,$sql))
  {
    http_response_code(201);
    $res = [
      'category' => $cat,
      'username' => $username,
      'password' => $password,
      
    ];
    echo json_encode($res);
  }
  else
  {
    http_response_code(422);
  }
 
  $crm1=$_SESSION['useid'];
  $sql3=mysqli_query($con,"UPDATE `idtbl` SET user_id='$crm1'");

?>