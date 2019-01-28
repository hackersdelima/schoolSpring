<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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

.ui-datepicker .ui-widget-content {
	background: #999 none;
}
</style>
</head>

<body class="background">
	<div class="breadcrumb-line">
		<nav aria-label="breadcrumb" role="navigation">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home"
					aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">Statements</li>
				
			</ol>
		</nav>
	</div>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2 class="col-md-6">Statements</h2>
				<ul class="nav navbar-right panel_toolbox">
					<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
					</li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
			<h2 class="col-md-6">Account Number: ${id }</h2>
			<h2 class="col-md-6">Account Name: ${name }</h2>
			<spring:url value="/nav/viewDateStatements/${id }" var="formUrl"/>
				<form action="${formUrl }" method="post">
				<table class="table" >
					
					<tbody>
					<tr>
							<td>From Date:</td>
							<td><input  id="min" type="text" name="fromDate"></td>
							
							<td>To Date:</td>
							<td><input  id="max" type="text" name="toDate"></td>
							<td></td>
							<td><input class="btn btn-primary" type="submit" value="Generate">
							</td>
							
						</tr>
						

					</tbody>
				</table>
				</form>

				<table id="example"
					class="table jambo_table table-striped table-bordered dt-responsive nowrap display"
					cellspacing="0" width="100%" style="font-size: 95%;'">
					<thead>

						<tr class="headings">
							<th>Booking Date</th>
							<th>Value Date</th>
							<th>Narrative</th>
							<th>Dr. Amount</th>
							<th>Cr. Amount</th>
							<th>Balance Amount</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${statements }" var="s">
							<tr>
								<td>${s.bookingDate }</td>
								<td>${s.valueDate }</td>
								<td>${s.narrative }</td>
								<td>${s.debitamount }</td>
								<td>${s.creditamount }</td>
								<td>${s.balanceamount }</td>

							</tr>

						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="modal fade bs-example-modal-lg" id="studentDetailModal"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content studentdetail"></div>
		</div>
	</div>

	<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
	
	<script>
	 
        /* $.fn.dataTable.ext.search.push(
    function (settings, data, dataIndex) {
            var min = $('#min').datepicker("getDate");
            var max = $('#max').datepicker("getDate");
           
            var dDate = new Date(data[0]);
            var day = dDate.getMonth()+1;
            var startDate=dDate.getFullYear()+"-"+day+"-"+dDate.getDate();
            if (min == null && max == null) { return true; }
            if (min == null && startDate <= max) { return true;}
            if(max == null && startDate >= min) {return true;}
            if (startDate <= max && startDate >= min) { return true; }
            return false;
        }
        ); */

        $(document).ready(function(){
		 	 var table = $('#example').DataTable();
            $("#min").datepicker({ onSelect: function () { table.draw(); }, changeMonth: true, changeYear: true ,dateFormat: 'yy-mm-dd'});
            $("#max").datepicker({ onSelect: function () { table.draw(); }, changeMonth: true, changeYear: true,dateFormat: 'yy-mm-dd'});
          

            // Event listener to the two range filtering inputs to redraw on input
            $('#min, #max').change(function () {
                table.draw();
            });
        });
	  </script>
</body>
</html>


