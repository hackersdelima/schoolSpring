<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../include.jsp"></jsp:include>
<html>
<head>
<style type="text/css">
tfoot input {
        width: 100%;
        padding: 3px;
        box-sizing: border-box;
    }
    </style></head>

<body class="background">
	<div class="breadcrumb-line">
		<nav aria-label="breadcrumb" role="navigation">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home"
					aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">Staff</li>
				<li class="breadcrumb-item active" aria-current="page">Staffs
					List</li>
			</ol>
		</nav>
	</div>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>AVAILABLE STAFFS</h2>
				<ul class="nav navbar-right panel_toolbox">
					<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
					</li>
				</ul>
				<a type="button" class="btn btn-info btn-sm pull-right" href="studentadmission.click">Add Student</a>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">

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
			</div>
		</div>
	</div>
</body>
</html>
