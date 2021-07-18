<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<form class="form-create-account" action="registerUser.do" method="POST">
			<br> <br>
			<div class="container">
				<br> <img src="images/logo1.png" width="250"
					alt="House Report Logo">
				<h1 class="h2 mb-2 font-weight-heavy">House Report</h1>
				<h1 class="h4 mb-4 font-weight-light">Register</h1>
				<input class="form-control me-2" name="firstName" type="text"
					placeholder="First Name" aria-label="firstName" autofocus>
				<br> <input class="form-control me-2" name="lastName"
					type="text" placeholder="Last Name" aria-label="lastName"><br>
				<input class="form-control me-2" name="username" type="text"
					placeholder="Username" required aria-label="Username"> <br>
				<input type="email" id="inputEmail" class="form-control"
					placeholder="Email address" name="email"> <br> <input
					class="form-control me-2" name="password" type="text"
					placeholder="Password" aria-label="Password" required> <br>
				<input class="form-control me-2" name="passwordverify" type="text"
					placeholder="Password again" aria-label="Passwordverify"><br>
					<input type="hidden" name ="enabled" value=1>
					<input type="hidden" name ="role" value="user">
				<button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>
				<br> Already have an account?<a href=login.do> Login </a> <br>
			</div>
		</form>
		<form class="form-login" action="login.do">
			<div class="container">
				<br> <a href="https://github.com/ryspc/MidtermProject">Follow
					the development on Github &nbsp;<i class="fa fa-github"
					aria-hidden="true"></i>
				</a>
			</div>
		</form>
	</div>
<c:if test="${username}">
  <script>alert("Username already Exists!");
</script>
</c:if>
<c:if test="${email}">
  <script>alert("Email already registered to another account!");
</script>
</c:if>
<c:if test="${password}">
  <script>alert("Passwords must match!");
</script>
</c:if>
</body>
</html>