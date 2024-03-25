<%@page import="java.util.Arrays"%>
<%@page import="com.voting.system.helper.QueryHelper"%>
<%@page import="com.voting.system.helper.QueriesProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.voting.system.helper.ConnectionProvider"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
Connection con = ConnectionProvider.getConnection();

String firstName = request.getParameter("firstName");
String middleName = request.getParameter("middleName");
String lastName = request.getParameter("lastName");
String enrollmentNumber = request.getParameter("enrollmentNumber");
String electionId = request.getParameter("electionId");
/* String branchId = request.getParameter("branch_id");
String yearId = request.getParameter("year_id"); */
int yearId = Integer.parseInt(request.getParameter("year_id"));
int branchId = Integer.parseInt(request.getParameter("branch_id"));

/* String andClause = "";
andClause += (firstName != null && !firstName.isEmpty()) ? "and firstName LIKE '" + firstName + "%'" : "";
andClause += (middleName != null && !middleName.isEmpty())
		? (andClause.isEmpty() ? " middleName LIKE '" + middleName + "%'"
		: " and middleName LIKE '" + middleName + "%'")
		: "";
andClause += (lastName != null && !lastName.isEmpty())
		? (andClause.isEmpty() ? " lastName LIKE '" + lastName + "%'" : " and lastName LIKE '" + lastName + "%'")
		: "";
andClause += (enrollmentNumber != null && !enrollmentNumber.isEmpty())
		? (andClause.isEmpty() ? " enrolment_number='" + enrollmentNumber + "'"
		: " and enrolment_number='" + enrollmentNumber + "'")
		: "";	
andClause += (branchId != 0) ? (andClause.isEmpty() ? " branch_id=" + branchId : " and branch_id=" + branchId) : "";
andClause += (yearId != 0) ? (andClause.isEmpty() ? " year_id=" + yearId : " and year_id=" + yearId) : "";


System.out.println(andClause); */
/* String query = QueriesProvider.queryForStudentInfo + (!andClause.isEmpty() ? "where" + andClause : "");
 String query = QueriesProvider.queryForStudentInfo
		+ " where student.id not in (select student_id from candidate where election_id = ?) " + andClause;

 
 */ 
boolean isDataPrinted = false;
 
 
 
 
 
 
 StringBuilder appendedString = new StringBuilder("");

 // Append firstName if it has a value
 appendedString.append(firstName.isEmpty() ? "" : " and firstName LIKE '" + firstName + "%' "  );

 // Append middleName if it has a value
 appendedString.append(middleName.isEmpty() ? "" : " and middleName LIKE '" + middleName + "%' "  );

 // Append lastName if it has a value
 appendedString.append(lastName.isEmpty() ? "" : " and lastName LIKE '" + lastName + "%' "  );

 // Append enrolment_number if it has a value
 appendedString.append(enrollmentNumber.isEmpty() ? "" : " and enrolment_number=" + enrollmentNumber );

 // Append address if it has a value

 // Append branch_name if it has a value
 appendedString.append(branchId == 0 ? "" : " and branch_id=" + branchId );

 // Append year_name if it has a value
 appendedString.append(yearId == 0 ? "" : " and year_id=" + yearId );

 
 
 
 String query = QueriesProvider.queryForStudentInfo
			+ " where student.id not in (select student_id from candidate where election_id = ?) ";
 System.out.println(query + appendedString.toString());
query = query + appendedString.toString();
 
 
 
 
 
 
 
 
 
 
 
 
 
 

PreparedStatement pstm = con.prepareStatement(query);
pstm.setString(1, electionId);
ResultSet rs = pstm.executeQuery();

while (rs.next()) {
	isDataPrinted = true;
	String stuFullName = rs.getString("firstName") + " " + rs.getString("middleName") + " " + rs.getString("lastName")
	+ " "; 
%>
<tr>
	<th scope="row"><%=rs.getString("id")%></th>
	<td><img src="<%=rs.getString("student_image")%>"
		class="img-thumbnail" alt="..."
		style="height: 50px; width: 50px; border-radius: 100%"></td>
	<td><%=stuFullName %></td>
	<td><%=rs.getString("enrolment_number")%></td>

	<td><%=rs.getString("email")%></td>
	<td><%=rs.getString("branch_name")%></td>
	<td><%=rs.getString("year_name")%></td>
	<td>
		<button
			onclick="addCandidate('<%=rs.getString("id")%>','<%=stuFullName%>')"
			type="submit" class="btn btn-success" data-bs-toggle="modal"
			data-bs-target="#exampleModal">Add Candidate</button>
	</td>

</tr> 
 
<%
}
if (!isDataPrinted)
out.print("0");
%>