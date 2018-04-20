<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.sql.*"%>
<jsp:include page="/includefile"></jsp:include>

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
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>UPDATE CATEGORY</h2>
				<ul class="nav navbar-right panel_toolbox">
					<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
					</li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<form class="form-horizontal shareCertForm" id="form1" method="post"
					action="category.update">

					<table class="table">
						<tbody>
							<tr>
								<td><input type="submit" class="btn btn-success cm"
									value="Update"></td>
									<td></td>
									<td><a class="btn btn-info pull-right" href="category.click">Go Back</a></td>
							</tr>
							<tr>
								<td>
								<input type="hidden" name="previousid" value="${categorydetail.categoryId }">
									<h5>Category ID</h5> <input type="text" class="form-control"
									name="categoryId" value="${categorydetail.categoryId }" required>
								</td>
								<td>
									<h5>Category Head</h5> <input type="text" class="form-control "
									name="categoryHead" value="${categorydetail.categoryHead }">
								</td>
								<td>
									<h5>Account Type</h5> <select name="accountType" class="form-control" required>
										<option value="${categorydetail.accountType }">${categorydetail.accountType }</option>
										<c:forEach items="${accounttype}" var="at">
										<option value="${at.accountType }">${at.accountHead }</option>
										</c:forEach>
								</select>
								</td>

							</tr>

						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
	<script>
	$('.cm').click(function(){
		return confirm('Confirm?');
	});
	</script>
</body>
</html>