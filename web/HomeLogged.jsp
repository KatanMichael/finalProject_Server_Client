<%@ page import="com.hit.java.models.HibernateGymDAO" %>
<%@ page import="com.hit.java.models.User" %>
<%@ page import="com.hit.java.models.Activity" %>
<%@ page import="com.hit.java.models.Schedule" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html lang="en">
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Gym App Agency</title>
  <!-- <link rel="GymAppIcon" href="img/logos/logo_45K_icon.ico" type="image/x-icon" /> -->
  <link rel="icon" href="${pageContext.request.contextPath}/img/logos/logo.png">

  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.css" rel="stylesheet"/>

  <!-- Bootstrap Social core CSS -->
  <link href="${pageContext.request.contextPath}/vendor/bootstrap-social/bootstrap-social.css" rel="stylesheet" />
  <!-- <link href="vendor/bootstrap-social/assets/css/font-awesome.css" rel="stylesheet"> -->

  <!-- Custom fonts for this template -->
  <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/css/agency.css" rel="stylesheet">

  <!-- Custom styles for calender -->
  <link href='${pageContext.request.contextPath}/css/fullcalendar.css' rel='stylesheet' />
  <link href='${pageContext.request.contextPath}/css/fullcalendar.print.css' rel='stylesheet' media='print' />

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
          <a class="nav-link js-scroll-trigger" href="#chartsArea">See Progress</a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="#userArea">Hi, ${user.userName}</a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/controller/logout">Log Out</a>
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
          <a class="portfolio-link" data-toggle="modal" href="#portfolioModal1">
            <span class="fa-stack fa-4x">
              <i class="fas fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-map fa-stack-1x fa-inverse"></i>
            </span>
          </a>
        <!-- <a class="portfolio-link" data-toggle="modal" href="#portfolioModal1"> -->
        <h4 class="service-heading">Pilates</h4>
        <p class="text-muted">
          Train Like A Champ.
        </p>
      </div>
      <div class="col-md-4">
        <a class="portfolio-link" data-toggle="modal" href="#portfolioModal2">
            <span class="fa-stack fa-4x">
              <i class="fas fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-thumbs-up fa-stack-1x fa-inverse"></i>
            </span>
        </a>
        <h4 class="service-heading">KickBoxing</h4>
        <p class="text-muted">
          Train Like A Champ.
        </p>
      </div>
      <div class="col-md-4">
        <a class="portfolio-link" data-toggle="modal" href="#portfolioModal3">
            <span class="fa-stack fa-4x">
              <i class="fas fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-users fa-stack-1x fa-inverse"></i>
            </span>
        </a>
        <h4 class="service-heading">Zumba</h4>
        <p class="text-muted">
          Train Like A Champ.
        </p>
      </div>
    </div>

    <div class="row text-center">
      <div class="col-md-4">
        <a class="portfolio-link" data-toggle="modal" href="#portfolioModal4">
            <span class="fa-stack fa-4x">
              <i class="fas fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-cog fa-stack-1x fa-fw fa-inverse"></i>
            </span>
        </a>
        <h4 class="service-heading">Weight Training</h4>
        <p class="text-muted">
          Train Like A Champ.
        </p>
      </div>
      <div class="col-md-4">
        <a class="portfolio-link" data-toggle="modal" href="#portfolioModal5">
            <span class="fa-stack fa-4x">
              <i class="fas fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-fire fa-stack-1x fa-inverse"></i>
            </span>
        </a>
        <h4 class="service-heading">Burning Fat</h4>
        <p class="text-muted">
          Train Like A Champ.
        </p>
      </div>
      <div class="col-md-4">
        <a class="portfolio-link" data-toggle="modal" href="#portfolioModal6">
            <span class="fa-stack fa-4x">
              <i class="fas fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-bicycle fa-stack-1x fa-inverse"></i>
            </span>
        </a>
        <h4 class="service-heading">Spinning</h4>
        <p class="text-muted">
          Train Like A Champ.
        </p>
      </div>
    </div>


  </div>
  </div>
</section>

<!-- Portfolio Modals -->

<!-- Modal 1 -->
<div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl"></div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 mx-auto">
                        <div class="modal-body">
                            <!-- Project Details Go Here -->
                            <h2 class="text-uppercase">Pilates Class</h2>
                            <p class="item-intro text-muted">Sign up for Pilates ?

                              <div class="btn-group">
                                <button type="button" class="btn btn-outline-success dropdown-toggle"
                                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                 <i class="fas fa-check"></i>
                                 Add Classes
                                </button>

                                <div class="dropdown-menu">
                                  <!-- drop down add items here -->

                                  <form action="${pageContext.request.contextPath}/controller/activityAdd" method="post">
                                    <input class="form-control" name="activityID" type="hidden" value="1" aria-hidden="true"/>
                                    <button type="submit" class="dropdown-item">Sunday 8-10am</button>
                                  </form>

                                  <form action="${pageContext.request.contextPath}/controller/activityAdd" method="post">
                                        <input class="form-control" name="activityID" type="hidden" value="2" aria-hidden="true"/>
                                        <button type="submit" class="dropdown-item">Monday 9-10am</button>
                                  </form>

                                    <form action="${pageContext.request.contextPath}/controller/activityAdd" method="post">
                                        <input class="form-control" name="activityID" type="hidden" value="3" aria-hidden="true"/>
                                        <button type="submit" class="dropdown-item">Wednesday 10-11pm</button>
                                    </form>

                                    <form action="${pageContext.request.contextPath}/controller/activityAdd" method="post">
                                        <input class="form-control" name="activityID" type="hidden" value="4" aria-hidden="true"/>
                                        <button type="submit" class="dropdown-item">Friday 10-11am</button>
                                    </form>

                                    <form action="${pageContext.request.contextPath}/controller/activityAdd" method="post">
                                        <input class="form-control" name="activityID" type="hidden" value="5" aria-hidden="true"/>
                                        <button type="submit" class="dropdown-item">Saturday 12-1pm</button>
                                    </form>
                                </div>
                              </div>

                          <div class="btn-group">
                            <button type="button" class="btn btn-outline-secondary dropdown-toggle"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                              <i class="fas fa-minus"></i>
                              Remove Classes
                            </button>

                            <div class="dropdown-menu">
                              <!-- drop down delete items here -->

                              <form action="${pageContext.request.contextPath}/controller/activityRemove" method="post">
                                <input class="form-control" name="activityID" type="hidden" value="1" aria-hidden="true"/>
                                <button type="submit" class="dropdown-item">Sunday 8-10am</button>
                              </form>

                              <form action="${pageContext.request.contextPath}/controller/activityRemove" method="post">
                                <input class="form-control" name="activityID" type="hidden" value="2" aria-hidden="true"/>
                                <button type="submit" class="dropdown-item">Monday 9-10am</button>
                              </form>

                              <form action="${pageContext.request.contextPath}/controller/activityRemove" method="post">
                                <input class="form-control" name="activityID" type="hidden" value="3" aria-hidden="true"/>
                                <button type="submit" class="dropdown-item">Wednesday 10-11pm</button>
                              </form>

                              <form action="${pageContext.request.contextPath}/controller/activityRemove" method="post">
                                <input class="form-control" name="activityID" type="hidden" value="4" aria-hidden="true"/>
                                <button type="submit" class="dropdown-item">Friday 10-11am</button>
                              </form>

                              <form action="${pageContext.request.contextPath}/controller/activityRemove" method="post">
                                <input class="form-control" name="activityID" type="hidden" value="5" aria-hidden="true"/>
                                <button type="submit" class="dropdown-item">Saturday 12-1pm</button>
                              </form>

                            </div>
                          </div>

                                <button class="btn btn-outline-danger" data-dismiss="modal" type="button">
                                    <i class="fas fa-times"></i>
                                    Close</button>
                            </p>
                            <img class="img-fluid d-block mx-auto" src="${pageContext.request.contextPath}/img/portfolio/01-full.jpg" alt="">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal 2 -->
<div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="close-modal" data-dismiss="modal">
        <div class="lr">
          <div class="rl"></div>
        </div>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-lg-8 mx-auto">
            <div class="modal-body">
              <!-- Project Details Go Here -->
              <h2 class="text-uppercase">Kickboxing Class</h2>
              <p class="item-intro text-muted">Sign up for Kickboxing ?

              <div class="btn-group">
                <button type="button" class="btn btn-outline-success dropdown-toggle"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="fas fa-check"></i>
                  Add Classes
                </button>

                <div class="dropdown-menu">

                  <form action="${pageContext.request.contextPath}/controller/activityAdd" method="post">
                    <input class="form-control" name="activityID" type="hidden" value="6" aria-hidden="true"/>
                    <button type="submit" class="dropdown-item">Sunday 12-1pm</button>
                  </form>

                  <form action="${pageContext.request.contextPath}/controller/activityAdd" method="post">
                    <input class="form-control" name="activityID" type="hidden" value="7" aria-hidden="true"/>
                    <button type="submit" class="dropdown-item">Wednesday 10-12am</button>
                  </form>

                  <form action="${pageContext.request.contextPath}/controller/activityAdd" method="post">
                    <input class="form-control" name="activityID" type="hidden" value="8" aria-hidden="true"/>
                    <button type="submit" class="dropdown-item">Friday 7-9am</button>
                  </form>

                </div>
              </div>

              <div class="btn-group">
                <button type="button" class="btn btn-outline-secondary dropdown-toggle"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="fas fa-minus"></i>
                  Remove Classes
                </button>

                <div class="dropdown-menu">

                  <form action="${pageContext.request.contextPath}/controller/activityRemove" method="post">
                    <input class="form-control" name="activityID" type="hidden" value="6" aria-hidden="true"/>
                    <button type="submit" class="dropdown-item">Sunday 12-1pm</button>
                  </form>

                  <form action="${pageContext.request.contextPath}/controller/activityRemove" method="post">
                    <input class="form-control" name="activityID" type="hidden" value="7" aria-hidden="true"/>
                    <button type="submit" class="dropdown-item">Wednesday 10-12am</button>
                  </form>

                  <form action="${pageContext.request.contextPath}/controller/activityRemove" method="post">
                    <input class="form-control" name="activityID" type="hidden" value="8" aria-hidden="true"/>
                    <button type="submit" class="dropdown-item">Friday 7-9am</button>
                  </form>

                </div>
              </div>

              <button class="btn btn-outline-danger" data-dismiss="modal" type="button">
                <i class="fas fa-times"></i>
                Close</button>
              </p>

              <img class="img-fluid d-block mx-auto" src="${pageContext.request.contextPath}/img/portfolio/02-full.jpg" alt="">

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Modal 3 -->
<div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="close-modal" data-dismiss="modal">
        <div class="lr">
          <div class="rl"></div>
        </div>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-lg-8 mx-auto">
            <div class="modal-body">
              <!-- Project Details Go Here -->
              <h2 class="text-uppercase">Zumba Class</h2>
              <p class="item-intro text-muted">Sign up for Zumba ?

              <div class="btn-group">
                <button type="button" class="btn btn-outline-success dropdown-toggle"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="fas fa-check"></i>
                  Add Classes
                </button>

                <div class="dropdown-menu">

                  <form action="${pageContext.request.contextPath}/controller/activityAdd" method="post">
                    <input class="form-control" name="activityID" type="hidden" value="9" aria-hidden="true"/>
                    <button type="submit" class="dropdown-item">Sunday 8-10pm</button>
                  </form>

                  <form action="${pageContext.request.contextPath}/controller/activityAdd" method="post">
                    <input class="form-control" name="activityID" type="hidden" value="10" aria-hidden="true"/>
                    <button type="submit" class="dropdown-item">Monday 8-10pm</button>
                  </form>

                  <form action="${pageContext.request.contextPath}/controller/activityAdd" method="post">
                    <input class="form-control" name="activityID" type="hidden" value="11" aria-hidden="true"/>
                    <button type="submit" class="dropdown-item">Tuesday 12-2pm</button>
                  </form>

                  <form action="${pageContext.request.contextPath}/controller/activityAdd" method="post">
                    <input class="form-control" name="activityID" type="hidden" value="12" aria-hidden="true"/>
                    <button type="submit" class="dropdown-item">Thursday 11-1pm</button>
                  </form>

                  <form action="${pageContext.request.contextPath}/controller/activityAdd" method="post">
                    <input class="form-control" name="activityID" type="hidden" value="13" aria-hidden="true"/>
                    <button type="submit" class="dropdown-item">Friday 9-10am</button>
                  </form>
                </div>
              </div>

              <div class="btn-group">
                <button type="button" class="btn btn-outline-secondary dropdown-toggle"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="fas fa-minus"></i>
                  Remove Classes
                </button>

                <div class="dropdown-menu">

                  <form action="${pageContext.request.contextPath}/controller/activityRemove" method="post">
                    <input class="form-control" name="activityID" type="hidden" value="9" aria-hidden="true"/>
                    <button type="submit" class="dropdown-item">Sunday 8-10pm</button>
                  </form>

                  <form action="${pageContext.request.contextPath}/controller/activityRemove" method="post">
                    <input class="form-control" name="activityID" type="hidden" value="10" aria-hidden="true"/>
                    <button type="submit" class="dropdown-item">Monday 8-10pm</button>
                  </form>

                  <form action="${pageContext.request.contextPath}/controller/activityRemove" method="post">
                    <input class="form-control" name="activityID" type="hidden" value="11" aria-hidden="true"/>
                    <button type="submit" class="dropdown-item">Tuesday 12-2pm</button>
                  </form>

                  <form action="${pageContext.request.contextPath}/controller/activityRemove" method="post">
                    <input class="form-control" name="activityID" type="hidden" value="12" aria-hidden="true"/>
                    <button type="submit" class="dropdown-item">Thursday 11-1pm</button>
                  </form>

                  <form action="${pageContext.request.contextPath}/controller/activityRemove" method="post">
                    <input class="form-control" name="activityID" type="hidden" value="13" aria-hidden="true"/>
                    <button type="submit" class="dropdown-item">Friday 9-10am</button>
                  </form>
                </div>
              </div>

              <button class="btn btn-outline-danger" data-dismiss="modal" type="button">
                <i class="fas fa-times"></i>
                Close</button>
              </p>

              <img class="img-fluid d-block mx-auto" src="${pageContext.request.contextPath}/img/portfolio/03-full.jpg" alt="">

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Modal 4 -->
<div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="close-modal" data-dismiss="modal">
        <div class="lr">
          <div class="rl"></div>
        </div>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-lg-8 mx-auto">
            <div class="modal-body">
              <!-- Project Details Go Here -->
              <h2 class="text-uppercase">Weight Training Class</h2>
              <p class="item-intro text-muted">Sign up for Weight Training ?



              <div class="btn-group">
                <button type="button" class="btn btn-outline-success dropdown-toggle"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="fas fa-check"></i>
                  Add Classes
                </button>

              <div class="dropdown-menu">
                <form action="${pageContext.request.contextPath}/controller/activityAdd" method="post">
                  <input class="form-control" name="activityID" type="hidden" value="14" aria-hidden="true"/>
                  <button type="submit" class="dropdown-item">Monday 11-1pm</button>
                </form>

                <form action="${pageContext.request.contextPath}/controller/activityAdd" method="post">
                  <input class="form-control" name="activityID" type="hidden" value="15" aria-hidden="true"/>
                  <button type="submit" class="dropdown-item">Thursday 8-9am</button>
                </form>

                <form action="${pageContext.request.contextPath}/controller/activityAdd" method="post">
                  <input class="form-control" name="activityID" type="hidden" value="16" aria-hidden="true"/>
                  <button type="submit" class="dropdown-item">Thursday 9-10pm</button>
                </form>

                <form action="${pageContext.request.contextPath}/controller/activityAdd" method="post">
                  <input class="form-control" name="activityID" type="hidden" value="17" aria-hidden="true"/>
                  <button type="submit" class="dropdown-item">Friday 1-2pm</button>
                </form>
              </div>
            </div>

              <div class="btn-group">
                <button type="button" class="btn btn-outline-secondary dropdown-toggle"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="fas fa-minus"></i>
                  Remove Classes
                </button>

                <div class="dropdown-menu">
                  <form action="${pageContext.request.contextPath}/controller/activityRemove" method="post">
                    <input class="form-control" name="activityID" type="hidden" value="14" aria-hidden="true"/>
                    <button type="submit" class="dropdown-item">Monday 11-1pm</button>
                  </form>

                  <form action="${pageContext.request.contextPath}/controller/activityRemove" method="post">
                    <input class="form-control" name="activityID" type="hidden" value="15" aria-hidden="true"/>
                    <button type="submit" class="dropdown-item">Thursday 8-9am</button>
                  </form>

                  <form action="${pageContext.request.contextPath}/controller/activityRemove" method="post">
                    <input class="form-control" name="activityID" type="hidden" value="16" aria-hidden="true"/>
                    <button type="submit" class="dropdown-item">Thursday 9-10pm</button>
                  </form>

                  <form action="${pageContext.request.contextPath}/controller/activityRemove" method="post">
                    <input class="form-control" name="activityID" type="hidden" value="17" aria-hidden="true"/>
                    <button type="submit" class="dropdown-item">Friday 1-2pm</button>
                  </form>
                </div>
              </div>

              <button class="btn btn-outline-danger" data-dismiss="modal" type="button">
                <i class="fas fa-times"></i>
                Close</button>
            </div>
              </p>
              <img class="img-fluid d-block mx-auto" src="${pageContext.request.contextPath}/img/portfolio/04-full.jpg" alt="">
            </div>
          </div>
      </div>
      </div>
    </div>
</div>

<!-- Modal 5 -->
<div class="portfolio-modal modal fade" id="portfolioModal5" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="close-modal" data-dismiss="modal">
        <div class="lr">
          <div class="rl"></div>
        </div>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-lg-8 mx-auto">
            <div class="modal-body">
              <!-- Project Details Go Here -->
              <h2 class="text-uppercase">Burnning Fat Class</h2>
              <p class="item-intro text-muted">Sign up for Burnning Fat ?

              <div class="btn-group">
                <button type="button" class="btn btn-outline-success dropdown-toggle"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="fas fa-check"></i>
                  Add Classes
                </button>

                <div class="dropdown-menu">

                  <form action="${pageContext.request.contextPath}/controller/activityAdd" method="post">
                    <input class="form-control" name="activityID" type="hidden" value="18" aria-hidden="true"/>
                    <button type="submit" class="dropdown-item">Tuesday 8-10am</button>
                  </form>

                  <form action="${pageContext.request.contextPath}/controller/activityAdd" method="post">
                    <input class="form-control" name="activityID" type="hidden" value="19" aria-hidden="true"/>
                    <button type="submit" class="dropdown-item">Thursday 8-9pm</button>
                  </form>

                  <form action="${pageContext.request.contextPath}/controller/activityAdd" method="post">
                    <input class="form-control" name="activityID" type="hidden" value="20" aria-hidden="true"/>
                    <button type="submit" class="dropdown-item">Friday 12-1pm</button>
                  </form>

                </div>
              </div>

              <div class="btn-group">
                <button type="button" class="btn btn-outline-secondary dropdown-toggle"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="fas fa-minus"></i>
                  Remove Classes
                </button>

                <div class="dropdown-menu">

                  <form action="${pageContext.request.contextPath}/controller/activityRemove" method="post">
                    <input class="form-control" name="activityID" type="hidden" value="18" aria-hidden="true"/>
                    <button type="submit" class="dropdown-item">Tuesday 8-10am</button>
                  </form>

                  <form action="${pageContext.request.contextPath}/controller/activityRemove" method="post">
                    <input class="form-control" name="activityID" type="hidden" value="19" aria-hidden="true"/>
                    <button type="submit" class="dropdown-item">Thursday 8-9pm</button>
                  </form>

                  <form action="${pageContext.request.contextPath}/controller/activityRemove" method="post">
                    <input class="form-control" name="activityID" type="hidden" value="20" aria-hidden="true"/>
                    <button type="submit" class="dropdown-item">Friday 12-1pm</button>
                  </form>

                </div>
              </div>

              <button class="btn btn-outline-danger" data-dismiss="modal" type="button">
                <i class="fas fa-times"></i>
                Close</button>
              </p>

              <img class="img-fluid d-block mx-auto" src="${pageContext.request.contextPath}/img/portfolio/05-full.jpg" alt="">
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Modal 6 -->
<div class="portfolio-modal modal fade" id="portfolioModal6" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="close-modal" data-dismiss="modal">
        <div class="lr">
          <div class="rl"></div>
        </div>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-lg-8 mx-auto">
            <div class="modal-body">
              <!-- Activity Details Go Here -->
              <h2 class="text-uppercase">Spinning Class</h2>

              <p class="item-intro text-muted">Sign up for Spinning ?

              <div class="btn-group">
                <button type="button" class="btn btn-outline-success dropdown-toggle"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="fas fa-check"></i>
                  Add Classes
                </button>

                <div class="dropdown-menu">

                  <form action="${pageContext.request.contextPath}/controller/activityAdd" method="post">
                    <input class="form-control" name="activityID" type="hidden" value="21" aria-hidden="true"/>
                    <button type="submit" class="dropdown-item">Tuesday 8-10pm</button>
                  </form>

                  <form action="${pageContext.request.contextPath}/controller/activityAdd" method="post">
                    <input class="form-control" name="activityID" type="hidden" value="22" aria-hidden="true"/>
                    <button type="submit" class="dropdown-item">Wednesday 4-6pm</button>
                  </form>

                  <form action="${pageContext.request.contextPath}/controller/activityAdd" method="post">
                    <input class="form-control" name="activityID" type="hidden" value="23" aria-hidden="true"/>
                    <button type="submit" class="dropdown-item">Friday 11-12am</button>
                  </form>

                  <form action="${pageContext.request.contextPath}/controller/activityAdd" method="post">
                    <input class="form-control" name="activityID" type="hidden" value="24" aria-hidden="true"/>
                    <button type="submit" class="dropdown-item">Saturday 5-7pm</button>
                  </form>

                </div>
              </div>

              <div class="btn-group">
                <button type="button" class="btn btn-outline-secondary dropdown-toggle"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="fas fa-minus"></i>
                  Remove Classes
                </button>

                <div class="dropdown-menu">

                  <form action="${pageContext.request.contextPath}/controller/activityRemove" method="post">
                    <input class="form-control" name="activityID" type="hidden" value="21" aria-hidden="true"/>
                    <button type="submit" class="dropdown-item">Tuesday 8-10pm</button>
                  </form>

                  <form action="${pageContext.request.contextPath}/controller/activityRemove" method="post">
                    <input class="form-control" name="activityID" type="hidden" value="22" aria-hidden="true"/>
                    <button type="submit" class="dropdown-item">Wednesday 4-6pm</button>
                  </form>

                  <form action="${pageContext.request.contextPath}/controller/activityRemove" method="post">
                    <input class="form-control" name="activityID" type="hidden" value="23" aria-hidden="true"/>
                    <button type="submit" class="dropdown-item">Friday 11-12am</button>
                  </form>

                  <form action="${pageContext.request.contextPath}/controller/activityRemove" method="post">
                    <input class="form-control" name="activityID" type="hidden" value="24" aria-hidden="true"/>
                    <button type="submit" class="dropdown-item">Saturday 5-7pm</button>
                  </form>

                </div>
              </div>


              <button class="btn btn-outline-danger" data-dismiss="modal" type="button">
                <i class="fas fa-times"></i>
                Close</button>
              </p>

              <img class="img-fluid d-block mx-auto" src="${pageContext.request.contextPath}/img/portfolio/06-full.png" alt="">

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>



<!-- Calendar Grid, doesn't work now -->
<section class="bg-light" id="portfolioCalendar">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
        <h2 class="section-heading text-uppercase">Gym Weekly calendar</h2>
        <h3 class="section-subheading text-muted"> See our classes on a timeline </h3>
      </div>
    </div>

    <div class="row">
      <div class="embed-responsive embed-responsive-1by1">
        <iframe class="embed-responsive-item" src="${pageContext.request.contextPath}/calender.jsp"></iframe>
      </div>
    </div>

  </div>
</section>

<!-- chartsArea -->
<section class="bg-light" id="chartsArea">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
        <h2 class="section-heading text-uppercase">See Your Progress</h2>
        <h3 class="section-subheading text-muted">via charts </h3>
        <button type="button" class="btn btn-dark" onclick="loadChartsAgain()">Load Charts</button>
      </div>
    </div>

    <div id="canvas-holder">
      <canvas id="chart-area"></canvas>
    </div>
      <br/><br/>
    <div id="container">
       <canvas id="canvas"></canvas>
    </div>

  </div>
</section>

<!-- Logos -->
<section class="py-5">
  <div class="container">
    <div class="row">
      <div class="col-md-3 col-sm-6">
        <a href="#">
          <img class="img-fluid d-block mx-auto" src="${pageContext.request.contextPath}/img/logos/Hit_logo.jpg" alt="">
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
          <input class="form-control" id="name" name="loginUserName" type="hidden" placeholder="Username" value="${user.userName}">
          <p class="help-block text-danger"></p>
        </div>
        <div class="form-group">
          <input class="form-control" id="set_height" name="height" type="text" placeholder="Current Height: ${user.height}" required="required" data-validation-required-message="Please enter your height.">
          <p class="help-block text-danger"></p>
        </div>
        <div class="form-group">
          <!--<input type="text" name="weight" placeholder="weight" required> -->
          <input class="form-control" id="set_weight" name="weight" type="text" placeholder="Current Weight: ${user.weight}" required="required" data-validation-required-message="Please enter your weight.">
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
<script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Plugin JavaScript -->
<script src="${pageContext.request.contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Contact form JavaScript -->
<script src="${pageContext.request.contextPath}/js/jqBootstrapValidation.js"></script>
<script src="${pageContext.request.contextPath}/js/contact_me.js"></script>

<!-- Custom scripts for this template -->
<script src="${pageContext.request.contextPath}/js/agency.min.js"></script>

<!-- Custom Scripts for calender -->
<script src='${pageContext.request.contextPath}/js/calendar/moment.js'></script>
<script src='${pageContext.request.contextPath}/js/calendar/fullcalendar.js'></script>

<!-- Charts Scripts -->
<script src="${pageContext.request.contextPath}/js/charts/Chart.bundle.js"></script>
<script src="${pageContext.request.contextPath}/js/charts/utils.js"></script>

<script>
    //pie-chart
   var calc = function(z) {
      var sum=0;
      var y=0;
      var x=0;

     <%ArrayList<Schedule> currentUserSchedules = (ArrayList<Schedule>)request.getAttribute("userSchedules2");
     for(Schedule s:currentUserSchedules){%>
      y = <%=s.getActivityId()%>;
      if (y == z) {
        x = <%=s.getCalories()%>;
        sum = sum + x;
      }
      <%}%>
      return sum;
    };

  var chartColors = window.chartColors;
  var color = Chart.helpers.color;
  var config = {
    data: {
      datasets: [{
        data: [
          calc(1),
          calc(2),
          calc(3),
          calc(4),
          calc(5),
          calc(6),
        ],
        backgroundColor: [
          color(chartColors.red).alpha(0.5).rgbString(),
          color(chartColors.blue).alpha(0.9).rgbString(),
          color(chartColors.orange).alpha(0.5).rgbString(),
          color(chartColors.green).alpha(0.5).rgbString(),
          color(chartColors.purple).alpha(0.5).rgbString(),
          color(chartColors.pink).alpha(0.5).rgbString(),
        ],
        label: 'My dataset' // for legend
      }],
      labels: [
        'Pilates',
        'Kickbox',
        'Zumba',
        'Weight Training',
        'Burning Fat',
        'Spinning',
      ]
    },
    options: {
      responsive: true,
      legend: {
        position: 'right',
      },
      title: {
        display: true,
        text: 'Burning Calories by each class'
      },
      scale: {
        ticks: {
          beginAtZero: true
        },
        reverse: false
      },
      animation: {
        animateRotate: false,
        animateScale: true
      }
    }
  };

  //bar chart info
  var calcDaysGym = function(d,t) {
      var sum2=0;
      var y2;
      var temp=0;

      <%ArrayList<Schedule> currentUserSchedules2 = (ArrayList<Schedule>)request.getAttribute("userSchedules2");
      for(Schedule s:currentUserSchedules2){%>
      y2 = <%=s.getDay()%>;
      temp = <%=s.getEnd()%>;
      if (y2 == d) {
        if(t==1)
        {
          if(temp<=12)
          {
            sum2++;
          }
        }
        else if(t==2)
        {
          if(temp>12)
          {
            sum2++;
          }
        }

      }
      <%}%>
      return sum2;
    };

  var DAYS = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
  var color2 = Chart.helpers.color;
  var barChartData = {
      labels: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
      datasets: [{
          label: 'Morning Classes',
          backgroundColor: color2(window.chartColors.red).alpha(0.5).rgbString(),
          borderColor: window.chartColors.red,
          borderWidth: 1,
          data: [
            calcDaysGym(1,1),
            calcDaysGym(2,1),
            calcDaysGym(3,1),
            calcDaysGym(4,1),
            calcDaysGym(5,1),
            calcDaysGym(6,1),
            calcDaysGym(7,1)
          ]
      }, {
          label: 'Night Classes',
          backgroundColor: color2(window.chartColors.blue).alpha(0.5).rgbString(),
          borderColor: window.chartColors.blue,
          borderWidth: 1,
          data: [
            calcDaysGym(1,2),
            calcDaysGym(2,2),
            calcDaysGym(3,2),
            calcDaysGym(4,2),
            calcDaysGym(5,2),
            calcDaysGym(6,2),
            calcDaysGym(7,2)
          ]
      }]

  };

  //mixed on load
  window.onload = function()
  {
      //pie chart
    var ctx = document.getElementById('chart-area');
    window.myPolarArea = Chart.PolarArea(ctx, config);

    //bar chart
      var ctx2 = document.getElementById('canvas').getContext('2d');
      window.myBar = new Chart(ctx2, {
          type: 'bar',
          data: barChartData,
          options: {
              responsive: true,
              legend: {
                  position: 'top',
              },
              title: {
                  display: true,
                  text: 'Your fav time of the day for the gym'
              }
          }
      });
  };

    function loadChartsAgain()
    {
        //pie chart
        var ctx = document.getElementById('chart-area');
        window.myPolarArea = Chart.PolarArea(ctx, config);

        //bar chart
        var ctx2 = document.getElementById('canvas').getContext('2d');
        window.myBar = new Chart(ctx2, {
            type: 'bar',
            data: barChartData,
            options: {
                responsive: true,
                legend: {
                    position: 'top',
                },
                title: {
                    display: true,
                    text: 'Your fav time of the day for the gym'
                }
            }
        });
    }
</script>

</body>

</html>
