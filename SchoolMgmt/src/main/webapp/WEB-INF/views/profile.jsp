

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import='java.sql.*' %>

<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Digi Nepal | Profile</title>

    <!-- Bootstrap -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="resources/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="resources/css/nprogress.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="resources/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="" class="site_title"><i class="fa fa-desktop" aria-hidden="true"></i> <span>Digi Nepal</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src="resources/images/user.jpg" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>Welcome,</span>
                <h2>${sessionScope.userDetail.username }</h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>General</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-home"></i> Home <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="view/dashboard.jsp" target="iframe_a">Dashboard</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-edit"></i> Student <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="studentAdmission" target="iframe_a">Student Admission</a></li>
                      <li><a href="listStudents" target="iframe_a">Students List</a></li>
                    </ul>
                  </li>
                   <li><a><i class="fa fa-edit"></i> Exam <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                    	 <li><a href="createExam" target="iframe_a">Create Exam</a>
                            </li>
                      <li><a href="createStudentReport.click" target="iframe_a">Create Marks Report</a></li>
                       <li><a href="reportsearchbox.click" target="iframe_a">Search Report</a>
                            </li>
                    </ul>
                  </li>
                </ul>
              </div>
              <div class="menu_section">
                <h3>Settings</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-sitemap"></i> Settings <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                    <li ><a href="generalSettings" target="iframe_a">General Settings</a>
                        <li><a>Academic Settings<span class="fa fa-chevron-down"></span></a>
                          <ul class="nav child_menu">
                            <li ><a href="subjects" target="iframe_a">Subjects</a>
                            </li>
                            <li><a href="assignSubjects" target="iframe_a">Assign Subjects</a>
                            </li>
                          </ul>
                        </li>
                        <li><a href="initialDetails" target="iframe_a">Set Initial Details</a>
                        </li>
                    </ul>
                  </li>                  
                </ul>
              </div>

            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="Settings">
                <i class="fa fa-cog" aria-hidden="true"></i>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="FullScreen" id="fullscreen">
                <i class="fa fa-arrows-alt" aria-hidden="true"></i>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Lock">
                <i class="fa fa-eye-slash" aria-hidden="true"></i>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Logout" href="logout">
                <i class="fa fa-sign-out" aria-hidden="true"></i>
              </a>
            </div>
            <!-- /menu footer buttons -->
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>

              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <img src="resources/images/user.jpg" alt="">Username
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="profileSettings" target="iframe_a"> Profile</a></li>
                    <li>
                      <a href="javascript:;">
                        <span>Settings</span>
                      </a>
                    </li>
                    <li><a href="javascript:;">Help</a></li>
                    <li><a href="logout"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                  </ul>
                </li>
              </ul>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
     <div class="right_col" role="main">
          <iframe    height="1400px" width="100%" src="view/dashboard.jsp" id="Iframe" name="iframe_a"  style="border:none;" >
		</iframe>
     </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            Copyright 2018 <a href="https://diginepal.com.np">Digi-Nepal</a>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>

    <!-- jQuery -->
    <script src="resources/js/jquery.min.js"></script>
    <script type="text/javascript">
    function toggleFullscreen(elem) {
    	  elem = elem || document.documentElement;
    	  if (!document.fullscreenElement && !document.mozFullScreenElement &&
    	    !document.webkitFullscreenElement && !document.msFullscreenElement) {
    	    if (elem.requestFullscreen) {
    	      elem.requestFullscreen();
    	    } else if (elem.msRequestFullscreen) {
    	      elem.msRequestFullscreen();
    	    } else if (elem.mozRequestFullScreen) {
    	      elem.mozRequestFullScreen();
    	    } else if (elem.webkitRequestFullscreen) {
    	      elem.webkitRequestFullscreen(Element.ALLOW_KEYBOARD_INPUT);
    	    }
    	  } else {
    	    if (document.exitFullscreen) {
    	      document.exitFullscreen();
    	    } else if (document.msExitFullscreen) {
    	      document.msExitFullscreen();
    	    } else if (document.mozCancelFullScreen) {
    	      document.mozCancelFullScreen();
    	    } else if (document.webkitExitFullscreen) {
    	      document.webkitExitFullscreen();
    	    }
    	  }
    	}
    document.getElementById('fullscreen').addEventListener('click', function() {
    	  toggleFullscreen();
    	});
    </script>
    <!-- Bootstrap -->
    <script src="resources/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="resources/js/fastclick.js"></script>
    <!-- NProgress -->
    <script src="resources/js/nprogress.js"></script>
    
    <!-- Custom Theme Scripts -->
    <script src="resources/js/custom.min.js"></script>
    
  </body>
</html>

