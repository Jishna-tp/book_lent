<?php
/**
 * Returns the list of policies.
 */
require 'main.php';

$policies = [];
$sql = "SELECT * FROM genretbl";


if($result = mysqli_query($con,$sql))
{
  $i = 0;
  while($row = mysqli_fetch_assoc($result))
  {
    
    $policies[$i]['genre_id'] = $row['genre_id'];
    $policies[$i]['genre_name'] = $row['genre_name'];
    $i++;
  }

  echo json_encode($policies);
}
else
{
  http_response_code(404);
}
?>