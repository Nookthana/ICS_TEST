<?php

require '../../config/connect.php';

try {

    $response = new stdClass();

    if ($_SERVER['REQUEST_METHOD'] == 'GET') {



        $page = intval($_GET['page']);
        $page_response = intval(($_GET['page']));
        $per_page = intval($_GET['per_page']);



        $sql = $conn->query("SELECT COUNT(`id`)  FROM `product` ");
        $total_page  = $sql->fetchAll(PDO::FETCH_ASSOC);

        $page_total = intval($total_page[0]['COUNT(`id`)']) / $per_page;

        $offset =  ($page - 1) * $per_page; 

      
    

        $sql = $conn->query("SELECT * FROM `product` limit ".$offset.",".$per_page."");
        $row = $sql->rowCount();


        if ($row > 0) {

    
            
            while ($data = $sql->fetchAll(PDO::FETCH_ASSOC)) {
                extract($data);
      

          $response->status = 200;
          $response->message = "Ok";
          $response->page = $page_response;
          $response->per_page = $per_page;
          $response->total = intval($total_page[0]['COUNT(`id`)']);
          $response->total_page = ceil($page_total);
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