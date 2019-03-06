<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<tag:header title="CONSOLIDATE MARKS SETTINGS"/>
				<a type="button" class="btn btn-info btn-sm pull-right" href="<spring:url value="/exam/consolidate/setform"/>">Set Consolidate Marks</a>

				<table id="datatable-buttons"
					class="table jambo_table table-striped table-bordered dt-responsive nowrap display"
					cellspacing="0" width="100%" style="font-size: 95%;'">
					<thead>
					
						<tr class="headings">
							<th>Exam</th>
							<th>Practical Percentage</th>
							<th>Theory Percentage</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="s">
							<tr>
								<td>${s.examid }</td>
								<td>${s.prper }</td>
								<td>${s.thper }</td>
								<td>
								<a href="<spring:url value="/exam/consolidate/edit/${s.examid }" />">Edit</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

	
		<tag:footer/>