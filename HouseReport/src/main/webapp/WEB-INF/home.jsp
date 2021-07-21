<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<link rel="shortcut icon" href="favicon.ico" />
<meta charset="UTF-8">

<!-- BOOTSTRAP -->
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.0/examples/sign-in/">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@forevolve/bootstrap-dark@1.1.0/dist/css/bootstrap-dark.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<!-- END BOOTSTRAP -->

<!-- JAVASCRIPT -->

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<!-- END JAVASCRIPT -->

<!-- CSS -->
<link rel="stylesheet" href="style.css" />
<!-- END CSS -->

<title>House Report</title>
<style>
</style>
</head>
<link rel="canonical" />
<body>
	<!-- Start Raybar -->
	<header>
		<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="home.do"><img
					src="images/logo1.png" width="75px" alt="House Report Logo">&nbsp;&nbsp;House
					Report</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ml-auto"
						style="max-width: 100%; margin-right: auto; margin-left: auto; padding-left: 120px">
						<li class="nav-item search">
							<form class="d-flex" action="home.do" method="POST">
								<input class="form-control me-2" name="keyword" type="search"
									placeholder="Search Listings" aria-label="Search">
								<button class="btn btn-outline-light" type="submit">
									<i class="fa fa-search" aria-hidden="true"></i>
								</button>
							</form>
						</li>
					</ul>
					<ul class="navbar-nav ml-auto ">
						<li class="nav-item dropdown" style="margin-right:20px" ><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> ${user.firstName }
								${user.lastName}&nbsp; </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<form action="profile.do" method="GET">
									<input type="hidden" name="id" value="${user.id}">
									<button class="dropdown-item" type="submit">View
										Profile</button>
								</form>
								<c:if test="${user.role == 'admin'}">
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="admin.do"> <span
										class="no-icon">Admin Dashboard</span>
									</a>
								</c:if>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="createListing.do">Create
									Listing</a>

								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="logOut.do">Logout</a>
							</div></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<!-- End Raybar -->

	<div class="container-fluid" style="padding-top:120px">
		<div class="px-lg-5">

			<!-- For demo purpose -->
			<!-- <div class="row py-5"> -->
<!-- 				 <div class="col-lg-12 mx-auto"> 
					<div class="text-white p-5 shadow-sm rounded banner"> -->
						<!-- <p class="lead"></p> -->
					<!-- </div>
				 </div>  -->
			<!-- </div>  -->
			<!-- End -->

			<div class="row">
				<!-- Gallery item -->
				<c:choose>
					<c:when test="${! empty AddressList}">
						<c:forEach var="address" items="${AddressList}">

							<div class="col-xl-3 col-lg-4 col-md-6 mb-4">
								<div class="card mb-4 shadow-sm">
									<form action="expandListing.do" method="POST">
										<input type="hidden" name="id" value="${address.listing.id}">
										<img src="${address.listing.listingPhotos.get(0)}"
											alt="image placeholder" height="200" class="card-img-top">
										<div class="p-4">
											<p class="lead">${address.street}</p>
											<p class="small text-muted mb-0">${address.city },
												${address.state }</p>
											<div
												class="d-flex align-items-center justify-content-between rounded-pill px-3 py-2 mt-4">
												<div
													class="badge badge-primary px-3 rounded-pill font-weight-normal">
													Rating: ${address.listing.accuracyRating}
												</div>
												<div
													class="badge badge-warning px-3 rounded-pill font-weight-normal">Events: ${address.listing.events.size()}</div>
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
<!-- 			<div class="py-5 text-right">
				<a href="#" class="btn btn-dark px-5 py-3 text-uppercase">Show
					more</a>
			</div> -->
		</div>
	</div>
</body>

</html>