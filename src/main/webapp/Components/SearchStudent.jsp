<%@page import="com.voting.system.helper.QueriesProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.voting.system.helper.ConnectionProvider"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
Connection con = ConnectionProvider.getConnection();

String firstName =  request.getParameter("firstName");
String middleName = request.getParameter("middleName");
String lastName = request.getParameter("lastName");
String enrollmentNumber = request.getParameter("enrollmentNumber");


firstName = (firstName == null) ? "" : firstName;
middleName = (middleName == null) ? "" : middleName;
lastName = (lastName == null) ? "" : lastName;
enrollmentNumber = (enrollmentNumber == null) ? "" : enrollmentNumber;


int yearId = Integer.parseInt(request.getParameter("year_id"));
int branchId = Integer.parseInt(request.getParameter("branch_id"));
String whereClause = "";
System.out.println(yearId + " " + branchId + enrollmentNumber);
boolean isDataPrinted = false;

whereClause += "firstName LIKE '" + firstName + "%' and " 
				+ "middleName LIKE '" + middleName + "%' "
				+ "and lastName LIKE '" + lastName +"%' "
				;


if (yearId != 0 && branchId != 0 && !enrollmentNumber.equals("")){
	whereClause += " and branch.id=" + branchId 
				+ " and acc_year.id =" + yearId
				+ " and student.enrolment_number=" + enrollmentNumber;
} else if (yearId != 0 || branchId != 0 || !enrollmentNumber.equals("")) {
	whereClause += " and ";
	whereClause += (yearId != 0) ? ("acc_year.id=" + yearId) : ("");
	whereClause += (branchId != 0) ? ("branch.id=" + branchId) : ("");
	whereClause += (!enrollmentNumber.equals("")) ? ("student.enrolment_number=" + enrollmentNumber) : ("");

}
whereClause += " order by id";

 String query = QueriesProvider.queryForStudentInfo + " where ";
query += whereClause;
System.out.println(" Query ==> " + query);

PreparedStatement pstm = con.prepareStatement(query);

ResultSet rs = pstm.executeQuery();

while (rs.next()) {
	isDataPrinted = true;
%>
<tr>
	<th scope="row"><%=rs.getString("id")%></th>
	<td><img src="<%=rs.getString("student_image")%>"
		class="img-thumbnail" alt="..."
		style="height: 50px; width: 50px; border-radius: 100%"></td>
	<td><%=rs.getString("firstName") + " " + rs.getString("middleName") + " " + rs.getString("lastName") + " "%></td>
	<td><%=rs.getString("enrolment_number")%></td>

	<td><%=rs.getString("email")%></td>
	<td><%=rs.getString("branch_name")%></td>
	<td><%=rs.getString("year_name")%></td>
	<td><a type="button" class="btn btn-success"
		href="UpdateStudent.jsp?studentId=<%=rs.getString("id")%>">Add Candidate</a>
	</td>

</tr>
<%
}

if (!isDataPrinted) out.print("0");
%>

