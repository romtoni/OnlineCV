<?php

require_once("server.php");

$response = array();
$key_expertise = array();

$id_profile = $_GET["id_profile"];

$sql = "SELECT 
                id_expertise,
                title,
                descriptions,
                id_profile,
                tgl_create
        FROM 
            key_expertise
        WHERE 
            id_profile = '$id_profile'";
$result = mysqli_query($conn, $sql);
if (mysqli_num_rows($result) > 0) 
{
    while($row = mysqli_fetch_assoc($result)) 
    {
        $id_expertise = $row['id_expertise'];
        $title = $row['title'];
        $descriptions = $row['descriptions'];
        $id_profile = $row['id_profile'];
        $tgl_create = $row['tgl_create'];

        $key_expertise[] = array('id_expertise' => $id_expertise, 'title' => $title, 'descriptions' => $descriptions,'id_profile' => $id_profile,'tgl_create' => $tgl_create);
        
    }

    $response=array_merge(array('response' => 'true', 'status' => '200', 'flag' => 'SUCCESS'), array('key_expertise' => $key_expertise));
}
else 
{
    $response=array('response' => 'false', 'status' => '999', 'flag' => 'FAILED', 'error' => 'No data found');
}
mysqli_close($conn);

echo json_encode($response);

?>