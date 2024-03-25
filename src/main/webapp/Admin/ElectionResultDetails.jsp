<%@page import="java.sql.ResultSet"%>
<%@page import="com.voting.system.helper.QueriesProvider"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.voting.system.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
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
	<%
	String WinnerName = "";
	String WinnerImage = "";
	String electionId = request.getParameter("electionId");
	String electionName = "";
	String electionStatus = "";
	PreparedStatement stmt = ConnectionProvider.getConnection().prepareStatement("select * from election where id=?");
	stmt.setString(1, electionId);
	ResultSet rs = stmt.executeQuery();
	while (rs.next()) {
		electionName = rs.getString("election_name");
		electionStatus = rs.getString("election_status");
	}
	%>
	<jsp:include page="../Components/NavBar.jsp"></jsp:include>
	<jsp:include page="../Components/SideBar.jsp"></jsp:include>
	<main>
		<div class="container">
			<div class="row">
				<div class="col-lg-10">

					<h2 class="mt-2">
						Candidates for <span class="badge bg-danger"><%=electionName%></span>
						Election
					</h2>
				</div>



				<div class="col-lg-2">

					<button id="showResultBtn" class="btn btn-success mt-2 text-blod">
						<strong> Show Winner</strong>
					</button>

				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-lg-12 px-5">
					<table class="table table-striped">
						<thead>
							<tr class="bg-dark text-white">
								<th scope="col">Sr .</th>
								<th scope="col">Candidate Name</th>
								<th scope="col">Candidate Photo</th>
								<th scope="col">Party Name</th>
								<th scope="col">Party Symbol</th>
								<th scope="col">Party Slogan</th>
								<th scope="col">Votes</th>
								<th scope="col">Operation</th>
							</tr>
						</thead>
						<tbody class="alert alert-secondary">
							<%
							Connection con = ConnectionProvider.getConnection();
							stmt = con.prepareStatement(QueriesProvider.electionResultQuery);
							stmt.setString(1, electionId);

							rs = stmt.executeQuery();
							int ind = 1;
							int maxVote = 0;
							while (rs.next()) {
								String studentFullName = rs.getString("firstName") + " " + rs.getString("middleName") + " "
								+ rs.getString("lastName");
								if (maxVote < rs.getInt("total_votes")) {
									WinnerName = studentFullName;
									WinnerImage = rs.getString("student_image");
									maxVote = rs.getInt("total_votes");
								}
							%>
							<tr>
								<th scope="row"><%=ind%></th>
								<td><%=studentFullName%></td>
								<td><img src="<%=rs.getString("student_image")%>"
									class="img-thumbnail" alt="..."
									style="height: 50px; width: 50px; border-radius: 100%"></td>
								<td><%=rs.getString("partyName")%></td>
								<td><img src="<%=rs.getString("partySymbol")%>"
									class="img-thumbnail" alt="..."
									style="height: 50px; width: 50px; border-radius: 100%"></td>
								<td><%=rs.getString("slogan")%></td>

								<td><%=rs.getInt("total_votes")%></td>
								<td>
									<form action="UserChart.jsp">
										<input value="<%=rs.getString("candidate_id")%>"
											name="candidateId" class="d-none"> <input
											value="<%=rs.getString("c.election_id")%>" name="electionId"
											class="d-none"> <input value="<%=studentFullName%>"
											name="candidateFullName" class="d-none"> <input
											value="<%=rs.getString("total_votes")%>" name="totalVotes"
											class="d-none"> <input type="submit"
											class="btn btn-info" value="view">


									</form>
								</td>
								<%-- <td><a
									href="UserChart.jsp?candidateId=<%=rs.getString("candidate_id")%>&electionId=<%=rs.getString("c.election_id")%>&candidateFullName=<%=studentFullName%>"
									class="btn btn-info ">View</a></td> --%>
							</tr>

							<%
							ind++;
							}
							%>
						</tbody>
					</table>
				</div>
				</h1>
			</div>
		</div>
	</main>
	<jsp:include page="../Components/Footer.jsp"></jsp:include>
	<script type="text/javascript">
	
	const btn = document.querySelector("#showResultBtn")
	btn.addEventListener('click', function () {
		console.log("clicked")
  Swal.fire({
    title: "Winner !",
    text: '<%=WinnerName%>',
    imageUrl: '<%=WinnerImage%>',
				imageWidth : 400,
				imageHeight : 200,
				imageAlt : "Custom image"
			});
		})
	</script>

</body>
</html>