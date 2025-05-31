<?php
require_once ("server.php");

$response = array();
$skillset = array();

$id_profile = $_GET["id_profile"];

$sql = "SELECT 
                id_skill,
                name,
                additional_info,
                id_profile,
                tgl_create
        FROM 
            skillset
        WHERE 
            id_profile = '$id_profile'";
$result = mysqli_query($conn, $sql);
if (mysqli_num_rows($result) > 0) 
{
    while($row = mysqli_fetch_assoc($result)) 
    {
        $id_skill = $row['id_skill'];
        $name = $row['name'];
        $additional_info = $row['additional_info'];
        $id_profile = $row['id_profile'];
        $tgl_create = $row['tgl_create'];

        $skillset[] = array('id_skill' => $id_skill, 'name' => $name, 'additional_info' => $additional_info, 'id_profile' => $id_profile,'tgl_create' => $tgl_create);
        
    }

    $response=array_merge(array('response' => 'true', 'status' => '200', 'flag' => 'SUCCESS'), array('skillset' => $skillset));
}
else 
{
    $response=array('response' => 'false', 'status' => '999', 'flag' => 'FAILED', 'error' => 'No data found');
}
mysqli_close($conn);

echo json_encode($response);
?>