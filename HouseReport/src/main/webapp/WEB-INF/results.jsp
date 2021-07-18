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
		<!-- Navbar -->
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">House Report</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarColor02"
					aria-controls="navbarColor02" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarColor02">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link active" href="#">Home
								<span class="visually-hidden"></span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#">View
								Listings</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Add a
								Listing</a></li>
						<li class="nav-item"><a class="nav-link" href="#">About</a></li>
					</ul>
					<form class="d-flex">
						<input class="form-control me-sm- " type="text"
							placeholder="Search">
						<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
					</form>
				</div>
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
      <div class="col-xl-3 col-lg-4 col-md-6 mb-4">
        <div class="card mb-4 shadow-sm"><img src="${listing.image}" alt="" class="img-fluid card-img-top">
          <div class="p-4">
            <h5> <a href="#" class="text-dark">${listing.address} listing address placeholder, image will be above this </a></h5>
            <p class="small text-muted mb-0">${listing.rating } listing rating placeholder</p>
            <div class="d-flex align-items-center justify-content-between rounded-pill px-3 py-2 mt-4">
              <p class="small mb-0"><i class="fa fa-picture-o mr-2"></i><span class="font-weight-bold">Some info</span></p>
              <div class="badge badge-danger px-3 rounded-pill font-weight-normal">New</div>
            </div>
          </div>
        </div>
      </div>
      <!-- End -->

    </div>
    <div class="py-5 text-right"><a href="#" class="btn btn-dark px-5 py-3 text-uppercase">Show more</a></div>
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