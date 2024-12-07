<?php

class Validator {
    public $params;

    public function __construct(){
        
    }

    public function Emptyparams($value) {
        if (empty($value)) {
            http_response_code(400); 
            echo json_encode(['error' => "El parámetro '$value' es requerido y no puede estar vacío."]);
            exit;
        }
        return $value;
    }
    public function IssetParams($value) {
        if (!isset($value)) {
            http_response_code(400); 
            echo json_encode(['error' => "Faltan Parametros"]);
            exit;
        }

        return $value;
    }

    public function validateRequired($value) {
        if (!isset($value)) {
            http_response_code(400); 
            echo json_encode(['error' => "Faltan Parametros"]);
            exit;
        }
        
        if (empty($value)) {
            http_response_code(400); 
            echo json_encode(['error' => "El parámetro '$value' es requerido y no puede estar vacío."]);
            exit;
        }

        return $value;
    }
}