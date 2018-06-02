<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../include.jsp"></jsp:include>
<spring:url value="/student/photo_upload" var="s"/>
<html>
<head>
</head>
<body class="background">
	<div class="breadcrumb-line">
		<nav aria-label="breadcrumb" role="navigation">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home"
					aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">Student</li>
				<li class="breadcrumb-item active" aria-current="page">Photo
					Upload</li>
			</ol>
		</nav>
	</div>
	
	
	<form method="post" action="${formUrl }" enctype="multipart/form-data">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="col-md-8 col-xs-12">
				<div class="x_panel">
					<div class="x_title">
						<h2>Upload Student Photo</h2>

						<div class="clearfix"></div>
					</div>
					<div class="form-group">

						<div class="form-group">
							<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
								<button class="btn btn-info" type="button" id="validate">Validate</button>
								<button class="btn btn-primary" type="reset">Reset</button>
								<input type="submit" class="btn btn-success confirm" value="Upload">
							</div>
						</div>
						<br> <br>
						<div class="ln_solid"></div>
						<label class="control-label col-md-2 col-sm-2 col-xs-12">STUDENT
							ID</label>
						<div class="col-md-2 col-sm-2 col-xs-12">
							<input type="text" id="studentid" class="form-control"
								name="studentid" required>
						</div>
												<div class="form-group">
							<label class="control-label col-md-2 col-sm-2 col-xs-12">File</label>
							<div class="col-md-4 col-sm-4 col-xs-12">
								<input type="file" id="file" class="form-control" name="file"
									accept="image/*" required>
							</div>
						</div>

					</div>
				</div>

			</div>
		</div>

	</form>
	<script>
		$(".confirm").click(function(){
			return confirm("Confirm?");
		})
	</script>
</body>
</html>