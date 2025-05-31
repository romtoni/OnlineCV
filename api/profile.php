<?php
require_once ("server.php");

$response = array();
$profile = array();

$id_profile = $_GET["id_profile"];

$sql = "SELECT 
                id_profile,
                name,
                tagline,
                hp,
                email,
                photo,
                TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) as age,
                birth_place,
                DATE_FORMAT(birth_date, '%d %M %Y') AS birth_date,
                address,
                city,
                country,
                tgl_create
        FROM 
            profile
        WHERE 
            id_profile = '$id_profile'";
$result = mysqli_query($conn, $sql);
if (mysqli_num_rows($result) > 0) 
{
    while($row = mysqli_fetch_assoc($result)) 
    {
        $id_profile = $row['id_profile'];
        $name = $row['name'];
        $tagline = $row['tagline'];
        $hp = $row['hp'];
        $email = $row['email'];
        $photo = $row['photo'];
        $age = $row['age'];
        $birth_place = $row['birth_place'];
        $birth_date = $row['birth_date'];
        $address = $row['address'];
        $city = $row['city'];
        $country = $row['country'];
        $tgl_create = $row['tgl_create'];

        $profile[] = array('id_profile' => $id_profile, 'name' => $name, 'tagline' => $tagline,'hp' => $hp,'email' => $email,'photo' => $photo, 'age' => $age, 'birth_place' => $birth_place, 'birth_date' => $birth_date,'address' => $address,'city' => $city, 'country' => $country,'tgl_create' => $tgl_create);
        
    }

    $response=array_merge(array('response' => 'true', 'status' => '200', 'flag' => 'SUCCESS'), array('profile' => $profile));
}
else 
{
    $response=array('response' => 'false', 'status' => '999', 'flag' => 'FAILED', 'error' => 'No data found');
}
mysqli_close($conn);

echo json_encode($response);
?>