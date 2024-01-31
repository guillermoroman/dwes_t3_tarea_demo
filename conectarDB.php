<?php
function conectarDB(){
    $cadena_conexion = 'mysql:dbname=dwes_t3;host=127.0.0.1';
    $usuario = "root";
    $clave = "";

    try {
        $db = new PDO($cadena_conexion, $usuario, $clave);
        return $db;
    } catch (PDOException $e) {
        echo "error conectando la bd" . $e->getMessage();
        return null;
    }
}