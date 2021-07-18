<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">

  <!-- BOOTSTRAP -->
  <link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/sign-in/">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@forevolve/bootstrap-dark@1.1.0/dist/css/bootstrap-dark.min.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
  <!-- END BOOTSTRAP -->

  <!-- JAVASCRIPT -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  <!-- END JAVASCRIPT -->

  <!-- CSS -->
  <link rel="stylesheet" href="style.css" />
  <!-- END CSS -->

  <title>House Report</title>

  <link rel="canonical" />

<body>

  <header>

    <!-- Navbar -->
<!--     <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <div class="container-fluid">
      <br> <img src="images/logo1.png" width="250"
					alt="House Report Logo"> -->
        <a class="navbar-brand" href="#">House Report</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarColor02">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a href=home.do>Home
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">View Listings</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Add a Listing</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">About</a>
            </li>
          </ul>
          <form class="d-flex">
            <input class="form-control me-sm- " type="text" placeholder="Search">
            <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
          </form>
        </div>
      </div>
    </nav>
  </header>
  <!-- End Navbar -->

  <!-- Carousel -->
  <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img class="d-block" src="badhouse1.jpeg" alt="First slide">
      </div>
      <div class="carousel-item">
        <img class="d-block" src="badhouse2.jpeg" alt="Second slide">
      </div>
      <div class="carousel-item">
        <img class="d-block" src="badhouse3.jpeg" alt="Third slide">
      </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
  <!-- End Carousel-->

  <!-- Info Card -->
  <div class="card text-center">
    <div class="card-header">
      Home Details
    </div>
    <div class="card-body">
      <h5 class="card-title">Header</h5>
      <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
      <br>

      <!-- Comment Box -->
      <section>
        <div class="overflow-auto p-3 mb-3 mb-md-0 mr-md-3 bg-dark" style="max-width: auto; max-height: 250px;">
          <div class="container">
            <div class="row">
              <div class="col-sm-5 col-md-6 col-12 pb-4">
                <h1>Comments</h1>
                <div class="comment mt-4 text-justify"> <img src="https://i.imgur.com/yTFUilP.jpg" alt="" class="rounded-circle" width="40" height="40">
                  <h4>John Doe</h4> <span>- 18 July, 2021</span> <br>
                  <p>This house is haunted, yo! Do not buy!</p>
                </div>
                <div class="text-justify darker mt-4 float-right"> <img src="https://i.imgur.com/CFpa3nK.jpg" alt="" class="rounded-circle" width="40" height="40">
                  <h4>Rob Simpson</h4> <span>- 18 July, 2021</span> <br>
                  <p>Thanks for the heads up, John. I HATE ghosts.</p>
                </div>
              </div>

            </div>
          </div>
        </div>
      </section>

      <form>
        <div class="form-group">
          <label for="exampleFormControlTextarea1">Enter Comment Here</label>
          <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
        </div>

        <!-- Like/Dislike -->
        <button class="dislike">
          <i class="fa fa-thumbs-o-down" aria-hidden="true"></i>
        </button>

        <button class="like">
          <i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
        </button>
        <br>
        <br>
        <!-- End Like/Dislike -->


      </form>
      <!-- End Comment Box -->

      <a href="#" class="btn btn-primary">Submit Comment</a>
      <br>
      <br>
      <a href="#" class="btn btn-primary">Home</a>
    </div>
    <div class="card-footer text-muted">
      2 days ago
    </div>
  </div>
  <!-- End Info Card -->


</body>

