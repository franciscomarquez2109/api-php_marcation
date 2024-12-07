<?php
class Database {
    private $host = 'postgres';
    private $db_name = 'diocesis';
    private $username = 'postgres';
    private $password = 'postgres';
    private $conn;

    public function getConnection() {
        $this->conn = null;

        try {
            $dsn = "pgsql:host=" . $this->host . ";port=5432;dbname=" . $this->db_name . ";";
            $this->conn = new PDO($dsn, $this->username, $this->password);
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $exception) {
            throw new Exception("Connection error: " . $exception->getMessage());
        }

        return $this->conn;
    }

    public function beginTransaction() {
        $this->conn->beginTransaction();
    }

    public function commit() {
        $this->conn->commit();
    }

    public function rollback() {
        $this->conn->rollBack();
    }

    public function closeConnection() {
        $this->conn = null;
    }
}
