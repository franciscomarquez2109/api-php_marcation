<?php
require_once '../models/dailingRegistrationModel.php';
require_once '../core/validator.php';

class DialingRegistrationController {
    public function get() {
        try {
            $dialingRegistrationModel = new DailingRegistration();
            $result = $dialingRegistrationModel->get();
            $list = array();

            foreach($result['payload'] as $row){
                array_push(
                    $list,
                    Array(
                        'id'=>$row['id_registro'],
                        'id_employee'=>$row['id_empleado'],
                        'name'=>$row['nombre'],
                        'date'=>$row['fecha'],
                        'hour'=>$row['hora'],
                        'type'=>$row['tipo'],
                        'state'=>$row['nombre_estado'],
                        'location'=>$row['ubicacion']                    
                    )
                );
            }
            
            Response::json($result['success'],$result['msg'],$list);
        } catch (Exception $e) {
            Response::json(false,$e->getMessage(),null);
        }
    }

    public function save(){
        try {
            $dialingRegistrationModel = new DailingRegistration();
            $Validator = new Validator();

            //definimos un arreglo de parametros
            $params = [
                'id_employee'      => $_POST['id_employee'] ?? null,
                'date' => $_POST['date'] ?? null,
                'hour' => $_POST['hour'] ?? null,
                'id_type' => $_POST['id_type'] ?? null,
                'id_state' => $_POST['id_state'] ?? null,
                'location' => $_POST['location'] ?? null
            ];

            //Validamos parametros indefinidos y obligatorios
            $Validator->IssetParams($params);

            //Validamos parametros vacios
            $Validator->Emptyparams($params);
            
            $dialingRegistrationModel->id_employee = $params['id_employee'];
            $dialingRegistrationModel->date = $params['date'];
            $dialingRegistrationModel->hour = $params['hour'];
            $dialingRegistrationModel->id_type = $params['id_type'];
            $dialingRegistrationModel->id_state = $params['id_state'];
            $dialingRegistrationModel->location = $params['location'];
            
            $resp = $dialingRegistrationModel->save();
            Response::json($resp['success'],$resp['msg'],$resp['payload']);

        } catch (Exception $e) {
            echo "Error: " . $e->getMessage();
        }

    }

}
