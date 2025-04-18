<?php
require('fpdf.php');

$order_id = isset($_GET['order_id']) ? (int)$_GET['order_id'] : 0;
$payment_method = isset($_GET['payment_method']) ? $_GET['payment_method'] : '';
$category_name = isset($_GET['category_name']) ? $_GET['category_name'] : '';

$conn = new mysqli('localhost', 'root', '', 'tailor_management_system');

$order_result = $conn->query("SELECT * FROM orders WHERE order_id = $order_id");

if ($order_result->num_rows > 0) {
    $order = $order_result->fetch_assoc();

    // Fetch the category_id from the 'orders' table
    $category_id = $order['category_id'];

    // Fetch the correct category and price_range from the 'prices' table based on category_id
    $price_result = $conn->query("SELECT category_name, price_range FROM prices WHERE category_id = $category_id");
    if ($price_result->num_rows > 0) {
        $price_details = $price_result->fetch_assoc();
        
        // Fetch payment details from the 'orders' table
        $payment_result = $conn->query("SELECT * FROM orders WHERE order_id = $order_id");
        if ($payment_result->num_rows > 0) {
            $payment_details = $payment_result->fetch_assoc();

            // Generate the PDF
            $pdf = new FPDF();
            $pdf->AddPage();

            // Logo and title
            $logo_path = 'C:\xampp\htdocs\Tailor\Logo.png';
            $logo_width = 30;
            $pdf->Image($logo_path, 10, 10, $logo_width);

            $pdf->SetFont('Arial', 'B', 30);
            $company_name = 'TailorCraft';
            $company_name_width = $pdf->GetStringWidth($company_name);

            $pdf->SetXY(($pdf->GetPageWidth() - $company_name_width) / 13, 10);
            $pdf->Cell(0, 10, $company_name, 0, 1, 'C');

            $pdf->Ln(5);

            $pdf->SetFont('Arial', 'I', 22);
            $pdf->Cell(0, 10, 'Receipt', 0, 1, 'C');
            $pdf->Ln(10);

            $pdf->SetLineWidth(0.5);
            $pdf->Line(10, $pdf->GetY(), 200, $pdf->GetY());
            $pdf->Ln(10);

            $pdf->SetFont('Arial', 'B', 14);
            $pdf->SetFillColor(50, 150, 255);
            $pdf->Cell(0, 10, 'Order Details', 0, 1, 'C', true);
            $pdf->Ln(5);

            $pdf->SetFont('Times', '', 14);
            $pdf->Cell(0, 10, "Order ID: " . $order['order_id'], 0, 1);
            $pdf->Cell(0, 10, "Payment ID: " . $order['razorpay_payment_id'], 0, 1);
            $pdf->Cell(0, 10, "Category Name: " . $category_name, 0, 1);
            $pdf->Cell(0, 10, "Customer Name: " . $order['full_name'], 0, 1);
            $pdf->Cell(0, 10, "Email: " . $order['email'], 0, 1);
            $pdf->Cell(0, 10, "Contact Number: " . $order['contact_no'], 0, 1);
            $pdf->Cell(0, 10, "Price Range: " . $price_details['price_range'], 0, 1);  // Updated to use price_range from prices table
            $pdf->Cell(0, 10, "Payment Status: " . $payment_details['payment_status'], 0, 1);
            $pdf->Ln(10);

            $pdf->SetLineWidth(0.5);
            $pdf->Line(10, $pdf->GetY(), 200, $pdf->GetY());
            $pdf->Ln(10);

            $pdf->SetFillColor(240, 240, 240);
            $pdf->SetFont('Arial', 'B', 14);
            $pdf->Cell(0, 10, 'Shop Information', 0, 1, 'C', true);
            $pdf->SetFont('Arial', '', 12);
            $pdf->Cell(0, 10, 'Address: Shop no.30, Shiva Samarth Apartment, Diva(East), Thane-400612', 0, 1);
            $pdf->Cell(0, 10, 'Shop Contact No: +91 9833364089', 0, 1);
            $pdf->Ln(15);

            $pdf->SetFont('Arial', 'I', 16);
            $pdf->SetTextColor(0, 128, 0);
            $pdf->Cell(0, 10, 'Thank you for choosing TailorCraft!!', 0, 1, 'C');
            $pdf->Ln(15);

            $pdf->SetFont('Arial', 'I', 12);
            $pdf->SetTextColor(100, 100, 100);
            $pdf->Cell(0, 10, 'Visit us at: www.tailorcraft.com', 0, 1, 'C');
            $pdf->Cell(0, 10, 'Follow us on Instagram: @tailorcraft_official', 0, 1, 'C');
            $pdf->Ln(15);

            $pdf->Output('D', 'receipt_order_' . $order['order_id'] . '.pdf');
        } else {
            echo "Payment details not found!";
        }
    } else {
        echo "Category price details not found!";
    }
} else {
    echo "Order not found!";
}

$conn->close();
?>
