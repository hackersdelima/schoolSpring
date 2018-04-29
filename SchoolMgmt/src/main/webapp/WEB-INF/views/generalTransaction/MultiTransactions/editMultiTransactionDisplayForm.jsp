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

	
	<div class="panel panel-default " style="width: 95%; margin: auto;">
		
		<div class="panel-body">

			<form class="form-horizontal shareCertForm" id="form1" method="post"
				action="multitransaction.update">
				<div id="1" class="tab-pane fade in active">
					<table class="table">
						<tbody>
						<tr>
								<td><input type="submit" class="btn btn-success"
									value="Update"></td>
							</tr>
							<tr>
									
								<td><h5>Transaction Id</h5>
								<input type="hidden"
									class="form-control sharecertmemberid" name="previousid" value="${multitxn.transactionid }" > 
								<input type="text"
									class="form-control" name="transactionid" value="${multitxn.transactionid }" readonly>
								</td>
								<td><h5>Transaction Number</h5> <input type="text"
									class="form-control" name="transactionno" value="${multitxn.transactionno }">
								</td>
								<td><h5>Booking Date</h5> <input type="text"
									class="form-control" name="bookingdate" value="${multitxn.bookingdate }">
								</td>
							</tr>
							<tr>
								<td><h5>Process Date</h5> <input type="text"
									class="form-control" name="processdate" value="${multitxn.processdate }">
								</td>
								<td><h5>Account Number</h5> <input type="text"
									class="form-control" name="accountnumber" value="${multitxn.accountnumber }">
								</td>
								<td><h5>Dr/Cr</h5> <select class="form-control" name="drcr" value="${multitxn.drcr }">
								
								<option value="D" <c:if test="${multitxn.drcr eq 'D' }">selected</c:if>>Dr</option>
								<option value="C" <c:if test="${multitxn.drcr eq 'C' }">selected</c:if>>Cr</option>
								
								</select>
								</td>
							</tr>
							<tr>
								<td><h5>Value Date</h5> <input type="text"
									class="form-control" name="valuedate" value="${multitxn.valuedate }">
								</td>
								<td><h5>Amount</h5> <input type="text"
									class="form-control" name="amount" value="${multitxn.amount }">
								</td>
								<td><h5>Narrative</h5> <input type="text"
									class="form-control" name="narrative" value="${multitxn.narrative }">
								</td>
						
							</tr>
							<tr>
								<td><h5>Transaction Code</h5> <input type="text"
									class="form-control" name="transactioncode" value="${multitxn.transactioncode }">
								</td>
								<td><h5>Cheque Number</h5> <input type="text"
									class="form-control" name="chequenumber" value="${multitxn.chequenumber }">
								</td>
							<tr>
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
