<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.voting.system.helper.ConnectionProvider"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
String candidateId = request.getParameter("candidateId");
String path = "C://Users//prati//eclipse-workspace//Voting_Application//src//main//webapp//assets//images";
MultipartRequest m = new MultipartRequest(request, path, 1024 * 1024 * 1024);
String partySlogan = m.getParameter("partySlogan");
String partyName = m.getParameter("partyName");
String electionId = m.getParameter("electionId");
String studentId = m.getParameter("studentId");
System.out.print(candidateId+ " " +partyName+ " " +partySlogan+ " " + m.getFilesystemName("partySymbol"));

out.print(candidateId+ " " +partyName+ " " +partySlogan+ " " + m.getFilesystemName("partySymbol"));


/* Connection con = ConnectionProvider.getConnection();
String query = "UPDATE candidate SET partyName = ? partySymbol=? slogan=? WHERE id = ?";
PreparedStatement pstm = con.prepareStatement(query);
pstm.setString(1, branchName);
pstm.setString(2, branchId);
try {
	out.print(pstm.executeUpdate()+" Updated");
} catch (Exception e) {
	e.printStackTrace();
	out.print(0);
} */
%>
