<?php 


    global $dbConnectionInfo;
    global $response;
    $dbInfo = array(
        'host'     => 'localhost',
        'user'     => 'root',
        'password' => '',
        'database' => 'simpledb',
        );



     
    // Create connection
    $conn = new mysqli($dbInfo['host'], $dbInfo['user'], $dbInfo['password'], $dbInfo['database']);

    // Check connection
    if ($conn->connect_errno) {
        
        $dbConnectionInfo['detail']['isConnectionOkey'] = false;
        $dbConnectionInfo['detail']['message'] = $conn->connect_error;
    }

?>