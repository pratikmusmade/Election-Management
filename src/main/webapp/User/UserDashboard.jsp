<%@page import="java.sql.ResultSet"%>
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
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="../Components/Header.jsp"></jsp:include>

</head>
	
<body>
	<%
	String studentId = (String) session.getAttribute("user");
	System.out.println(studentId);
	Connection con = ConnectionProvider.getConnection();
	PreparedStatement pstm = con.prepareStatement("select * from election where election_status = ?");
	pstm.setString(1, "Active");
	ResultSet rs = pstm.executeQuery();
	%>d
	<jsp:include page="../Components/NavBarUser.jsp"></jsp:include>
	<article style="margin-top: 6.5rem">
		<div class="container">
			<h1>Active Elections</h1>
			<div class="row">
				<%
				while (rs.next()) {
				%>
				<div class="col">
					<div class="card">
						<div class="card-body">
							<%
							if (ConnectionProvider.studentHasVoted(studentId, rs.getString("id"))) {
							%>
							<div class="alert alert-danger alert-dismissible fade show"
								role="alert">
								<i class="bi bi-exclamation-octagon-fill"></i> <strong>You
									have already Voted in this Election</strong>
								<button type="button" class="btn-close" data-bs-dismiss="alert"
									aria-label="Close"></button>
							</div>
							<%
							}
							%>
							<div
								class="card-title bg-info d-flex align-items-center justify-content-between py-1 px-3 m-0 rounded-top">
								<h5
										class="m-0 border border-3 rounded-3 px-3 py-1 bg-dark text-white">Status</h5>
								<h5
									class="bg-success text-light py-1 border border-3 border-dark rounded-pill px-4 m-0"><%=rs.getString("election_status")%></h5>
							</div>
							<div
								class="d-flex flex-column justify-content-center alert-info gap-2 p-2 rounded-bottom">
								<h3 class="text-center">
									Election :
									<%=rs.getString("election_name")%></h3>
								<a href="VoteCandidate.jsp?electionId=<%=rs.getString("id")%>"
									class="btn bg-warning"><strong> Vote </strong> </a>
							</div>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</article>

	<jsp:include page="../Components/Footer.jsp"></jsp:include>
</body>
</html>