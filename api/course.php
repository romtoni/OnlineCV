<?php

require_once("server.php");

$response = array();
$course = array();

$id_profile = $_GET["id_profile"];

$sql = "SELECT 
                id_course,
                name,
                company,
                city,
                country,
                CONCAT(SUBSTRING(DATE_FORMAT(start_date, '%M'), 1, 3) , ' ', DATE_FORMAT(start_date, '%Y')) AS start_date,
                CONCAT(SUBSTRING(DATE_FORMAT(end_date, '%M'), 1, 3) , ' ', DATE_FORMAT(end_date, '%Y')) AS end_date,
                id_profile,
                tgl_create
        FROM 
            course
        WHERE 
            id_profile = '$id_profile'";
$result = mysqli_query($conn, $sql);
if (mysqli_num_rows($result) > 0) 
{
    while($row = mysqli_fetch_assoc($result)) 
    {
        $id_course = $row['id_course'];
        $name = $row['name'];
        $company = $row['company'];
        $city = $row['city'];
        $country = $row['country'];
        $start_date = $row['start_date'];
        $end_date = $row['end_date'];
        $id_profile = $row['id_profile'];
        $tgl_create = $row['tgl_create'];

        $course[] = array('id_course' => $id_course, 'name' => $name, 'company' => $company, 'city' => $city,'country' => $country,'start_date' => $start_date,'end_date' => $end_date,'id_profile' => $id_profile, 'tgl_create' => $tgl_create);
        
    }

    $response=array_merge(array('response' => 'true', 'status' => '200', 'flag' => 'SUCCESS'), array('course' => $course));
}
else 
{
    $response=array('response' => 'false', 'status' => '999', 'flag' => 'FAILED', 'error' => 'No data found');
}
mysqli_close($conn);

echo json_encode($response);

?>