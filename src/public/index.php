<?php

require_once '../core/router.php';
require_once '../core/db.php';
require_once '../core/response.php';

$router = new Router();

// Definir rutas aquí
//rutas de empleado
$router->add('GET', 'employees', 'EmployeeController', 'get');
$router->add('POST', 'employees/save', 'EmployeeController', 'save');
$router->add('POST', 'employees/update', 'EmployeeController', 'update');
$router->add('POST', 'employees/disable', 'EmployeeController', 'disable');

$router->dispatch($_SERVER['REQUEST_URI']);
