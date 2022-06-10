<?php

require '../../config/connect.php';

try {

    $response = new stdClass();
    $res = new stdClass();

    if ($_SERVER['REQUEST_METHOD'] == 'POST') {

       $data = json_decode(file_get_contents('php://input'), true);

       //user data 
       $firstname = $data['firstname'];
       $lastname = $data['lastname'];
       $address = $data['address'];
       //order_product
       $gender = ucfirst($data['gender']);
       $style = ucfirst($data['style']);
       $size = strtoupper($data['size']);
       $amount = intval($data['amount']);
       //status_payment
       $status_payment = $data['status_payment'];
       //generate id_order
       $length = 5;    
       $id_generate = substr(str_shuffle('0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'),1,$length);
       $date = date("YmdHis");
       $id_order = "ID".$id_generate.$date;
       //date time format
       $create = date("d-m-Y");

       $sql = $conn->prepare("SELECT * FROM `product` WHERE gender=? AND style=? AND size=?");
       $sql->execute([$gender,$style,$size]); 
       $row = $sql->rowCount();

        if ($row > 0) {

     
         //loop for data TB_product     
            while ($data = $sql->fetchAll(PDO::FETCH_ASSOC)) {
                extract($data);

                $response->data = $data;

            }
            //total_price
            $price = intval($response->data[0]['price']);
            $total_price = ($amount * $price);
            //id_product
            $id_product = $response->data[0]['id_product'];

           //insert to TB_order  
            $sql = "INSERT INTO `order`(`id_product`, `id_order`, `amount`, `total_price`,`status`, `create`) 
                    VALUES (?,?,?,?,?,?)";
            $result = $conn->prepare($sql);

            if ($result->execute([$id_product,$id_order,$amount,$total_price,$status_payment,$create])) {
                
              //insert to TB_shipping  
                $sql2 = "INSERT INTO `shipping`(`id_order`, `firstname`, `lastname`, `address`, `create`) 
                         VALUES (?,?,?,?,?)";
                $result2 = $conn->prepare($sql2);

                if ($result2->execute([$id_order,$firstname,$lastname,$address,$create])) {
                    
                    $res->status = 200;
                    $res->message = 'ok';
                    $res->order = "order successfully";
              

                }
                


            }else{


                $response->status = 400;
                $response->message = 'Bad Request';
                http_response_code(400);
                exit();

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

    echo json_encode($res);
    http_response_code(200);
    exit();

} catch (PDOException $e) {

    echo 'Error: '.$e->getMessage();

}



?>