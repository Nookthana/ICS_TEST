<?php

require '../../config/connect.php';

try {

    $response = new stdClass();

    if ($_SERVER['REQUEST_METHOD'] == 'GET') {

        $gender = ucfirst($_GET['gender']);
        $style = ucfirst($_GET['style']);
        $size =  strtoupper($_GET['size']);


        $sql = $conn->prepare("SELECT * FROM `product` WHERE gender=? AND style=? AND size=?");
        $sql->execute([$gender,$style,$size]); 
        $row = $sql->rowCount();


        if ($row > 0) {
            
            while ($data = $sql->fetchAll(PDO::FETCH_ASSOC)) {
                extract($data);
      

          $response->status = 200;
          $response->message = "Ok";
          $response->total = $row;
          $response->data = $data;

        }

        }else{

          $response->status = 404;
          $response->message = "Not Found";
          http_response_code(404);
          echo json_encode($response);
          exit();



        }
      

    }else{

        $response->status = 400;
        $response->message = 'Bad Request';
        http_response_code(400);
        echo json_encode($response);
        exit();

    }

    echo json_encode($response);
    http_response_code(200);
    exit();

} catch (PDOException $e) {

    echo 'Error: '.$e->getMessage();

}



?>