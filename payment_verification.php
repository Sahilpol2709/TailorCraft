<?php
session_start();
require 'razorpay-php/Razorpay.php'; 
use Razorpay\Api\Api;

$data = json_decode(file_get_contents('php://input'), true);

$order_id = isset($data['order_id']) ? (int)$data['order_id'] : 0;
$payment_id = isset($data['payment_id']) ? $data['payment_id'] : '';

if ($order_id == 0 || !$payment_id) {
    die("Error: Invalid order ID or payment ID!");
}

$conn = new mysqli('localhost', 'root', '', 'tailor_management_system');
if ($conn->connect_error) {
    die("Database connection failed: " . $conn->connect_error);
}

$key_id = "YOUR_RAZORPAY_KEY_ID";
$key_secret = "YOUR_RAZORPAY_SECRET";
$api = new Api($key_id, $key_secret);

try {
    $payment = $api->payment->fetch($payment_id);
    
    if ($payment->status == 'captured') {
        $update_query = $conn->prepare("UPDATE orders SET razorpay_payment_id = ?, payment_status = 'success' WHERE order_id = ?");
        $update_query->bind_param("si", $payment_id, $order_id);
        $update_query->execute();

        if ($update_query->affected_rows > 0) {
            echo json_encode(['success' => true, 'message' => 'Payment verified and stored successfully']);
        } else {
            echo json_encode(['success' => false, 'message' => 'Failed to update payment information']);
        }
    } else {
        echo json_encode(['success' => false, 'message' => 'Payment not captured']);
    }
} catch (Exception $e) {
    echo json_encode(['success' => false, 'message' => 'Error verifying payment: ' . $e->getMessage()]);
}

$conn->close();
?>
