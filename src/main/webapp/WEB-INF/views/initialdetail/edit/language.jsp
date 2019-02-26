<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<tag:header title="EDIT LANGUAGE"/>
<spring:url value="/initialDetails/languageUpdate" var="formUrl"/>
	<form:form class="form" action="${formUrl }"
		style="width: 20%; margin-top: 10px;">
		<h6>
			<strong>Language Name:</strong>
		</h6>
		<input type="hidden" value="${languageid }" name="languageid">
		<input type="text" class="form-control" name="languagename"
			placeholder="Language name..." value="${languagename }" required>
		<br>
		<button type="submit" class="btn btn-success">+ UPDATE</button>
		<a class="btn btn-danger" href="<spring:url value="/initialDetails/deleteLanguage/${languageid }"/>">X DELETE</a>
	</form:form>
	<tag:footer/>