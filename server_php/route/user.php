<?php  

//route (POST) : localhost/server_php/?module=user&function=register
if($module == "user" && $function == "register"){
    register();
}

function register(){

    global $response;
    global $conn;

    $name = $_POST['name'];
    $password = $_POST['password'];
    $username = $_POST['username'];


    $query = "insert into user(name,password,username) values ('".$name."','".$password."','".$username."')";

    if($conn->query($query) === TRUE){
        $response['responseInfo']['status'] = 'success';
        $response['responseInfo']['message'] = 'new record added..';    
    }else{
        $response['responseInfo']['status'] = 'failed';
        $response['responseInfo']['message'] = $conn->error;
    }

    //close connection
    $conn->close();

    
    header('Content-Type: application/json');
    echo json_encode($response);






}
