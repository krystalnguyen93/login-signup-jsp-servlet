<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	height: 100vh;
	min-height: 550px;
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
	position: relative;
	overflow-y: hidden;
}

a {
	text-decoration: none;
	color: #444444;
}

.login-reg-panel {
	position: relative;
	top: 50%;
	transform: translateY(-50%);
	text-align: center;
	width: 70%;
	right: 0;
	left: 0;
	margin: auto;
	height: 400px;
	background-color: rgba(236, 48, 20, 0.9);
}

.white-panel {
	background-color: rgba(255, 255, 255, 1);
	height: 500px;
	position: absolute;
	top: -50px;
	width: 50%;
	right: calc(50% - 50px);
	transition: .3s ease-in-out;
	z-index: 0;
	box-shadow: 0 0 15px 9px #00000096;
}

.login-reg-panel input[type="radio"] {
	position: relative;
	display: none;
}

.login-reg-panel {
	color: #B8B8B8;
}

.login-reg-panel #label-login, .login-reg-panel #label-register {
	border: 1px solid #9E9E9E;
	padding: 5px 5px;
	width: 150px;
	display: block;
	text-align: center;
	border-radius: 10px;
	cursor: pointer;
	font-weight: 600;
	font-size: 18px;
}

.login-info-box {
	width: 30%;
	padding: 0 50px;
	top: 20%;
	left: 0;
	position: absolute;
	text-align: left;
}

.register-info-box {
	width: 30%;
	padding: 0 50px;
	top: 20%;
	right: 0;
	position: absolute;
	text-align: left;
}

.right-log {
	right: 50px !important;
}

.login-show, .register-show {
	z-index: 1;
	display: none;
	opacity: 0;
	transition: 0.3s ease-in-out;
	color: #242424;
	text-align: left;
	padding: 50px;
}

.show-log-panel {
	display: block;
	opacity: 0.9;
}

.login-show input[type="text"], .login-show input[type="password"] {
	width: 100%;
	display: block;
	margin: 20px 0;
	padding: 15px;
	border: 1px solid #b5b5b5;
	outline: none;
}

.login-show input[type="submit"] {
	max-width: 150px;
	width: 100%;
	background: #444444;
	color: #f9f9f9;
	border: none;
	padding: 10px;
	text-transform: uppercase;
	border-radius: 2px;
	float: right;
	cursor: pointer;
}

.login-show a {
	display: inline-block;
	padding: 10px 0;
}

.register-show input[type="text"], .register-show input[type="password"]
	{
	width: 100%;
	display: block;
	margin: 20px 0;
	padding: 15px;
	border: 1px solid #b5b5b5;
	outline: none;
}

.register-show input[type="submit"] {
	max-width: 150px;
	width: 100%;
	background: #444444;
	color: #f9f9f9;
	border: none;
	padding: 10px;
	text-transform: uppercase;
	border-radius: 2px;
	float: right;
	cursor: pointer;
}

.credit {
	position: absolute;
	bottom: 10px;
	left: 10px;
	color: #3B3B25;
	margin: 0;
	padding: 0;
	text-transform: uppercase;
	font-size: 12px;
	font-weight: bold;
	letter-spacing: 1px;
	z-index: 99;
}

a {
	text-decoration: none;
	color: #2c7715;
}

.error-notice {
	margin: 5px 5px; /* Making sure to keep some distance from all side */
}

.oaerror {
	width: 90%; /* Configure it fit in your design  */
	margin: 0 auto; /* Centering Stuff */
	background-color: #FFFFFF; /* Default background */
	padding: 20px;
	border: 1px solid #eee;
	border-left-width: 5px;
	border-radius: 3px;
	margin: 0 auto;
	font-family: 'Open Sans', sans-serif;
	font-size: 16px;
}

.danger {
	border-left-color: #d9534f; /* Left side border color */
	background-color: rgba(217, 83, 79, 0.1);
	/* Same color as the left border with reduced alpha to 0.1 */
}

.danger strong {
	color: #d9534f;
}
.success {
  border-left-color: #2b542c;
  background-color: rgba(43, 84, 44, 0.1);
}

</style>
</head>
<body>

	<div class="login-reg-panel">
		<div class="login-info-box">
			<h2>Have an account?</h2>
			<label id="label-register" for="log-reg-show">Login</label> <input
				type="radio" name="active-log-panel" id="log-reg-show"
				checked="checked">
		</div>

		<div class="register-info-box">
			<h2>Don't have an account?</h2>
			<label id="label-login" for="log-login-show">Register</label> <input
				type="radio" name="active-log-panel" id="log-login-show">
		</div>

		<div class="white-panel">
			<form action="LoginServlet" class="login-show">
				<h2>LOGIN</h2>
				<div class="error-notice">
					<c:if test="${not empty message}">
						<div class="oaerror danger">
							<strong>${alert}</strong> ${message}
						</div>
					</c:if>
					<c:if test="${not empty mss}">
						<div class="oaerror danger">
							<strong>${al}</strong> ${mss}
						</div>
					</c:if>

					<c:if test="${not empty mes}">
						<div class=" oaerror success">
							<strong>${yeppi}</strong> ${mes}
						</div>
					</c:if>
				</div>
				<input type="text" name="username" placeholder="User Name">
				<input type="password" name="password" placeholder="Password">
				<input type="submit" value="Login"> <a href="">Forgot
					password?</a>
			</form>

			<form action="RegisterServlet" class="register-show">
				<h2>REGISTER</h2>
				<c:if test="${not empty message}">
					<div class="error-notice">
						<div class="oaerror danger">
							<strong>${alert}</strong> ${message}
						</div>
					</div>
				</c:if>
				<input type="text" name="username" placeholder="User Name">
				<input type="text" name="email" placeholder="Email"> <input
					type="password" name="password" placeholder="Password"> <input
					type="password" name="repassword" placeholder="Confirm Password">
				<input type="submit" value="Register">
			</form>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		$(document).ready(function() {
			$('.login-info-box').fadeOut();
			$('.login-show').addClass('show-log-panel');
		});

		$('.login-reg-panel input[type="radio"]').on('change', function() {
			if ($('#log-login-show').is(':checked')) {
				$('.register-info-box').fadeOut();
				$('.login-info-box').fadeIn();

				$('.white-panel').addClass('right-log');
				$('.register-show').addClass('show-log-panel');
				$('.login-show').removeClass('show-log-panel');

			} else if ($('#log-reg-show').is(':checked')) {
				$('.register-info-box').fadeIn();
				$('.login-info-box').fadeOut();

				$('.white-panel').removeClass('right-log');

				$('.login-show').addClass('show-log-panel');
				$('.register-show').removeClass('show-log-panel');
			}
		})
	</script>

</body>
</html>