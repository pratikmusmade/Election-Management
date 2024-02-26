<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
if(session.getAttribute("user") == null){
	  response.sendRedirect("AdminLogin.jsp"); 
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="../Components/Header.jsp"></jsp:include>

</head>
<body>
	<jsp:include page="../Components/SideBar.jsp"></jsp:include>
	<jsp:include page="../Components/NavBar.jsp"></jsp:include>

	<main>
		<div class="row p-2 m-8">
			<div class="col-md-4 mt-6">
				<div class="row">
					<div class="card text-white bg-primary ms-4 mt-4"
						style="max-width: 18rem;">
						<div class="card-header">
							<span class="me-2"><i class="bi bi-backpack"></i></span>Student
						</div>
						<div class="card-body">
							<h5 class="card-title">Primary card title</h5>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="row">
					<div class="card text-white bg-danger ms-4 mt-4"
						style="max-width: 18rem;">
						<div class="card-header">
							<span class="me-2"><i class="bi bi-person-circle"></i></span> <span>Academics</span>
						</div>
						<div class="card-body">
							<h5 class="card-title">Danger card title</h5>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="row">
					<div class="card text-dark bg-warning ms-4 mt-4"
						style="max-width: 18rem;">
						<div class="card-header">
							<span class="me-2"><i class="bi bi-flag-fill"></i></span> <span>Election</span>
						</div>
						<div class="card-body">
							<h5 class="card-title">Warning card title</h5>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row p-2 mt-4">
			<div class="col-md-4">
				<div class="row">
					<div class="card text-dark bg-info ms-4" style="max-width: 18rem;">
						<div class="card-header">
							<span class="me-2"><i class="bi bi-flag-fill"></i></span> <span>Election
								Result</span>
						</div>
						<div class="card-body">
							<h5 class="card-title">Warning card title</h5>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="row">
					<div class="card text-dark bg-success ms-4"
						style="max-width: 18rem;">
						<div class="card-header">Election Result</div>
						<div class="card-body">
							<h5 class="card-title">success card title</h5>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>


	<jsp:include page="../Components/Footer.jsp"></jsp:include>
</body>
</html>