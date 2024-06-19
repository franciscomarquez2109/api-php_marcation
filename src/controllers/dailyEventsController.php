<?php
require_once '../models/dailyEventsModel.php';
require_once '../core/validator.php';

class DailyEventsController {
    public function get() {
        try {
            $dailyEventsModel = new DailyEvents();
            $result = $dailyEventsModel->get();
            $list = array();

            foreach($result['payload'] as $row){
                array_push(
                    $list,
                    Array(
                        'id'=>$row['id_evento'],
                        'id_employee'=>$row['id_empleado'],
                        'name_employee'=>$row['nombre_empleado'],
                        'date'=>$row['fecha'],
                        'description'=>$row['descripcion'],
                        'event_type'=>$row['tipo_evento'],
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
            $dailyEventsModel = new DailyEvents();
            $Validator = new Validator();

            //definimos un arreglo de parametros
            $params = [
                'id_employee'      => $_POST['id_employee'] ?? null,
                'date' => $_POST['date'] ?? null,
                'description' => $_POST['description'] ?? null,
                'id_event_type' => $_POST['id_event_type'] ?? null,
                'location' => $_POST['location'] ?? null
            ];

            //Validamos parametros indefinidos y obligatorios
            $Validator->IssetParams($params);

            //Validamos parametros vacios
            $Validator->Emptyparams($params);
            
            $dailyEventsModel->id_employee = $params['id_employee'];
            $dailyEventsModel->date = $params['date'];
            $dailyEventsModel->description = $params['description'];
            $dailyEventsModel->id_event_type = $params['id_event_type'];
            $dailyEventsModel->location = $params['location'];
            
            $resp = $dailyEventsModel->save();
            Response::json($resp['success'],$resp['msg'],$resp['payload']);

        } catch (Exception $e) {
            echo "Error: " . $e->getMessage();
        }

    }

}
