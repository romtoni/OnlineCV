<?php
require_once ("server.php");

$response = array();
$social_media = array();

$id_profile = $_GET["id_profile"];

$sql = "SELECT 
                id_social,
                social_name,
                name,
                link,
                social_logo,
                id_profile,
                tgl_create
        FROM 
            social_media
        WHERE 
            id_profile = '$id_profile'";
$result = mysqli_query($conn, $sql);
if (mysqli_num_rows($result) > 0) 
{
    while($row = mysqli_fetch_assoc($result)) 
    {
        $id_social = $row['id_social'];
        $social_name = $row['social_name'];
        $name = $row['name'];
        $link = $row['link'];
        $social_logo = $row['social_logo'];
        $id_profile = $row['id_profile'];
        $tgl_create = $row['tgl_create'];

        $social_media[] = array('id_social' => $id_social, 'social_name' => $social_name, 'name' => $name, 'link' => $link, 'social_logo' => $social_logo, 'id_profile' => $id_profile,'tgl_create' => $tgl_create);
        
    }

    $response=array_merge(array('response' => 'true', 'status' => '200', 'flag' => 'SUCCESS'), array('social_media' => $social_media));
}
else 
{
    $response=array('response' => 'false', 'status' => '999', 'flag' => 'FAILED', 'error' => 'No data found');
}
mysqli_close($conn);

echo json_encode($response);
?>