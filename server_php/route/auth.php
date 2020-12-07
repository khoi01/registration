<?php 


//route : (POST) localhost/server_php/?module=auth&function=login
if($module == "auth" && $function == "login"){
    login();
}

function login()
{
    global $response;
    global $conn;

    $username = $_POST['username'];
    $password = $_POST['password'];

    $query = "
        select userId from user where username = '".$username."'
        and password = '".$password."';
    ";

    $result = $conn->query($query);

    //want to check if data exists
    if($result->num_rows > 0){
        //output data of each row
        while($row = $result->fetch_assoc()) {
            //data the will receive from db
            $response['userId'] = $row["userId"];
        }

        $response['responseInfo']['status'] = 'success';
        $response['responseInfo']['message'] = 'success';

    }else{
        $response['responseInfo']['status'] = 'failed';
        $response['responseInfo']['message'] = 'User ID and password not match';
    }

    //close connection
    $conn->close();

    header('Content-Type: application/json');
    echo json_encode($response);


}

?>