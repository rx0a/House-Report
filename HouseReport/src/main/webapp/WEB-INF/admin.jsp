<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page import="java.util.*"%>
<%@ page import="java.time.*"%>

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
<style>
.mytable {
	height: 300px;
	padding: 0px;
	margin: 0px;
}

.commentdate {
	width: 130px;
}

.td-actions {
	width: 130px;
}

.test {
	height: 30px;
	padding: 0px;
	margin: 0;
	text-align: center
}

.test2 {
	margin-top: 20px;
}

html {
	width: 100%;
	margin: 0;
	padding: 0;
}

.mycontainer {
	width: 90%;
	padding: 0;
}

.demo-wrap {
	position: relative;
}

.demo-wrap:before {
	content: ' ';
	display: block;
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	opacity: 0.2;
	background-image: url('images/logo1.png');
	background-repeat: no-repeat;
	background-position: 50% 0;
	background-size: contain;
}

.demo-content {
	position: relative;
}
</style>
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
				<p></p>
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
						<li class="nav-item"><a class="nav-link" href="profile.do"> <span
								class="no-icon">User</span>
						</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- End Navbar -->
		<div class="content"></div>
		<div class="container-fluid mycontainer">
			<div class="row">
				<div class="col-md-4">
					<div class="card ">
						<div class="card-header ">
							<form action="editUserPage.do" method="POST">
								<input type="hidden" name="id" value="${user.id}" />
								<button class="btn btn-outline-warning pull-right" type="submit"
									name="action" value="Edit">
									<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
								</button>
								<h4 class="card-title">Profile Info</h4>
							</form>
						</div>
						<div class="card-body ">
							<c:choose>
								<c:when test="${! empty user}">

									<div class="info">Username: ${user.username}</div>
									<hr>
									<div class="info">First Name: ${user.firstName}</div>
									<hr>
									<div class="info">Last Name: ${user.lastName}</div>
									<hr>
									<div class="info">Email: ${user.email}</div>

								</c:when>
							</c:choose>
						</div>
						<c:choose>
							<c:when test="${! empty user.updatedTime }">
								<div class="card-footer ">Last Updated:

									${Duration.between(user.updatedTime, LocalDateTime.now()).getSeconds()}
									seconds ago.</div>
							</c:when>
							<c:otherwise>
								<div class="card-footer ">Last Updated: Never</div>
							</c:otherwise>
						</c:choose>

					</div>
					<br>
				</div>
				<div class="col-md-8 demo-wrap">
					<div class="demo-content">
						<c:choose>
							<c:when test="${! empty user}">
								<br>
								<h1>&nbsp;&nbsp;&nbsp;&nbsp;Admin Dashboard</h1>
								<br>
								<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Here
									you can view and edit users and listings.</h5>
							</c:when>
						</c:choose>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="card ">
						<div class="card-header ">
							<h4 class="card-title">Users</h4>
							<p class="card-category">All registered users</p>
							<form class="d-flex" action="getUser.do" method="POST">
								<input class="form-control me-2" name="keyword" type="search"
									placeholder="Search Users" aria-label="Search">
								<button class="btn btn-outline-light" type="submit">
									<i class="fa fa-search" aria-hidden="true"></i>
								</button>
							</form>
						</div>
						<div class="card-body ">
							<div class="table-full-width">
								<table class="table" id="container">
									<tbody>
										<c:choose>
											<c:when test="${! empty userList}">
												<c:forEach var="user" items="${userList}">
													<tr>
														<td>
															<div class="form-check">ID: ${user.id }</div>
														</td>
														<td>
															<table class="table mytable">
																<tr>
																	<td valign="top">

																		<form action="#" method="POST">
																			<input type="hidden" name="id" value="${user.id }">Name:
																			<button style="padding: 0px"
																				class="btn btn-link text-left" type="submit">${user.firstName}
																				${user.lastName}</button>
																		</form>Username: ${user.username }<br>Password:
																		${user.password }<br>Enabled: ${user.enabled } <br>Email:
																		${user.email}

																	</td>
																</tr>
																<tr>
																	<td class="test align-bottom" valign="bottom">

																		<form action="deactivateUser.do" method="POST">
																			<input type="hidden" name="id" value="${user.id}">
																			<button class="btn btn-outline-danger " type="submit"
																				name="action" value="Delete">
																				<i class="fa fa-trash" aria-hidden="true"></i>
																			</button>
																			&nbsp;&nbsp;
																			<button class="btn btn-outline-warning  "
																				type="submit" name="action" value="Deactivate">
																				<i class="fa fa-power-off" aria-hidden="true"></i>
																			</button>
																		</form>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</c:forEach>
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
					<div class="card ">
						<div class="card-header ">
							<h4 class="card-title">Listings</h4>
							<p class="card-category">All available listings</p>
							<form class="d-flex" action="getListing.do" method="POST">
								<input class="form-control me-2" name="keyword" type="search"
									placeholder="Search Listings" aria-label="Search">
								<button class="btn btn-outline-light" type="submit">
									<i class="fa fa-search" aria-hidden="true"></i>
								</button>
							</form>
						</div>
						<div class="card-body ">
							<div class="table-full-width">
								<table class="table" id="container">
									<tbody>
										<c:choose>
											<c:when test="${! empty listingList}">
												<c:forEach var="address" items="${listingList}">
													<tr>
														<td>
															<div class="form-check">
																<img src="${address.listing.listingPhotos.get(0)}"
																	height="300px" alt="image placeholder"
																	class="card-img-top">
															</div>
														</td>
														<td>
															<table class="table mytable">
																<tr>
																	<td valign="top">
																		<form action="listing.do" method="POST">
																			<input type="hidden" name="id"
																				value="${address.listing.id }">Address:<br>
																			<button style="padding: 0px"
																				class="btn btn-link text-left" type="submit">${address.street },
																				${address.city}, ${address.state}</button>
																		</form>Rating: ${address.listing.accuracyRating} <br>
																		Events: ${address.listing.events.size()} <br>

																	</td>
																</tr>
																<tr>
																	<td class="test align-bottom" valign="bottom">

																		<form action="editListing.do" method="POST">
																			<input type="hidden" name="id" value="${address.listing.id}" />
																			<input type="hidden" name="id" value="${user.id}">
																			<button class="btn btn-outline-danger " type="submit"
																				name="action" value="Delete">
																				<i class="fa fa-trash" aria-hidden="true"></i>
																			</button>
																			&nbsp;&nbsp;
																			<button class="btn btn-outline-warning  "
																				type="submit" name="action" value="Edit">
																				<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
																			</button>
																		</form>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</c:forEach>
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
			</div>
		</div>
	</div>
	<br>
	<br>
</body>
</html>