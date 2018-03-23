
<%@page import="com.controller.student.classes.StudentOperations"%>
<%@page import='com.school.model.UserModel'%>
<%UserModel userdetail=(UserModel)session.getAttribute("userdetail");
StudentOperations s=new StudentOperations();
String totalstd=s.totalstudents(); %>
<jsp:include page="/includefile"></jsp:include>
<body class="background">
	<div class="">
		<div class="row top_tiles" style="margin: 10px 0;">
			<div class="col-md-3 col-sm-3 col-xs-6 tile">
				<span>Total Students</span>
				<h2><%=totalstd%></h2>
				<span class="sparkline_one" style="height: 160px;">
					<canvas width="200" height="60"
						style="display: inline-block; vertical-align: top; width: 94px; height: 30px;"></canvas>
				</span>
			</div>
			<div class="col-md-3 col-sm-3 col-xs-6 tile">
				<span>Total Users</span>
				<h2>1</h2>
				<span class="sparkline_one" style="height: 160px;">
					<canvas width="200" height="60"
						style="display: inline-block; vertical-align: top; width: 94px; height: 30px;"></canvas>
				</span>
			</div>
			<div class="col-md-3 col-sm-3 col-xs-6 tile">
				<span>Total Teachers</span>
				<h2>0</h2>
				<span class="sparkline_two" style="height: 160px;">
					<canvas width="200" height="60"
						style="display: inline-block; vertical-align: top; width: 94px; height: 30px;"></canvas>
				</span>
			</div>
		</div>
		
	</div>
</body>