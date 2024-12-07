<?php

class Router {
    protected $routes = [];

    public function __construct() {
        $this->routes = [
            'GET' => [],
            'POST' => [],
            'PUT' => [],
            'DELETE' => [],
            'PATCH'=> []
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
            $routeRegex = preg_replace('/\{([a-zA-Z0-9_]+)\}/', '(?P<$1>[a-zA-Z0-9_-]+)', $route);
            $routeRegex = "#^" . $routeRegex . "$#";
    
            if (preg_match($routeRegex, $uri, $matches)) {
                $controllerName = $handler['nameController'];
                $controller = $handler['controller'];
                $actionName = $handler['action'];
    
                $params = array_filter($matches, 'is_string', ARRAY_FILTER_USE_KEY);
    
                require_once "../controllers/{$controller}.php";
                $obj = new $controllerName();
                call_user_func_array([$obj, $actionName], $params);
                return;
            }
        }
    
        http_response_code(404);
        echo json_encode(['error' => 'Not Found']);
    }
    
}

