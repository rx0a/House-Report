<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="/docs/4.0/assets/img/favicons/favicon.ico">
<title>House Report</title>
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.0/examples/sign-in/">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@forevolve/bootstrap-dark@1.1.0/dist/css/bootstrap-dark.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
</head>
<body class="text-center">
	<div style="width: 300px; margin: 0 auto;">
		<form class="form-signin" action="checkAccount.do" method="POST">
			<br> <br>
			<div class="container">
				<br> <img src="images/logo1.png" width="250"
					alt="House Report Logo">
				<h1 class="h2 mb-2 font-weight-heavy">House Report</h1>
				<h1 class="h4 mb-4 font-weight-light">Login</h1>
				
				
				<label for="inputUsername" class="sr-only">Username</label> <input
					type="text" id="inputUsername" name="username" class="form-control"
					placeholder="Username" required autofocus><br> 
					
					<label
					for="inputPassword" class="sr-only">Password</label> <input
					type="password" id="inputPassword" name="password" class="form-control"
					placeholder="Password" required> <br>
				<div class="checkbox mb-3">
					<label> <input type="checkbox" value="remember-me">
						Remember me
					</label>
				</div>
				<button class="btn btn-lg btn-secondary btn-block" type="submit">Login</button>
				<br>
			</div>
		</form>
		<form class="form-create-account" action="register.do">
			<div class="container">
				<button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>
				<br> <a href="https://github.com/ryspc/MidtermProject">Follow
					the development on Github &nbsp;<i class="fa fa-github"
					aria-hidden="true"></i>
				</a>
			</div>
		</form>
	</div>
</body>
</html>