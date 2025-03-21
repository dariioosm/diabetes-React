<?php
require 'db.php';

// Configurar CORS de manera segura
header("Access-Control-Allow-Origin: http://localhost:3000");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Content-Type: application/json");

// Manejo de preflight OPTIONS
if ($_SERVER['REQUEST_METHOD'] === "OPTIONS") {
    http_response_code(200);
    exit();
}

$method = $_SERVER['REQUEST_METHOD'];
$data = [];

// Solo decodificamos JSON si NO es GET
if ($method !== 'GET') {
    $json = file_get_contents("php://input");
    if (!$json) {
        http_response_code(400);
        echo json_encode(["error" => "Solicitud vacía"]);
        exit;
    }

    $data = json_decode($json, true);
    if (!is_array($data)) {
        http_response_code(400);
        echo json_encode(["error" => "JSON inválido"]);
        exit;
    }
}

// CONSULTAR TODOS LOS USUARIOS
if ($method === 'GET') {
    try {
        $stmt = $pdo->query("SELECT id_usuario, nombre, apellidos, fecha_nacimiento, login FROM usuarios");
        echo json_encode($stmt->fetchAll());
    } catch (Exception $e) {
        error_log("Error en users.php (GET): " . $e->getMessage());
        http_response_code(500);
        echo json_encode(["error" => "Error en el servidor"]);
    }
    exit;
}

// AÑADIR NUEVO USUARIO
if ($method === 'POST') {
    if (empty($data['nombre']) || empty($data['apellidos']) || empty($data['fecha_nacimiento']) || empty($data['login']) || empty($data['pass'])) {
        http_response_code(400);
        echo json_encode(["error" => "Todos los campos son obligatorios"]);
        exit;
    }

    try {
        $stmt = $pdo->prepare("INSERT INTO usuarios (nombre, apellidos, fecha_nacimiento, login, pass) VALUES (?, ?, ?, ?, ?)");
        $hashed_pass = password_hash($data['pass'], PASSWORD_DEFAULT);
        $stmt->execute([$data['nombre'], $data['apellidos'], $data['fecha_nacimiento'], $data['login'], $hashed_pass]);
        echo json_encode(["mensaje" => "Usuario añadido"]);
    } catch (Exception $e) {
        error_log("Error en users.php (POST): " . $e->getMessage());
        http_response_code(500);
        echo json_encode(["error" => "Error en el servidor"]);
    }
    exit;
}

// ACTUALIZAR USUARIO por login
if ($method === 'PUT') {
    if (empty($data['login'])) {
        http_response_code(400);
        echo json_encode(["error" => "Falta login"]);
        exit;
    }

    $campos = ['nombre', 'apellidos', 'fecha_nacimiento', 'pass'];
    $set = [];
    $params = [];

    foreach ($campos as $campo) {
        if (!empty($data[$campo])) {
            $set[] = "$campo = ?";
            $params[] = $campo === 'pass' ? password_hash($data[$campo], PASSWORD_DEFAULT) : $data[$campo];
        }
    }

    if (empty($set)) {
        echo json_encode(["mensaje" => "Nada que actualizar"]);
        exit;
    }

    $params[] = $data['login'];

    try {
        $stmt = $pdo->prepare("UPDATE usuarios SET " . implode(', ', $set) . " WHERE login = ?");
        $stmt->execute($params);
        echo json_encode(["mensaje" => "Usuario actualizado"]);
    } catch (Exception $e) {
        error_log("Error en users.php (PUT): " . $e->getMessage());
        http_response_code(500);
        echo json_encode(["error" => "Error en el servidor"]);
    }
    exit;
}

// ELIMINAR USUARIO por login
if ($method === 'DELETE') {
    if (empty($data['login'])) {
        http_response_code(400);
        echo json_encode(["error" => "Falta login"]);
        exit;
    }

    try {
        $stmt = $pdo->prepare("DELETE FROM usuarios WHERE login = ?");
        $stmt->execute([$data['login']]);
        echo json_encode(["mensaje" => "Usuario eliminado"]);
    } catch (Exception $e) {
        error_log("Error en users.php (DELETE): " . $e->getMessage());
        http_response_code(500);
        echo json_encode(["error" => "Error en el servidor"]);
    }
    exit;
}
?>
