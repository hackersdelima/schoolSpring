<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../include.jsp"></jsp:include>


<html>
<head></head>
<body class="background">
	<div class="breadcrumb-line">
		<nav aria-label="breadcrumb" role="navigation">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home"
					aria-hidden="true"></i>&nbsp;<a href="#">Claim Bill</a></li>
				
			</ol>
		</nav>
	</div>
	<div class="col-md-12 col-sm-12 col-xs-12">

		<div class="x_panel">
			<div class="x_title">
				<h2>CLAIM BILL</h2>
				<ul class="nav navbar-right panel_toolbox">
					<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
					</li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
			
		
			<spring:url value="/claimbill/viewClassClaimBill" var="formUrl"/>
			<button type="submit" class="btn btn-success" form="form">
					<i class="fa fa-check"></i> Generate
				</button>
		
			
				
				<form:form action="${formUrl }" id="form">
				<table class="table">
					<tbody>
						<tr>
						
							<td><h6>Month *</h6> <select class="form-control " name="month"
									id="month">
									<option value="">Select Month</option>
									<c:forEach items="${monthlist }" var="m">
										<option value="${m.month }">${m.month }-${m.value }</option>
									</c:forEach>
								</select></td>
								
								<td><h6>
									<strong>Class*</strong>
								</h6>
								<select class="form-control class" name="classid" id="class" required>
									<option value="">Select Class</option>
									<c:forEach items="${classlist }" var="cl">
									<option value="${cl.classid }">${cl.classname }</option>
									</c:forEach>
									
									
								</select></td>
								
								<td>
								
								<h6>
									<strong>Section</strong>
								</h6>
								<select class="form-control" name="sectionname" id="section">
									<option value="n">Select Section</option>
									<c:forEach items="${section }" var="sec">
									<option value="${sec.sectionname }">${sec.sectionname}</option>
									</c:forEach>
								</select>
							
								</td>
							
						</tr>
					</tbody>
				</table>
				</form:form>
			</div>
		</div>
	</div>
	<%-- <div class="col-md-12 col-sm-12 col-xs-12">

		<div class="x_panel">
			<div class="x_title">
				<h2>AVAILABLE EXAM DETAILS</h2>
				<ul class="nav navbar-right panel_toolbox">
					<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
					</li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<table id="datatable"
					class="table jambo_table table-striped table-bordered"
					cellspacing="0" width="100%" id="table" style="font-size: 95%">
					<thead>
						<tr>
							<th>Exam Name</th>
							<th>Exam Type</th>
							<th>Start Date</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${examlist }" var="elist">
							<tr>
								<td>${elist.examname }</td>
								<td>${elist.examTypeModel.examtypename }</td>
								<td>${elist.startdate }</td>
								<td><a href="<spring:url value="/exam/editExam/${elist.examid }"></spring:url>">Edit</a></td>


							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div> --%>
	<script>
		$('#form').submit(function() {
			return confirm('CONFIRM SAVE?');
		});
		$('.delete').click(function() {
			return confirm('CONFIRM EXAM DELETE?');
		});
		

	function nepaliToEnglish(nepalidate,englishdate){
		var date = $(nepalidate).val();
		var dataString = {'nepalidate' : date};
		$.ajax({
			type : "POST",
			url : "nepaliToEnglish",
			data : dataString,
			cache : false,
			success : function(html) {
			 	$(englishdate).val(html); 
			},
		error : function() {
			alert("error occured");
		}
		
		});
	}
	function englishToNepali(nepalidate,englishdate){
		var date = $(englishdate).val();
		var dataString = {
			'englishdate' : date
		};
		$.ajax({
			type : "POST",
			url : "englishToNepali",
			data : dataString,
			cache : false,
			success : function(html) {
				$(nepalidate).val(html);
			},
			error : function() {
				alert("error occured");
			}
		});
	}
	
	$('.delete').click(function() {
		return confirm('CONFIRM SUBJECT DELETE?');
	});
	</script>
</body>
</html>
