<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ attribute name="title" required="true"%>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Digi Nepal</title>

<!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Datatables -->
    <link href="${pageContext.request.contextPath}/resources/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/scroller.bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath}/resources/css/nprogress.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath}/resources/css/custom.min.css" rel="stylesheet">
    <style>
    	table{
    	color:black;
    	font-weight:bold;}
    </style>
</head>


<body class="nav-md">

	<div class="container body">


		<div class="main_container">

			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">

					<div class="navbar nav_title" style="border: 0;">
						
					</div>
					<div class="clearfix"></div>

					<!-- menu prile quick info -->
					<div class="profile">
						<div class="profile_pic">
							<img
								src="//124.41.193.91/projectdatas/${sessionScope.foldername }/images/logo.jpg"
								alt="..." class="img-circle profile_img">
						</div>
						<div class="profile_info">
							<span>Welcome,</span>
							<h2>${sessionScope.userDetail.username }</h2>
						</div>
					</div>
					<!-- /menu prile quick info -->

					<br />

					<!-- sidebar menu -->
					<div id="sidebar-menu"
						class="main_menu_side hidden-print main_menu">
						<div class="menu_section">
							<h3>General</h3>
							<ul class="nav side-menu">
								<li><a><i class="fa fa-home"></i> Home <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="<spring:url value="/nav/dashboard"/>" target="iframe_a">Dashboard</a></li>
									</ul></li>
								<li><a id="printiframe">Print Frame</a></li>
								<li><a><i class="fa fa-edit"></i> Student <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="<spring:url value="/nav/studentAdmission"/>" target="iframe_a">New
												Student</a></li>
										<li><a href="<spring:url value="/nav/listStudents"/>" target="iframe_a">Students
												List</a></li>
										<!--  <li><a href="nav/student_photo_upload" target="iframe_a">Upload Photo</a></li> -->
									</ul></li>
								<li><a><i class="fa fa-edit"></i> Staff <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="<spring:url value="/nav/newStaff"/>" target="iframe_a">New
												Staff </a></li>
										<li><a href="<spring:url value="/nav/staffList"/>" target="iframe_a">Staff
												List</a></li>
									</ul></li>
								<li><a><i class="fa fa-edit"></i> Exam <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a><i class="fa fa-edit"></i> Create<span
												class="fa fa-chevron-down"></span></a>
											<ul class="nav child_menu">
												<li><a href="<spring:url value="/nav/createExam"/>" target="iframe_a">Create
														Exam</a></li>
												<li><a href="<spring:url value="/nav/createMarksReport"/>" target="iframe_a">Create
														Marks Report</a></li>
												<li><a href="<spring:url value="/nav/createReportonSubject"/>"
													target="iframe_a">Create Marks Subject Teacher</a></li>
											</ul></li>
										<li><a><i class="fa fa-edit"></i> Result<span
												class="fa fa-chevron-down"></span></a>
											<ul class="nav child_menu">
												<li><a href="<spring:url value="/nav/bulkGradeReportSearch"/>"
													target="iframe_a">Grade Sheet</a></li>
												<li><a href="<spring:url value="/nav/bulkReportSearch"/>" target="iframe_a">Marks
														Sheet</a></li>
												<li><a href="<spring:url value="/nav/marksReportSearch"/>" target="iframe_a">Search
														Report</a>
											</ul></li></li>
							</ul>
							</li>
							<li><a><span class="fa fa-chevron-down"></span><i
									class="fa fa-user"></i>Account</a>
								<ul class="nav child_menu">
									<li id="i"><a href="<spring:url value="/nav/account"/>" target="iframe_a">Open
											Personal Account</a></li>
									<li id="i"><a href="<spring:url value="/nav/financialAccount"/>"
										target="iframe_a">Open Financial Account</a></li>

									<li><a href="<spring:url value="/nav/pageNotFound"/>" target="iframe_a">Open
											New Shareholder Account</a> <li id="v"><a href="<spring:url value="/nav/viewAccount"/>" target="iframe_a">Amendment
											of Account</a></li>

								</ul>
							<li id="generaltransaction"><a><i class="fa fa-tasks"
									aria-hidden="true"></i> General Transaction <span
									class="fa fa-chevron-down"></span></a>
								<ul class="nav child_menu">
									
									<li><a><span class="fa fa-chevron-down"></span>Payment
											Voucher</a>

										<ul class="nav child_menu">
											<li><a href="<spring:url value="/nav/paymentVoucher"/>" target="iframe_a">
													Create</a></li>
											<li><a href="<spring:url value="/nav/viewPaymentVoucher"/>" target="iframe_a">
													View</a></li>
										</ul></li>
								</ul></li>
							<li><a><i class="fa fa-tasks"
									aria-hidden="true"></i>Reports<span class="fa fa-chevron-down"></span></a>
								<ul class="nav child_menu">
									<li id="i"><a href="<spring:url value="/nav/viewTrialBalance"/>" target="iframe_a">Trial
									Balance </a></li>
							<li id="i"><a href="<spring:url value="/nav/viewTrialBalanceSummary"/>"
								target="iframe_a">Trial Balance Summary </a></li>
							<li id="i"><a href="<spring:url value="/nav/viewAccount"/>" target="iframe_a">Statements
							</a></li>
								</ul></li>
							<li><a><i class="fa fa-tasks"
									aria-hidden="true"></i>Invoice<span class="fa fa-chevron-down"></span></a>
								<ul class="nav child_menu">
									<li id="a"><a href="<spring:url value="/invoice/search"/>" target="iframe_a">
											Invoice </a></li>
									<li id="a"><a href="<spring:url value="/claimbill/studentList"/>"
										target="iframe_a"> Claim Bill </a></li>
									<li id="a"><a href="<spring:url value="/nav/viewBulkClaimBill"/>"
										target="iframe_a"> Class Claim Bill </a></li>
									<%-- <li id="a"><a href="<spring:url value="/nav/viewClaimBill"/>" target="iframe_a">
											Data Claim Bill </a></li> --%>
								</ul></li>


							</ul>
						</div>
						<div class="menu_section">
							<h3>Settings</h3>
							<ul class="nav side-menu">
								<li><a><i class="fa fa-sitemap"></i> Settings <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="<spring:url value="/nav/generalSettings"/>" target="iframe_a">Office
												Settings</a>
										
										<li><a><span class="fa fa-chevron-down"></span>User</a>
											<ul class="nav child_menu">

												<li><a href="<spring:url value="/nav/addUser"/>" target="iframe_a">
														Manage User </a></li>
												<li><a href="<spring:url value="/nav/pageNotFound"/>" target="iframe_a">
														Create user Group</a></li>
												<li><a href="<spring:url value="/nav/pageNotFound"/>" target="iframe_a">
														Authorize user </a></li>
											</ul></li>

										<li><a>Subject Settings<span
												class="fa fa-chevron-down"></span></a>
											<ul class="nav child_menu">
												<li><a href="<spring:url value="/nav/subjects"/>" target="iframe_a">Subjects</a>
												</li>
												<li><a href="<spring:url value="/nav/assignSubjects"/>" target="iframe_a">Assign
														Subjects</a></li>
												<li><a href="<spring:url value="/nav/assignedsubjects"/>" target="iframe_a">Assigned
														Subjects List</a></li>
											</ul></li>
										<li><a>Account Settings<span
												class="fa fa-chevron-down"></span></a>
											<ul class="nav child_menu">
												<li><a href="<spring:url value="/nav/category"/>" target="iframe_a">Category</a></li>
												<li><a href="<spring:url value="/nav/accountType"/>" target="iframe_a">Account
														Type</a></li>
												<li><a href="<spring:url value="/nav/feeSetting"/>" target="iframe_a">Fee
														Setting</a></li>
												<li><a href="<spring:url value="/nav/viewFeeHead"/>" target="iframe_a">Fee
														Head</a>
												
												<li><a href="<spring:url value="/nav/viewFeeStructure"/>" target="iframe_a">Fee
														Structure</a>
											
											</ul></li>
										<li><a href="<spring:url value="/nav/initialDetails"/>" target="iframe_a">Basic
												Details</a>
										
										<li><a href="<spring:url value="/nav/attendance"/>" target="iframe_a">Exam
												Attendance</a>
										
										<li><a
											href="<spring:url value="/nav/studentattendance"/>"
											target="iframe_a">Student Attendance</a></li>
												<li><a href="<spring:url value="/nav/promotion"/>" target="iframe_a">Student Promotion</a>
									
									</ul></li>
							</ul>
						</div>

					</div>
          <!-- /sidebar menu --> 
          <!-- /menu footer buttons -->
          <div class="sidebar-footer hidden-small">
						<a data-toggle="tooltip" data-placement="top" title="Settings">
							<i class="fa fa-cog" aria-hidden="true"></i>
						</a> <a data-toggle="tooltip" data-placement="top" title="FullScreen"
							id="fullscreen"> <i class="fa fa-arrows-alt"
							aria-hidden="true"></i>
						</a> <a data-toggle="tooltip" data-placement="top" title="Lock"> <i
							class="fa fa-eye-slash" aria-hidden="true"></i>
						</a> <a data-toggle="tooltip" data-placement="top" title="Logout"
							href="nav/logout"> <i class="fa fa-sign-out"
							aria-hidden="true"></i>
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
							<li class=""><a href="nav/javascript:;"
								class="user-profile dropdown-toggle" data-toggle="dropdown"
								aria-expanded="false"> <img src="//124.41.193.91/projectdatas/${sessionScope.foldername }/images/logo.jpg"
									alt="">${sessionScope.userDetail.username } <span class=" fa fa-angle-down"></span>
							</a>
								<ul class="dropdown-menu dropdown-usermenu pull-right">
									<li><a href="nav/profileSettings" target="iframe_a">
											Profile</a></li>
									<li><a href="nav/javascript:;"> <span>Settings</span>
									</a></li>
									<li><a href="nav/javascript:;">Help</a></li>


									<li><a href="<spring:url value="/logout"/>"><i
											class="fa fa-sign-out pull-right"></i> Log Out</a></li>
								</ul></li>
						</ul>
					</nav>
				</div>
			</div>
      <!-- /top navigation -->


      <!-- page content -->
      <div class="right_col" role="main" style="height:1500px">
      
      <div class="x_panel">
		<div class="x_title">
			<h3>${title}</h3>
		</div>
		<div class="clearfix"> </div>	
	    <div class="x_content">