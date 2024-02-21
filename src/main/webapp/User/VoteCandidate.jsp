<%@page import="java.sql.ResultSet"%>
<%@page import="com.voting.system.helper.QueriesProvider"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.voting.system.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap demo</title>
<jsp:include page="../Components/Header.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../Components/NavBar.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<h1>Pick Your Candidate</h1>
		</div>

		<div class="row">
			<div class="row row-cols-1 row-cols-md-3 g-3">
				<%
				String electionId = "1";
				String studentName = "";
				String partySlogan = "";
				String studentImage = "";
				String studentId = "5";

				Connection con = ConnectionProvider.getConnection();
				PreparedStatement stmt = con.prepareStatement(QueriesProvider.CandiateCampainQuery);
				ResultSet rs = stmt.executeQuery();

				System.out.println(ConnectionProvider.studentHasVoted(studentId));
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

						<div class="card-footer">
							<small class="text-muted">Last updated 3 mins ago</small>
						</div>
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