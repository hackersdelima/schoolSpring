<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../include.jsp"></jsp:include>
<spring:url value="/operation/assignsubjects" var="formUrl" />
<spring:url value="/operation/assignOptionalSubjects" var="optSubUrl" />


<body class="background">
	<div class="breadcrumb-line">
		<nav aria-label="breadcrumb" role="navigation">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home"
					aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">Academic</li>
				<li class="breadcrumb-item active" aria-current="page">Subjects</li>
				<li class="breadcrumb-item active" aria-current="page">Assign
					Subjects</li>
			</ol>
		</nav>
	</div>
	<div class="col-md-12 col-sm-12 col-xs-12">

		<div class="x_panel">
			<div class="x_title">
				<h2>ASSIGN COMMON SUBJECTS</h2>
				<ul class="nav navbar-right panel_toolbox">
					<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
					</li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<form:form method="post" action="${formUrl }" id="form"
					style="width: 100%">
					<div>
					<button type="submit" class="btn btn-success" form="form">
						<i class="fa fa-check"></i> Save
					</button>
					</div>
					
					<div>
					<div class="col-md-4">
							<h6>Class</h6> <select class="form-control" name="classid"
									form="form" id="class" required>
										<option value="">Select Class</option>
										<c:forEach items="${classlist }" var="c">
											<option value="${c.classid }">${c.classname }</option>
										</c:forEach>
								</select>
						</div>
					
					<div class="col-md-8">
							<table id="datatablesub"
								class="table jambo_table table-striped table-bordered "
								style="font-size: 95%;'">
								<thead>

									<tr class="headings">
										<th>Checkbox</th>
										<th>Subject Name</th>
										<th>Subject Code</th>
										

									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>Checkbox</th>
										<th>Subject Name</th>
										<th>Subject Code</th>
										

									</tr>
								</tfoot>
								<tbody>
									<c:forEach items="${subjectlist }" var="s">
										<tr>
											<td><input type="checkbox" name="subjectid"
												value="${s.subjectid }"></td>
											<td>${s.subjectCode }</td>
											<td>${s.subjectname }</td>
											

										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						</div>
				</form:form>
			</div>
		</div>
	</div>

	<div class="col-md-12 col-sm-12 col-xs-12">

		<div class="x_panel">
			<div class="x_title">
				<h2>ASSIGN OPTIONAL SUBJECTS</h2>
				<ul class="nav navbar-right panel_toolbox">
					<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
					</li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<form method="post" action="${optSubUrl }">
					<div>
						<button type="submit" class="btn btn-success">
							<i class="fa fa-check"></i> Save
						</button>
					</div>
					<div>
						<div class="col-md-4">
							<h6>Subjects</h6>
							<select class="form-control" name="optsubjectid">
								<c:forEach items="${optsubjectlist }" var="s">
									<option value="${s.subjectid }">${s.subjectCode }-${s.subjectname }</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-md-8">
							<table id="datatablee"
								class="table jambo_table table-striped table-bordered "
								  style="font-size: 95%;'">
								<thead>

									<tr class="headings">
										<th>Checkbox</th>
										<th>STUDENT NAME</th>
										<th>ROLL NO</th>
										<th class="select-filter">CLASS</th>

									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>Checkbox</th>
										<th>Student Name</th>
										<th>Roll No</th>
										<th>Class</th>

									</tr>
								</tfoot>
								<tbody>
									<c:forEach items="${slist }" var="s">
										<tr>
											<td><input type="checkbox" name="students"
												value="${s.studentid }"></td>
											<td>${s.studentname }</td>
											<td>${s.rollno }</td>
											<td>${s.admissionclass }</td>

										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>
	<div class="col-md-12 col-sm-12 col-xs-12">

		<div class="x_panel">
			<div class="x_title">
				<h2>Assigned Subjects List</h2>
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
						<tr>
							<th>CLASS</th>
							<th>SUBJECTS</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${assignedsubjects}" var="map">
							<tr>
								<td>${map.key }</td>
								<td>${map.value }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>


	<jsp:include page="../../msgmodal.jsp"></jsp:include>
	<script>
		$('#form').submit(function() {
			return confirm('CONFIRM SUBJECT SAVE?');
		});

		
	</script>
	<script>
	$(document).ready(function() {
	    $('#datatablee').DataTable( {
	    	"order": [[ 3, 'asc' ]], 
	    	"scrollY": '15vh',
	    	"paging":false,
	        initComplete: function () {
	            this.api().columns('.select-filter').every( function () {
	            	
	                var column = this;
	                var select = $('<select><option value="">Search</option></select>')
	                    .appendTo( $(column.footer()).empty() )
	                    .on( 'change', function () {
	                        var val = $.fn.dataTable.util.escapeRegex(
	                            $(this).val()
	                        );
	 
	                        column
	                            .search( val ? '^'+val+'$' : '', true, false )
	                            .draw();
	                    } );
	 
	                column.data().unique().sort().each( function ( d, j ) {
	                    select.append( '<option value="'+d+'">'+d+'</option>' )
	                } );
	            } );
	        }
	    } );
	} );</script>
	
	<script>
	$('#datatablesub').DataTable( {
    	"searching": false,
    	"scrollX": true,
    	"paging":false,
    	select: true,
    	scrollY:        '15vh'
	});
	</script>
</body>
