<?php

require_once("server.php");

$response = array();
$academic_qualification = array();

$id_profile = $_GET["id_profile"];

$sql = "SELECT 
                id_academic,
                name,
                city,
                country,
                CONCAT(SUBSTRING(DATE_FORMAT(start_date, '%M'), 1, 3) , ' ', DATE_FORMAT(start_date, '%Y')) AS start_date,
                CONCAT(SUBSTRING(DATE_FORMAT(end_date, '%M'), 1, 3) , ' ', DATE_FORMAT(end_date, '%Y')) AS end_date,
                title,
                department,
                gpa,
                id_profile,
                tgl_create
        FROM 
            academic_qualification
        WHERE 
            id_profile = '$id_profile'";
$result = mysqli_query($conn, $sql);
if (mysqli_num_rows($result) > 0) 
{
    while($row = mysqli_fetch_assoc($result)) 
    {
        $id_academic = $row['id_academic'];
        $name = $row['name'];
        $city = $row['city'];
        $country = $row['country'];
        $start_date = $row['start_date'];
        $end_date = $row['end_date'];
        $title = $row['title'];
        $department = $row['department'];
        $gpa = $row['gpa'];
        $id_profile = $row['id_profile'];
        $tgl_create = $row['tgl_create'];

        $academic_qualification[] = array('id_academic' => $id_academic, 'name' => $name, 'city' => $city,'country' => $country,'start_date' => $start_date,'end_date' => $end_date,'title' => $title,'department' => $department,'gpa' => $gpa,'id_profile' => $id_profile, 'tgl_create' => $tgl_create);
        
    }

    $response=array_merge(array('response' => 'true', 'status' => '200', 'flag' => 'SUCCESS'), array('academic_qualification' => $academic_qualification));
}
else 
{
    $response=array('response' => 'false', 'status' => '999', 'flag' => 'FAILED', 'error' => 'No data found');
}
mysqli_close($conn);

echo json_encode($response);

?>