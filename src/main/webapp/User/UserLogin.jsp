<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap demo</title>
<jsp:include page="../Components/Header.jsp"></jsp:include>

</head>
<body class="d-flex align-items-center"
	style="height: 100vh; background: url('../assets/images/background-image.jpg'); background-repeat: no-repeat; object-fit: cover; background-size: cover;">

	<div class="container">
		<div class="row position-relative">
			<div class="col-lg-3"></div>
			<div
				class="col-lg-6 m-2 border border-dark border-2 rounded px-5 py-3 bg-white">
				<h1 class="text-center">User Login</h1>
				<div id="invalid-credentials-alert-box">
				</div>
				<form id="userLoginForm">
					<div class="mb-3">
						<label for="exampleInputEmail1" class="form-label">Enrollment Number</label> <input type="text" class="form-control"
							name="enrollment_number" id="exampleInputEmail1"
							aria-describedby="emailHelp" required>

					</div>
					<div class="mb-3">
						<label for="exampleInputPassword1" class="form-label">Password</label>
						<input type="password" class="form-control" name="password"
							id="exampleInputPassword1" required>
					</div>
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
			</div>
		</div>
	</div>


	<jsp:include page="../Components/Footer.jsp"></jsp:include>
	<script type="text/javascript">

	const alertBox= document.querySelector("#invalid-credentials-alert-box");
	console.log(alertBox);
	const alerBoxCode = `
		<div class="alert alert-danger alert-dismissible fade show"
		role="alert">
		<i class="bi bi-exclamation-octagon-fill"></i>
		<strong>Invalid Credentials!</strong> Your Enrollment Number or Password is <strong>Incorrect !!!</strong>
		<button type="button" class="btn-close" data-bs-dismiss="alert"
			aria-label="Close"></button>
	</div>
						`
$(document).ready(function () {
	  
    $("#userLoginForm").submit(function (e) {
      e.preventDefault();
      $.ajax({
        type: "POST",
        url: "DB/UserLoginDB.jsp",
        data: $("#userLoginForm").serialize(),
        success: function (response) {        	
          if (response.trim()[0] === "1") {
            Swal.fire({
              title: "Login Successful",
              text: "Click OK to continue!",
              icon: "success",
            }).then((res) => {
              window.location = "UserDashboard.jsp";
            });
          } else {
        	  alertBox.innerHTML = alerBoxCode
          }
        },
      });
    });
  });
  
</script>
</body>
</html>