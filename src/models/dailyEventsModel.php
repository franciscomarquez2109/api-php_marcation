<?php
require_once '../core/db.php';

class DailyEvents {
    private $conn;
    public $id;
    public $id_employee;
    public $date;
    public $description;
    public $id_event_type;
    public $location;

    public function __construct() {
        $database = new Database();
        $this->conn = $database->getConnection();

    }

    public function get() {
        $sql = "SELECT
            EVT.ID_EVENTO,
            EVT.ID_EMPLEADO,
            E.NOMBRE || ' ' || E.APELLIDO NOMBRE_EMPLEADO,
            EVT.FECHA,
            EVT.DESCRIPCION,
            TE.NOMBRE_TIPO_EVENTO TIPO_EVENTO,
            EVT.UBICACION
        FROM
            EVENTO_DIARIO EVT,
            EMPLEADO E,
            TIPO_EVENTO TE
        WHERE 
            EVT.ID_EMPLEADO = E.ID_EMPLEADO
            AND EVT.ID_TIPO_EVENTO = TE.ID_TIPO_EVENTO
        ORDER BY
            EVT.FECHA";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();

        return Response::payload(true,null,$stmt->fetchAll(PDO::FETCH_ASSOC));
    }

    public function save(){
        $sql = "
            INSERT INTO PUBLIC.EVENTO_DIARIO
            (ID_EMPLEADO,FECHA,DESCRIPCION,ID_TIPO_EVENTO,UBICACION)
            VALUES(:id_employee,:date,:description,:id_event_type,:location)
            ";

        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':id_employee', $this->id_employee);
        $stmt->bindParam(':date', $this->date);
        $stmt->bindParam(':description', $this->description);
        $stmt->bindParam(':id_event_type', $this->id_event_type);
        $stmt->bindParam(':location', $this->location);
        if ($stmt->execute()) {
            return Response::payload(true,'Registro Exitoso',null);
        }else{
            return Response::payload(false,'Error en el registro',null);
        }
        
    }
}
