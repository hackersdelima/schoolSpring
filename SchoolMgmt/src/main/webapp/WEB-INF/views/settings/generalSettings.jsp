<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../include.jsp"></jsp:include>
<html>
<head>
</head>
<body class="hiddenscroll bgcolor background">

	<div class="breadcrumb-line">
		<nav aria-label="breadcrumb" role="navigation">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home"
					aria-hidden="true"></i>&nbsp;<a href="#">Settings</a></li>
				<li class="breadcrumb-item active" aria-current="page">General
					Settings</li>
			</ol>
		</nav>
	</div>

	<div class="col-md-8 col-xs-12">
		<div class="x_panel">
			<form:form class="form-horizontal form-label-left input_mask"
				method="post" action="operation/updateGeneralSetting">

				<div class="x_title">
					<h2>SYSTEM SETTINGS</h2>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<br />
					<c:forEach items="${sessionScope.systemdetail}" var="sysdetail">
						<div class="form-group">
							<label class="control-label col-md-2 col-sm-2 col-xs-12">${sysdetail.settingstype }</label>
							<div class="col-md-4 col-sm-4 col-xs-12">
							<input type="hidden" name="type" value="${sysdetail.settingstype }">
								<input type="text" class="form-control" name="description" value="${sysdetail.settingsdescription }"
									placeholder="" value="">
							</div>
						</div>
					</c:forEach>
					<div class="ln_solid"></div>
					<div class="form-group">
						<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
							<button class="btn btn-info" type="button" id="validate">Validate</button>
							<button class="btn btn-primary" type="reset">Reset</button>
							<input type="submit" class="btn btn-success" value="Save">
						</div>
					</div>


				</div>
			</form:form>
		</div>
	</div>
	<jsp:include page="../msgmodal.jsp"></jsp:include>
	<script>
		
	<%if (request.getAttribute("msg") != null) {%>
		$('#myModal').modal('show');
	<%}%>
		
	</script>
</body>
</html>
