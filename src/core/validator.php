<?php

class Validator {
    public $params;

    public function __construct(){
        
    }

    public function Emptyparams($params) {
        foreach ($params as $key => $value) {
            if (empty($value)) {
                http_response_code(400); 
                echo json_encode(['error' => "El parámetro '$key' es requerido y no puede estar vacío."]);
                exit;
            }
        }
    }
    public function IssetParams($params) {
        foreach ($params as  $value) {
            if (!isset($value)) {
                http_response_code(400); 
                echo json_encode(['error' => "Faltan Parametros"]);
                exit;
            }
        }
    }

}