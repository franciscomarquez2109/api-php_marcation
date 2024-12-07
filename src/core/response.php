<?php

class Response {
    public static function json($success,$msg,$payload,$status = 200) {
        http_response_code($status);
        header('Content-Type: application/json');
        echo json_encode([
            'success' => $success,
            'msg' => $msg,
            'payload' => $payload
        ]);
    }
    public static function payload($success, $msg, $payload) {
        return [
            'success' => $success,
            'msg' => $msg,
            'payload' => $payload
        ];
    }
}
