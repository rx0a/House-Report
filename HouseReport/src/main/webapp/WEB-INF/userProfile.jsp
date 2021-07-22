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
	<main>
		<!--     <div class="wrapper"> -->
		<div class="main-panel" style="padding-top:80px">
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
									<button class="btn btn-outline-warning pull-right"
										type="submit" name="action" value="Edit">
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
									<h1>&nbsp;&nbsp;&nbsp;&nbsp;Welcome to your dashboard,
										${user.firstName }.</h1>
									<br>
									<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Here
										you can view and edit your listings, favorites, comments and
										profile information.</h5>
								</c:when>

							</c:choose>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="card ">
							<div class="card-header ">
								<h4 class="card-title">Listings</h4>
								<p class="card-category">All listings created by you</p>
							</div>
							<div class="card-body ">
								<div class="table-full-width">
									<table class="table" id="container">
										<tbody>
											<c:choose>
												<c:when test="${! empty user.listings}">
													<c:forEach var="listing" items="${user.listings}">
														<tr>
															<td>
																<div class="form-check">
																	<img src="${listing.listingPhotos.get(0)}"
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
																					value="${listing.id }">Address:<br>
																				<button style="padding: 0px"
																					class="btn btn-link text-left" type="submit">${listing.address.street },
																					${listing.address.city}, ${listing.address.state}</button>
																			</form>Rating: ${listing.accuracyRating} <br> Events:
																			${listing.events.size()} <br> Created:
																			${listing.getCreatedOn().getYear()}<br>

																		</td>
																	</tr>
																	<tr>
																		<td class="test align-bottom" valign="bottom">

																			<form action="modifyListing.do" method="POST">
																				<input type="hidden" name="id" value="${listing.id}" />
																				<input type="hidden" name="id" value="${user.id}">
																				<button class="btn btn-outline-danger "
																					type="submit" name="action" value="Delete">
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
					<div class="col-md-6">
						<div class="card ">
							<div class="card-header ">
								<h4 class="card-title">Favorites</h4>
								<p class="card-category">Your favorite listings</p>
							</div>
							<div class="card-body ">
								<div class="table-full-width">
									<table class="table" id="container">
										<tbody>
											<c:choose>
												<c:when test="${! empty user.favorites}">
													<c:forEach var="favorite" items="${user.favorites}">
														<tr>
															<td>
																<div class="form-check">
																	<img src="${favorite.listingPhotos.get(0)}"
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
																					value="${favorite.id }">Address:<br>
																				<button style="padding: 0px"
																					class="btn btn-link text-left" type="submit">${favorite.address.street },
																					${favorite.address.city}, ${favorite.address.state}</button>
																			</form>Rating: ${favorite.accuracyRating} <br> Events:
																			${favorite.events.size()} <br>

																		</td>
																	</tr>
																	<tr>
																		<td class="test align-bottom" valign="bottom">

																			<form action="deleteFromFavorites.do" method="POST">
																				<input type="hidden" name="favoriteID"
																					value="${favorite.id}" /> <input type="hidden"
																					name="userID" value="${user.id}">
																				<button class="btn btn-outline-danger "
																					type="submit" name="action" value="Delete">
																					<i class="fa fa-trash" aria-hidden="true"></i>
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
				<div class="row">
					<div class="col-md-6 test2">
						<div class="card  card-tasks">
							<div class="card-header ">
								<h4 class="card-title">Comments</h4>
								<p class="card-category">All comments made by you</p>
							</div>
							<div class="card-body ">
								<div class="table-full-width">
									<table class="table">
										<tbody>
											<c:choose>
												<c:when test="${! empty user.comments}">
													<c:forEach var="comment" items="${user.comments}">
														<tr>
															<td class="commentdate">
																<div class="form-check">
																	<p>${comment.commentDate.getMonth()},
																		${comment.commentDate.getDayOfMonth()}</p>
																	<p>${comment.commentDate.getYear() }</p>
																</div>
															</td>
															<td>
																<form action="listing.do" method="POST">
																	<input type="hidden" name="id" value="${listing.id }">
																	<button style="padding: 0px"
																		class="btn btn-link text-left" type="submit">${comment.listing.address.street },
																		${comment.listing.address.city},
																		${comment.listing.address.state}</button>
																</form> <c:choose>
																	<c:when test="${!empty editComment}">
																		<form action="accountEditedComment.do" method="POST">
																			<input type="hidden" name="id" value="${comment.id }">
																			<textarea class="form-control z-depth-1 bg-dark text-light"rows="2"name="commentText">${comment.comment } </textarea>
																				<br>
																				<input class="btn btn-primary bg-dark pull-right"
																				type="submit" value="Submit" />
																		</form>
																	</c:when>
																	<c:otherwise>
																		<p>"${comment.comment}"</p>
																	</c:otherwise>
																</c:choose>
															</td>
															<td class="td-actions text-right">
																<form action="deleteComment.do" method="POST">
																	<input type="hidden" name="id" value="${comment.id}" />
																	<button class="btn btn-outline-danger" type="submit"
																		name="action" value="Delete">
																		<i class="fa fa-trash" aria-hidden="true"></i>
																	</button>
																	</form>
																	&nbsp;&nbsp;
																	<form action="editComment.do" method="POST">
																	<input type="hidden" name="id" value="${comment.id}" />
																	<button class="btn btn-outline-warning" type="submit"
																		name="action" value="Edit">
																		<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
																	</button>
																</form>
															</td>
														</tr>
													</c:forEach>
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
		<br> <br>
	</main>
</body>
</html>