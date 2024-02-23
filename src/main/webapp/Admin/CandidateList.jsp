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
	//Take these values from request obj.
	String electionId = request.getParameter("electionId");
	String electionName = request.getParameter("electionName");
	System.out.println(electionId + " " + electionName + " ");
	String electionStatus = "";

	Connection con = ConnectionProvider.getConnection();
	PreparedStatement pstm;

	ResultSet rs;
	%>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true"
		data-bs-keyboard="false"  data-bs-backdrop="static"
		>
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body pb-3">

					<div class="container">
						<div class="row">
 							<div class="col-sm-12 px-3 alert alert-secondary rounded">
								<form class="row g-3" id="addCandidate" name="myForm">
									<h1>Candidate List</h1>
									<input style="display: none;" name="electionId" type="text" value=<%=electionId%>>
									<input style="display: none;" name="candidateId" type="text" id="candidateId">

									<div class="col-md-6">
										<div class="input-group mb-3 border border-secondary">
											<span class="input-group-text bg-dark text-light"
												id="basic-addon1"> <strong> Election Name</strong>
											</span> <input readonly="readonly" value="<%=electionName%>"
												name="electionName" type="text"
												class="form-control bg-dark text-white"
												aria-label="Username" aria-describedby="basic-addon1">

										</div>
									</div>

									<div class="col-md-6">
										<div class="input-group mb-3 border border-secondary">
											<span class="input-group-text bg-dark text-light"
												id="basic-addon1"> <strong> Candidate Name </strong>
											</span> <input readonly="readonly" name="studentName" type="text"
												id="cnadidateFullName"
												class="form-control bg-dark text-white"
												aria-label="Username" aria-describedby="basic-addon1">

										</div>
									</div>

									<div class="col-md-6">
										<label for="exampleFormControlInput1" class="form-label">
											<strong>Party Name</strong>
										</label> <input type="text" class="form-control" name="partyName"
										onblur="validate(event,'partyName-validation')"	id="partyName" required>
										<small class="text-danger"
							id="partyName-validation"></small>
									</div>


									<div class="col-md-6">
										<label for="exampleFormControlInput1" class="form-label">
											<strong>Party Slogan</strong>
										</label> <input type="text" class="form-control" id="partySlogan"
										onblur="validate(event,'partSlogan-validation')"	name="partySlogan" required>
											<small class="text-danger"
							id="partSlogan-validation"></small>
									</div>
									<div class="col-md-6">
										<label for="exampleFormControlInput1" class="form-label">
											<strong>Party Symbol </strong>
										</label> <label for="exampleFormControlInput1" class="form-label"
											id="partySymbolLable"> Party Symbol </label> <input
											type="file" class="form-control" id="partySymbol"
									onblur="validate(event,'partSlogan-validation')"		name="partySymbol" required>
												<small class="text-danger"
							id="partySymbol-validation"></small>
									</div>

									<div class="col-md-6"></div>

									<div class="col-6">
										<button type="submit" class="btn btn-primary px-4"
											id="branch-submit-btn">Add Candidate</button>
										<button type="button" class="btn btn-danger" id="cancleBtn"
											style="display: none">Cancel</button>
									</div>
								</form>

							</div>
						</div>
					</div>


				</div>
				
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col ">

				<form
					class="m-2 px-4 py-1 border border-dark border-2 alert-secondary rounded"
					method="post" id="filter-form">
					<div class="container-fulid">
						<div class="row mt-4 mb-3">

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
									<input style="display: none" name="electionId" value=<%=electionId %>>
									<input disabled="disabled"
										value="<%=rs.getString("election_name")%>" type="text"
										class="form-control bg-dark text-white" aria-label="Username"
										aria-describedby="basic-addon1">
									<%
									}
									%>
								</div>
							</div>

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

							<div class="col-lg-2">
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
								<button type="submit"
									class="btn btn-info text-white form-control">Filter</button>
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
							<th scope="col">Operation</th>

						</tr>
					</thead>
					<tbody id="listContainer">
						<%
						String query = QueriesProvider.queryForStudentInfo + "where student.id not in (select student_id from candidate  where election_id = ?)" + "order by id";
						pstm = con.prepareStatement(query);
						pstm.setString(1, electionId);
						rs = pstm.executeQuery();
						while (rs.next()) {
							String stuFullName = rs.getString("firstName") + " " + rs.getString("middleName") + " " + rs.getString("lastName") + " ";
						%>
						<tr>
							<th scope="row"><%=rs.getString("id")%></th>
							<td><img src="<%=rs.getString("student_image")%>"
								class="img-thumbnail" alt="..."
								style="height: 50px; width: 50px; border-radius: 100%"></td>
							<td>stuFullName</td>
							<td><%=rs.getString("enrolment_number")%></td>

							<td><%=rs.getString("email")%></td>
							<td><%=rs.getString("branch_name")%></td>
							<td><%=rs.getString("year_name")%></td>
							<td>
								<%-- <form  action="AddCandidate.jsp" method="post">
								<input style="display:none"  name="studentId" type="text" value="<%=rs.getString("id") %>" >
								<input style="display:none"  name="studentName" type="text" value="<%=rs.getString("firstName") + " " + rs.getString("middleName") + " " + rs.getString("lastName") + " "%>" >
								<input style="display:none"  name= "electionId" type="text" value="<%=electionId %>" >
								<input style="display:none"  name="electionName" type="text" value="<%=electionName%>" >
								<input style="display:none"  name="electionStatus" type="text" value="<%=electionStatus%>" >
								</form> --%>
								<button onclick="addCandidate('<%=rs.getString("id")%>','<%=stuFullName %>')" type="submit"
									class="btn btn-success" data-bs-toggle="modal"
									data-bs-target="#exampleModal">Add Candidate</button>
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
	<jsp:include page="../Components/Footer.jsp"></jsp:include>

	<script type="text/javascript">
			
	const candidateFullName = document.querySelector("#cnadidateFullName");
	const candidateId = document.querySelector("#candidateId");
	
	$(document).ready(function() {
		$("#addCandidate").submit(function(event) {
			event.preventDefault();
			let f = new FormData($(this)[0]);

			$.ajax({
				type : "POST",
				enctype : "multipart/form-data",
				url : "DB/AddCandidateDB.jsp",
				data : f,
				processData : false,
				contentType : false,
				cache : false,
				success : function(response) {
					if (response.trim()[0] === "1") {
						Swal.fire({
							title : response.trim().slice(1),
							text : "Click ok to continue !",
							icon : "success"
						}).then(()=>{
			                  window.location.reload();
						});
					}else{
						Swal.fire({
							  title: response.trim().slice(1),
							  text: "Click ok to continue ",
							  icon: "error"
							});
					}
				},
			});
		});
	});
	
		$(document).ready(function() {
							$("#filter-form")
									.submit(
											function(event) {
												event.preventDefault();
												$
														.ajax({
															type : 'POST',
															url : "../Components/SearchCandidate.jsp",
															data : $(
																	"#filter-form")
																	.serialize(),
															success : function(
																	response) {
																console
																		.log(response)
																if (response
																		.trim() === "0") {
																	Swal.fire({
																				title : "Data not found !!",
																				text : "Click ok to continue ",
																				icon : "error"
																			}).then(()=>{
																				document.querySelector("#listContainer").innerHTML = '<h1 style="margin:2rem"> No Data Found</h1>'
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
						
	function addCandidate(cId,cFullName){
			candidateFullName.value = cFullName
			candidateId.value = cId
		}
		
		
		const partyName = document.myForm.partyName
		const partySlogan = document.myForm.partySlogan
		const partySymbol =document.myForm.partySymbol
	      
	      function validate(event,targetedValue){
	    	  if(event.target.value){

	    			 event.target.classList.remove("is-invalid")
	    		   event.target.classList.add("is-valid")
	    		   
	    	  }else{
	    		  event.target.classList.remove("is-valid")
	    		   event.target.classList.add("is-invalid")
	    		  
	    		  
	    	  }
	      }
		
		
		
		
		
		
		
	</script>

</body>
</html>