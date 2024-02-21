<%@page import="java.sql.SQLIntegrityConstraintViolationException"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.voting.system.helper.ConnectionProvider"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
String path = "C://Users//prati//eclipse-workspace//Voting_Application//src//main//webapp//assets//images";
MultipartRequest m = new MultipartRequest(request, path, 1024 * 1024 * 1024);
String partySlogan = m.getParameter("partySlogan");
String partyName = m.getParameter("partyName");
String electionId = m.getParameter("electionId");
String studentId = m.getParameter("studentId");
Connection con = ConnectionProvider.getConnection();

String query = "insert into candidate(student_id, election_id, partyName, partySymbol, slogan) values (?,?,?,?,?)";

PreparedStatement pstmt = con.prepareStatement(query);
pstmt.setString(1, studentId);
pstmt.setString(2, electionId);
pstmt.setString(3, partyName);
pstmt.setString(4, "../assets/images/" + m.getFilesystemName("partySymbol"));
 pstmt.setString(5, partySlogan);
  try {
	out.print(pstmt.executeUpdate()+"Added Successfully !!");
} catch (SQLIntegrityConstraintViolationException e) {
	System.out.print(e.getMessage());
	e.printStackTrace();
	out.print(0 + "Dublicate Candidate Entry");
} catch(Exception e){
	e.printStackTrace();
	out.print(0 + "Internal Server Error !!");
}
%>