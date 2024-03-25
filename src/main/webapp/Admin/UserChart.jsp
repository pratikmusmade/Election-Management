<%@page import="java.sql.ResultSet"%>
<%@page import="com.voting.system.helper.QueriesProvider"%>
<%@page import="com.voting.system.helper.ConnectionProvider"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet" href="./index.css" />
<jsp:include page="../Components/Header.jsp"></jsp:include>

</head>
<body>
	<%
	String candidateId = request.getParameter("candidateId");
	String electionId = request.getParameter("electionId");
	String candidateName = request.getParameter("candidateFullName");
	String totalVotes = request.getParameter("totalVotes");


	int male = 0, female = 0, other = 0;

	/* System.out.println("C-->" + candidateId);
	System.out.println("E-->" + electionId);
	System.out.println("FN-->" + candidateName); */

	PreparedStatement pst = ConnectionProvider.getConnection().prepareStatement(QueriesProvider.countNoOfMaleAndFemaleVote);
	pst.setString(1, electionId);
	pst.setString(2, candidateId);
	ResultSet rs = pst.executeQuery();
	while (rs.next()) {
		if (rs.getString("gender").equals("Male")) {
			male = rs.getInt("votes");
		} else if (rs.getString("gender").equals("Female")) {
			female = rs.getInt("votes");
		} else if (rs.getString("gender").equals("Other")) {
			other = rs.getInt("votes");
		}
	}

	System.out.println("M-->" + male);
	System.out.println("F-->" + female);
	System.out.println("OT-->" + other);
	%>
	<jsp:include page="../Components/NavBar.jsp"></jsp:include>
	<jsp:include page="../Components/SideBar.jsp"></jsp:include>
	<main>
		<div class="container mt-5">
			<div class="row">
				<div class="col-lg-4 text-center">
					<h3 class=" alert alert-dark"><%=candidateName%></h3>
				</div>
				<div class="col-lg-5"></div>
				<div class="col-lg-3 text-center">
					<h3 class="alert alert-info">Total Votes :- <%=totalVotes %></h3>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col">
					<canvas id="myChart"></canvas>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="../Components/Footer.jsp"></jsp:include>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.bundle.js"
		integrity="sha512-zO8oeHCxetPn1Hd9PdDleg5Tw1bAaP0YmNvPY8CwcRyUk7d7/+nyElmFrB6f7vg4f7Fv4sui1mcep8RIEShczg=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script>
		const canvas = document.querySelector("#myChart");
		let ctx = canvas.getContext("2d");
		var myDoughnutChart = new Chart(ctx, {
			type : "doughnut",
			data : {
				labels : [ "Male", "Female", "Other" ],
				datasets : [
						{
							label : "# of Votes",
							data : [
	<%=male%>
		,
	<%=female%>
		,
	<%=other%>
		],
							backgroundColor : [ "rgba(255, 99, 132, 0.4)",
									"rgba(75, 192, 192, 0.7)",
									'rgba(54, 162, 235, 0.2)',

							],
							borderColor : [ "rgba(255, 99, 132, 1)",
									"rgba(75, 192, 192, 1)",
									'rgba(54, 162, 235, 1)',

							],
							borderWidth : 1,
						}, ],
			},
			options : {
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true,
						},
					}, ],
				},
			},
		});
	</script>
</body>
</html>
