<?php
include('./conectarDB.php');

function comprobar_usuario($username, $password){
    $conn = conectarDB();

    $stm = $conn->prepare("SELECT username, rol, id FROM users WHERE username = :username AND password = :password");
    $stm->bindParam(':username', $username);
    $stm->bindParam(':password', $password);
    $stm->execute();

    if ($stm->rowCount() > 0){
        $row = $stm->fetch(PDO::FETCH_ASSOC);
        return array("username" => $row["username"],
                     "rol" => $row["rol"],
                     "id" => $row["id"]);
    }
    else {
        return FALSE;
    }
}

if($_SERVER["REQUEST_METHOD"] == "POST"){
    $usu = comprobar_usuario($_POST["username"], $_POST["password"]);

    if ($usu == FALSE) {
        $username = $_POST["username"];
    } else {
        session_start();
        $_SESSION["username"] = $usu["username"];
        $_SESSION["rol"] = $usu["rol"];
        $_SESSION["id"] = $usu["id"];

        if($usu["rol"] === 1){
            header("Location:zona_admin.php");
            exit;
        } else if ($usu["rol"] === 2) {
            header("Location:pedido.php");
            exit;
        }
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


<?php
$conn = conectarDB();

function listarPizzas($conn)
{
    $consulta = $conn->prepare("SELECT nombre, precio FROM pizzas");
    $consulta->execute();

    foreach ($consulta as $row) {
        echo $row["nombre"] . ": " . $row["precio"] . "€ <br>";
    }
}

?>

<body>


    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="POST">
        <input value="<?php if (isset($username)) echo $username;?> "name="username" type="text">
        <input name="password" type="password">
        <button type="submit">Iniciar sesion </button>
    </form>

    <h1>Nuestras Pizzas</h1>
    <?php
    listarPizzas($conn);
    ?>

    <p>¿Nuevo aquí? <a href="nuevo_usuario.php">Crea una cuenta</a></p>
</body>

</html>