<?php
require_once '../core/db.php';

class UsersModel {
    private $conn;
    public $id;
    public $name;
    public $password;
    public $id_employee;

    public function __construct() {
        $database = new Database();
        $this->conn = $database->getConnection();

    }

    public function get() {
        $sql = "select u.id,u.nombre usuario from usuarios u where u.nombre = :name and u.password = crypt(:password,u.password)";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':name', $this->name);
        $stmt->bindParam(':password', $this->password);
        $stmt->execute();

        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
        
        if (count($rows) == 0) {
            return Response::payload(false,'No se encontraron Datos',$rows);
        }

        return Response::payload(true,null,$rows);
        
    }

    /* public function save(){
        $sql = "
        INSERT 
            INTO empleado 
            (nombre,apellido,dirección,teléfono, correo_electrónico,id_departamento,id_cargo) 
        VALUES 
            (:name, :last_name,:location,:phone,:email,:id_departament,:id_rol)";

        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':name', $this->name);
        $stmt->bindParam(':last_name', $this->last_name);
        $stmt->bindParam(':location', $this->location);
        $stmt->bindParam(':phone', $this->phone);
        $stmt->bindParam(':email', $this->email);
        $stmt->bindParam(':id_departament', $this->id_departament);
        $stmt->bindParam(':id_rol', $this->id_rol);
        
        if ($stmt->execute()) {
            return Response::payload(true,'Registro Exitoso',null);
        }else{
            return Response::payload(false,'Error en el registro',null);
        }
        
    }

    public function update(){
        $sql ="
        update empleado
            set
            nombre = :name,
            apellido = :last_name,
            direccion = :location,
            telefono = :phone,
            correo_electronico = :email,
            id_departamento = :id_departament,
            id_cargo = :id_rol
            where id_empleado = :id_employee";

        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':name', $this->name);
        $stmt->bindParam(':last_name', $this->last_name);
        $stmt->bindParam(':location', $this->location);
        $stmt->bindParam(':phone', $this->phone);
        $stmt->bindParam(':email', $this->email);
        $stmt->bindParam(':id_departament', $this->id_departament);
        $stmt->bindParam(':id_rol', $this->id_rol);
        $stmt->bindParam(':id_employee', $this->id_employee);
        
        if ($stmt->execute()) {
            return Response::payload(true,'Registro actualizado',null);
        }else{
            return Response::payload(false,'Error al actualizar',null);
        }
        
    }

    public function disable(){
        $sql = "
        update 
            empleado
            set estado = 0
        where 
            id_empleado = :id_employee";

        $stmt = $this->conn->prepare($sql);
            
        $stmt->bindParam(':id_employee', $this->id_employee);
        
        if ($stmt->execute()) {
            return Response::payload(true,'Registro deshabilitado',null);
        }else{
            return Response::payload(false,'Error al deshabilitar',null);
        }
        
    } */
}
