<%@page import="com.voting.system.helper.ConnectionProvider"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%

Connection con = ConnectionProvider.getConnection();
String electionId = request.getParameter("electionId");
String query = "DELETE FROM election WHERE id=?";
PreparedStatement pstm = con.prepareStatement(query);
pstm.setString(1, electionId);
try {
	out.print(pstm.executeUpdate());
} catch (Exception e) {
	e.printStackTrace();
	out.print(0);
} 

%>