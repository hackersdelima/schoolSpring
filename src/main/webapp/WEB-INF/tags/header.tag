<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${sessionScope.userDetail != null}" >
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
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Datatables -->
<link
	href="${pageContext.request.contextPath}/resources/css/dataTables.bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/buttons.bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/fixedHeader.bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/responsive.bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/scroller.bootstrap.min.css"
	rel="stylesheet">

<!-- Font Awesome -->
<link
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link
	href="${pageContext.request.contextPath}/resources/css/nprogress.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link
	href="${pageContext.request.contextPath}/resources/css/custom.min.css"
	rel="stylesheet">
<style>
table {
	color: black;
	font-weight: bold;
}
</style>
</head>


<body class="nav-md">

	<div class="container body">


		<div class="main_container">

			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">

					<div class="navbar nav_title" style="border: 0;"></div>
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
										<li><a href="<spring:url value="/nav/dashboard"/>">Dashboard</a></li>
									</ul></li>
								<li><a id="printiframe">Print Frame</a></li>
								<li><a><i class="fa fa-edit"></i> Student <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="<spring:url value="/nav/studentAdmission"/>">New
												Student</a></li>
										<li><a href="<spring:url value="/student/listStudents"/>">Students
												List</a></li>
										<!--  <li><a href="nav/student_photo_upload" >Upload Photo</a></li> -->
									</ul></li>
								<li><a><i class="fa fa-edit"></i> Staff <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="<spring:url value="/nav/newStaff"/>">New
												Staff </a></li>
										<li><a href="<spring:url value="/nav/staffList"/>">Staff
												List</a></li>
									</ul></li>
								<li><a><i class="fa fa-edit"></i> Exam <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a><i class="fa fa-edit"></i> Create<span
												class="fa fa-chevron-down"></span></a>
											<ul class="nav child_menu">
												<li><a href="<spring:url value="/nav/createExam"/>">Create
														Exam</a></li>
												<li><a
													href="<spring:url value="/nav/createMarksReport"/>">Create
														Marks Report</a></li>
												<li><a
													href="<spring:url value="/nav/createReportonSubject"/>">Create
														Marks Subject Teacher</a></li>
											</ul></li>
										<li><a><i class="fa fa-edit"></i> Result<span
												class="fa fa-chevron-down"></span></a>
											<ul class="nav child_menu">
												<li><a
													href="<spring:url value="/nav/bulkGradeReportSearch"/>">Grade
														Sheet</a></li>
												<li><a
													href="<spring:url value="/nav/bulkReportSearch"/>">Marks
														Sheet</a></li>
												<li><a
													href="<spring:url value="/nav/marksReportSearch"/>">Search
														Report</a>
											</ul></li></li>
							</ul>
							</li>
							<li><a><span class="fa fa-chevron-down"></span><i
									class="fa fa-user"></i>Account</a>
								<ul class="nav child_menu">
									<li id="i"><a href="<spring:url value="/nav/account"/>">Open
											Personal Account</a></li>
									<li id="i"><a
										href="<spring:url value="/nav/financialAccount"/>">Open
											Financial Account</a></li>

									<li><a href="<spring:url value="/nav/pageNotFound"/>">Open
											New Shareholder Account</a>
									<li id="v"><a
										href="<spring:url value="/nav/viewAccount"/>">Amendment
											of Account</a></li>

								</ul>
							<li id="generaltransaction"><a><i class="fa fa-tasks"
									aria-hidden="true"></i> General Transaction <span
									class="fa fa-chevron-down"></span></a>
								<ul class="nav child_menu">

									<li><a><span class="fa fa-chevron-down"></span>Payment
											Voucher</a>

										<ul class="nav child_menu">
											<li><a href="<spring:url value="/nav/paymentVoucher"/>">
													Create</a></li>
											<li><a
												href="<spring:url value="/nav/viewPaymentVoucher"/>">
													View</a></li>
										</ul></li>
								</ul></li>
							<li><a><i class="fa fa-tasks" aria-hidden="true"></i>Reports<span
									class="fa fa-chevron-down"></span></a>
								<ul class="nav child_menu">
									<li id="i"><a
										href="<spring:url value="/nav/viewTrialBalance"/>">Trial
											Balance </a></li>
									<li id="i"><a
										href="<spring:url value="/nav/viewTrialBalanceSummary"/>">Trial
											Balance Summary </a></li>
									<li id="i"><a
										href="<spring:url value="/nav/viewAccount"/>">Statements
									</a></li>
								</ul></li>
							<li><a><i class="fa fa-tasks" aria-hidden="true"></i>Invoice<span
									class="fa fa-chevron-down"></span></a>
								<ul class="nav child_menu">
									<li id="a"><a href="<spring:url value="/invoice/search"/>">
											Invoice </a></li>
									<li id="a"><a
										href="<spring:url value="/claimbill/studentList"/>">
											Claim Bill </a></li>
									<li id="a"><a
										href="<spring:url value="/nav/viewBulkClaimBill"/>">
											Class Claim Bill </a></li>
									<%-- <li id="a"><a href="<spring:url value="/nav/viewClaimBill"/>" >
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
										<li><a><span class="fa fa-chevron-down"></span>User</a>
											<ul class="nav child_menu">

												<li><a href="<spring:url value="/nav/addUser"/>">
														Manage User </a></li>
												<li><a href="<spring:url value="/nav/pageNotFound"/>">
														Create user Group</a></li>
												<li><a href="<spring:url value="/nav/pageNotFound"/>">
														Authorize user </a></li>
											</ul></li>

										<li><a>Subject Settings<span
												class="fa fa-chevron-down"></span></a>
											<ul class="nav child_menu">
												<li><a href="<spring:url value="/nav/subjects"/>">Subjects</a>
												</li>
												<li><a href="<spring:url value="/nav/assignSubjects"/>">Assign
														Subjects</a></li>
												<li><a
													href="<spring:url value="/nav/assignedsubjects"/>">Assigned
														Subjects List</a></li>
											</ul></li>
										<li><a>Account Settings<span
												class="fa fa-chevron-down"></span></a>
											<ul class="nav child_menu">
												<li><a href="<spring:url value="/nav/rateSetting"/>">Rate
														Setting</a></li>
												<li><a href="<spring:url value="/nav/category"/>">Category</a></li>
												<li><a href="<spring:url value="/nav/accountType"/>">Account
														Type</a></li>
												<li><a href="<spring:url value="/nav/feeSetting"/>">Fee
														Setting</a></li>
												<li><a href="<spring:url value="/nav/viewFeeHead"/>">Fee
														Head</a>
												<li><a
													href="<spring:url value="/nav/viewFeeStructure"/>">Fee
														Structure</a>
											</ul></li>
										<li><a href="<spring:url value="/nav/initialDetails"/>">Basic
												Details</a>
										<li><a href="<spring:url value="/nav/attendance"/>">Exam
												Attendance</a>
										<li><a>Student Settings<span
												class="fa fa-chevron-down"></span></a>
											<ul class="nav child_menu">
												<li><a
													href="<spring:url value="/nav/studentattendance"/>">Student
														Attendance</a></li>
												<li><a href="<spring:url value="/nav/promotion"/>">Student
														Promotion</a></li>
												
												<li><a>Student Status<span
												class="fa fa-chevron-down"></span></a>
											<ul class="nav child_menu">
												<li><a href="<spring:url value="/status/"/>">New Student
														Status</a></li>
												<li><a href="<spring:url value="/status/showAll"/>">
														Status List</a></li>
											</ul></li>
											
											

									</ul></li>
										<li><a>Exam Settings<span
												class="fa fa-chevron-down"></span></a>
											<ul class="nav child_menu">
												<li><a href="<spring:url value="/exam/consolidate/setform"/>">Set Consolidate Marks</a></li>
												<li><a href="<spring:url value="/exam/consolidate/list"/>">Consolidate Marks List</a></li>
											</ul></li>
									<li><a>School Settings<span
												class="fa fa-chevron-down"></span></a>
											<ul class="nav child_menu">
												<li><a href="<spring:url value="/generaldetails/"/>">General Details</a></li>
												<li><a href="<spring:url value="/academicdates/"/>">Set Academic Dates</a></li>
											</ul></li>
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
								aria-expanded="false"> <img
									src="//124.41.193.91/projectdatas/${sessionScope.foldername }/images/logo.jpg"
									alt="">${sessionScope.userDetail.username } <span
									class=" fa fa-angle-down"></span>
							</a>
								<ul class="dropdown-menu dropdown-usermenu pull-right">
									<li><a href="nav/profileSettings"> Profile</a></li>
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
			<div class="right_col" role="main" style="height: 1500px">

				<div class="x_panel">
					<div class="x_title">
						<h3>${title}</h3>
					</div>
					<div class="clearfix"></div>
					<div class="x_content">
				 </c:if>
				 <c:if test="${sessionScope.userDetail == null}" >
				 
				 <c:redirect url="/"/>  
				 </c:if>