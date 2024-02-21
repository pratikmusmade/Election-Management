<%@page import="java.sql.SQLIntegrityConstraintViolationException"%>
<%@page import="com.voting.system.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%

System.out.print("Inside");
String query = "insert into vote(voter_id, vote_to_candidate, election_id) values (?,?,?)";

String studentId = request.getParameter("studentId");
String candidateId = request.getParameter("candidateId");
String electionId = request.getParameter("electionId");

Connection con = ConnectionProvider.getConnection();

PreparedStatement pstm = con.prepareStatement(query);
pstm.setString(1, studentId);
pstm.setString(2, candidateId);
pstm.setString(3, electionId);

try {
	out.print(pstm.executeUpdate()+"Your Vote is Recorded !!");
} catch (SQLIntegrityConstraintViolationException e) {
	e.printStackTrace();
	out.print(0 + "You Have Already Voted this Candidate !!");
} catch(Exception e){
	e.printStackTrace();
	out.print(0 + "Internal Server Error !!");

}
%>