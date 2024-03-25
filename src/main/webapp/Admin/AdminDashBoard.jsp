<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
if (session.getAttribute("user") == null) {
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
		<div class="container mt-5">
		<div class="row">
			<h1>DashBoard</h1>
		
		</div>
			<div class="row ">
				<div class="col">
					<div class="card text-dark alert-success  mt-5 shadow"
						style="max-width: 18rem;">
						<div class="card-header text-center">
							<h4>
								<strong> Student Info <i class="bi bi-info-square-fill"></i>
								</strong>
							</h4>
						</div>
						<div class="card-body py-4">
							<div class="container">
								<div class="row">
									<div class="col-lg-4">
										<h1 style="font-size: 4rem;">
											<i class="bi bi-person-workspace"></i>
										</h1>
									</div>
									<div class="col-lg-8">

										<a class="btn-info btn px-3 py-1 rounded mb-2" role="alert"
										href="AddStudent.jsp"
										>
											Add Student</a>
										<a class="btn-info btn  px-3 py-1 rounded mb-2" role="alert"
										href="StudentList.jsp	"
										>
											Student List &nbsp;</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			
				<div class="col">
					<div class="card text-dark alert-primary  mt-5 shadow"
						style="max-width: 18rem;">
						<div class="card-header text-center">
							<h4>
								<strong> Academics <i class="bi bi-journal-richtext"></i>
								</strong>
							</h4>
						</div>
						<div class="card-body py-4">
							<div class="container">
								<div class="row">
									<div class="col-lg-4">
										<h1 style="font-size: 4rem;">
											<i class="bi bi-building"></i>
										</h1>
									</div>
									<div class="col-lg-8">

										<a class="btn-info btn px-3 py-1 rounded mb-2" role="alert"
										href="AddBranch.jsp"
										>
											Add Branch</a>
										<a class="btn-info btn  px-3 py-1 rounded mb-2" role="alert"
										href="AddYear.jsp	"
										>
											Add Year &nbsp;</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
				<div class="col">
					<div class="card text-dark alert-warning  mt-5 shadow"
						style="max-width: 18rem;">
						<div class="card-header text-center">
							<h4>
								<strong> Election <i class="bi bi-ticket-perforated-fill"></i>
								</strong>
							</h4>
						</div>
						<div class="card-body py-4">
							<div class="container">
								<div class="row">
									<div class="col-lg-4">
										<h1 style="font-size: 4rem;">
											<i class="bi bi-person-raised-hand"></i>
										</h1>
									</div>
									<div class="col-lg-8">

										<a class="btn-info btn px-3 py-1 rounded mb-2" role="alert"
										href="AddElection.jsp"
										>
											Add Election</a>
										<a class="btn-info btn  px-3 py-1 rounded mb-2" role="alert"
										href="AddElection.jsp	"
										>
											Election List &nbsp;</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
				<div class="col">
					<div class="card text-dark alert-danger  mt-5 shadow"
						style="max-width: 18rem;">
						<div class="card-header text-center">
							<h4>
								<strong> Result <i class="bi bi-clock-fill"></i>
								</strong>
							</h4>
						</div>
						<div class="card-body py-4">
							<div class="container">
								<div class="row">
									<div class="col-lg-4">
										<h1 style="font-size: 4rem;">
											<i class="bi bi-bar-chart-fill"></i>
										</h1>
									</div>
									<div class="col-lg-8">

										<a class="btn-info btn px-3 py-1 rounded mb-2" role="alert"
										href="ElectionResult.jsp"
										>
											Election Result</a>
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
				
				
				
				
			</div>
		</div>
	</main>


	<jsp:include page="../Components/Footer.jsp"></jsp:include>
</body>
</html>