<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<nav class="navbar navbar-expand-lg  fixed-top"
	style="background-color: #e3f2fd;">
	<div class="container-fluid">
		<!-- 		offcanvas tigger    -->

		<button class="navbar-toggler" type="button"
			data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling"
			aria-controls="offcanvasScrolling">
			<span class="navbar-toggler-icon"
				data-bs-target="#offcanvasScrolling"></span>
		</button>

		<!-- 		offcanvas tigger    -->


		<a class="navbar-brand text-uppercase text-dark" href="#"><strong>
				Navbar </strong></a>
		<!-- 	
>>>>>>> 961e93fcf91eb15cb0403243d5f0991128e1eb66
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNavAltMarkup"
			aria-controls="navbarNavAltMarkup" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<div class="navbar-nav">
				<a class="nav-link active" aria-current="page" href="#">Home</a> <a
					class="nav-link" href="#">Features</a> <a class="nav-link" href="#">Pricing</a>
				<a class="nav-link disabled" aria-disabled="true">Disabled</a>
			</div>
		</div> -->
		<div class="text-white mr-5">
			<button class="btn btn-outline-dark border-2" onclick="logout()">
				<span class="fw-bolder">Logout</span> <span class=" px-1 rounded">
					<i class="bi bi-box-arrow-right"></i>

				</span>
			</button>

		</div>
	</div>
</nav>

<script type="text/javascript">
	function logout(){
		Swal.fire({
			  title: "Are you sure ?",
			  text: "That you want to logout?",
			  icon: "question",
			  showCancelButton: true,
			  cancelButtonColor: "#d33",
			}).then((res)=>{
				if(res.isConfirmed){
					      $.ajax({
					        type: "POST",
					        url: "DB/LoginDB.jsp",
					        data:{logoutRequest:1},
					        success: function (response) { 
					        	console.log(response.trim())
					        	
					        if (response.trim()[0] === "1") {
                Swal.fire({
                  title: response.trim().slice(1),
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
					        	
					        	
					        	
					        	
					        }
					      });
	
					
				}
			});
	}
</script>

