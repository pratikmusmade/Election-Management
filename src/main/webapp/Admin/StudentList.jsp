<%@page import="com.voting.system.helper.QueriesProvider"%>
<%@page import="com.voting.system.helper.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap demo</title>
<jsp:include page="../Components/Header.jsp"></jsp:include>
<style type="text/css">
</style>
</head>
<body>
	<jsp:include page="../Components/NavBar.jsp"></jsp:include>
	<%

		Connection con = ConnectionProvider.getConnection();
		PreparedStatement pstm;
		ResultSet rs;
		String query = QueriesProvider.queryForStudentInfo + "order by id";
		%>
		<div class="container">
		<div class="row"> <h1 class="text-center alert alert-danger px-4 py-1 m-2 rounded">Student List</h1>  </div>
			<div class="row">
			
				<div class="col">
					<form method="post" id="filter-form" class="m-2 px-4 py-1 border border-dark border-2 alert-secondary rounded">
						<div class="container-fulid">
							<div class="row mt-4 mb-3">

<%-- 
								<div class="col-lg-4">
									<div class="input-group mb-3 border border-secondary">
										<span class="input-group-text bg-dark text-light"
											id="basic-addon1"> <strong> Election Name </strong>
										</span>
										<%
										pstm = con.prepareStatement("select * from election where id=" + electionId);
										rs = pstm.executeQuery();
										while (rs.next()) {
											electionName = rs.getString("election_name");
											electionStatus = rs.getString("election_status");
										%>
										<input style="display: none" name="electionId"
											value=<%=electionId%>> <input disabled="disabled"
											value="<%=rs.getString("election_name")%>" type="text"
											class="form-control bg-dark text-white" aria-label="Username"
											aria-describedby="basic-addon1">
										<%
										}
										%>
									</div>
								</div> --%>

								<div class="col-lg-4">
									<div class="mb-3">
										<div class="input-group mb-3">
											<input type="text" class="form-control"
												id="exampleFormControlInput1" placeholder="First Name"
												name="firstName">
										</div>
									</div>
								</div>


								<div class="col-lg-4">
									<div class="mb-3">
										<div class="input-group mb-3">
											<input type="text" class="form-control"
												id="exampleFormControlInput1" placeholder="Middle Name"
												name="middleName">
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="mb-3">
										<div class="input-group mb-3">
											<input type="text" class="form-control"
												id="exampleFormControlInput1" placeholder="Last Name"
												name="lastName">
										</div>
									</div>
								</div>

								<div class="col-lg-4">
									<div class="mb-3">
										<div class="input-group mb-3">
											<input type="text" class="form-control"
												id="exampleFormControlInput1" placeholder="Enrolment Number"
												name="enrollmentNumber">
										</div>
									</div>
								</div>

								<div class="col-lg-2 ">
									<select class="form-select" aria-label="Default select example"
										name="branch_id">
										<option selected value="0">Branch</option>
										<%
										pstm = con.prepareStatement("select * from branch");
										rs = pstm.executeQuery();
										while (rs.next()) {
										%>
										<option value="<%=rs.getString("id")%>"><%=rs.getString("branch_name")%></option>
										<%
										}
										%>
									</select>

								</div>

								<div class="col-lg-2 ">
									<select class="form-select" aria-label="Default select example"
										name="year_id">
										<option selected value="0">Year</option>
										<%
										pstm = con.prepareStatement("select * from acc_year");
										rs = pstm.executeQuery();
										while (rs.next()) {
										%>
										<option value="<%=rs.getString("id")%>"><%=rs.getString("year_name")%></option>
										<%
										}
										%>
									</select>
								</div>


								<div class="col-lg-2">
									<button type="submit" class="btn btn-info text-white form-control">Filter</button>
								</div>
							</div>
						</div>

					</form>
				</div>
			</div>


			<div class="row">
				<div class="col">
					<table class="table table-info table-striped">
						<thead>
							<tr class="table-dark">
								<th scope="col">Sr #</th>
								<th scope="col">Image</th>
								<th scope="col">Name</th>
								<th scope="col">Enrollment Number</th>
								<th scope="col">Email</th>
								<th scope="col">Branch</th>
								<th scope="col">Year</th>
								<th scope="col">Update</th>
								<th scope="col">Delete</th>
							</tr>
						</thead>
						<tbody id="listContainer">
							<%
							pstm = con.prepareStatement(query);
							rs = pstm.executeQuery();
							while (rs.next()) {
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
								<td><a type="button" class="btn btn-outline-warning"
									href="UpdateStudent.jsp?studentId=<%=rs.getString("id")%>">Update</a>

								</td>
								<td><a type="button" class="btn btn-outline-danger"
									href="DB/DeleteStudentDB.jsp?studentId=<%=rs.getString("id")%>">Delete</a>
								</td>
							</tr>
							<%
							}
							%>

						</tbody>
					</table>

				</div>
			</div>
		</div>
	</main>	
	<jsp:include page="../Components/Footer.jsp"></jsp:include>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$("#filter-form")
									.submit(
											function(event) {
												event.preventDefault();
												$
														.ajax({
															type : 'POST',
															url : "../Components/SearchStudent.jsp",
															data : $(
																	"#filter-form")
																	.serialize(),
															success : function(
																	response) {
																console
																		.log(response)
																if (response
																		.trim() === "0") {
																	Swal
																			.fire({
																				title : "Data not found !!",
																				text : "Click ok to continue ",
																				icon : "error"
																			});
																	return;
																}
																document
																		.querySelector("#listContainer").innerHTML = response
																		.trim()
															}
														})
											})
						})
	</script>

</body>
</html>