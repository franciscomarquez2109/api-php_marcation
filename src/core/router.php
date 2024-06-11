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

    public function add($method, $route, $controller, $action) {
        $this->routes[$method][$route] = ['controller' => $controller, 'action' => $action];
    }

    public function dispatch($uri) {
        $method = $_SERVER['REQUEST_METHOD'];
        $uri = trim($uri, '/');
        
        foreach ($this->routes[$method] as $route => $handler) {
            if ($route == $uri) {
                $controllerName = $handler['controller'];
                $actionName = $handler['action'];

                require_once "../controllers/{$controllerName}.php";
                $controller = new $controllerName();
                $controller->{$actionName}();
                return;
            }
        }

        http_response_code(404);
        echo json_encode(['error' => 'Not Found']);
    }
}

