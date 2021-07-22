<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
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
<link rel="stylesheet" href="CSS/style.css" />
<!-- END CSS -->

<title>House Report</title>

<link rel="canonical" />

<style>
.titletable {
	width: 100%;
}
</style>

</head>
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
						<li class="nav-item dropdown" style="margin-right: 20px"><a
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
	<!-- Carousel -->
	<div id="carouselExampleControls" class="carousel slide"
		style="padding-top: 70px; height: 600px;" data-ride="carousel">
		<div class="carousel-inner">

			<div class="carousel-item active">

				<img class="d-block w-100 h-100" style="margin-top: -200px;"
					src="${selectedListing.listingPhotos.get(0).imgUrl}"
					alt="Image of home">
			</div>
			<c:forEach var="photo" items="${selectedListing.listingPhotos}">

				<div class="carousel-item">

					<img class="d-block w-100 h-100" style="margin-top: -200px;"
						src="${photo.imgUrl}" alt="Image of home">
				</div>
			</c:forEach>
		</div>
		<button class="carousel-control-prev" type="button"
			data-target="#carouselExampleControls" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-target="#carouselExampleControls" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
	<!-- End Carousel-->

	<!-- Info Card -->
	<div class="card text-center">
		<div class="card-header" style="padding-left: 0; margin-left: 0;">
			<table class="table titletable "
				style="padding-left: 0; margin-left: 0;">
				<tr>
					<td class="align-left" style="padding-left: 0; margin-left: 0;">
						<form action="addRating.do" method="POST">
							Rating:&nbsp;${selectedListing.address.listing.accuracyRating }%<br>
							<input type="hidden" name="listingID"
								value="${selectedListing.id}" /> <input type="hidden"
								name="userID" value="${user.id}">
							<button class="btn btn-outline-primary  " name="vote"
								type="submit" value="1">
								<i class="fa fa-arrow-up" aria-hidden="true"></i>
							</button>

							<button class="btn btn-outline-warning  " name="vote"
								type="submit" value="0">
								<i class="fa fa-arrow-down" aria-hidden="true"></i>
							</button>
						</form>
					</td>
					<td class="align-center">
						<h5 class="card-title">${selectedListing.address.street},
							<br> ${selectedListing.address.city},
							${selectedListing.address.state}
							${selectedListing.address.postalCode}
						</h5>
					</td>
					<td class="align-right">
						<form action="addToFavorites.do" method="POST">
							<input type="hidden" name="listingID"
								value="${selectedListing.id}" /> <input type="hidden"
								name="userID" value="${user.id}"> Favorite<br>
							<button class="btn btn-outline-danger  " type="submit"
								value="favorite">
								<i class="fa fa-heart" aria-hidden="true"></i>
							</button>
						</form>
					</td>
				</tr>
			</table>
		</div>
		<!-- Start Listing body -->
		<div class="card-body">
			<div class="row">
				<div class="col-md-6">
					<div class="card ">
						<div class="card-header ">
							<h4 class="card-title">Details</h4>
						</div>
						<div class="card-body ">
							<div class="table-full-width">
								<table class="table table-striped" id="container">
									<tbody>
										<tr>
											<td>
												<div class="form-check">Price:</div>
											</td>
											<td>$ ${selectedListing.price }</td>
										</tr>
										<tr>
											<td>
												<div class="form-check">Square Feet:</div>
											</td>
											<td>${selectedListing.squareFeet }</td>
										</tr>

										<tr>
											<td>
												<div class="form-check">Bedrooms:</div>
											</td>
											<td>${selectedListing.bedNumber }</td>
										</tr>


										<tr>
											<td>
												<div class="form-check">Bathrooms:</div>
											</td>
											<td>${selectedListing.bathNumber }</td>
										</tr>

										<tr>
											<td>
												<div class="form-check">Year Built:</div>
											</td>
											<td>${selectedListing.yearBuilt }</td>
										</tr>

										<tr>
											<td>
												<div class="form-check">Crime Rate:</div>
											</td>
											<td>${selectedListing.propertyCrimeRate }</td>
										</tr>

										<tr>
											<td>
												<div class="form-check">Violent Crime Rate:</div>
											</td>
											<td>${selectedListing.violentCrimeRate }</td>
										</tr>

										<tr>
											<td>
												<div class="form-check">Lot Size:</div>
											</td>
											<td>${selectedListing.lotSizeSqft }</td>
										</tr>
										<tr>
											<td>
												<div class="form-check">Property Type:</div>
											</td>
											<td>${selectedListing.propertyType.type }</td>
										</tr>

										<tr>
											<td>
												<div class="form-check">Parking:</div>
											</td>
											<td>${selectedListing.parkingType }</td>
										</tr>
										<tr>
											<td>
												<div class="form-check">Monthly HOA fees:</div>
											</td>
											<td>$ ${selectedListing.hoaMonthlyRate }</td>
										</tr>

										<tr>
											<td>
												<div class="form-check">Property Tax Rate:</div>
											</td>
											<td>$ ${selectedListing.propertyTax }</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="card ">
						<div class="card-header ">
							<form action="addEvent.do" method="post">
								<button class="btn btn-outline-primary pull-right" type="submit"
									value="Add Event">
									<i class="fa fa-plus"></i>
								</button>
								<input class="btn btn-primary bg-dark" type="hidden" name="id"
									value="${selectedListing.id }">
							</form>
							<h4 class="card-title">Events</h4>
						</div>
						<div class="card-body ">
							<div class="table-full-width">
								<table class="table table-striped" id="container">
									<tbody>
										<c:choose>
											<c:when test="${! empty selectedListing.events}">
												<c:forEach var="event" items="${selectedListing.events}">
													<tr>
														<td>${event.eventType }</td>
														<td>${event.eventDate }</td>
													</tr>
												</c:forEach>
											</c:when>

											<c:otherwise>
		No recorded events.<br>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br>

		<!-- Comment Box -->
		<section>
			<div class="overflow-auto p-3 mb-3 mb-md-0 mr-md-3 bg-dark"
				style="max-width: auto; max-height: 250px;">
				<div class="container">
					<div class="row">
						<div class="col-sm-5 col-md-6 col-12 pb-4">
							<h1>Comments</h1>

							<c:choose>
								<c:when test="${! empty selectedListing.comments}">
									<c:forEach var="comment" items="${selectedListing.comments}">
										<div class="comment mt-4 text-justify">
											<img src="https://i.imgur.com/yTFUilP.jpg" alt=""
												class="rounded-circle" width="40" height="40">
											<h4>${comment.user.username }</h4>
											<span>- 18 July, 2021</span> <br>
											<p>${comment.comment}</p>
										</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
								No comments on this listing<br>
								</c:otherwise>
							</c:choose>
						</div>

					</div>
				</div>
			</div>
		</section>
		<form action="postComment.do" method="POST">

			<input type="text" name="comment" /> <input type="hidden"
				name="listingID" value="${selectedListing.id}" /> <input
				type="hidden" name="userID" value="${user.id}"> <input
				class="btn btn-primary bg-dark" type="submit" value="Post Comment" />
		</form>
	</div>

	<div class="card-footer text-muted"></div>

	<!-- End Info Card -->


</body>