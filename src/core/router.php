<?php

class Router {
    protected $routes = [];

    public function __construct() {
        $this->routes = [
            'GET' => [],
            'POST' => [],
            'PUT' => [],
            'DELETE' => []
        ];
    }

    public function add($method, $route, $controller, $nameController, $action) {
        $this->routes[$method][$route] = ['controller' => $controller,'nameController' => $nameController, 'action' => $action];
    }

    public function dispatch($uri) {
        $method = $_SERVER['REQUEST_METHOD'];
        
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");

        $uri = trim($uri, '/');
        
        foreach ($this->routes[$method] as $route => $handler) {
            if ($route == $uri) {
                $controllerName = $handler['nameController'];
                $controller = $handler['controller'];
                $actionName = $handler['action'];
                
                require_once "../controllers/{$controller}.php";
                $obj = new $controllerName();
                $obj->{$actionName}();
                return;
            }
        }

        http_response_code(404);
        echo json_encode(['error' => 'Not Found']);
    }
}

