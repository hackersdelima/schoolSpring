<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
					Teller Transaction</li>
			</ol>
		</nav>
	</div>
	<div class="panel panel-default " style="width: 95%; margin: auto;">
		<div class="panel-heading">
			<h4>Add Teller Transaction</h4>
		</div>
		<div class="panel-body">

			<form class="form-horizontal shareCertForm" id="form1" method="post"
				action="teller.add">
				<div id="1" class="tab-pane fade in active">
					<table class="table">
						<tbody>
						<tr>
								<td><input type="submit" class="btn btn-success"
									value="Save"></td>
							</tr>
							<tr>
								<td><h5>Transaction Id</h5> <input type="text"
									class="form-control" name="transactionid" value="">
								</td>
							</tr>
							<tr>
								<td><h5>Branch Id</h5> <input type="text"
									class="form-control" name="branchid" value="">
								</td>
								<td><h5>Booking Date</h5> <input type="text"
									class="form-control" name="bookingdate" value="">
								</td>
								<td><h5>Value Date</h5> <input type="text"
									class="form-control" name="valuedate" value="">
								</td>
							</tr>
							<tr>
								<td><h5>Process Date</h5> <input type="text"
									class="form-control" name="processdate" value="">
								</td>
								<td><h5>Debit Account Number</h5> <input type="text"
									class="form-control" name="debitaccountnumber" value="">
								</td>
								<td><h5>Credit Account Number</h5> <input type="text"
									class="form-control" name="creditaccountnumber" value="">
								</td>
							</tr>
							<tr>
								<td><h5>Narrative</h5> <input type="text"
									class="form-control" name="narrative" value="">
								</td>
								<td><h5>Cheque Number</h5> <input type="text"
									class="form-control" name="chequenumber" value="">
								</td>
								<td><h5>Amount</h5> <input type="text"
									class="form-control" name="amount" value="">
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="/msgmodal"></jsp:include>
	<script type="text/javascript" src="assets/js/form.js"></script>
	<script>
	<%if(request.getAttribute("msg")!=null){%>
	   $('#myModal').modal('show');
	   <%}%>
	  
</script>
</body>
</html>
