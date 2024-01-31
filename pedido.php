
<?php

include ('conectarDB.php');
$conn = conectarDB();

$sql = "SELECT id, nombre, precio FROM pizzas";
$stmt = $conn->prepare($sql);
$stmt->execute();
$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

<h1>Realizar pedido</h1>
<form action = "procesar_pedido.php" method = "POST">
    <?php for  ($i = 1; $i <=4; $i++): ?>

        <label for="pizza<?= $i ?>">Pizza <?= $i ?></label>
        <select name="pizza<?= $i ?>" id="pizza<?= $i ?>">
            <option value="">Selecciona una Pizza</option>

            <?php
            foreach($rows as $row) {
                echo"<option value='" . $row["id"] . "'>" . $row ["nombre"] . " " . $row ["precio"] . "€</option>";
            }
            ?>
        </select>
        <br>
    <?php
    endfor;
    ?>

    <input type="submit" value = "Hacer Pedido">

</form>
    
</body>
</html>