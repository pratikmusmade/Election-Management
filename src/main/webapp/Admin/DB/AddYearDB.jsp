<%@page import="com.voting.system.helper.ConnectionProvider"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
String className = request.getParameter("yearName");
Connection con = ConnectionProvider.getConnection();

String query = "insert into acc_year(year_name) values(?)";
PreparedStatement pstm = con.prepareStatement(query);
pstm.setString(1, className);

try {
	out.print(pstm.executeUpdate() + " Added");
} catch (Exception e) {
	e.printStackTrace();
	out.print(0);
}
%>