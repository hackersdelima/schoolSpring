<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<tag:header title="ASSIGNED SUBJECTS LIST"/>
					<a href="<spring:url value="/nav/assignedsubjects"/>" class="btn btn-primary btn-sm">Back</a>
		
			<table id="datatable"
				class="table jambo_table table-striped table-bordered"
				style="font-size: 95%;">
				<thead>
					<tr class="headings">
						<th>Student Name</th>
						<th>Class</th>
						<th>Section</th>
						<th>Roll Number</th>
						<th>Subject Count</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${courselist }" var="c">
						<tr>
							<td>${c.studentModel.studentname }</td>
							<td>${c.classname }</td>
							<td>${c.studentModel.section }</td>
							<td> ${c.studentModel.rollno }</td>
							<td> ${c.subjectid }</td>
							<td><a
								href="<spring:url value="/operation/view/${c.studentid }/stdsubjects"></spring:url>">Detail</a></td>
						</tr>
						</c:forEach>
				</tbody>
			</table>
	<tag:footer/>