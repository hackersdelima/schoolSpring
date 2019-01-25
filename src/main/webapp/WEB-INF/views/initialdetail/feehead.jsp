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
				<li class="breadcrumb-item active" aria-current="page">Category</li>
				<li class="breadcrumb-item active" aria-current="page">Add</li>
			</ol>
		</nav>
	</div>
	<div class="col-md-8 col-sm-8 col-xs-8">

		<div class="x_panel">
			<div class="x_title">
				<h2>ADD Fee Head CATEGORY${msg }</h2>
				<ul class="nav navbar-right panel_toolbox">
					<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
					</li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">

				<spring:url value="/initialDetails/addFeeHead" var="formUrl" />

				<form:form class="form-horizontal" action="${formUrl }">

					<input type="submit" class="btn btn-success" value="Save">

					<table class="table borderless">
						<tbody>

							<tr>
								
							
								<td>
									<h5>Category</h5>	<select class="form-control categoryId" name="categoryId" id="categories">
										<option value="">Select Category</option>
										<c:forEach items="${allcategory }" var="c">
											<option value="${c.categoryId }-${c.categoryHead }">${c.categoryId }-${c.categoryHead }</option>
											
										</c:forEach>
								</select>
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
				<h2>FEE HEAD DETAILS</h2>
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
							<th>Category Id</th>
							<th>Category Head</th>
							<th>Account Type</th>
							<th>Taxable</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${categorylist }" var="cat">
							<tr>
								<td>${cat.categoryId }</td>
								<td>${cat.categoryHead }</td>
								<td>${cat.accountTypeModel.accountType }</td>
								<td>${cat.taxable }</td>
								<td><a
									href="<spring:url value="/category/edit/${cat.categoryId }"/>">Edit</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="categorymodal"></div>

	

	
</body>
</html>