<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<title>Insert title here</title>
<!-- Include the script.js file here -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <script src="js/script.js"></script>
</head>
<body>

 <!-- Include jQuery and Bootstrap JS once -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<h3>Pay amount</h3>

<input id="payment_field" type="text" class="form-control mb-2" placeholder="Enter amount here">
<div class="container text-center mt-4">
<button onclick="paymentStart()" class="btn btn-success">PAY</button>

</div>
</body>
</html>