<?php
require_once ("server.php");

$response = array();
$software = array();

$id_profile = $_GET["id_profile"];

$sql = "SELECT 
                id_software,
                name,
                icon,
                id_profile,
                tgl_create
        FROM 
            software
        WHERE 
            id_profile = '$id_profile'";
$result = mysqli_query($conn, $sql);
if (mysqli_num_rows($result) > 0) 
{
    while($row = mysqli_fetch_assoc($result)) 
    {
        $id_software = $row['id_software'];
        $name = $row['name'];
        $icon = $row['icon'];
        $id_profile = $row['id_profile'];
        $tgl_create = $row['tgl_create'];

        $software[] = array('id_software' => $id_software, 'name' => $name, 'icon' => $icon, 'id_profile' => $id_profile,'tgl_create' => $tgl_create);
        
    }

    $response=array_merge(array('response' => 'true', 'status' => '200', 'flag' => 'SUCCESS'), array('software' => $software));
}
else 
{
    $response=array('response' => 'false', 'status' => '999', 'flag' => 'FAILED', 'error' => 'No data found');
}
mysqli_close($conn);

echo json_encode($response);
?>