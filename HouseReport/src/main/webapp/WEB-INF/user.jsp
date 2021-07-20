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
<title>User Profile</title>
</head>

<body>
	<header>
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
					<form action="profile.do" method="POST">
						<input type="hidden" name="id" value="${user.id }">
						<button class="btn btn-secondary my-2 my-sm-0" type="submit">Profile</button>
					</form>
				</div>
			</div>
		</nav>
	</header>
	<!-- End Navbar -->
	<!--     <div class="wrapper"> -->
	<div class="main-panel">
		<nav class="navbar navbar-expand-lg " color-on-scroll="500">
			<div class=" container-fluid  ">
				<a class="navbar-brand" href="#"> Dashboard </a>
				<button href="" class="navbar-toggler navbar-toggler-right"
					type="button" data-toggle="collapse"
					aria-controls="navigation-index" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-bar burger-lines"></span> <span
						class="navbar-toggler-bar burger-lines"></span> <span
						class="navbar-toggler-bar burger-lines"></span>
				</button>
				<div class="collapse navbar-collapse justify-content-end"
					id="navigation">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link" href="#pablo"> <span
								class="no-icon">Account</span>
						</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="https://example.com"
							id="navbarDropdownMenuLink" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> <span
								class="no-icon">Dropdown</span>
						</a>
							<div class="dropdown-menu"
								aria-labelledby="navbarDropdownMenuLink">
								<a class="dropdown-item" href="#">Action</a> <a
									class="dropdown-item" href="#">Another action</a> <a
									class="dropdown-item" href="#">Something</a> <a
									class="dropdown-item" href="#">Something else here</a>
								<div class="divider"></div>
								<a class="dropdown-item" href="#">Separated link</a>
							</div></li>
						<li class="nav-item"><a class="nav-link" href="#pablo"> <span
								class="no-icon">Log out</span>
						</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- End Navbar -->
		<div class="content"></div>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-4">
					<div class="card ">
						<div class="card-header ">
							<h4 class="card-title">Profile Info</h4>
						</div>
						<div class="card-footer ">
							<c:choose>
								<c:when test="${! empty user}">
									<h2>Account Info</h2>
									<form action="editUserPage.do" method="POST">
										<input type="hidden" name="id" value="${user.id}" /> <input
											type="submit" value="Edit Personal Information" />
									</form>
									<div class="info">Username: ${user.username}</div>
									<hr>
									<div class="info">First Name: ${user.firstName}</div>
									<div class="info">Last Name: ${user.lastName}</div>
									<div class="info">Email: ${user.email}</div>
									<div class="edit">
										<form action="editUserPage.do" method="POST">
											<input type="hidden" name="id" value="${user.id}" />
											<button class="btn btn-outline-warning" type="submit"
												name="action" value="Edit">
												<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
											</button>
										</form>
									</div>

								</c:when>
							</c:choose>
						</div>
					</div>
					<br>
				</div>
				<div class="col-md-8"></div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="card ">
						<div class="card-header ">
							<h4 class="card-title">Listings</h4>
							<p class="card-category">All listings of the user</p>
						</div>

						<div class="card-body ">
							<div class="table-full-width">
								<table class="table">
									<tbody>
										<c:choose>
											<c:when test="${! empty user.listings}">
												<tr>
													<c:forEach var="listing" items="${user.listings}">
														<td>
															<div class="form-check">
																<img src="${listing.listingPhotos.get(0)}"
																	alt="image placeholder" height="200"
																	class="card-img-top">
															</div>
														</td>
														<td>${listing.address.street },
															${listing.address.city}, ${listing.address.state}</td>
														<td class="td-actions text-right">
															<form action="editListing.do" method="POST">
																<input type="hidden" name="id" value="${listing.id}" />
																<input type="hidden" name="id" value="${user.id}">
																<button class="btn btn-outline-warning" type="submit"
																	name="action" value="Edit">
																	<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
																</button>
																<button class="btn btn-outline-danger" type="submit"
																	name="action" value="Delete">
																	<i class="fa fa-trash" aria-hidden="true"></i>
																</button>
															</form>
														</td>
													</c:forEach>

												</tr>
											</c:when>
											<c:otherwise>
		You do not have any current listings<br>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="card  card-tasks">
						<div class="card-header ">
							<h4 class="card-title">Comments</h4>
							<p class="card-category">All comments of the user</p>
						</div>
						<div class="card-body ">
							<div class="table-full-width">
								<table class="table">
									<tbody>
										<c:choose>
											<c:when test="${! empty user.comments}">
												<tr>
													<c:forEach var="comment" items="${user.comments}">
														<td>
															<div class="form-check">
																<p>${comment.listing.address.street }</p>
															</div>
														</td>
														<td>"${comment.comment }"</td>
														<td class="td-actions text-right">
															<form action="editComment.do" method="GET">
																<input type="hidden" name="id" value="${comment.id}" />
																<button class="btn btn-outline-warning" type="submit"
																	name="action" value="Edit">
																	<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
																</button>
																<button class="btn btn-outline-danger" type="submit"
																	name="action" value="Delete">
																	<i class="fa fa-trash" aria-hidden="true"></i>
																</button>
															</form>
														</td>
													</c:forEach>
												</tr>
											</c:when>
											<c:otherwise>
		You do not have any current comments<br>
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
	</div>
	<br>
	<br>
</body>
</html>