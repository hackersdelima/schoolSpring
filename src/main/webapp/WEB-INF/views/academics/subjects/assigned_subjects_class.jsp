<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<tag:header title="ASSIGNED SUBJECTS : CLASS: ${list[0].classname }"/>

		<a href="<spring:url value="/nav/v/assignedsubjectsclass"/>" class="btn btn-primary btn-sm">Back</a>
			<table id="datatable"
				class="table jambo_table table-striped table-bordered"
				style="font-size: 95%;width:50%">
				<thead>
					<tr class="headings">
				
						<th>Subject Name</th>
							<th>Subject Code</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list }" var="c">
						<tr>
							
							<td> ${c.subjectname }</td>
							<td>${c.subjectCode }</td>
						</tr>
						</c:forEach>
				</tbody>
			</table>
	<tag:footer/>