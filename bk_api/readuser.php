<?php
/**
 * Returns the list of policies.
 */
require 'main.php';

$policies = [];
$sql = "SELECT * FROM usertbl";


if($result = mysqli_query($con,$sql))
{
  $i = 0;
  while($row = mysqli_fetch_assoc($result))
  {
    
    $policies[$i]['name'] = $row['name'];
    $policies[$i]['username'] = $row['username'];
    $policies[$i]['phone_no'] = $row['phone_no'];
    $policies[$i]['email_id'] = $row['email_id'];
    $i++;
  }

  echo json_encode($policies);
}
else
{
  http_response_code(404);
}
?>