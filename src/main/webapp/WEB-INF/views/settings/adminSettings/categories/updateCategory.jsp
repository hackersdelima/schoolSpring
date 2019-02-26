<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<tag:header title="UPDATE CATEGORY" />
<spring:url value="/category/update" var="formUrl" />
<form class="form-horizontal" method="post" action="${formUrl }">
	<div class="form-group">
		<div class="form-group">
			<div class="col-md-9 col-sm-9 col-xs-12 ">
				<input type="submit" class="btn btn-success cm" value="Update">
				<button class="btn btn-info" type="button" id="validate">Validate</button>
				<a class="btn btn-danger cm"
					href="<spring:url value="/category/delete/${id }"/>">Delete</a> <a
					class="btn btn-info" href="<spring:url value="/nav/category"/>">Go
					Back</a>
			</div>
		</div>
		<div class="ln_solid"></div>
		<div class="form-group">
			<div class="col-md-9 col-sm-9 col-xs-12">
				<input type="hidden" name="previousid"
					value="${categorydetail.categoryId }">
				<h5>Category ID</h5>
				<input type="text" class="form-control" name="categoryId"
					value="${categorydetail.categoryId }" required>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-9 col-sm-9 col-xs-12 ">
				<h5>Category Head</h5>
				<input type="text" class="form-control " name="categoryHead"
					value="${categorydetail.categoryHead }">

			</div>
		</div>
		<div class="form-group">
			<div class="col-md-9 col-sm-9 col-xs-12 ">
				<h5>Account Type</h5>
				<select name="accountType" class="form-control" required>
					<option value="${categorydetail.accountTypeModel.accountType }">${categorydetail.accountTypeModel.accountTypeHead }</option>
					<c:forEach items="${accounttype}" var="at">
						<option value="${at.accountType }">${at.accountTypeHead }</option>
					</c:forEach>
				</select>
			</div>
		</div>

		<div class="form-group">
			<div class="col-md-9 col-sm-9 col-xs-12 ">
				<h5>Taxable</h5>
				<select class="form-control" name="taxable">
					<option value="y"
						<c:if test="${categorydetail.taxable eq 'y' }">selected</c:if>>Yes</option>
					<option value="n"
						<c:if test="${categorydetail.taxable eq 'n' }">selected</c:if>>No</option>
				</select>
			</div>
		</div>
	</div>
</form>
<tag:footer />
<script>
	$(".cm").click(function(){
		return confirm('Confirm?')
	});
	</script>
