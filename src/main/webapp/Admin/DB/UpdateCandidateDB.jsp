<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.voting.system.helper.ConnectionProvider"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
String query = "UPDATE candidate SET partyName = ?, slogan=? ";
String candidateId = request.getParameter("candidateId");
String path = "C://Users//prati//eclipse-workspace//Voting_Application//src//main//webapp//assets//images";
MultipartRequest m = new MultipartRequest(request, path, 1024 * 1024 * 1024);
String partySlogan = m.getParameter("partySlogan");
String partyName = m.getParameter("partyName");
String electionId = m.getParameter("electionId");
String studentId = m.getParameter("studentId");
String partySymbol = m.getFilesystemName("partySymbol");
query += (m.getFilesystemName("partySymbol") == null)?"":", partySymbol=? ";
System.out.print(candidateId+ " " +partyName+ " " +partySlogan+ " " + m.getFilesystemName("partySymbol"));
query += "WHERE id = " + candidateId;
Connection con = ConnectionProvider.getConnection();
PreparedStatement pstm = con.prepareStatement(query);
pstm.setString(1, partyName);
pstm.setString(2, partySlogan);

if(partySymbol != null){
	pstm.setString(3, "../assets/images/" +  partySymbol);
}

try {
	out.print(pstm.executeUpdate()+" Updated");
} catch (Exception e) {
	e.printStackTrace();
	out.print(0);
} 
%>
