<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../include.jsp"></jsp:include>
<spring:url value="/invoice/add" var="formUrl"></spring:url>
<html>
<head>
<style>
h5 {
	font-size: 80%;
	font-weight: bold;
}
</style>
</head>
<body class="background">
	<div class="breadcrumb-line">
		<nav aria-label="breadcrumb" role="navigation">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home"
					aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">Account</li>
				<li class="breadcrumb-item active" aria-current="page">Add
					Account</li>
			</ol>
		</nav>
	</div>
	<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="col-md-8 col-xs-12">
		<div class="x_panel">
			<form:form class="form-horizontal form-label-left input_mask" method="post"
				action="${formUrl }">

				<div class="x_title">
					<h2>Student Invoice</h2>
					<div class="col-md-4 col-sm-4 col-xs-12 pull-right">
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<br />

					<div class="form-group">
						
					<div class="form-group">
						<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
							<button class="btn btn-info" type="button" id="validate">Validate</button>
							<button class="btn btn-primary" type="reset">Reset</button>
							<input type="submit" class="btn btn-success" value="Submit">
						</div>
					</div>
					<hr>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-2 col-xs-12">Student  
							Admission Number</label>
						<div class="col-md-4 col-sm-4 col-xs-12">
							 <input type="text"
									class="form-control" id="staffName" name="studentid"
									value="" required >
						</div>
					</div>
					
				</div>
				</div>
			</form:form>
		</div>
							</div>
	</div>

</body>
</html>
