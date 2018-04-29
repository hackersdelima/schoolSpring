<!doctype>
</html><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<jsp:include page="/includefile"></jsp:include>

<html>
<head>
<style>
h5 {
	font-size: 80%;
	font-weight: bold;
}
</style>
</head>
<body class="hiddenscroll bgcolor background">

	<div class="breadcrumb-line">
		<nav aria-label="breadcrumb" role="navigation">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home"
					aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">Transaction</li>
				<li class="breadcrumb-item active" aria-current="page">Add
					Multi Transaction</li>
			</ol>
		</nav>
	</div>
	<div class="panel panel-default " style="width: 95%; margin: auto;">
		<div class="panel-heading">
			<h4>Add Multi Transaction Details</h4>
		</div>
		<div class="panel-body">

			<form class="form-horizontal shareCertForm toggle-disabled" id="form1" method="post"
				action="multitransaction.add">
				<div id="1" class="tab-pane fade in active">
					<table class="table">
						<tbody>
						<tr>
								<td><input type="submit" class="btn btn-success"
									value="Save"></td>
							</tr>
							<tr>
								<td><h5>Transaction Id</h5> <input type="text"
									class="form-control" name="transactionid" data-validation="alphanumeric" data-validation-error-msg=" "  value="${mid }">
								</td>
								<td><h5>Transaction Number</h5> <input type="text"
									class="form-control" name="transactionno" data-validation="number" data-validation-error-msg=" " value="" >
								</td>
								<td><h5>Booking Date</h5> <input type="text"
									class="form-control" name="bookingdate"  data-validation="date" data-validation-error-msg=" " value="" data-validation-optional="true">
								</td>
							</tr>
							<tr>
								<td><h5>Process Date</h5> <input type="text"
									class="form-control" name="processdate" value="" data-validation="date" data-validation-error-msg=" " data-validation-optional="true">
								</td>
								<td><h5>Account Number</h5> <input type="text"
									class="form-control" name="accountnumber" value="" data-validation="number" data-validation-error-msg=" " data-validation-optional="true">
								</td>
								<td><h5>Dr/Cr</h5> <select class="form-control" name="drcr">
								
								<option value="D">Dr</option>
								<option value="C">Cr</option>
								
								</select>
								</td>
							</tr>
							<tr>
								<td><h5>Value Date</h5> <input type="text"
									class="form-control" name="valuedate" value="" data-validation="date" data-validation-error-msg=" " data-validation-optional="true">
								</td>
								<td><h5>Amount</h5> <input type="text"
									class="form-control" name="amount" value="" data-validation="number" data-validation-error-msg=" " data-validation-optional="true">
								</td>
								<td><h5>Narrative</h5> <input type="text"
									class="form-control" name="narrative" value="">
								</td>
						
							</tr>
							<tr>
								<td><h5>Transaction Code</h5> <input type="text"
									class="form-control" name="transactioncode" value="">
								</td>
								<td><h5>Cheque Number</h5> <input type="text"
									class="form-control" name="chequenumber" value="" data-validation="number" data-validation-error-msg=" " data-validation-optional="true">
								</td>
							<tr>
						</tbody>
					</table>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="/msgmodal"></jsp:include>
	<script>
  $.validate({
    lang: 'en',
    modules : 'date,toggleDisabled',
	  disabledFormFilter : 'form.toggle-disabled',
	 showErrorDialogs : false

    });
</script>
	<script type="text/javascript" src="assets/js/form.js"></script>
	<script>
	<%if(request.getAttribute("msg")!=null){%>
	   $('#myModal').modal('show');
	   <%}%>
	  
</script>
</body>
</html>
