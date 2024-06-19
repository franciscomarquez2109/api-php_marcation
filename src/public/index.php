<?php

require_once '../core/router.php';
require_once '../core/db.php';
require_once '../core/response.php';

$router = new Router();

// Definir rutas aquí
//rutas de empleado
$router->add('GET', 'employees', 'employeeController', 'EmployeeController','get');
$router->add('POST', 'employees/save', 'employeeController', 'EmployeeController','save');
$router->add('POST', 'employees/update', 'employeeController', 'EmployeeController','update');
$router->add('POST', 'employees/disable', 'employeeController', 'EmployeeController','disable');

//rutas de registro de marcacion
$router->add('GET', 'marking', 'dailingRegistrationController','DialingRegistrationController', 'get');
$router->add('POST', 'marking/save', 'dailingRegistrationController', 'DialingRegistrationController','save');

//rutas de eventos diarios
$router->add('GET', 'events', 'dailyEventsController', 'DailyEventsController','get');
$router->add('POST', 'events/save', 'dailyEventsController', 'DailyEventsController','save');

$router->dispatch($_SERVER['REQUEST_URI']);
