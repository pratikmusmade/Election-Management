<%@page import="com.voting.system.helper.QueriesProvider"%>
<%@page import="com.voting.system.helper.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap demo</title>
<jsp:include page="../Components/Header.jsp"></jsp:include>
</head>
<body>
	<%
	String electionId = request.getParameter("electionId");

	String electionName = request.getParameter("electionName");
	String electionStatus = request.getParameter("electionStatus");

	String studentName = request.getParameter("studentName");
	String studentId = request.getParameter("studentId");
	System.out.print(studentId + studentName + electionId + electionName + electionStatus);
	%>
	<jsp:include page="../Components/NavBar.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8 mt-3 px-3 py-4 alert alert-secondary rounded">
				<form class="row g-3" id="addCandidate">
					<h1>Candidate List</h1>
					<input style="display: none" type="text" name="electionId"
						value=<%=electionId%>> <input style="display: none"
						type="text" name="studentId" value=<%=studentId%>>

					<div class="col-md-6">
						<div class="input-group mb-3 border border-secondary">
							<span class="input-group-text bg-dark text-light"
								id="basic-addon1"> <strong> Election Name</strong>
							</span> <input readonly="readonly" value="<%=electionName%>"
								name="electionName" type="text"
								class="form-control bg-dark text-white" aria-label="Username"
								aria-describedby="basic-addon1">

						</div>
					</div>

					<div class="col-md-6">
						<div class="input-group mb-3 border border-secondary">
							<span class="input-group-text bg-dark text-light"
								id="basic-addon1"> <strong> Candidate Name </strong>
							</span> <input readonly="readonly" value="<%=studentName%>"
								name="studentName" type="text"
								class="form-control bg-dark text-white" aria-label="Username"
								aria-describedby="basic-addon1">

						</div>
					</div>

					<div class="col-md-6">
						<label for="exampleFormControlInput1" class="form-label">
							<strong>Party Name</strong>
						</label> <input type="text" class="form-control" name="partyName"
							id="partyName">
					</div>


					<div class="col-md-6">
						<label for="exampleFormControlInput1" class="form-label">
							<strong>Party Slogan</strong>
						</label> <input type="text" class="form-control" id="partySlogan"
							name="partySlogan">

					</div>
					<div class="col-md-6">
						<label for="exampleFormControlInput1" class="form-label">
							<strong>Party Symbol </strong>
						</label> <label for="exampleFormControlInput1" class="form-label"
							id="partySymbolLable"> Party Symbol </label> <input type="file"
							class="form-control" id="partySymbol" name="partySymbol">
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

	<div class="container mt-3 alert alert-info rounded">
		<div class="row">
			<div class="col-lg-10">

				<h2>
					Candidates for <span class="badge bg-danger"><%=electionName%></span>
					Election
				</h2>
			</div>

			<div class="col-lg-2">

				<div
					class="d-flex align-items-center justify-content-center alert alert-danger p-0 rounded-pill">
					<h5 class="mt-1">Status</h5>
					<h6>
						<span class="badge bg-success flex-fill mt-2 ms-2 px-3"><%=electionStatus%></span>
					</h6>
				</div>

			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-lg-12 px-5">
				<table class="table table-striped">
					<thead>
						<tr class="bg-dark text-white">
							<th scope="col">Sr .</th>
							<th scope="col">Candidate Name</th>
							<th scope="col">Party Name</th>
							<th scope="col">Party Symbol</th>
							<th scope="col">Party Slogan</th>
							<th scope="col">Election</th>

						</tr>
					</thead>
					<tbody class="alert alert-secondary ">
						<%
						Connection con = ConnectionProvider.getConnection();
						PreparedStatement stmt = con.prepareStatement(QueriesProvider.CandidateInfo + "where election_id=?");
						stmt.setString(1, electionId);

						ResultSet rs = stmt.executeQuery();
						int ind = 1;
						while (rs.next()) {
						%>
						<tr>
							<th scope="row"><%=ind%></th>
							<td><%=rs.getString("firstName") + " " + rs.getString("middleName") + " " + rs.getString("lastName")%></td>
							<td><%=rs.getString("partyName")%></td>
							<td><img src="<%=rs.getString("partySymbol")%>"
								class="img-thumbnail" alt="..."
								style="height: 50px; width: 50px; border-radius: 100%"></td>
							<td><%=rs.getString("slogan")%></td>

							<td><button type="button" class="btn btn-outline-warning"
									onclick="updateCandidate('<%=rs.getString("id")%>','<%=rs.getString("partyName")%>','<%=rs.getString("slogan")%>','<%=rs.getString("partySymbol")%>')">Update</button>
								&nbsp &nbsp
								<button type="button" class="btn btn-outline-danger"
									id="deleteBranch">Delete</button></td>
						</tr>

						<%
						ind++;
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>



	<jsp:include page="../Components/Footer.jsp"></jsp:include>


	<script type="text/javascript">

		let requestUrl = "DB/AddCandidateDB.jsp";
	  $(document).ready(function () {
    	  	console.log("Hello")
	        $("#addCandidate").submit(function (e) {
	          e.preventDefault();
				let f = new FormData($(this)[0]);
				console.log( "form data ")
	          console.log("Hiii	")
	          $.ajax({
	            type: "POST",
				enctype : "multipaet/form-data",
	            url: requestUrl,
	            data : f,
				processData : false,
				contentType : false,
				cache : false,
	            success: function (response) {
	            	console.log(response.trim())
	              if (response.trim()[0] === "1") {
	                Swal.fire({
	                  title: "Branch "+ response.trim().slice(1) + " Successfully",
	                  text: "Click OK to continue!",
	                  icon: "success",
	                }).then((res) => {
	                  window.location.reload();
	                });
	              } else {
	                Swal.fire({
	                  icon: "error",
	                  title: "Oops...",
	                  text: "Something went wrong!",
	                });
	              }
	            },
	          });
	        });
	      });
	  
	  
		const cancelBtn = document.querySelector("#cancleBtn");
		const submitBtn = document.querySelector("#branch-submit-btn");
		
		const partyName1 = document.querySelector("#partyName");
		const partySlogan1 = document.querySelector("#partySlogan");
		const partySymbol1 = document.querySelector("#partySymbol");
		const partyLable = document.querySelector("#partySymbolLable");

		
		
/* 		console.log(partyName,partySlogan,partySymbol,partyLable);
 */		
		

		
	 	 cancelBtn.addEventListener("click",(e)=>{
			e.preventDefault();
			cancelBtn.style.display = "none"
			submitBtn.className = "btn btn-primary px-4"
			submitBtn.innerHTML = "Add Candidate"
			requestUrl = "DB/AddBranchDB.jsp";
			partyName1.value = ""
			partySlogan1.value = ""
			partyLable.innerHTML = ""
			partyLable.classList = ""
			requestUrl = "DB/AddCandidateDB.jsp";
		}) 
		
		function updateCandidate(candidateId,partyName,partySlogan,partySymbol){	 		 
			submitBtn.className = "btn btn-success"
			submitBtn.innerHTML = "Update Branch"
			
			partyName1.value = partyName
			partySlogan1.value = partySlogan
			partyLable.innerHTML = "<strong> :- " + partySymbol + "</strong>"
			partyLable.classList.add("alert")
			partyLable.classList.add("alert-primary")
			partyLable.classList.add("py-1")
			partyLable.classList.add("px-2")

			
			cancelBtn.style.display = "inline-block"
			requestUrl = "DB/UpdateCandidateDB.jsp?candidateId=" + candidateId;
			partyName1.focus()
			console.log(requestUrl)
			
		}
			
	  
	     function deleteCandidate(branchId,branchName){
		Swal.fire({
            icon: "warning",
			  title: "Are you sure !!?",
			  text:"DELETE (" + branchName + "Branch !!)",
			  showDenyButton: true,
			  confirmButtonText: "Yes",
			  denyButtonText: `Cancel`
			}).then((result) => {
			  if (result.isConfirmed) {
				  $.ajax({
				        url: "DB/DeleteBranch.jsp",
				        type: "POST",
				        data: {branchId},
				        success: function(response) {
				              if (response.trim() === "1") {
				                  Swal.fire({
				                    title: "Branch Deleted Successfully",
				                    text: "Click OK to continue!",
				                    icon: "success",
				                  }).then((res) => {
				                    window.location.reload();
				                  });
				                } else {
				                  Swal.fire({
				                    icon: "error",
				                    title: "Oops...",
				                    text: "Something went wrong!",
				                  });
				                }
				              },
				        error: function(xhr, status, error) {
				          console.log("Error:", error);
				        }
				      });
			  } else if (result.isDenied) {
			    Swal.fire("Branch Not Deleted", "", "info");
			  }
			});
	} 
    </script>

</body>
</html>
