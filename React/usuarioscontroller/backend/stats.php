<?php
require 'db.php';

// Configurar CORS
header("Access-Control-Allow-Origin: http://localhost:3000");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Content-Type: application/json");

// Preflight CORS
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

// Validar método
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(["error" => "Método no permitido"]);
    exit;
}

// Leer JSON
$json = file_get_contents("php://input");
if (!$json) {
    http_response_code(400);
    echo json_encode(["error" => "Solicitud vacía"]);
    exit;
}

$data = json_decode($json, true);
if (!isset($data['fecha_inicio'], $data['fecha_fin'])) {
    http_response_code(400);
    echo json_encode(["error" => "Faltan fechas"]);
    exit;
}

$fechaInicio = $data['fecha_inicio'];
$fechaFin = $data['fecha_fin'];

try {
    // Estadísticas globales
    $stmt = $pdo->prepare("
        SELECT 
            ROUND(AVG(insulina), 2) AS media,
            MIN(insulina) AS minimo,
            MAX(insulina) AS maximo
        FROM comida
        WHERE fecha_control BETWEEN ? AND ?
    ");
    $stmt->execute([$fechaInicio, $fechaFin]);
    $resumen = $stmt->fetch();

    // Evolución diaria
    $stmt2 = $pdo->prepare("
        SELECT fecha_control, ROUND(AVG(insulina), 2) AS promedio_dia
        FROM comida
        WHERE fecha_control BETWEEN ? AND ?
        GROUP BY fecha_control
        ORDER BY fecha_control ASC
    ");
    $stmt2->execute([$fechaInicio, $fechaFin]);
    $evolucion = $stmt2->fetchAll();

    echo json_encode([
        "resumen" => $resumen,
        "evolucion" => $evolucion
    ]);
} catch (Exception $e) {
    error_log("Error en stats.php: " . $e->getMessage());
    http_response_code(500);
    echo json_encode(["error" => "Error al obtener estadísticas"]);
}
