<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<tag:header title="ACADEMIC DATES"/>
<p style="color:red">${msg }</p>
				<a href="<spring:url value="/academicdates/"/>" class="btn btn-primary btn-sm">Back</a>
			<table id="datatable"
				class="table jambo_table table-striped table-bordered"
				style="font-size: 95%;width:50%">
				<thead>
					<tr class="headings">
				
						<th>Date (Np)</th>
							<th>Date (En)</th>
							<th>Action</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list }" var="c">
						<tr>
							
							<td> ${c.academicdate }</td>
							<td>${c.academicdateen }</td>
							<td><a href="<spring:url value="/academicdates/update_form/${c.id }"/>">Edit</a></td>
						</tr>
						</c:forEach>
				</tbody>
			</table>
		<tag:footer/>