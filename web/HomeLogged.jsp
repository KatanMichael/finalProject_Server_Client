<%@ page import="com.hit.java.models.HibernateGymDAO" %>
<%@ page import="com.hit.java.models.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  final String userName = request.getParameter("userName");
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Gym App Agency</title>
  <!-- <link rel="GymAppIcon" href="img/logos/logo_45K_icon.ico" type="image/x-icon" /> -->
  <link rel="icon" href="img/logos/logo.png">

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet"/>

  <!-- Bootstrap Social core CSS -->
  <link href="vendor/bootstrap-social/bootstrap-social.css" rel="stylesheet" />
  <!-- <link href="vendor/bootstrap-social/assets/css/font-awesome.css" rel="stylesheet"> -->

  <!-- Custom fonts for this template -->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

  <!-- Custom styles for this template -->
  <link href="css/agency.css" rel="stylesheet">

  <!-- Custom styles for calender -->
  <link href='css/fullcalendar.css' rel='stylesheet' />
  <link href='css/fullcalendar.print.css' rel='stylesheet' media='print' />

</head>

<body id="page-top">

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
  <div class="container">
    <a class="navbar-brand js-scroll-trigger" href="#page-top">Gym_App</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      Menu
      <i class="fas fa-bars"></i>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav text-uppercase ml-auto">
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="#services">Services</a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="#portfolioCalendar">Weekly Calendar</a>
        </li>
        <!--
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="#about">About</a>
        </li> -->
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="#team">Team</a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="#userArea">Hi, <%=userName%></a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Header -->
<header class="masthead">
  <div class="container">
    <div class="intro-text">
      <div class="intro-lead-in">Welcome To Our Gym!</div>
      <div class="intro-heading text-uppercase">It's Nice To See You Again</div>
      <a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" href="#services">Register to classes</a>
    </div>
  </div>
</header>

<!-- Services -->
<section id="services">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
        <h2 class="section-heading text-uppercase">Services</h2>
        <h3 class="section-subheading text-muted">Sign up to classes we have here at GymApp</h3>
      </div>
    </div>
    <div class="row text-center">
      <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <i class="fas fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-map fa-stack-1x fa-inverse"></i>
            </span>
        <h4 class="service-heading">Pilates</h4>
        <p class="text-muted">
          Train Like A Champ.
        </p>
      </div>
      <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <i class="fas fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-thumbs-up fa-stack-1x fa-inverse"></i>
            </span>
        <h4 class="service-heading">KickBoxing</h4>
        <p class="text-muted">
          Train Like A Champ.
        </p>
      </div>
      <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <i class="fas fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-users fa-stack-1x fa-inverse"></i>
            </span>
        <h4 class="service-heading">Zumba</h4>
        <p class="text-muted">
          Train Like A Champ.
        </p>
      </div>
    </div>

    <div class="row text-center">
      <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <i class="fas fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-cog fa-stack-1x fa-fw fa-inverse"></i>
            </span>
        <h4 class="service-heading">Weight Training</h4>
        <p class="text-muted">
          Train Like A Champ.
        </p>
      </div>
      <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <i class="fas fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-fire fa-stack-1x fa-inverse"></i>
            </span>
        <h4 class="service-heading">Burning Fat</h4>
        <p class="text-muted">
          Train Like A Champ.
        </p>
      </div>
      <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <i class="fas fa-circle fa-stack-2x text-primary"></i>
              <!-- <i class="fas fa-lock fa-stack-1x fa-inverse"></i> -->
              <!-- <i class="fa fa-cog fa-spin fa-1x fa-fw fa-inverse"></i> -->
              <i class="fa fa-bicycle fa-stack-1x fa-inverse"></i>
            </span>
        <h4 class="service-heading">Spinning</h4>
        <p class="text-muted">
          Train Like A Champ.
        </p>
      </div>
    </div>


  </div>
  </div>
</section>

<!-- Calendar Grid -->
<section class="bg-light" id="portfolioCalendar">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
        <h2 class="section-heading text-uppercase">Your Weekly calendar</h2>
        <h3 class="section-subheading text-muted"> See your classes on a timeline </h3>
      </div>
    </div>

    <div class="row">
      <div id="calendar"></div>
    </div>

  </div>
</section>

<!-- Team -->
<section class="bg-light" id="team">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
        <h2 class="section-heading text-uppercase">Our Amazing Team</h2>
        <h3 class="section-subheading text-muted">Code With The Best</h3>
      </div>
    </div>
    <div class="row">
      <div class="col-sm-4">
        <div class="team-member">
          <img class="mx-auto rounded-circle" src="img/team/1.jpg" alt="">
          <h4>Shani Geva</h4>
          <p class="text-muted">Lead Designer</p>
          <ul class="list-inline social-buttons">
            <li class="list-inline-item">
              <a href="#">
                <i class="fab fa-twitter"></i>
              </a>
            </li>
            <li class="list-inline-item">
              <a href="#">
                <i class="fab fa-facebook-f"></i>
              </a>
            </li>
            <li class="list-inline-item">
              <a href="#">
                <i class="fab fa-linkedin-in"></i>
              </a>
            </li>
          </ul>
        </div>
      </div>
      <div class="col-sm-4">
        <div class="team-member">
          <img class="mx-auto rounded-circle" src="img/team/2.jpg" alt="">
          <h4>Daniel Yadlin</h4>
          <p class="text-muted">Lead Manager</p>
          <ul class="list-inline social-buttons">
            <li class="list-inline-item">
              <a href="#">
                <i class="fab fa-twitter"></i>
              </a>
            </li>
            <li class="list-inline-item">
              <a href="#">
                <i class="fab fa-facebook-f"></i>
              </a>
            </li>
            <li class="list-inline-item">
              <a href="#">
                <i class="fab fa-linkedin-in"></i>
              </a>
            </li>
          </ul>
        </div>
      </div>
      <div class="col-sm-4">
        <div class="team-member">
          <img class="mx-auto rounded-circle" src="img/team/3.jpg" alt="">
          <h4>Michael Katan</h4>
          <p class="text-muted">Lead Developer</p>
          <ul class="list-inline social-buttons">
            <li class="list-inline-item">
              <a href="#">
                <i class="fab fa-twitter"></i>
              </a>
            </li>
            <li class="list-inline-item">
              <a href="#">
                <i class="fab fa-facebook-f"></i>
              </a>
            </li>
            <li class="list-inline-item">
              <a href="#">
                <i class="fab fa-linkedin-in"></i>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-8 mx-auto text-center">
        <p class="large text-muted">
          Hit Mobile Class 2018-19
        </p>
      </div>
    </div>
  </div>
</section>

<!-- Logos -->
<section class="py-5">
  <div class="container">
    <div class="row">
      <div class="col-md-3 col-sm-6">
        <a href="#">
          <img class="img-fluid d-block mx-auto" src="img/logos/Hit_logo.jpg" alt="">
        </a>
      </div>
    </div>
  </div>
</section>

<!-- Personal Profile Here-->
<section id="userArea">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
        <h2 class="section-heading text-uppercase">Your Own Personal Profile</h2>
      </div>
    </div>

    <form id="infoUpdateForm" name="" novalidate="novalidate" action="${pageContext.request.contextPath}/controller/personalProfile" method="post">

      <div class="col-md-6" id="modalLoginForm" role="dialog" aria-labelledby="signInModalLabel" aria-hidden="false">
        <div class="form-group">
          <input class="form-control" id="name" name="loginUserName" type="text" placeholder="Username" required="required" data-validation-required-message="Please enter your name.">
          <p class="help-block text-danger"></p>
        </div>
        <div class="form-group">
          <input class="form-control" id="set_height" name="height" type="text" placeholder="Insert Height" required="required" data-validation-required-message="Please enter your height.">
          <p class="help-block text-danger"></p>
        </div>
        <div class="form-group">
          <!--<input type="text" name="weight" placeholder="weight" required> -->
          <input class="form-control" id="set_weight" name="weight" type="text" placeholder="Insert Weight" required="required" data-validation-required-message="Please enter your weight.">
          <p class="help-block text-danger"></p>
        </div>
      </div>

      <div class="clearfix"></div>
      <div class="col-lg-12 text-center">
        <div id="success"></div>
        <button id="updateButton" class="btn btn-primary btn-xl text-uppercase" type="submit">Update Info</button>
      </div>
    </form>

  </div>
</section>


<!-- Footer -->
<footer>
  <div class="container">
    <div class="row">
      <div class="col-md-4">
        <span class="copyright">Copyright &copy; Gym-App 2018-19</span>
      </div>
      <div class="col-md-4">
        <ul class="list-inline social-buttons">
          <li class="list-inline-item">
            <a href="#">
              <i class="fab fa-twitter"></i>
            </a>
          </li>
          <li class="list-inline-item">
            <a href="#">
              <i class="fab fa-facebook-f"></i>
            </a>
          </li>
          <li class="list-inline-item">
            <a href="#">
              <i class="fab fa-linkedin-in"></i>
            </a>
          </li>
        </ul>
      </div>
      <div class="col-md-4">
        <ul class="list-inline quicklinks">
          <li class="list-inline-item">
            <a href="#">Privacy Policy</a>
          </li>
          <li class="list-inline-item">
            <a href="#">Terms of Use</a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</footer>

<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Plugin JavaScript -->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Contact form JavaScript -->
<script src="js/jqBootstrapValidation.js"></script>
<script src="js/contact_me.js"></script>

<!-- Custom scripts for this template -->
<script src="js/agency.min.js"></script>

<!-- Custom Scripts for calender -->
<script src='js/calendar/moment.js'></script>
<script src='js/calendar/fullcalendar.js'></script>

<script>

  $(document).ready(function() {

    $('#calendar').fullCalendar({
      header: {
        left: ' ',
        center: 'title',
        right: 'agendaWeek'
      },
      defaultDate: '2019-03-10',
      navLinks: true, // can click day/week names to navigate views
      editable: false,
      eventLimit: true, // allow "more" link when too many events
      events: [
        {
          id: 999,
          title: 'Class1',
          start: '2019-03-10T16:00:00'
        },
        {
          id: 999,
          title: 'Class2',
          start: '2019-03-11T09:00:00'
        },
        {
          id: 999,
          title: 'Class3',
          start: '2019-03-12T10:00:00'
        },
        {
          id: 999,
          title: 'Class4',
          start: '2019-03-13T08:00:00'
        }

      ]
    });

  });

</script>

</body>

</html>
