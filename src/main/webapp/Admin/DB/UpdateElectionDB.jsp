<%@page import="com.voting.system.helper.ConnectionProvider"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
String electionId = request.getParameter("electionId");

System.out.println(electionId);
String electionName = request.getParameter("electionName");
String electionStatus = request.getParameter("electionStatus");


Connection con = ConnectionProvider.getConnection();
String query = "UPDATE election SET election_name = ?, election_status = ? WHERE id = ?";
PreparedStatement pstm = con.prepareStatement(query);
pstm.setString(1, electionName);
pstm.setString(2, electionStatus);
pstm.setString(3, electionId);

try {
	out.print(pstm.executeUpdate()+" Updated");
} catch (Exception e) {
	e.printStackTrace();
	out.print(0);
}
%>
