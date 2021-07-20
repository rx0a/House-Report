<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<link rel="shortcut icon" href="favicon.ico" />
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

	<!-- Navbar -->
	<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">

		<br> <a class="navbar-brand" href="home.do"><img
			src="images/logo1.png" width="75px" alt="House Report Logo"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="home.do">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">About</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Profile</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="results.do">View Listings</a>
						<form action="profile.do" method="GET">
							<input type="hidden" name="id" value="${user.id }">
							<button class="dropdown-item" type="submit">View Profile</button>
						</form>

						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Logout</a>
					</div></li>
				<li class="nav-item"><a class="nav-link disabled" href="#"
					tabindex="-1" aria-disabled="true"></a></li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
	</nav>
	<!-- End Navbar -->

	<div class="container-fluid">
		<div class="px-lg-5">

			<!-- For demo purpose -->
			<div class="row py-5">
				<div class="col-lg-12 mx-auto">
					<div class="text-white p-5 shadow-sm rounded banner">
						<h1 class="display-4">Results</h1>
						<p class="lead">Listings that match your query</p>
					</div>
				</div>
			</div>
			<!-- End -->

			<div class="row">
				<!-- Gallery item -->
				<c:choose>
					<c:when test="${! empty listings}">
						<c:forEach var="listing" items="${listings}">

							<div class="col-xl-3 col-lg-4 col-md-6 mb-4">
								<div class="card mb-4 shadow-sm">
									<form action="expandListing.do" method="POST">
										<input type="hidden" name="id" value="${listing.id}">
										<img src="${listing.listingPhotos.get(0)}"
											alt="image placeholder" height="200" class="card-img-top">
										<div class="p-4">
											<p class="lead">${listing.address.street}</p>
											<p class="small text-muted mb-0">${listing.address.city },
												${listing.address.state }</p>
											<div
												class="d-flex align-items-center justify-content-between rounded-pill px-3 py-2 mt-4">
												<div
													class="badge badge-primary px-3 rounded-pill font-weight-normal">
													<i class="fa fa-check"></i>Accuracy Rating
												</div>
												<div
													class="badge badge-warning px-3 rounded-pill font-weight-normal">${listing.getCreatedOn().getYear()},
													${listing.getCreatedOn().getMonth()}</div>
												<button class="stretched-link" type="submit"
													style="background: transparent; border: none; color: transparent;"></button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<p>No listings found</p>
					</c:otherwise>
				</c:choose>
				<!-- End -->

			</div>
			<div class="py-5 text-right">
				<a href="#" class="btn btn-dark px-5 py-3 text-uppercase">Show
					more</a>
			</div>
		</div>
	</div>
	<div class="container">
		<br> <a href="https://github.com/ryspc/MidtermProject">Follow
			the development on Github &nbsp;<i class="fa fa-github"
			aria-hidden="true"></i>
		</a> <br>
	</div>

</body>
</html>