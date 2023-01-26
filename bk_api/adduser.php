<?php
echo "sample";
require 'main.php';



$name = $_POST['name'];
$username=$_POST['username'];
$phone=$_POST['phone'];
$email=$_POST['email'];
$password=$_POST['password'];
$confirmpassword=$_POST['confirmpassword'];








  // Create.
  $sql = "INSERT INTO `usertbl`(`name`,`username`,`phone_no`,`email_id`,`password`,`confirm_password`) VALUES ('{$name}','{$username}','{$phone}','{$email}','{$password}','{$confirmpassword}')";
 
  if(mysqli_query($con,$sql))
  {
    http_response_code(201);
    $res = [
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
 


?>