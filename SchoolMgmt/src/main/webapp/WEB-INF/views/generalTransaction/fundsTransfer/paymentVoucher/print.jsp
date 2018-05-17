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
<style type="text/css">
.background {
	background-color: transparent;
}
</style>

</head>

<body class="background">
	<div class="form-group">
		<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">

			<a class="btn btn-info" type="button"
				href="<spring:url value="/paymentVoucher/edit/" />">Edit</a> 
			<a class="btn btn-primary" href="#">Print</a>

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
				<br> Admission No: ${sessionScope.feeInvoice.student.studentid }
			</h4>

			<table id="meta">
				<tr>
					<td class="meta-head">Transaction Id #</td>
					<td><p></p></td>
				</tr>
				<tr>
					<td class="meta-head">Reference No</td>
					<td><p id="date"></p></td>
				</tr>
				<tr>

					<td class="meta-head">Value Eng Date</td>
					<td><p id="date"></p></td>
				</tr>
				<tr>

					<td class="meta-head">Value Nep Date</td>
					<td><p id="date"></p></td>
				</tr>
				<tr>
					<td class="meta-head">Booking Eng Date</td>
					<td><div class="due"></div></td>
				</tr>
				<tr>
					<td class="meta-head">Booking Nep Date</td>
					<td><div class="due"></div></td>
				</tr>

			</table>

		</div>

		<table id="items">
			<tbody>
				<tr>
					<th>S.No</th>
					<th>Account No</th>
					<th>Dr/Cr</th>
					<th>Amount</th>
				</tr>

				<tr class="item-row">
					<td></td>
					<td class="item-name"></td>
					<td class="description"></td>
					<td><p class="cost"></p></td>
				</tr>

			</tbody>
			<tfoot>
				<tr>

					<td colspan="2" class="total-line">Narration</td>
					<td class="total-value" colspan="2"></td>
				</tr>
				<tr>

					<td colspan="2" class="total-line">Total Debit Amount</td>
					<td class="total-value" colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2" class="total-line">Total Credit Amount</td>
					<td class="total-value" colspan="2"></div></td>
				</tr>
				<tr>
					<td colspan="2" class="total-line">Total Credit Amount</td>
					<td class="total-value" colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2" class="total-line">In Words</td>
					<td class="total-value" colspan="2"></td>
				</tr>
				<tr>
					<td colspan="1" class="total-line">Prepared By</td>
					<td class="total-value" colspan="1"></td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="1" class="total-line">Checked By</td>
					<td class="total-value" colspan="1"></td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="1" class="total-line">Approved By</td>
					<td class="total-value" colspan="1"></td>
					<td colspan="2"></td>
				</tr>
				
			</tfoot>



		</table>
		
	</div>
</body>

</html>