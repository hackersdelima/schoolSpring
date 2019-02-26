<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<tag:header title="EDIT SECTION"/>
				<spring:url value="/initialDetails/sectionUpdate" var="formUrl" />
				<form action="${formUrl }" method="post"
					style="width: 20%; margin-top: 10px;" class="form">
					<h6>
						<strong>Section Name:</strong>
					</h6>
					<input type="hidden" value="${sectionid }" name="sectionid">
					<input type="text" class="form-control" name="sectionname"
						placeholder="Section name..." value="${sectionname }"required> <br>
					<button type="submit" class="btn btn-success">+ Update</button>
					<a class="btn btn-danger" href="<spring:url value="/initialDetails/deleteSection/${sectionid}"/>">X Delete</a>
				</form>
			<tag:footer/>