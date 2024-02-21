<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.voting.system.helper.ConnectionProvider"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
String path = "C://Users//prati//eclipse-workspace//Voting_Application//src//main//webapp//assets//images";
String query = "insert into student(firstName, middleName, lastName, enrolment_number, address, email, pass, student_image, phone_number, branch_id, year_id) values (?,?,?,?,?,?,?,?,?,?,?)";
MultipartRequest m = new MultipartRequest(request, path, 1024 * 1024 * 1024);
Connection con = ConnectionProvider.getConnection();

String student_img = "../assets/images/" + m.getFilesystemName("studentImage");
String firstName = m.getParameter("firstName");
String middleName = m.getParameter("middleName");
String lastName = m.getParameter("lastName");
String email = m.getParameter("email");
String yearId = m.getParameter("yearId");
String branchId = m.getParameter("branchId");
String address = m.getParameter("address");
String phoneNumber = m.getParameter("phoneNumber");
String enrollNo = m.getParameter("enrollmentNumber");
String password = m.getParameter("password");

System.out.println(password);
PreparedStatement pstmt = con.prepareStatement(query);
pstmt.setString(1, firstName);
pstmt.setString(2, middleName);
pstmt.setString(3, lastName);
pstmt.setString(4, enrollNo);
pstmt.setString(5, address);
pstmt.setString(6, email);
pstmt.setString(7, password);
pstmt.setString(8, student_img);
pstmt.setString(9, phoneNumber);
pstmt.setString(10, branchId);
pstmt.setString(11, yearId);

out.print(pstmt.executeUpdate());
%>