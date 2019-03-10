<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 13/01/2019
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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

<head>

</head>
<body>

<div id="calendar"></div>

</body>

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
                    id: 111,
                    title: 'blah01',
                    start: '2019-03-10T16:00:00'
                },
                {
                    id: 999,
                    title: 'Class2',
                    start: '2019-03-11T09:00:00'
                },
                {
                    id: 888,
                    title: 'Class3',
                    start: '2019-03-12T10:00:00'
                },
                {
                    id: 222,
                    title: 'Class4',
                    start: '2019-03-13T08:00:00'
                }

            ]
        });

    });
</script>
</html>
