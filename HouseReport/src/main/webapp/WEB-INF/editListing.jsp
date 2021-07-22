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
<link rel="stylesheet" href="CSS/style.css" />
<!-- END CSS -->

<title>Update Listing</title>

<link rel="canonical" />
<style>
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
	<main>
		<br> <br> <br> <br> <br> <br>
		<div style="padding-top: 250"></div>
		<div class="container-fluid mycontainer card"
			style="width: 50%; margin-left: auto; margin-right: auto; padding: 20px;">
			<div>
				<h3>Update Your listing</h3>
			</div>
			<form class="row g-3" action="updateListing.do" method="POST">
				<input type="hidden" name="id" value="${listing.id}">

				<!-- Start of address object -->
				<div class="col-md-12">

					<label for="street" class="form-label">Street</label> <input
						type="text" class="form-control" name="street" value="${listing.address.street }">
				</div>

				<div class="col-md-12">
					<label for="street2" class="form-label">Apt</label> <input
						type="text" class="form-control" name="street2" value="${listing.address.street2 }">
				</div>

				<div class="col-md-6">
					<label for="city" class="form-label">City</label> <input
						type="text" class="form-control" name="city" value="${listing.address.city }">
				</div>
				<br>
				<div class="col-md-3">
					<label for="state" class="form-label"> State </label> <br> <select
						name="state" class="form-select bg-dark text-light">
						<option selected>State...</option>
						<option value="AL">Alabama</option>
						<option value="AK">Alaska</option>
						<option value="AZ">Arizona</option>
						<option value="AR">Arkansas</option>
						<option value="CA">California</option>
						<option value="CO">Colorado</option>
						<option value="CT">Connecticut</option>
						<option value="DE">Delaware</option>
						<option value="DC">DC</option>
						<option value="FL">Florida</option>
						<option value="GA">Georgia</option>
						<option value="HI">Hawaii</option>
						<option value="ID">Idaho</option>
						<option value="IL">Illinois</option>
						<option value="IN">Indiana</option>
						<option value="IA">Iowa</option>
						<option value="KS">Kansas</option>
						<option value="KY">Kentucky</option>
						<option value="LA">Louisiana</option>
						<option value="ME">Maine</option>
						<option value="MD">Maryland</option>
						<option value="MA">Massachusetts</option>
						<option value="MI">Michigan</option>
						<option value="MN">Minnesota</option>
						<option value="MS">Mississippi</option>
						<option value="MO">Missouri</option>
						<option value="MT">Montana</option>
						<option value="NE">Nebraska</option>
						<option value="NV">Nevada</option>
						<option value="NH">New Hampshire</option>
						<option value="NJ">New Jersey</option>
						<option value="NM">New Mexico</option>
						<option value="NY">New York</option>
						<option value="NC">North Carolina</option>
						<option value="ND">North Dakota</option>
						<option value="OH">Ohio</option>
						<option value="OK">Oklahoma</option>
						<option value="OR">Oregon</option>
						<option value="PA">Pennsylvania</option>
						<option value="RI">Rhode Island</option>
						<option value="SC">South Carolina</option>
						<option value="SD">South Dakota</option>
						<option value="TN">Tennessee</option>
						<option value="TX">Texas</option>
						<option value="UT">Utah</option>
						<option value="VT">Vermont</option>
						<option value="VA">Virginia</option>
						<option value="WA">Washington</option>
						<option value="WV">West Virginia</option>
						<option value="WI">Wisconsin</option>
						<option value="WY">Wyoming</option>
					</select>
				</div>

				<div class="col-md-3">
					<label for="postalCode" class="form-label">Zip Code</label> <input
						type="text" class="form-control" name="postalCode" value="${listing.address.postalCode }">
				</div>

				<!-- Start of listing object -->
				<div class="col-md-3">
					<label for="price" class="form-label">Price</label> <input
						type="text" class="form-control" name="price"
						value="${listing.price}">
				</div>

				<div class="col-md-3">
					<label for="squareFeet" class="form-label">Square footage</label> <input
						type="text" class="form-control" name="squareFeet"
						value="${listing.squareFeet}">
				</div>

				<div class="col-md-3">
					<label for="bedNumber" class="form-label">Bedrooms</label> <input
						type="text" class="form-control" name="bedNumber"
						value="${listing.bedNumber}">
				</div>

				<div class="col-md-3">
					<label for="bathNumber" class="form-label">Bathrooms</label> <input
						type="text" class="form-control" name="bathNumber"
						value="${listing.bathNumber}">
				</div>

				<div class="col-md-3">
					<label for="propertyCrimeRate" class="form-label"> Crime
						Rate</label> <input type="text" class="form-control"
						name="propertyCrimeRate" value="${listing.propertyCrimeRate}">
				</div>

				<div class="col-md-3">
					<label for="hoaMonthlyRate" class="form-label">Monthly HOA
						Cost</label> <input type="text" class="form-control" name="hoaMonthlyRate"
						value="${listing.hoaMonthlyRate}">
				</div>

				<div class="col-md-3">
					<label for="yearBuilt" class="form-label">Year Built</label> <input
						type="text" class="form-control" name="yearBuilt"
						value="${listing.yearBuilt}">
				</div>

				<div class="col-md-3">
					<label for="lotSizeSqft" class="form-label">Lot Size</label> <input
						type="text" class="form-control" name="lotSizeSqft"
						value="${listing.lotSizeSqft}">
				</div>

				<div class="col-md-3">
					<label for="propertyTax" class="form-label">Property Tax</label> <input
						type="text" class="form-control" name="propertyTax"
						value="${listing.propertyTax}">
				</div>

				<div class="col-md-3">
					<label for="parkingType" class="form-label">Parking Type</label> <input
						type="text" class="form-control" name="parkingType"
						value="${listing.parkingType}">
				</div>

				<!-- property type object -->
				<div class="col-md-3">
					<label class="form-label"> Type </label> <br> <select
						id="state" name="type" value="${listing.propertyType.type}" class="form-select bg-dark text-light">
						<option selected>Property Type...</option>
						<option value="Apartment">Apartment</option>
						<option value="House">House</option>
						<option value="Condo">Condo</option>
						<option value="Duplex">Duplex</option>
						<option value="Townhouse">Townhouse</option>
					</select>
				</div>

				<!-- listing photo object -->
				<div class="col-md-3">
					<label for="imgUrl" class="form-label">Photo URL</label> <input
						type="text" class="form-control" id="Create" name="imgUrl" value="${listing.listingPhotos.get(0).imgUrl }">
				</div>
				<br>
				<div class="col text-center">
					<button type="submit" class="btn btn-primary bg-dark"
						value="submit">Update</button>
				</div>
			</form>
		</div>
	</main>
</body>
</html>