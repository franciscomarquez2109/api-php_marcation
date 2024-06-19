<?php
require_once '../core/db.php';

class DailingRegistration {
    private $conn;
    public $id;
    public $id_employee;
    public $date;
    public $hour;
    public $id_state;
    public $id_type;
    public $location;

    public function __construct() {
        $database = new Database();
        $this->conn = $database->getConnection();

    }

    public function get() {
        $sql = "SELECT
            RM.ID_REGISTRO,
            RM.ID_EMPLEADO,
            E.NOMBRE || ' ' || E.APELLIDO NOMBRE,
            RM.FECHA,
            RM.HORA,
            T.DESCRIPCION TIPO,
            EST.NOMBRE_ESTADO,
            RM.UBICACION
        FROM
            REGISTRO_MARCACION RM,
            EMPLEADO E,
            ESTADO EST,
            TIPO T
        WHERE
            RM.ID_EMPLEADO = E.ID_EMPLEADO
            AND RM.ID_ESTADO = EST.ID_ESTADO
            AND RM.ID_TIPO = T.ID
        ORDER BY
            RM.FECHA";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();

        return Response::payload(true,null,$stmt->fetchAll(PDO::FETCH_ASSOC));
    }

    public function save(){
        $sql = "
            INSERT INTO public.registro_marcacion
                (id_empleado, fecha, hora, id_estado, ubicacion,id_tipo)
            VALUES(:id_employee, :date, :hour, :id_state, :location,:id_type)";

        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':id_employee', $this->id_employee);
        $stmt->bindParam(':date', $this->date);
        $stmt->bindParam(':hour', $this->hour);
        $stmt->bindParam(':id_state', $this->id_state);
        $stmt->bindParam(':location', $this->location);
        $stmt->bindParam(':id_type', $this->id_type);
        if ($stmt->execute()) {
            return Response::payload(true,'Registro Exitoso',null);
        }else{
            return Response::payload(false,'Error en el registro',null);
        }
        
    }
}
