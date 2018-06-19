<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../include.jsp"></jsp:include>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body class="background">
	<div class="col-md-12 col-sm-12 col-xs-12">

		<div class="x_panel">
			<div class="x_title">
				<h2>EDIT HOUSE GROUP</h2>
				<ul class="nav navbar-right panel_toolbox">
					<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
					</li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<spring:url value="/initialDetails/houseGroupUpdate" var="formUrl" />
				<form action="${formUrl }" method="post"
					style="width: 20%; margin-top: 10px;" class="form">
					<h6>
						<strong>House Group Name:</strong>
					</h6>
					<input type="hidden" value="${housegroupid }" name="housegroupid">
					<input type="text" class="form-control" name="housegroupname"
						placeholder="House Group name..." value="${housegroupname }"required> <br>
					<button type="submit" class="btn btn-success">+ Update</button>
					<a class="btn btn-danger" href="<spring:url value="/initialDetails/deleteHousegroup/${housegroupid}"/>">X Delete</a>
				</form>
			</div>
		</div>
	</div>

</body>
</html>