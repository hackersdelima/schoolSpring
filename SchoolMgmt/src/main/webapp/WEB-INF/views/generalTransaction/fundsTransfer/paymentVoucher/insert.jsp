<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/paymentVoucher/add" var="formUrl" />
<jsp:include page="../../../include.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Purchase Invoice</title>
<link rel="stylesheet"
	href="<spring:url value="/resources/css/invoice.css"/>" media="all" />
<style>
.displaynone {
	display: none;
}

.itemdetailinput {
	width: 10%;
}

.inputdetails {
	width: 60%;
	float: right;
}

.top {
	width: 65%;
	float: right;
}
</style>
</head>
<body class="background">
	<form action="${formUrl }" method="post">
		<input type="hidden" name="receivedby"
			value="${sessionScope.userDetail.username }">

		<div class="row">

			<div class="col-md-12">
				<header class="clearfix">

					<div id="logo"></div>
					<center>
						<h2 class="name">
							<strong>PAYMENT VOUCHER</strong>
						</h2>
					</center>
					<hr>

					<div id="seller">
						<div>
							<h3>${sessionScope.systemdetail[0].settingsdescription }</h3>
							<h4>${sessionScope.systemdetail[2].settingsdescription }</h4>
							<h4>${sessionScope.systemdetail[3].settingsdescription }</h4>
							<h4>${sessionScope.systemdetail[7].settingsdescription }</h4>

						</div>
					</div>

				</header>
				<main>

				<div id="details" class="clearfix">
					<div id="seller">

						<h4 class="name">
							<span class="label label-default">Transaction Id*</span><input
								type="text" class="form-control " name="transactionId" value="">
						</h4>

						<h4 class="name">
							<span class="label label-default">Reference No*</span><input
								type="text" class="form-control " id="referenceNo"
								name="referenceNo" value="">
						</h4>
					</div>

					<div id="client">

						<div class="date">
							<span class="label label-default">Booking Eng Date*</span> <input
								type="text" maxlength="10" id="bookingDateen"
								class="form-control date" name="bookingDateen"
								placeholder="yyyy-mm-dd" value="">
						</div>
						<br>
						<div class="date">
							<span class="label label-default">Booking nep Date*</span> <input
								type="text" maxlength="10" id="bookingDate" name="bookingDate"
								class="form-control date" placeholder="yyyy-mm-dd" value="">
						</div>
					</div>
					<div id="client">
						<div class="date">
							<span class="label label-default">Value Eng Date*</span> <input
								type="text" maxlength="10" id="valueDateen"
								class="form-control date" name="valueDateen"
								placeholder="yyyy-mm-dd" value="">
						</div>
						<br>
						<div class="date">
							<span class="label label-default">Value nep Date*</span> <input
								type="text" maxlength="10" id="valueDate" name="valueDate"
								class="form-control date" placeholder="yyyy-mm-dd" value="">
						</div>
					</div>
				</div>

				<table border="0" cellspacing="0" cellpadding="0">
					<thead>
						<tr>
							<th class="desc"><a onclick="addRow()" id="newrow">Add
									Row+</a></th>
							<th colspan="1">Account No</th>
							<th class="desc" colspan="1">Dr/Cr</th>
							<th class="desc" colspan="1">Amount</th>

						</tr>
					</thead>
					<tbody>
									<tr id="tablerow">
										<td><button onclick="deleteRow(this)"
												class="removebutton">X</button></td>
										<td colspan="1">
										<input type="text"
											class="form-control" name="paymentVoucherAccount.accountNo"
											value="">
										</td>

										<td class="desc" colspan="1"><select 
											class="form-control one" name="paymentVoucherAccount.drcr" required>
											<option value="">None</option>
											<option value="dr">Dr.</option>
											<option value="cr">Cr.</option>
											</select></td>
										<td class="desc" colspan="1"><input type="text"
											class="form-control two" name="paymentVoucherAccount.amount" id="amount"
											value=""></td>
									</tr>
					</tbody>
					<tfoot>
<tr>
							<td colspan="2"></td>
							<td colspan="1"><h5>NARRATION</h5></td>
							<td colspan="1"><textarea id="narration" cols="30"
									name="narration" class="form-control" rows="3"></textarea></td>
						</tr>
						<tr>
							<td colspan="2"></td>
							<td colspan="1">Total Debit Amount</td>
							<td><input class="form-control totalDebitAmount" type="number"
								step="any" name="totalDebitAmount"
								value="" readonly></td>
						</tr>
						
						<tr>
							<td colspan="2"></td>
							<td colspan="1">Total Credit Amount</td>
							<td><input class="form-control totalCreditAmount" type="number"
								step="any" name="totalCreditAmount"
								value="" readonly></td>
						</tr>
						
						<tr>
							<td colspan="2"></td>
							<td colspan="1"><h5>IN WORDS</h5></td>
							<td colspan="3"><textarea id="result" cols="30"
									name="inwords" class="form-control" rows="3" readonly></textarea></td>
						</tr>
						<tr><td>Prepared By:</td>
							<td><input type="text" class="form-control" name="preparedBy" value="${sessionScope.userDetail.username}"></td>
						<td>Checked By:</td>
							<td><input type="text" class="form-control" name="checkedBy" value=""></td>
						
						</tr>
						<tr><td>Approved By:</td>
							<td><input type="text" class="form-control" name="approvedBy" value=""></td>
						</tr>
						
						
					</tfoot>
				</table>

				<div id="notices">
					<div class="form-group">
						<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">

							<button class="btn btn-info" type="button" id="validate">Validate</button>
							<a class="btn btn-danger" id="cancel"
								href="<spring:url value="/invoice/cancel" />">Cancel</a> <input
								type="submit" class="btn btn-success" value="Submit">

						</div>
					</div>

					<div class="notice"></div>
				</div>

				</main>
			</div>

			<div class="col-md-1"></div>
		</div>
	</form>
	<script src="<spring:url value="/resources/js/dateAction.js"/>"></script>
	<script>
	function deleteRow(btn) {
		  var row = btn.parentNode.parentNode;
		  row.parentNode.removeChild(row);
		};
		 function addRow() {
			   var tbody = $("table tbody");
			   tbody.find("tr:eq(0)").clone().appendTo(tbody).find("input, select").val("");
			};
		
	</script>
</body>

</html>