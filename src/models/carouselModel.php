<?php
require_once '../core/db.php';

class Carousel {
    private $conn;
    public $id;
    public $title;
    public $description;
    public $image;
    public $link;
    public $state_id;
    public $state;
    public $created_at;

    public function __construct() {
        $database = new Database();
        $this->conn = $database->getConnection();

    }

    public function get() {
        $sql = "select
            c.titulo,
            c.descripcion,
            c.imagen imagen,
            c.enlace,
            c.fecha_creacion
        from
            carrusel c
        where
            c.estatus = 1
        order by
            fecha_creacion desc";

        $stmt = $this->conn->prepare($sql);
        $stmt->execute();

        return Response::payload(true,null,$stmt->fetchAll(PDO::FETCH_ASSOC));
    }

    public function save(){
        $sql = "INSERT INTO PUBLIC.CARRUSEL
            (TITULO, DESCRIPCION, IMAGEN, ENLACE, ESTADO_ID)
            VALUES(:title,:description,:image,:link,:state_id);";

        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':title', $this->title);
        $stmt->bindParam(':description', $this->description);
        $stmt->bindParam(':image', $this->image);
        $stmt->bindParam(':link', $this->link);
        $stmt->bindParam(':state_id', $this->state_id);

        if ($stmt->execute()) {
            return Response::payload(true,'Registro Exitoso',null);
        }else{
            return Response::payload(false,'Error en el registro',null);
        }
        
    }

    public function update(){
        $sql = "UPDATE PUBLIC.CARRUSEL
                SET TITULO=:title, 
                DESCRIPCION=:description, 
                IMAGEN=:image, 
                ENLACE=:link, 
                ESTADO_ID=:state_id
                WHERE ID=:id";

        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':title', $this->title);
        $stmt->bindParam(':description', $this->description);
        $stmt->bindParam(':image', $this->image);
        $stmt->bindParam(':link', $this->link);
        $stmt->bindParam(':state_id', $this->state_id);
        $stmt->bindParam(':id', $this->id);

        if ($stmt->execute()) {
            return Response::payload(true,'Actualizado correctamente',null);
        }else{
            return Response::payload(false,'Error al actualizar',null);
        }
        
    }
}
