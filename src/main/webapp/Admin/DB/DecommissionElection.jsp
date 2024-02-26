<%@page import="java.sql.Connection"%>
<%@page import="com.voting.system.helper.ConnectionProvider"%>
<%@page import="java.sql.PreparedStatement"%>
<%
String electionId = request.getParameter("electionId");
String election_name = request.getParameter("electionName");

String query = "update election set election_status = ? where id = ?";

Connection con =  ConnectionProvider.getConnection();
PreparedStatement pstm = con.prepareStatement(query);
pstm.setString(1, "Decom");
pstm.setString(2, electionId);
out.print(pstm.executeUpdate());
%>