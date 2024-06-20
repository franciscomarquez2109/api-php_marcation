<?php
require_once '../models/usersModel.php';
require_once '../core/validator.php';

class UsersController {
    public function get() {
        try {
            $usersModel = new UsersModel();
            $Validator = new Validator();
            //definimos un arreglo de parametros
            $params = [
                'name'     => $_POST['username'] ?? null,
                'password' => $_POST['password'] ?? null
            ];

            //Validamos parametros indefinidos y obligatorios
            $Validator->IssetParams($params);

            //Validamos parametros vacios
            $Validator->Emptyparams($params);

            $usersModel->name = $params['name'];
            $usersModel->password = $params['password'];

            $result = $usersModel->get();
            $list = array();
            
            if (!$result['success']) {
                Response::json($result['success'],$result['msg'],[]);    
            } 
            else {
                foreach($result['payload'] as $row){
                    array_push(
                        $list,
                        Array(
                            'id'=>$row['id'],
                            'username'=>$row['usuario']              
                        )
                    );
                }
                
                Response::json($result['success'],$result['msg'],$list);
            }

            
        } catch (Exception $e) {
            Response::json(false,$e->getMessage(),null);
        }
    }

    public function save(){
        try {
            $employeeModel = new Employee();
            $Validator = new Validator();

            //definimos un arreglo de parametros
            $params = [
                'name'      => $_POST['name'] ?? null,
                'last_name' => $_POST['last_name'] ?? null,
                'phone' => $_POST['phone'] ?? null,
                'location' => $_POST['location'] ?? null,
                'email' => $_POST['email'] ?? null,
                'id_rol' => $_POST['id_rol'] ?? null,
                'id_departament' => $_POST['id_departament'] ?? null
            ];

            //Validamos parametros indefinidos y obligatorios
            $Validator->IssetParams($params);

            //Validamos parametros vacios
            $Validator->Emptyparams($params);
            $employeeModel->name = $_POST['name'] ?? null;
            $employeeModel->last_name = $_POST['last_name'] ?? null;
            $employeeModel->phone = $_POST['phone'] ?? null;
            $employeeModel->location = $_POST['location'] ?? null;
            $employeeModel->email = $_POST['email'] ?? null;
            $employeeModel->id_rol = $_POST['id_rol'] ?? null;
            $employeeModel->id_departament = $_POST['id_departament'] ?? null;
            
            $resp = $employeeModel->save();
            Response::json($resp['success'],$resp['msg'],$resp['payload']);

        } catch (Exception $e) {
            echo "Error: " . $e->getMessage();
        }

    }

    public function update(){
        try {
            $employeeModel = new Employee();
            $Validator = new Validator();

            //definimos un arreglo de parametros
            $params = [
                'id_employee' => $_POST['id_employee'] ?? null,
                'name'      => $_POST['name'] ?? null,
                'last_name' => $_POST['last_name'] ?? null,
                'phone' => $_POST['phone'] ?? null,
                'location' => $_POST['location'] ?? null,
                'email' => $_POST['email'] ?? null,
                'id_rol' => $_POST['id_rol'] ?? null,
                'id_departament' => $_POST['id_departament'] ?? null
            ];

            //Validamos parametros indefinidos y obligatorios
            $Validator->IssetParams($params);

            //Validamos parametros vacios
            $Validator->Emptyparams($params);

            $employeeModel->id_employee = $_POST['id_employee'] ?? null;
            $employeeModel->name = $_POST['name'] ?? null;
            $employeeModel->last_name = $_POST['last_name'] ?? null;
            $employeeModel->phone = $_POST['phone'] ?? null;
            $employeeModel->location = $_POST['location'] ?? null;
            $employeeModel->email = $_POST['email'] ?? null;
            $employeeModel->id_rol = $_POST['id_rol'] ?? null;
            $employeeModel->id_departament = $_POST['id_departament'] ?? null;
            
            $resp = $employeeModel->update();
            
            Response::json($resp['success'],$resp['msg'],$resp['payload']);

        } catch (Exception $e) {
            echo "Error: " . $e->getMessage();
        }

    }

    public function disable(){
        try {
            $employeeModel = new Employee();
            $Validator = new Validator();

            //definimos un arreglo de parametros
            $params = [
                'id_employee' => $_POST['id_employee'] ?? null
            ];

            //Validamos parametros indefinidos y obligatorios
            $Validator->IssetParams($params);

            //Validamos parametros vacios
            $Validator->Emptyparams($params);

            $employeeModel->id_employee = $_POST['id_employee'] ?? null;

            $resp = $employeeModel->disable();
            
            Response::json($resp['success'],$resp['msg'],$resp['payload']);

        } catch (Exception $e) {
            echo "Error: " . $e->getMessage();
        }

    }
}
