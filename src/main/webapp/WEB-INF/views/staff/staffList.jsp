<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<tag:header title="STAFFS LIST"/>
				<a type="button" class="btn btn-info btn-sm pull-right" href="studentadmission.click">Add Student</a>

				<table id="datatable-buttons"
					class="table jambo_table table-striped table-bordered dt-responsive nowrap display"
					cellspacing="0" width="100%" style="font-size: 95%;'">
					<thead>
					
						<tr class="headings">
							<th>S No.</th>
							<th>STAFF CODE</th>
							<th>STAFF NAME</th>
							<th>ADDRESS</th>
							<th>POST</th>
							<th>ACTION</th>
						</tr>
					</thead>
					 <tfoot>
        </tfoot>
					<tbody>
						<%
			int sn=1;
			%>
						<c:forEach items="${staffList }" var="s">
							<tr>
								<th scope="row"><%=sn %></th>
								<td>${s.staffCode }</td>
								<td>${s.staffName }</td>
								<td>${s.staffAddress }</td>
								<td>${s.post }</td>
								<td>
								<a href="<spring:url value="/staff/edit/${s.staffCode }" />">Edit</a>
								</td>
							</tr>
							<%sn++;%>
						</c:forEach>
					</tbody>
				</table>
		<tag:footer/>