<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />

<title>Editable Invoice</title>
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link rel='stylesheet' type='text/css'
	href='${pageContext.request.contextPath}/resources/css/style.css' />
<link rel='stylesheet' type='text/css'
	href='${pageContext.request.contextPath}/resources/css/print.css'
	media="print" />
<style>
.borderless tfoot tr td {
	border: none
}

body {
	background: rgb(204, 204, 204);
}

page {
	background: white;
	display: block;
	margin: 0 auto;
	margin-bottom: 0.5cm;
	box-shadow: 0 0 0.5cm rgba(0, 0, 0, 0.5);
}

page[size="A4"] {
	width: 21cm;
	height: 29.7cm;
}

@media print {
	body, page {
		margin: 0;
		box-shadow: 0;
	}
}

@page {
	size: auto; /* auto is the current printer page size */
	margin: 0mm; /* this affects the margin in the printer settings */
}
</style>

</head>

<body class="background">
	<div class="form-group">
		<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">

			<a class="btn btn-info" type="button"
				href="<spring:url value="/nav/paymentVoucher" />">Edit</a> <a
				class="btn btn-danger" id="cancel"
				href="<spring:url value="/paymentVoucher/cancel" />">Cancel</a> <a
				class="btn btn-primary" href="#">Save & Print</a> <a
				class="btn btn-success"
				href="<spring:url value="/paymentVoucher/add"/>">Save</a>

		</div>
	</div>
	<div id="page-wrap">

		<textarea id="header">PAYMENT VOUCHER</textarea>

		<div id="identity">

			<p id="address" style="font-size: 150%">${sessionScope.systemdetail[0].settingsdescription },<br>
				${sessionScope.systemdetail[2].settingsdescription },<br>
				Phone: ${sessionScope.systemdetail[3].settingsdescription } Vat/Pan:
				${sessionScope.systemdetail[7].settingsdescription }
			</p>

			<div id="logo">
				<div id="logohelp">
					<input id="imageloc" type="text" size="50" value="" /><br /> (max
					width: 540px, max height: 100px)
				</div>
				<img id="image"
					src="${pageContext.request.contextPath}/resources/img/fds.png" />
			</div>

		</div>

		<div style="clear: both"></div>

		<div id="customer">

			<h4>
				<br> Admission No:
			</h4>

			<table id="meta">
				<tr>
					<td class="meta-head">Transaction Id #</td>
					<td><p>${paymentVoucher.transactionId }</p></td>
				</tr>
				<tr>
					<td class="meta-head">Reference No</td>
					<td><p id="date">${paymentVoucher.referenceNo }</p></td>
				</tr>
				<tr>

					<td class="meta-head">Value Eng Date</td>
					<td><p id="date">${paymentVoucher.valueDateen }</p></td>
				</tr>
				<tr>

					<td class="meta-head">Value Nep Date</td>
					<td><p id="date">${paymentVoucher.valueDate }</p></td>
				</tr>
				<tr>
					<td class="meta-head">Booking Eng Date</td>
					<td><div class="due">${paymentVoucher.bookingDateen }</div></td>
				</tr>
				<tr>
					<td class="meta-head">Booking Nep Date</td>
					<td><div class="due">${paymentVoucher.bookingDate }</div></td>
				</tr>

			</table>

		</div>

		<table id="items">
			<tbody>
				<tr>
					<th>S.No</th>
					<th>Account No</th>
					<th>Account Name</th>
					<th>Cheque No</th>
					<th>Dr/Cr</th>
					<th >Narration</th>
					<th>Amount</th>
				</tr>
				<c:forEach
					items="${paymentVoucher.paymentVoucherAccount.accountNo }"
					var="desc" varStatus="descIndex">
					<tr class="item-row">
						<td>${descIndex.index +1 }</td>
						<td class="item-name">${paymentVoucher.paymentVoucherAccount.accountNo[descIndex.index] }</td>
						<td class="item-name">${paymentVoucher.paymentVoucherAccount.accountName[descIndex.index] }</td>
						<td class="item-name">${paymentVoucher.paymentVoucherAccount.chequeNo[descIndex.index] }</td>
						<td class="description">${paymentVoucher.paymentVoucherAccount.drcr[descIndex.index] }</td>
						<td class="description">${paymentVoucher.paymentVoucherAccount.narration[descIndex.index] }</td>
						<td><p class="cost">${paymentVoucher.paymentVoucherAccount.amount[descIndex.index] }</p></td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>

					<td colspan="5" class="total-line">Narration</td>
					<td class="total-value" colspan="2">${paymentVoucher.narration }</td>
				</tr>
				<tr>

					<td colspan="5" class="total-line">Total Debit Amount</td>
					<td class="total-value" colspan="2">${paymentVoucher.totalDebitAmount }</td>
				</tr>
				<tr>
					<td colspan="5" class="total-line">Total Credit Amount</td>
					<td class="total-value" colspan="2">${paymentVoucher.totalCreditAmount }</td>
				</tr>
				
				<!-- <tr>
					<td colspan="3" class="total-line">In Words</td>
					<td class="total-value" colspan="2"></td>
				</tr> -->
				<tr>
					<td colspan="3" class="total-line">Prepared By</td>
					<td class="total-value" colspan="1"></td>
					<td colspan="3">${paymentVoucher.preparedBy }</td>
				</tr>
				<tr>
					<td colspan="3" class="total-line">Checked By</td>
					<td class="total-value" colspan="1"></td>
					<td colspan="3">${paymentVoucher.checkedBy }</td>
				</tr>
				<tr>
					<td colspan="3" class="total-line">Approved By</td>
					<td class="total-value" colspan="1"></td>
					<td colspan="3">${paymentVoucher.approvedBy }</td>
				</tr>

			</tfoot>



		</table>

	</div>
</body>

</html>