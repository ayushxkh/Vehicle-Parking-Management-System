<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Registration</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="reg_set.css">
<!--===============================================================================================-->
</head>
<body>
	<form action="/Project/OtpServlet" method="post">
		<div class="limiter">
			<div class="container-login100"
				style="background-image: url('https://thumbs.dreamstime.com/b/katowice-poland-b-shaped-logo-wings-bonnet-pink-bentley-mulsane-201660860.jpg');">
				<div class="wrap-login100">
					<form class="login100-form validate-form">
						<span class="login100-form-logo"> <i
							class="glyphicon glyphicon-user"></i>
						</span> <span class="login100-form-title p-b-34 p-t-27"> Register
							Here </span>

						<div class="wrap-input100 validate-input"
							data-validate="Enter First Name">
							<input class="input100" type="text" name="firstname"
								placeholder="First Name"> <span class="focus-input100"
								data-placeholder="&#xf207;"></span>
						</div>

						<div class="wrap-input100 validate-input"
							data-validate="Enter Last Name ">
							<input class="input100" type="text" name="lastname"
								placeholder="Last Name"> <span class="focus-input100"
								data-placeholder="&#xf207;"></span>
						</div>

						<div class="wrap-input100 validate-input"
							data-validate="Enter username">
							<input class="input100" type="text" name="username"
								placeholder="Username"> <span class="focus-input100"
								data-placeholder="&#xf207;"></span>
						</div>

						<div class="wrap-input100 validate-input"
							data-validate="Enter password">
							<input class="input100" type="password" name="password"
								placeholder="Password"> <span class="focus-input100"
								data-placeholder="&#xf191;"></span>
						</div>

						<div class="wrap-input100 validate-input"
							data-validate="Confirm password">
							<input class="input100" type="password" name="confirm_password"
								placeholder="Confirm Password"> <span
								class="focus-input100" data-placeholder="&#xf191;"></span>
						</div>




						<div class="wrap-input100 validate-input"
							data-validate="Enter Residential Address">
							<input class="input100" type="text" name="residential"
								placeholder="Residential Address"> <span
								class="focus-input100" data-placeholder="&#xf207;"></span>
						</div>

						<div class="wrap-input100 validate-input"
							data-validate="Enter Email ID">
							<input class="input100" type="text" name="email"
								placeholder="Email ID"> <span class="focus-input100"
								data-placeholder="&#xf207;"></span>
						</div>

						<div class="wrap-input100 validate-input"
							data-validate="Enter Mobile Number">
							<input class="input100" type="text" name="mob"
								placeholder="Mobile Number"> <span
								class="focus-input100" data-placeholder="&#xf207;"></span>
						</div>

						<div class="wrap-input100 validate-input"
							data-validate="Enter Car Registration Number">
							<input class="input100" type="text" name="car_reg"
								placeholder="Car Registration Number"> <span
								class="focus-input100" data-placeholder="&#xf207;"></span>
						</div>

						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="ckb1" type="checkbox"
								name="remember-me"> <label class="label-checkbox100"
								for="ckb1"> Remember me </label>
						</div>

						<div class="container-login100-form-btn">
							<button class="login100-form-btn">Register</button>
						</div>

						<div class="text-center p-t-90">
							<a class="txt1" href="#"> Forgot Password? </a>
						</div>
					</form>
				</div>
			</div>
		</div>


		<div id="dropDownSelect1"></div>


		<script src="reg_main.js"></script>
	</form>
</body>
</html>

