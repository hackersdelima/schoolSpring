<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<tag:header title="ADD NEW SUBJECT"/>
			
			<c:if test="${empty sub }">
			<spring:url value="/operation/addsubject" var="formUrl"/>
			</c:if>
				<c:if test="${not empty sub }">
			<spring:url value="/operation/editSubject/${sub.subjectid }" var="formUrl"/>
			</c:if>
				<form:form action="${formUrl }" id="form">
				
				<c:if test="${empty sub }">
				
					<button type="submit" class="btn btn-success" form="form">
						<i class="fa fa-check"></i> Save
					</button>
					</c:if>
					<c:if test="${not empty sub }">
					
					<button type="submit" form="form"  class="btn btn-primary" >Update</button>
					</c:if>

					<table class="table">
						<tbody>
							<tr>
								<td><h6>Subject Code *</h6> <input type="text"
									class="form-control" name="subjectcode" form="form" value="${sub.subjectcode }" required></td>
								<td><h6>Subject Name *</h6> <input type="text"
									class="form-control" name="subjectname" form="form"  value="${sub.subjectname }" required></td>
								<td><h6>Subject Type *</h6> <select class="form-control"
									name="subjecttype" form="form" required>
										<option value="" selected>Select subject type</option>
										<c:if test="${empty sub }">
										<option value="common">Common</option>
										<option value="optional">Optional</option>
										</c:if>
										
										<c:if test="${not empty sub }">
										<option value="common" <c:if test="${sub.subjecttype eq 'common' }">selected</c:if> >Common</option>
										<option value="optional" <c:if test="${sub.subjecttype eq 'optional' }">selected</c:if>>Optional</option>
										</c:if>
								</select></td>
								<td><h6>Th Full Marks*</h6> <input type="text"
									class="form-control" name="fullmarks" form="form" value="${sub.fullmarks }" pattern="[0-9]+" required></td>
								<td><h6>Pr Full Marks*</h6> <input type="text"
									class="form-control" name="fullmarks_pr" form="form" value="${sub.fullmarks_pr }"  pattern="[0-9]+"required></td>
								<td><h6>Th Pass Marks*</h6> <input type="text"
									class="form-control" name="passmarks" form="form" value="${sub.passmarks }" pattern="[0-9]+" required></td>
								<td><h6>Pr Pass Marks*</h6> <input type="text"
									class="form-control" name="passmarks_pr" form="form" value="${sub.passmarks_pr }"  pattern="[0-9]+" required></td>
							</tr>
						</tbody>
					</table>
				</form:form>
		<tag:footer/>
	<div class="col-md-12 col-sm-12 col-xs-12">

		<div class="x_panel">
			<div class="x_title">
				<h2>AVAILABLE SUBJECTS LIST</h2>
				<ul class="nav navbar-right panel_toolbox">
					<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
					</li>
					<li><a class="close-link"><i class="fa fa-close"></i></a>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<table id="datatable"
					class="table jambo_table table-striped table-bordered"
					style="font-size: 95%;">
					<thead>
					<tr class="tbltophead">
						<th colspan="3">SUBJECT</th>
						<th colspan="2">FULL MARKS</th>
						<th colspan="2">PASSMARKS</th>
						<th rowspan="2">ACTION</th>
						
					
					</tr>
						<tr class="headings">
							<th>Subject Code</th>
							<th>Subject Name</th>
							<th>Subject Type</th>
							
							<th>Theory</th>
							<th>Practical</th>
							
							<th>Theory</th>
							<th>Practical</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${subject }" var="sub">
						<tr>
							<td>${sub.subjectCode }</td>
							<td>${sub.subjectname }</td>
							<td>${sub.subjecttype }</td>
							
							<td>${sub.subjects.fullmarks }</td>
							<td>${sub.subjects.fullmarks_pr }</td>
							
							<td>${sub.subjects.passmarks }</td>
							<td>${sub.subjects.passmarks_pr }</td>
							
							<td><a href="<spring:url value="/operation/viewEditSubject/${sub.subjectid }"></spring:url>">Edit</a></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script>
		$('#form').submit(function() {
			return confirm('CONFIRM SUBJECT SAVE?');
		});
		$('.delete').click(function() {
			return confirm('CONFIRM SUBJECT DELETE?');
		});
		
	</script>
	