<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
        Usuario: <input type="text" name="username"><br>
        Nombre: <input type="text"  name="name"><br>
        Contraseña: <input type="password" name="password"><br>
        Email: <input type="email" name="email" required><br>
        <input type="submit" name="submit" value="Crear Usuario">
    </form>
</body>
</html>

<?php
include ('./conectarDB.php');

$conn =  conectarDB();

if($_SERVER["REQUEST_METHOD"] == "POST"){
    //Almacenar datos

    $username = $_POST ['username'];
    $name = $_POST ['name'];
    $password = $_POST ['password'];
    $email = $_POST ['email'];
    $rol = 2;

    $insertar = $conn->prepare("INSERT INTO users (username, name, password, email, rol) VALUES (:username, :name, :password, :email, :rol)");

    $insertar->bindParam(':username', $username);
    $insertar->bindParam(':name', $name);
    $insertar->bindParam(':password', $password);
    $insertar->bindParam(':email', $email);
    $insertar->bindParam(':rol', $rol);

    $insertar->execute();

    echo("Usuario creado correctamente. Redirigiendo a la página de inicio...");
    //redirigir
    header("refresh:5; url=index.php");
}

?>