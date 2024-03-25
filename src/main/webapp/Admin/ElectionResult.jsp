<%@page import="java.sql.ResultSet"%>
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
	<jsp:include page="../Components/NavBar.jsp"></jsp:include>
	<jsp:include page="../Components/SideBar.jsp"></jsp:include>
	<main>
		<div class="container">
			<div class="row">
				<h1>Election Result</h1>
			</div>
			<div class="row">
				<div class="col-lg-10">
					<table class="table table-bordered table-secondary table-striped">
						<thead>
							<tr class="table-dark">
								<th scope="col">Sr .</th>
								<th scope="col">Election Name</th>
								<th scope="col">Status</th>
								<th scope="col">Operation</th>
								<!-- <th scope="col"></th>-->
							</tr>
						</thead>
						<tbody>
							<%
							Connection con = ConnectionProvider.getConnection();
							PreparedStatement stmt = con.prepareStatement("select * from election where election_status= ?");
							stmt.setString(1, "Decom");
							ResultSet rs = stmt.executeQuery();
							int i = 1;
							while (rs.next()) {
							%>
							<tr>
								<th scope="row"><%=i%></th>
								<td><%=rs.getString("election_name")%></td>
								<td><%=rs.getString("election_status")%></td>
								<td><a class="btn btn-success p-1"
									href="ElectionResultDetails.jsp?electionId=<%=rs.getString("id")%>>">
										View Result </a></td>
								<%-- 

								<td class="d-flex justify-content-center">
									<%
									if(! rs.getString("election_status").equals("Decom")){
				
									
									%>
								
								<button
										type="button" class="btn btn-warning"
										onclick="updateElection(<%=rs.getString("id")%>,'<%=rs.getString("election_name")%>')">Update</button>
									&nbsp &nbsp
									
									<button type="button" class="btn btn-danger"
										onclick="deleteElection(<%=rs.getString("id")%>,'<%=rs.getString("election_name")%> ')"
										id="deleteElection">Delete</button> &nbsp &nbsp

									<form action="CandidateList.jsp" method="post"
										style="display: <%=((!rs.getString("election_status").equals("In-Active")) ? "inline-block" : "none")%>;">
										<input style="display: none" type="text" name="electionId"
											value="<%=rs.getString("id")%>"> <input
											style="display: none"
											value="<%=rs.getString("election_name")%>" type="text"
											name="electionName">
										<button type="submit" class="btn btn-success">Add
											Candidate</button>
									</form> &nbsp &nbsp



									<form action="DB/DecommissionElection.jsp" method="post"
										style="display:<%=((!rs.getString("election_status").equals("In-Active")) ? "inline-block" : "none")%>;">
										<input style="display: none" type="text" name="electionId"
											value="<%=rs.getString("id")%>"><input
											style="display: none"
											value="<%=rs.getString("election_name")%>" type="text"
											name="electionName">
										<button type="submit" class="btn btn-dark">Decommission</button>
									</form>
									<%
									}
									%>
									&nbsp &nbsp
									<form action="AddCandidate.jsp" method="post">
										<input style="display: none" type="text" name="electionId"
											value="<%=rs.getString("id")%>"> <input
											style="display: none"
											value="<%=rs.getString("election_name")%>" type="text"
											name="electionName"> <input style="display: none"
											value="<%=rs.getString("election_name")%>" type="text"
											name="electionStatus">
										<button type="submit" class="btn btn-info">View
											Candidate</button>
									</form> 
									</td> --%>
							</tr>

							<%
							i++;
							}
							%>
						</tbody>
					</table>
				</div>

			</div>

		</div>
	</main>
	<jsp:include page="../Components/Footer.jsp"></jsp:include>

</body>
</html>