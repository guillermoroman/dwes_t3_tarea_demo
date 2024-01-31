<?php

include ('conectarDB.php');
$conn = conectarDB();
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombrePizza = $_POST['nombre'];
    $costePizza = $_POST['coste'];
    $precioPizza = $_POST['precio'];
    $ingredientesPizza = $_POST['ingredientes'];

    $insertar = $conn->prepare("INSERT INTO pizzas (nombre, coste, precio, ingredientes) VALUES (:nombre, :coste, :precio, :ingredientes)");

    $insertar->bindParam(':nombre', $nombrePizza);
    $insertar->bindParam(':coste', $costePizza);
    $insertar->bindParam(':precio', $precioPizza);
    $insertar->bindParam(':ingredientes', $ingredientesPizza);

    $insertar->execute();

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
    <h1>Zona admin</h1>

    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="POST">
        Nombre: <input type="text" name="nombre"><br>
        Coste: <input type="number" step="0.01" name="coste"><br>
        Precio: <input type="number" step="0.01" name="precio"><br>
        Ingredientes: <textarea name="ingredientes"></textarea><br>
        <input type="submit" name="submit" value="Añadir Pizza">
    </form>


</body>

</html>