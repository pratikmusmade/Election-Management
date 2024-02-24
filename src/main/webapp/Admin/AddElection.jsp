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
	<jsp:include page="../Components/NavBar.jsp"></jsp:include>
	<jsp:include page="../Components/SideBar.jsp"></jsp:include>
<main>
	<div class="container">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<form
					class="row g-3 m-2 px-4 pb-4 border border-dark border-2 alert-secondary rounded"
					action="DB/AddBranchDB.jsp" id="addElection">
					<h1 class="bg-dark text-white p-2 rounded-3">Add Election</h1>
					<div class="col-md-8">
						<div class="mb-3">
							<label for="exampleInput" class="form-label">Enter
								Election</label> <input type="text" class="form-control"
								id="exampleInput" aria-describedby="textHelp"
								name="electionName" required />
						</div>
					</div>

					<div class="col-md-4">
						<div class="mb-3">
							<label for="exampleInput" class="form-label">Enter
								Election</label> <select name="electionStatus" class="form-select"
								aria-label="Default select example" >
								<option selected value="Active">Active</option>
								<option value="In-Active">In-Active</option>
							</select>
						</div>
					</div>


					<div class="col-md-4"></div>

					<div class="col-md-6">
						<button type="submit" class="btn btn-primary px-4"
							id="branch-submit-btn">Add Election</button>
						<button type="button" class="btn btn-danger" id="deleteElection"
							style="display: none">Cancel</button>
					</div>


				</form>
			</div>
		</div>
	</div>

	<div class="container mt-5">
		<div class="row">
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
				<h2>Branch List</h2>
				<table class="table table-bordered table-info table-striped">
					<thead>
						<tr class="table-dark">
							<th scope="col">Sr .</th>
							<th scope="col">Election Name</th>
							<th scope="col">Status</th>
							<th scope="col">Operation</th>
							<!-- 							<th scope="col"></th>
 -->
						</tr>
					</thead>
					<tbody>
						<%
						Connection con = ConnectionProvider.getConnection();
						PreparedStatement stmt = con.prepareStatement("select * from election");
						ResultSet rs = stmt.executeQuery();
						int i = 1;
						while (rs.next()) {
						%>
						<tr>
							<th scope="row"><%=i%></th>
							<td><%=rs.getString("election_name")%></td>
							<td><%=rs.getString("election_status")%></td>

							<td class="d-flex justify-content-center"><button
									type="button" class="btn btn-warning"
									onclick="updateElection(<%=rs.getString("id")%>,'<%=rs.getString("election_name")%>')">Update</button>
								&nbsp &nbsp
								<button type="button" class="btn btn-danger"
									onclick="deleteElection(<%=rs.getString("id")%>,'<%=rs.getString("election_name")%> ')"
									id="deleteElection">Delete</button> &nbsp &nbsp

								<form action="AddCandidate.jsp" method="post">
									<input style="display: none" type="text" name="electionId"
										value="<%=rs.getString("id")%>"> 
										<input
										style="display: none"
										value="<%=rs.getString("election_name")%>" type="text"
										name="electionName">
										<input
										style="display: none"
										value="<%=rs.getString("election_name")%>" type="text"
										name="electionStatus"
										>
									<button type="submit" class="btn btn-info">View Candidate</button>
								</form> 
								&nbsp &nbsp
								<form action="CandidateList.jsp" method="post"
									style="display: <%=((!rs.getString("election_status").equals("In-Active")) ? "inline-block" : "none")%>;">
									<input style="display: none" type="text" name="electionId"
										value="<%=rs.getString("id")%>"> <input
										style="display: none"
										value="<%=rs.getString("election_name")%>" type="text"
										name="electionName">
									<button type="submit" class="btn btn-success">Add
										Candidate</button>
								</form></td>
						</tr>

						<%
						i++;
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
      $(document).ready(function () {
    	  
        $("#addElection").submit(function (e) {
          e.preventDefault();
          $.ajax({
            type: "POST",
            url: requestUrl,
            data: $("#addElection").serialize(),
            success: function (response) {
            	
            	console.log(response.trim())
              if (response.trim()[0] === "1") {
                Swal.fire({
                  title: "Election "+ response.trim().slice(1) + " Successfully",
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
	
	
	const cancelBtn = document.querySelector("#deleteElection");
	const inputElection = document.querySelector("#exampleInput");
	const submitBtn = document.querySelector("#branch-submit-btn");
	let requestUrl = "DB/AddElectionDB.jsp";

	
	
	cancelBtn.addEventListener("click",(e)=>{
		e.preventDefault();
		cancelBtn.style.display = "none"
		submitBtn.className = "btn btn-primary px-4"
		submitBtn.innerHTML = "Add Election"
		requestUrl = "DB/AddElectionDB.jsp";
		inputElection.value = ""
	})
	
	    function deleteElection(electionId,electionName){
		Swal.fire({
            icon: "warning",
			  title: "Are you sure !!?",
			  text:"DELETE (" + electionName + "Election !!)",
			  showDenyButton: true,
			  confirmButtonText: "Yes",
			  denyButtonText: `Cancel`
			}).then((result) => {
			  if (result.isConfirmed) {
				  $.ajax({
				        url: "DB/DeleteElection.jsp",
				        type: "POST",
				        data: {electionId},
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
			    Swal.fire("Election Not Deleted", "", "info");
			  }
			});
	}
	    
	    
	function updateElection(electionId,electionName){
		submitBtn.className = "btn btn-success"
		submitBtn.innerHTML = "Update Election"
		inputElection.value = electionName
		cancelBtn.style.display = "inline-block"
		requestUrl = "DB/UpdateElectionDB.jsp?electionId=" + electionId;
		inputElection.focus()
	}
	
	
	


    </script>

</body>
</html>
