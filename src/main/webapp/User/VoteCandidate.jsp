<%@page import="java.sql.ResultSet"%>
<%@page import="com.voting.system.helper.QueriesProvider"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.voting.system.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
if (session.getAttribute("user") == null) {
	response.sendRedirect("UserLogin.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap demo</title>
<jsp:include page="../Components/Header.jsp"></jsp:include>
</head>
<body>

	<%
	String electionId = request.getParameter("electionId");
	String studentName = "";
	String partySlogan = "";
	String studentImage = "";
	String studentId = (String) session.getAttribute("user");
	String electionName = "";
	Connection con = ConnectionProvider.getConnection();
	PreparedStatement stmt = con.prepareStatement("select election_name from election where id= " + electionId);
	ResultSet rs = stmt.executeQuery();
	while (rs.next()) {
		electionName = rs.getString("election_name");
	}
	%>
	<jsp:include page="../Components/NavBarUser.jsp"></jsp:include>

	<article style="margin-top: 6rem">
		<div class="container mt-5">
			<div class="row alert-info alert m-2">
				<div class="col">
					<h1>Pick Your Candidate</h1>
				</div>
				<div class="col d-flex justify-content-end align-items-center ">
					<span class="mx-2">
						<h2>Election Name</h2>
					</span> <span>
						<h2
							class="bg-success text-white m-0 border-3 border border-dark rounded-pill px-4">
							<%=electionName%>
						</h2>
					</span>
				</div>

			</div>
			<%
			System.out.print(ConnectionProvider.studentHasVoted(studentId, electionId));

			if (ConnectionProvider.studentHasVoted(studentId, electionId)) {
			%>
			<div class="row m-2">
				<div class="alert alert-danger alert-dismissible fade show"
					role="alert">
					<h5>
						<i class="bi bi-exclamation-octagon-fill"></i> <strong>You
							have already Voted in this Election</strong>
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</h5>
				</div>
			</div>
			<%
			}
			%>

			<div class="row">
				<div class="row row-cols-1 row-cols-md-3">
					<%
					stmt = con.prepareStatement(QueriesProvider.candiateCampainQuery);
					stmt.setString(1, electionId);
					rs = stmt.executeQuery();
					while (rs.next()) {
						studentName = rs.getString("firstName") + " " + " " + rs.getString("middleName") + rs.getString("lastName");
						partySlogan = rs.getString("slogan");
						studentImage = rs.getString("student_image");
					%>
					<div class="col">
						<div class="card h-100">
							<div style="height: 15rem">
								<img
									style="width: 100%; height: 100%; object-fit: cover; object-position: 15% 35%;"
									src="<%=rs.getString("partySymbol")%>" class="card-img-top"
									alt="...">
							</div>
							<div class="card-body">
								<h4 class="card-title"><%=rs.getString("partyName")%></h4>
								<p class="card-text">
									<%=rs.getString("slogan")%>
								</p>
								<h5 class="card-title"><%=rs.getString("firstName")%>
									<%=rs.getString("lastName")%></h5>
							</div>
							<button
								onclick="voteFor(
							'<%=studentImage%>','<%=studentName%>',
							'<%=partySlogan%>',<%=rs.getString("id")%>)"
								class="btn btn-primary mx-2 mb-2">Vote</button>


						</div>
					</div>
					<%
					}
					%>

				</div>
			</div>
		</div>

		<div class="container">
			<div class="row"></div>

		</div>

	</article>
	<jsp:include page="../Components/Footer.jsp"></jsp:include>

	<script type="text/javascript">
	
	function voteFor(studentImage,studentName,slogan,candidateId){
		Swal.fire({
			  title: studentName,
			  text: slogan,
			  imageUrl: studentImage,
			  imageWidth: 500,
			  imageHeight: 300,
			  imageAlt: "Custom image",
			  confirmButtonColor: "Green",
			  confirmButtonText: "  Yes, Vote ! ",
			  cancelButtonColor: "#d33",
			  cancelButtonText:"Cancle",
			  showCloseButton: true,
			  showCancelButton: true,

			}).then((result)=>{
					console.log(result);	
					if(result.isConfirmed){
						submitVote(<%=studentId%>,candidateId,<%=electionId%>);
					}
			});

	}
	
	function submitVote(studentId,candidateId,electionId){
		$.ajax({
			type : 'POST',
			url : "DB/VoteCandidateDB.jsp",
			data : {studentId,candidateId,electionId},
			success : function(response) {
					console.log(response.trim())
					if(response.trim()[0]==="0"){
					Swal.fire({
					title: response.trim().slice(1),
					text: "Click ok to continue ",
					icon: "error"
					}).then(()=>{
						
					window.location.reload();
					});
					return;
					}
					else if(response.trim()[0]==="1"){
						Swal.fire({
							title: response.trim().slice(1),
							text: "Click ok to continue ",
							icon: "success"
							}).then(()=>{
								
							window.location.reload();
							});
							return;
					}
	/* 				document .querySelector("#listContainer").innerHTML = response.trim() */
					}
				})				
	}
								

	</script>
</body>
</html>