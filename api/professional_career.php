<?php

require_once("server.php");

$response = array();
$professional_career = array();

$id_profile = $_GET["id_profile"];

$sql = "SELECT 
                id_career,
                company,
                city,
                CONCAT(SUBSTRING(DATE_FORMAT(start_date, '%M'), 1, 3) , ' ', DATE_FORMAT(start_date, '%Y')) AS start_date,
                CONCAT(SUBSTRING(DATE_FORMAT(end_date, '%M'), 1, 3) , ' ', DATE_FORMAT(end_date, '%Y')) AS end_date,
                position,
                jobdesc,
                company_logo,
                id_profile,
                tgl_create
        FROM 
            professional_career
        WHERE 
            id_profile = '$id_profile'";
$result = mysqli_query($conn, $sql);
if (mysqli_num_rows($result) > 0) 
{
    while($row = mysqli_fetch_assoc($result)) 
    {
        $id_career = $row['id_career'];
        $company = $row['company'];
        $city = $row['city'];
        $start_date = $row['start_date'];
        $end_date = $row['end_date'];
        $position = $row['position'];
        $jobdesc = $row['jobdesc'];
        $company_logo = $row['company_logo'];
        $id_profile = $row['id_profile'];
        $tgl_create = $row['tgl_create'];

        $professional_career[] = array('id_career' => $id_career, 'company' => $company, 'city' => $city,'start_date' => $start_date,'end_date' => $end_date, 'position' => $position,'jobdesc' => $jobdesc, 'company_logo' => $company_logo, 'id_profile' => $id_profile, 'tgl_create' => $tgl_create);
        
    }

    $response=array_merge(array('response' => 'true', 'status' => '200', 'flag' => 'SUCCESS'), array('professional_career' => $professional_career));
}
else 
{
    $response=array('response' => 'false', 'status' => '999', 'flag' => 'FAILED', 'error' => 'No data found');
}
mysqli_close($conn);

echo json_encode($response);

?>