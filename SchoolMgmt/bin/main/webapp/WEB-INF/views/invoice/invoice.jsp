<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/invoice/review" var="formUrl" />
<jsp:include page="../include.jsp"></jsp:include>
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
	<input type="hidden" name="receivedby" value="${sessionScope.userDetail.username }">
	
		<div class="row">

			<div class="col-md-12">
				<header class="clearfix">

					<div id="logo"></div>
					<center>
						<h2 class="name">
							<strong>STUDENT FEE INVOICE</strong>
						</h2>
					</center>
					<hr>
					
					<div id="seller">
						<div>
							<span class="label label-default">From Date(English)*</span> <br>
							<input type="text" maxlength="10" id="englishDate"
								class="form-control date" name="fromDateEn"
								value="${sessionScope.feeInvoice.fromDateEn }"
								placeholder="yyyy-mm-dd">
						</div>
						<br>
						<div>
							<span class="label label-default ">From Date(Nepali)*</span> <br>
							<input type="text" maxlength="10" id="nepaliDate"
								name="fromDateNep" class="form-control date"
								placeholder="yyyy-mm-dd"
								value="${sessionScope.feeInvoice.fromDateNep }">
						</div>
					</div>
					<div id="client">
						<div>
							<span class="label label-default ">To Date(English)*</span> <br>
							<input type="text" maxlength="10" id="englishDate1"
								class="form-control date" name="toDateEn"
								placeholder="yyyy-mm-dd"
								value="${sessionScope.feeInvoice.toDateEn }">
						</div>
						<br>
						<div>
							<span class="label label-default ">To Date(Nepali)*</span> <br>
							<input type="text" maxlength="10" id="nepaliDate1"
								name="toDateNep" class="form-control date"
								placeholder="yyyy-mm-dd"
								value="${sessionScope.feeInvoice.toDateNep }">
						</div>
						<br>
					</div>

				</header>
				<main>

				<div id="details" class="clearfix">
					<div id="seller">

						<h4 class="name">
							<span class="label label-default">Invoice No*</span><input
								type="text" class="form-control " name="invoiceNo"
								value="${sessionScope.feeInvoice.invoiceNo }">
						</h4>

						<h4 class="name">
							<span class="label label-default">Student Admission No*</span><input
								type="text" class="form-control " id="studentid" name="student.studentid"
								value="${pid}" readonly>
						</h4>
					</div>
					<div id="client">

						<div class="date">
							<span class="label label-default">Bill Date(English)*</span> <input
								type="text" maxlength="10" id="billDateEnglish"
								class="form-control date" name="invoiceDateEn"
								placeholder="yyyy-mm-dd"
								value="${sessionScope.feeInvoice.invoiceDateEn }">
						</div>
						<br>
						<div class="date">
							<span class="label label-default">Bill Date(Nepali)*</span> <input
								type="text" maxlength="10" id="billDateNepali"
								name="invoiceDateNep" class="form-control date"
								placeholder="yyyy-mm-dd"
								value="${sessionScope.feeInvoice.invoiceDateNep }">
						</div>
					</div>

				</div>

				<table border="0" cellspacing="0" cellpadding="0">
					<thead>
						<tr>
							<th>Account Number </th>
							<th>Category Id</th>
							<th>Category Head</th>
							<th class="desc" colspan="1">Working Balance</th>
							<th class="desc" colspan="1">DISCOUNT</th>
							<th class="total itemdetailinput " colspan="1">BALANCE</th>

						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty sessionScope.feeInvoice.charges}">
							
								<c:forEach items="${scategory }" var="s">
								
								<c:if test="${not empty s.workingBal }">
								<tr id="tablerow">
								
								
										<td><input type="text"
										class="form-control" name="account" value="${s.accountNumber }"></td>
										<td><input type="text"
										class="form-control" name="category.categoryIdList" value="${s.categoryModel.categoryId }"></td>
										<td><input type="text"
										class="form-control" name="category.categoryHeadList" value="${s.categoryModel.categoryHead }"></td>
									
										
										<td class="desc" colspan="1"><input type="text"
										class="form-control one" name="charges" value="${s.workingBal }"></td>
									<td class="desc" colspan="1"><input type="text"
										class="form-control two" name="discount"
										value=""></td>
									<td class="total" colspan="1"><input
										class="form-control balance" type="number" step="any" value=""
										name="balance"></td>


								</tr>
								</c:if>
								</c:forEach>
							</c:when>
						
							<c:otherwise>
								<c:forEach items="${sessionScope.feeInvoice.charges }"
									var="desc" varStatus="descIndex">

									
											<tr id="tablerow">
								
								
										<td><input type="text"
										class="form-control " name="account" value="${s.accountNumber }"></td>
										<td><input type="text"
										class="form-control " name="category.categoryIdList" value="${sessionScope.feeInvoice.category.categoryIdList[descIndex.index] }"></td>
										<td><input type="text"
										class="form-control " name="category.categoryHeadList" value="${sessionScope.feeInvoice.category.categoryHeadList[descIndex.index] }"></td>
									
										
										<td class="desc" colspan="1"><input type="text"
										class="form-control one" name="charges" value="${s.workingBal }"></td>
									<td class="desc" colspan="1"><input type="text"
										class="form-control two" name="discount"
										value=""></td>
									<td class="total" colspan="1"><input
										class="form-control balance" type="number" step="any" value=""
										name="balance"></td>


								</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
					<tfoot>

						<tr>
							<td colspan="4"></td>
							<td colspan="1">SUB-TOTAL(Rs)</td>
							<td><input class="form-control subtotal" type="number"
								step="any" name="subTotal"
								value="${sessionScope.feeInvoice.subTotal }" readonly></td>
						</tr>
						<tr>
							<td colspan="4"></td>
							<td colspan="1"><span class="label label-default">Overall Discount
									%*</span><br> <input name="discountPercentage" type="number"
								step="any" min=0 max=100
								class="form-control discountPercentage inputdetails "
								value="${sessionScope.feeInvoice.discountPercentage }"></td>

							<td><span class="label label-default">Overall Discount(Rs)</span> <input
								value="0" name="discountAmount" type="number" step="any"
								class="form-control discountAmount "
								value="${sessionScope.feeInvoice.discountAmount }" readonly></td>
						</tr>
						<tr>
							<td colspan="4"></td>
							<td colspan="1">TOTAL(Rs)</td>
							<td><input class="form-control resulttotal" type="number"
								step="any" name="total"
								value="${sessionScope.feeInvoice.total }" readonly></td>
						</tr>
						<tr>
							<td colspan="4"></td>
							<td colspan="1"><span class="label label-default">TAX
									%*</span><br> <input name="taxPercentage" step="any"
								type="number" min=0 max=100
								class="form-control taxPercentage inputdetails"
								value="${sessionScope.feeInvoice.taxPercentage }"></td>
							<td><span class="label label-default">TAX Amount(Rs)</span>
								<input value="0" name="taxAmount" type="number" step="any"
								class="form-control taxAmount"
								value="${sessionScope.feeInvoice.taxAmount }"></td>
						</tr>

						<tr>
							<td colspan="4"></td>
							<td colspan="1">GRAND TOTAL(Rs)</td>
							<td><input name="grandTotal"  id="number" type="number"
								step="any" class="form-control grandTotal"
								value="${sessionScope.feeInvoice.grandTotal }" readonly></td>
						</tr>
						<tr>
							<td colspan="4"></td>
							<td colspan="1">AMOUNT PAID(Rs)</td>
							<td><input name="amountPaid" type="number" id="amount-paid"
								step="any" class="form-control"
								value="${sessionScope.feeInvoice.amountPaid }"></td>
						</tr>
						<tr>
							<td colspan="4"></td>
							<td colspan="1">BALANCE DUE(Rs)</td>
							<td><input name="balanceDue" id="balance-due" type="number"
								step="any" class="form-control"
								value="${sessionScope.feeInvoice.balanceDue }"></td>
						</tr>
						<tr>
							<td colspan="2"></td>
							<td colspan="1"><h5>IN WORDS</h5></td>
							<td colspan="3"><textarea id="result" cols="30"
									name="inwords" class="form-control" rows="3" readonly>${sessionScope.feeInvoice.inwords }</textarea></td>
						</tr>
						<tr>
							<td colspan="2"></td>
							<td colspan="1"><h5>REMARKS</h5></td>
							<td colspan="3"><textarea id="remarks" cols="30"
									name="remarks" class="form-control" rows="3">${sessionScope.feeInvoice.remarks }</textarea></td>
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
	<script src="<spring:url value="/resources/js/dynamicpurchase.js"/>"></script>
	<script src="<spring:url value="/resources/js/dateAction.js"/>"></script>
	<script>
		$("table").on("change", "input", function() { /* //use event delegation */
			var tableRow = $(this).closest("tr"); /* //from input find row */
			var one = Number(tableRow.find(".one").val()); /* //get first textbox */
			var two = Number(tableRow.find(".two").val()); /* //get second textbox */
			var balance = one - two; /*  //calculate total */
			tableRow.find(".balance").val(balance);
		});
		$("table").on("change","select",function(){
			var tableRow = $(this).closest("tr");
			var categoryHead = tableRow.find(".category :selected").text();
			tableRow.find(".categoryHead").val(categoryHead);
		});

		$(document).on('blur', "input", function() {
			calculateSubTotal();
		});
		function calculateSubTotal() {
			var sum = 0;
			$(".balance").each(function() {
				sum += +$(this).val();
			});
			$(".subtotal").val(sum);

		}
$("#studentid").blur(function(){
	
	
});
		$("#balance-due").focus(function() {
			var grandTotal = $("#number").val();
			var amountPaid = $("#amount-paid").val();
			var balanceDue = grandTotal - amountPaid;
			$("#balance-due").val(balanceDue);
		});
		 $("#validate").click(function()
					{
					membername();
					accountno();
					}); 
			 function membername(){
				 var id=$('.memberid').val();
					var dataString = 'id='+ id;
				 $.ajax
					({
					type: "POST",
					url: "../account/membername",
					data: dataString,
					cache: false,
					success: function(html)
					{
					$("#membername").val(html);
					$("#accountname").val(html);
					} 
					});
			 };
			 function accountno(){
				 var id=$('.memberid').val();
					var dataString = 'id='+ id;
				 $.ajax
					({
					type: "POST",
					url: "../account/generateAccNo",
					data: dataString,
					cache: false,
					success: function(html)
					{
					$("#accountno").val(html);
					} 
					});
			 }

		$('#englishDate1').change(function() {
			$('#nepaliDate1').val(AD2BS($('#englishDate1').val()));
		});

		$('#nepaliDate1').change(function() {
			$('#englishDate1').val(BS2AD($('#nepaliDate1').val()));
		});

		$(".date").keyup(function() {
			if ($(this).val().length == 4) {
				$(this).val($(this).val() + "-");
			} else if ($(this).val().length == 7) {
				$(this).val($(this).val() + "-");
			}
		});
		 function addRow() {
			   var tbody = $("table tbody");
			   tbody.find("tr:eq(0)").clone().appendTo(tbody).find("input, select").val("");
			};
		
	</script>
</body>

</html>