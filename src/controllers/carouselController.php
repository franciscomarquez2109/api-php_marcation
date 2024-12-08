<?php
require_once '../models/carouselModel.php';
require_once '../core/validator.php';

class CarouselController {
    
    public function get() {
        try {
            $Validator = new Validator();
            $carouselModel = new Carousel();

            $result = $carouselModel->get();
            $list = array();
            foreach($result['payload'] as $row){
                array_push(
                    $list,
                    Array(
                        'title'       =>$row['titulo'],
                        'description' =>$row['descripcion'],
                        'image'       =>$row['imagen'],
                        'link'        =>$row['enlace'],
                        'created_at'  =>$row['fecha_creacion']              
                    )
                );
            };

            Response::json($result['success'],$result['msg'],$list);
        } catch (Exception $e) {
            Response::json(false,$e->getMessage(),null);
        }
    }

    public function save(){
        try {
            $carouselModel = new Carousel();
            $Validator = new Validator();

            $data = json_decode(file_get_contents('php://input'), true);

            //definimos un arreglo de parametros
            $params = [
                'title'       => $Validator->validateRequired($data['title']),
                'description' => $Validator->validateRequired($data['description']),
                'image'       => $Validator->validateRequired($data['image']),
                'state_id'    => $Validator->validateRequired($data['state_id']),
                'link'        => $data['link']
            ];
             
            $carouselModel->title = $params['title'];
            $carouselModel->description = $params['description'];
            $carouselModel->image = $params['image'];
            $carouselModel->link = $params['link'];
            $carouselModel->state_id = $params['state_id'];
            
            $resp = $carouselModel->save();
            
            Response::json($resp['success'],$resp['msg'],$resp['payload']);

        } catch (Exception $e) {
            echo "Error: " . $e->getMessage();
        }

    }
    public function update($id){
        try {
            $carouselModel = new Carousel();
            $Validator = new Validator();

            $data = json_decode(file_get_contents('php://input'), true);

            $params = [
                'title'       => $Validator->validateRequired($data['title']),
                'description' => $Validator->validateRequired($data['description']),
                'image'       => $Validator->validateRequired($data['image']),
                'state_id'    => $Validator->validateRequired($data['state_id']),
                'link'        => $data['link']
            ];
            
            $carouselModel->id = $id;
            $carouselModel->title = $params['title'];
            $carouselModel->description = $params['description'];
            $carouselModel->image = $params['image'];
            $carouselModel->link = $params['link'];
            $carouselModel->state_id = $params['state_id'];
            
            $resp = $carouselModel->update();
            
            Response::json($resp['success'],$resp['msg'],$resp['payload']);

        } catch (Exception $e) {
            echo "Error: " . $e->getMessage();
        }

    }

    public function delete($id){
        try {
            $carouselModel = new Carousel();
            $carouselModel->id = $id;
            $resp = $carouselModel->delete();
            Response::json($resp['success'],$resp['msg'],$resp['payload']);
        } catch (Exception $e) {
            echo "Error: " . $e->getMessage();
        }

    }

}
