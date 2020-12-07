<?php 

//hide all error
// error_reporting(0);
// ini_set('display_errors', 0);

//show all error
error_reporting(E_ALL);
ini_set('display_errors', 1);





$module = $_GET['module'];
$function = $_GET['function'];

//flag to give the response to the client
$response = array(
    "responseInfo" => array(
        "module" => $module,
        "function" => $function,
        "status" => null,
        "message" => null,
    ),
);

include 'inc/custom.php';
include 'inc/init.php';





if($module == "auth"){
    include './route/auth.php';
}
if($module == "user"){
    include './route/user.php';
}
if($module == "item"){
    include './route/item.php';
}

?>