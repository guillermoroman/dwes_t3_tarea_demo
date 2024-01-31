<?php

include("conectarDB.php");

$conn = conectarDB();

if ($_SERVER ["REQUEST_METHOD"] == "POST") {
    $id_cliente = 1;
    $fecha_pedido = date("Y-m-d H:i:s");
    $detalle_pedido = "";
    $total = 0;

    for ($i = 1; $i <= 4; $i++){
        $id = $_POST["pizza$i"];
        if(!empty($id)){
            $stmt = $conn->prepare("SELECT nombre, precio from pizzas WHERE id = :id");
            $stmt->bindParam(':id', $id);
            $stmt->execute();

            if ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                $detalle_pedido .= $row["nombre"] . ", ";
                $total += $row["precio"];
            }
        }
    }

    $detalle_pedido = rtrim($detalle_pedido, ", ");

    //Insertar en la tabla de pedidos
    $stmt = $conn->prepare("INSERT INTO pedidos (id_cliente, fecha_pedido, detalle_pedido, total)
        VALUES (:id_cliente, :fecha_pedido, :detalle_pedido, :total)");

    $stmt->bindParam(":id_cliente", $id_cliente);
    $stmt->bindParam(":fecha_pedido", $fecha_pedido);
    $stmt->bindParam(":detalle_pedido", $detalle_pedido);
    $stmt->bindParam(":total", $total);

    if($stmt->execute()){
        $mensaje = "Pedido realizado con éxito";
    } else {
        $mensaje = "Error al realizar el pedido";
    }


}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

<h1>Pedido</h1>
<h3><?=$mensaje?></h3>

    
</body>
</html>