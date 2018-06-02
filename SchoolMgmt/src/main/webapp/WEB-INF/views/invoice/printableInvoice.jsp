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
				href="<spring:url value="/paymentVoucher/edit" />">Edit</a> <a
				class="btn btn-danger" id="cancel"
				href="<spring:url value="/invoice/cancel" />">Cancel</a> <a
				class="btn btn-success" href="<spring:url value="/invoice/save" />">Save</a>
				<a class="btn btn-danger" id="cancel" href="<spring:url value="/paymentVoucher/cancel" />">Cancel</a>
			<a class="btn btn-primary" href="#">Save & Print</a>

		</div>
	</div>
	<div id="page-wrap">

		<textarea id="header">INVOICE</textarea>

		<div id="identity">

			<p id="address" style="font-size: 150%">${sessionScope.systemdetail[0].settingsdescription },<br>
				${sessionScope.systemdetail[2].settingsdescription },<br>
				Phone: ${sessionScope.systemdetail[3].settingsdescription }
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
					<td class="meta-head">Invoice #</td>
					<td><p>${sessionScope.feeInvoice.invoiceNo }</p></td>
				</tr>
				<tr>
					<td class="meta-head">Invoice Date</td>
					<td><p id="date">${sessionScope.feeInvoice.invoiceDateEn }</p></td>
				</tr>
				<tr>

					<td class="meta-head">Date From</td>
					<td><p id="date">${sessionScope.feeInvoice.fromDateEn }</p></td>
				</tr>
				<tr>

					<td class="meta-head">Date To</td>
					<td><p id="date">${sessionScope.feeInvoice.toDateEn }</p></td>
				</tr>
				<tr>
					<td class="meta-head">Amount Due</td>
					<td><div class="due">${sessionScope.feeInvoice.balanceDue }</div></td>
				</tr>

			</table>

		</div>

		<table id="items">

			<tr>
				<th>S.No</th>
				<th>Category</th>
				<th>Description</th>
				<th>Charges</th>
				<th>Payment</th>
				<th>Balance</th>
			</tr>
			<c:forEach items="${sessionScope.feeInvoice.charges }" var="desc"
				varStatus="descIndex">
				<tr class="item-row">
					<td>${descIndex.index +1 }</td>
					<td class="item-name">${sessionScope.feeInvoice.category.categoryHeadList[descIndex.index]}</td>
					<td class="description">${desc }</td>
					<td><p class="cost">${sessionScope.feeInvoice.charges[descIndex.index] }</p></td>
					<td><p class="qty">${sessionScope.feeInvoice.discount[descIndex.index] }</p></td>
					<td><span class="price">${sessionScope.feeInvoice.balance[descIndex.index] }</span></td>
				</tr>
			</c:forEach>

			<tr>

				<td colspan="3" class="blank"></td>
				<td colspan="2" class="total-line">Subtotal</td>
				<td class="total-value"><div id="subtotal">${sessionScope.feeInvoice.subTotal }</div></td>
			</tr>
			<tr>
				<td colspan="3" class="blank"></td>
				<td colspan="2" class="total-line">Discount</td>
				<td class="total-value"><div id="subtotal">${sessionScope.feeInvoice.discountAmount }</div></td>
			</tr>
			<tr>

				<td colspan="3" class="blank"></td>
				<td colspan="2" class="total-line">Total</td>
				<td class="total-value"><div id="total">${sessionScope.feeInvoice.total }</div></td>
			</tr>
			<tr>
				<td colspan="3" class="blank"></td>
				<td colspan="2" class="total-line">Tax Amount</td>
				<td class="total-value"><div id="subtotal">${sessionScope.feeInvoice.taxAmount }</div></td>
			</tr>
			<tr>

				<td colspan="3" class="blank"></td>
				<td colspan="2" class="total-line">Grand Total</td>
				<td class="total-value"><div id="total">${sessionScope.feeInvoice.grandTotal }</div></td>
			</tr>
			<tr>
				<td colspan="3" class="blank"></td>
				<td colspan="2" class="total-line">Amount Paid</td>
				<td class="total-value"><p id="paid">${sessionScope.feeInvoice.amountPaid }</p></td>
			</tr>
			<tr>
				<td colspan="3" class="blank"></td>
				<td colspan="2" class="total-line balance">Balance Due</td>
				<td class="total-value balance"><div class="due">${sessionScope.feeInvoice.balanceDue }</div></td>
			</tr>

		</table>
		<div>
			<div class="col-md-6">
				<div id="terms">
					<h5>Remarks</h5>
					<p>${sessionScope.feeInvoice.remarks }</p>
				</div>

			</div>
			<div class="col-md-6">
				<div id="terms">
					<h5>In Words</h5>
					<p>${sessionScope.feeInvoice.inwords }</p>
				</div>

			</div>
			<div class="col-md-12">
			<div id="terms">
					<h5>Received By</h5>
					<p>${sessionScope.userDetail.fullName}</p>
				</div>
			</div>


		</div>
	</div>
</body>

</html>