<%@page import="java.sql.ResultSet"%>
<%@page import="com.voting.system.helper.ConnectionProvider"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
System.out.print("Inside");
String electionName = request.getParameter("electionName");
String electionStatus = request.getParameter("electionStatus");

Connection con = ConnectionProvider.getConnection();

String query = "insert into election(election_name,election_status) values(?,?)";
PreparedStatement pstm = con.prepareStatement(query);
pstm.setString(1, electionName);
pstm.setString(2, electionStatus);

try {
	out.print(pstm.executeUpdate() + " Added");

} catch (Exception e) {
	e.printStackTrace();
	out.print(0);
}

%>
