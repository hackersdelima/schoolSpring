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
				href="<spring:url value="/claimbill/add" />">Edit</a> <a
				class="btn btn-danger" id="cancel"
				href="<spring:url value="/claimbill/cancel" />">Cancel</a> <a
				class="btn btn-success" href="<spring:url value="/claimbill/save" />">Save</a>
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
				<br> Admission No: ${sessionScope.claimBill.student.studentid }
			</h4>

			<table id="meta">
				<tr>
					<td class="meta-head">Invoice #</td>
					<td><p>${sessionScope.claimBill.invoiceNo }</p></td>
				</tr>
				<tr>
					<td class="meta-head">Invoice Date</td>
					<td><p id="date">${sessionScope.claimBill.invoiceDateEn }</p></td>
				</tr>
				<tr>

					<td class="meta-head">Date From</td>
					<td><p id="date">${sessionScope.claimBill.fromDateEn }</p></td>
				</tr>
				<tr>

					<td class="meta-head">Date To</td>
					<td><p id="date">${sessionScope.claimBill.toDateEn }</p></td>
				</tr>

			</table>

		</div>

		<table id="items">
<tbody>
			<tr>
				<th>S.No</th>
				<th>Category</th>
				<th>Nontaxable Amount</th>
				<th>Taxable Amount</th>
				<th>Total Amount</th>
			</tr>
			<c:forEach items="${sessionScope.claimBill.category.categoryIdList }" var="desc"
				varStatus="descIndex">
				<tr class="item-row">
					<td>${descIndex.index +1 }</td>
					<td class="item-name">${sessionScope.claimBill.category.categoryHeadList[descIndex.index] }</td>
					<td><p class="cost">${sessionScope.claimBill.nontaxableamount[descIndex.index] }</p></td>
					<td><p class="qty">${sessionScope.claimBill.taxableamount[descIndex.index] }</p></td>
					<td><span class="price">${sessionScope.claimBill.totalamount[descIndex.index] }</span></td>
				</tr>
			</c:forEach>
			</tbody>
			<tfoot>
			<tr>
				<td colspan="2">Total Fees</td>
				<td>${sessionScope.claimBill.nontaxable_totalfees }</td>
				<td>${sessionScope.claimBill.taxable_totalfees }</td>
				<td>${sessionScope.claimBill.totalfees }</td>
			</tr>
			<tr>
				<td colspan="2">Less:Scholarship/Discount</td>
				<td>${sessionScope.claimBill.nontaxable_discount }</td>
				<td>${sessionScope.claimBill.taxable_discount }</td>
				<td>${sessionScope.claimBill.totaldiscount }</td>
			</tr>
			<tr>
				<td colspan="2">Total Amount</td>
				<td>${sessionScope.claimBill.nontaxable_total }</td>
				<td>${sessionScope.claimBill.taxable_total }</td>
				<td>${sessionScope.claimBill.total }</td>
			</tr>
			<tr>
				<td colspan="3">Education Service Tax(%)</td>
				<td>${sessionScope.claimBill.tax_percentage }</td>
				<td>${sessionScope.claimBill.tax_amount }</td>
			</tr>
			<tr>
				<td colspan="4">Grand Total</td>
				<td>${sessionScope.claimBill.grand_total }</td>
				
			</tr>
			<tr>
				<td colspan="4">Dr/Cr Previous Balance</td>
				<td>${sessionScope.claimBill.drcr_previous_balance }</td>
				
			</tr>
			<tr>
				<td colspan="4">Total Receivable</td>
				<td>${sessionScope.claimBill.total_receivable }</td>
				
			</tr>
			</tfoot>
		</table>
		<div>
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