<?php
session_start();
/**
 * Returns the list of policies.
 */
require 'main.php';

$policies = [];
$id = mysqli_real_escape_string($con, $_GET['id']);
$s=$_REQUEST['id'];
$s1=$_REQUEST['id1'];

$id1=mysqli_real_escape_string($con, $_GET['id1']);
$sql = "SELECT * FROM `logintbl` where `username`='$s' and `password`='$s1' ";


if($result = mysqli_query($con,$sql))
{
  
  $i = 0;
  while($row = mysqli_fetch_assoc($result))
  {
    $policies[$i]['category']    = $row['category'];
    $policies[$i]['username'] = $row['username'];
    $i++;
  }

  echo json_encode($policies);
}
else
{
  http_response_code(404);
}
?>