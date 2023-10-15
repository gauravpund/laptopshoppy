<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>SIGN UP</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

  <style>
    .card {
      background: #fbfbfb;
      border-radius: 8px;
      box-shadow: 1px 2px 8px rgba(0, 0, 0, 0.65);
      max-width: 750px;
      margin: 0 auto; /* Center the card horizontally */
    }
    .card-content {
      padding: 12px 44px;
    }
  </style>
</head>
<body>

  <%@include file="navbar.jsp" %> 
  
  

  <div class="mt-3 container mt-3">
  	<%@include file="component/message.jsp" %>
    <div class="row justify-content-center">
      <div class="col-md-8">  
        <div class="card mt-2">
          <div class="card-content">
            <div class="card-body">
              
              <form action="RegisterServlet" method="post">
                <h2 class="card-header bg-white text-center font-weight-bold ">Sign up</h2>
                <div class="form-group mt-3">
                  <label for="name" class="font-weight-bold">Enter Your Name</label>
                  <input type="text" name="userName" class="form-control" id="name" placeholder="Enter Your Name" required>
                </div>
                <div class="form-group">
                  <label for="email" class="font-weight-bold">Enter Email</label>
                  <input type="text" name="userEmail" class="form-control" id="email" placeholder="Enter Your Email" required>
                </div>
                <div class="form-group">
                  <label for="pass" class="font-weight-bold">Create Password</label>
                  <input type="password" name="userPassword" class="form-control" id="pass" placeholder="Enter Your Password" required>
                </div>
                <div class="form-group">
                  <label for="phone" class="font-weight-bold">Enter Phone</label>
                  <input type="text" name="userPhone" class="form-control" id="phone" placeholder="Enter Your Phone" required>
                </div>
                <div class="form-group">
                  <label for="address" class="font-weight-bold">Enter Address</label>
                  <input type="text" name="userAddress" class="form-control" id="address" placeholder="Enter Your Address" required>
                </div>
                
                <div class="row">
                  <div class="col-md-4">
                    <button class="btn btn-success">SignUp</button>
                  </div>
                  <div class="col-md-8">
                    <button type="reset" class="btn btn-outline-warning">Clear</button>
                  </div>
                </div>
                <p class="text-center mt-4">Already have an account, please <a href="login.jsp">Login here</a></p>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <%@include file="footer.jsp" %>
  
  <script>
    function validateForm() {
        var userName = document.getElementById("name").value;
        var userEmail = document.getElementById("email").value;
        var userPassword = document.getElementById("pass").value;
        var userPhone = document.getElementById("phone").value;
        var userAddress = document.getElementById("address").value;
        
        if (userName === "" || userEmail === "" || userPassword === "" || userPhone === "" || userAddress === "") {
            alert("All Information Must Be Filled.");
            return false; // Prevent form submission
        }
        
        // You can add more specific validations here, e.g., for email format, password strength, etc.
        
        return true; // Allow form submission
    }
</script>
</body>
</html>
