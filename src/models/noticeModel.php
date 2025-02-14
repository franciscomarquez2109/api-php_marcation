<?php
require_once '../core/db.php';

class Notice {
    private $conn;
    public $id;
    public $title;
    public $subtitle;
    public $content;
    public $publication_date;
    public $author_id;
    public $category_id;
    public $image;
    public $state_id;
    public $source;

    public function __construct() {
        $database = new Database();
        $this->conn = $database->getConnection();

    }
    public function get() {
        $sql = "SELECT
                N.TITULO,
                N.SUBTITULO,
                N.CONTENIDO,
                N.FECHA_PUBLICACION,
                N.FUENTE,
                A.NOMBRE AUTOR,
                C.NOMBRE CATEGORIA,
                n.imagen_url imagen
            FROM
                NOTICIA N,
                AUTOR A,
                CATEGORIA C,
                ESTADO E
            WHERE 
                N.AUTOR_ID = A.ID 
                AND N.CATEGORIA_ID = C.ID 
                AND N.ESTADO_ID = E.ID 
                AND N.ESTADO = 1
            ORDER BY N.FECHA_PUBLICACION DESC";

        $stmt = $this->conn->prepare($sql);
        $stmt->execute();

        return Response::payload(true,null,$stmt->fetchAll(PDO::FETCH_ASSOC));
    }
    public function save(){
        $sql = "INSERT INTO PUBLIC.NOTICIA
                (TITULO, SUBTITULO, CONTENIDO, FECHA_PUBLICACION, AUTOR_ID, CATEGORIA_ID, IMAGEN_URL, ESTADO_ID, FUENTE)
                VALUES(:title, :subtitle, :content,:publication_date,:author_id,:category_id,:image,:state_id,:source)";

        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':title', $this->title);
        $stmt->bindParam(':subtitle', $this->subtitle);
        $stmt->bindParam(':content', $this->content);
        $stmt->bindParam(':publication_date', $this->publication_date);
        $stmt->bindParam(':author_id', $this->author_id);
        $stmt->bindParam(':category_id', $this->category_id);
        $stmt->bindParam(':image', $this->image);
        $stmt->bindParam(':state_id', $this->state_id);
        $stmt->bindParam(':source', $this->source);
        
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
        $stmt->bindParam(':image', $this->image);
        $stmt->bindParam(':state_id', $this->state_id);
        $stmt->bindParam(':id', $this->id);

        if ($stmt->execute()) {
            return Response::payload(true,'Actualizado correctamente',null);
        }else{
            return Response::payload(false,'Error al actualizar',null);
        }
        
    }
    public function delete(){
        $sql = "DELETE FROM CARRUSEL WHERE ID = :id";

        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':id', $this->id);

        if ($stmt->execute()) {
            return Response::payload(true,'Eliminado correctamente',null);
        }else{
            return Response::payload(false,'Error al eliminar',null);
        }
        
    }
}
