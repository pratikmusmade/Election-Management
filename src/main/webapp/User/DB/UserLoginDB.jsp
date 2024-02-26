<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@page import="com.voting.system.helper.ConnectionProvider"%>
<%@page import="java.sql.PreparedStatement"%>
<%
System.out.println("Hello");
String enroll_no = "";
String pass = "";
String enrollNo = request.getParameter("enrollment_number");
String password = request.getParameter("password");
System.out.println("Password " + password);
System.out.println("Enrollment " + enrollNo);
String logoutRequest = request.getParameter("logoutRequest");
String studentId = "";

logoutRequest = (logoutRequest != null) ? logoutRequest : "";
enrollNo = (enrollNo != null) ? enrollNo : "";
password = (password != null) ? password : "";

String query = "select id,enrolment_number,pass from student where enrolment_number = ?";
PreparedStatement pst = ConnectionProvider.getConnection().prepareStatement(query);
pst.setString(1, enrollNo);
ResultSet rs = pst.executeQuery();
while (rs.next()) {
	pass = rs.getString("pass");
	enroll_no = rs.getString("enrolment_number");
	studentId = rs.getString("id");
	
}
System.out.println("shann " + enroll_no.isEmpty());
System.out.println("adiii " + password.equals(pass));
if (logoutRequest.equals("1")) {
	out.print("1");
	out.print("Logout Successful");
	session.removeAttribute("user");
} else {
	if (enroll_no.isEmpty()) {
		out.print("0");

	} else if (!password.equals(pass)) {
		out.print("0");

	} else {
		out.print("1");
		session.setAttribute("user", studentId);
	}
}
%>