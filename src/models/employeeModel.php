<?php
require_once '../core/db.php';

class Employee {
    private $conn;
    public $id_employee;
    public $name;
    public $last_name;
    public $location;
    public $phone;
    public $email;
    public $id_departament;
    public $id_rol;
    public $esatdo;

    public function __construct() {
        $database = new Database();
        $this->conn = $database->getConnection();

    }

    public function get() {
        $sql = "select 
                    e.id_empleado,
                    e.nombre,
                    e.apellido,
                    e.direccion,
                    e.telefono,
                    e.correo_electronico,
                    c.nombre_cargo,
                    d.nombre_departamento,
                    e.estado
                from 
                    empleado e, 
                    cargo c,
                    departamento d 
                where 
                    e.id_departamento = d.id_departamento 
                    and e.id_cargo = c.id_cargo
                    and e.estado = 1";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();

        return Response::payload(true,null,$stmt->fetchAll(PDO::FETCH_ASSOC));
    }

    public function save(){
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
        
    }
}
