
<%
String userName = request.getParameter("enrollment_number");
String password = request.getParameter("password");
String logoutRequest = request.getParameter("logoutRequest");
userName = (userName != null) ? userName : "";
password = (password != null) ? password : "";
logoutRequest = (logoutRequest != null) ? logoutRequest : "";

if (logoutRequest.equals("1")) {
	out.print("1");
	out.print("Logout Successful");
	session.removeAttribute("user");
} else {
	if (userName.equals("admin") && password.equals("Admin@123")) {
		out.print("1");
		session.setAttribute("user", userName);
	} else {
		out.print("0");
	}
}
%>