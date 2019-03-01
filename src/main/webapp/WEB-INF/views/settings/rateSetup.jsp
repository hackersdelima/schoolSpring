<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<tag:header title="ADD RATE DETAILS"/>
				
				<spring:url value="/initialDetails/rate/add" var="formUrl" />
				<form:form class="form-horizontal" action="${formUrl }" >
				<input type="submit" class="btn btn-success" value="Save">
			
				<%-- 	<c:if test="${not empty fm.sclass}">
				<spring:url value="/initialDetails/updateFeeSetting/${fm.feecode}" var="formUrl" />
				</c:if>
					<c:if test="${empty fm.sclass }">
					<input type="submit" class="btn btn-success" value="Save">
					</c:if>
					<c:if test="${not empty fm.sclass }">
					<input type="submit" class="btn btn-primary" value="Update">
					</c:if> --%>

					<table class="table borderless">
						<tbody>

							<tr>
								
								<td>
									<h5>Rate Name</h5> <input class="form-control" name="name" value="">
								</td>
								
								<td>
									<h5>Rate  Value</h5> <input class="form-control" name="ratevalue" value="">
								</td>
								
							</tr>

						</tbody>
					</table>
				</form:form>
		
	<div class="col-md-12 col-sm-12 col-xs-12">

		<div class="x_panel">
			<div class="x_title">
				<h2>RATE SETTING</h2>
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
							<th>Rate Name</th>
							<th>Rate Value</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${feeDetails }" var="f" varStatus="count">
							<tr>
								<td>${count.index+1 }</td>
								<td></td>
								<td></td>
								<td><a href="<spring:url value="/initialDetails/editFeeSetting/${f.feecode}"/>">Edit</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<tag:footer/>