<?php

require '../../config/connect.php';

try {

    $response = new stdClass();

    if ($_SERVER['REQUEST_METHOD'] == 'POST') {

        $sql = $conn->query("SELECT * FROM `product`");
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