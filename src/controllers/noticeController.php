<?php
require_once '../models/noticeModel.php';
require_once '../core/validator.php';


class NoticeController {
    
    public function get() {
        try {
            $noticeModel = new Notice();
            $result = $noticeModel->get();
            $list = array();
            foreach($result['payload'] as $row){
                array_push(
                    $list,
                    Array(
                        'title'             =>$row['titulo'],
                        'subtitulo'         =>$row['subtitulo'],
                        'content'           =>$row['contenido'],
                        'publication_date'  =>$row['fecha_publicacion'],
                        'source'            =>$row['fuente'],
                        'author'            =>$row['autor'],
                        'category'          =>$row['categoria'],
                        'image'             =>$row['imagen'],                
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
            $noticeModel = new Notice();
            $Validator = new Validator();

            $data = json_decode(file_get_contents('php://input'), true);

            //definimos un arreglo de parametros
            $params = [
                'title'            => $Validator->validateRequired($data['title']),
                'subtitle'         => $data['subtitle'],
                'content'          => $Validator->validateRequired($data['content']),
                'publication_date' => $Validator->validateRequired($data['publication_date']),
                'author_id'        => $Validator->validateRequired($data['author_id']),
                'category_id'      => $Validator->validateRequired($data['category_id']),
                'image'            => $Validator->validateRequired($data['image']),
                'state_id'         => $Validator->validateRequired($data['state_id']),
                'source'           => $data['source']
            ];
             
            $noticeModel->title            = $params['title'];
            $noticeModel->subtitle         = $params['subtitle'];
            $noticeModel->content          = $params['content'];
            $noticeModel->publication_date = $params['publication_date'];
            $noticeModel->author_id        = $params['author_id'];
            $noticeModel->category_id      = $params['category_id'];
            $noticeModel->image            = $params['image'];
            $noticeModel->state_id         = $params['state_id'];
            $noticeModel->source           = $params['source'];
            
            $resp = $noticeModel->save();
            
            Response::json($resp['success'],$resp['msg'],$resp['payload']);

        } catch (Exception $e) {
            echo "Error: " . $e->getMessage();
        }

    }
    
    /* public function update($id){
        try {
            $noticeModel = new Carousel();
            $Validator = new Validator();

            $data = json_decode(file_get_contents('php://input'), true);

            $params = [
                'title'       => $Validator->validateRequired($data['title']),
                'description' => $Validator->validateRequired($data['description']),
                'image'       => $Validator->validateRequired($data['image']),
                'state_id'    => $Validator->validateRequired($data['state_id']),
                'link'        => $data['link']
            ];
            
            $noticeModel->id = $id;
            $noticeModel->title = $params['title'];
            $noticeModel->description = $params['description'];
            $noticeModel->image = $params['image'];
            $noticeModel->link = $params['link'];
            $noticeModel->state_id = $params['state_id'];
            
            $resp = $noticeModel->update();
            
            Response::json($resp['success'],$resp['msg'],$resp['payload']);

        } catch (Exception $e) {
            echo "Error: " . $e->getMessage();
        }

    }

    public function delete($id){
        try {
            $noticeModel = new Carousel();
            $noticeModel->id = $id;
            $resp = $noticeModel->delete();
            Response::json($resp['success'],$resp['msg'],$resp['payload']);
        } catch (Exception $e) {
            echo "Error: " . $e->getMessage();
        }

    } */

}
