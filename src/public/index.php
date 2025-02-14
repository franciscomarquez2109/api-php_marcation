<?php

require_once '../core/router.php';
require_once '../core/db.php';
require_once '../core/response.php';

$router = new Router();

// Definir rutas aquí
//rutas de parroquia
$router->add('GET', 'priest', 'priestController', 'PriestController','get');

//rutas carrusel
$router->add('GET', 'carousel', 'carouselController','CarouselController','get');
$router->add('POST','carousel','carouselController','CarouselController','save');
$router->add('PUT','carousel/{id}','carouselController','CarouselController','update');
$router->add('DELETE','carousel/{id}','carouselController','CarouselController','delete');

//rutas noticias
$router->add('GET', 'notices', 'noticeController','NoticeController','get');
$router->add('POST', 'notice', 'noticeController','NoticeController','save');

//rutas de user
$router->add('POST', 'user', 'usersController', 'UsersController','get');

$router->dispatch($_SERVER['REQUEST_URI']);
