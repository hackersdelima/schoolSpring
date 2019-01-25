<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../include.jsp"></jsp:include>

<html>
<head>
<style>
h5 {
	font-size: 80%;
	font-weight: bold;
}
/* .borderless td, .borderless th {
    border-bottom-style: hidden;
     border-top-style: hidden;
} */
</style>
</head>
<body class="background">

	<div class="breadcrumb-line">
		<nav aria-label="breadcrumb" role="navigation">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home"
					aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">Settings</li>
				<li class="breadcrumb-item active" aria-current="page">Account
					Settings</li>
				<li class="breadcrumb-item active" aria-current="page">Fee
					Setting</li>
			</ol>
		</nav>
	</div>
	<div class="col-md-8 col-sm-8 col-xs-8">

		<div class="x_panel">
			<div class="x_title">
				<h2>Add Fee Details</h2>
				<ul class="nav navbar-right panel_toolbox">
					<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
					</li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<c:if test="${empty fm.sclass}">
				<spring:url value="/initialDetails/feeSetting/add" var="formUrl" />
				</c:if>
				
				<c:if test="${not empty fm.sclass}">
				<spring:url value="/initialDetails/updateFeeSetting/${fm.feecode}" var="formUrl" />
				</c:if>

				<form:form class="form-horizontal" action="${formUrl }">
					
					<c:if test="${empty fm.sclass }">
					<input type="submit" class="btn btn-success" value="Save">
					</c:if>
					<c:if test="${not empty fm.sclass }">
					<input type="submit" class="btn btn-primary" value="Update">
					</c:if>

					<table class="table borderless">
						<tbody>

							<tr>
								<td>
									<h5>Class</h5> <select class="form-control class"
									name="classname" id="class" required>
										<option value="">Select Class</option>
										<c:forEach items="${classlist }" var="cl">
										<c:if test="${fm.sclass eq cl.classname }">selected</c:if>
											<option value="${cl.classname }" <c:if test="${fm.sclass eq cl.classname }">selected</c:if>>${cl.classname }</option>
										</c:forEach>


								</select>
								</td>
								<td>
									<h5>Category</h5> <select class="form-control categoryId"
									name="category" id="categories">
										<option value="">Select Category</option>
										
										<c:forEach items="${categorylist }" var="c">
											<option value="${c.categoryId }" <c:if test="${fm.categoryId eq c.categoryId }">selected</c:if>>${c.categoryHead }</option>
										</c:forEach>
								</select>

								</td>
								<td>
									<h5>Fee Rate</h5> <input class="form-control" name="feerate" value="${fm.frate }">
								</td>
							</tr>

						</tbody>
					</table>
				</form:form>
			</div>
		</div>
	</div>
	<div class="col-md-12 col-sm-12 col-xs-12">

		<div class="x_panel">
			<div class="x_title">
				<h2>Fee Setting</h2>
				<ul class="nav navbar-right panel_toolbox">
					<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
					</li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<table id="categorytbl"
					class="table jambo_table table-striped table-bordered"
					style="font-size: 95%;">
					<thead>
						<tr>
							<th>S.N.</th>
							<th>Class</th>
							<th>Category</th>
							<th>Fee Rate</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${feeDetails }" var="f" varStatus="count">
							<tr>
								<td>${count.index+1 }</td>
								<td>${f.sclass }</td>
								<td>${f.categoryId }</td>
								<td>${f.frate }</td>
								<td><a href="<spring:url value="/initialDetails/editFeeSetting/${f.feecode}"/>">Edit</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	

	</script>
</body>
</html>