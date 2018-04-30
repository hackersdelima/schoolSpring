<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/invoice/review" var="formUrl"/>
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

	<div class="row">

		<div class="col-md-12">
			<header class="clearfix">
				<form id="addBillForm" method="post" action="${formUrl }"></form>
				<div id="logo"></div>
				<center>
					<h2 class="name">
						<strong>STUDENT FEE INVOICE</strong>
					</h2>
				</center>
				<div id="seller">
					<div>
						<span class="label label-default">From Date(English)*</span> <br>
						<input type="text" maxlength="10" id="englishDate"
							class="form-control date" name="fromDateEn" form="addBillForm" value="${sessionScope.feeInvoice.fromDateEn }"
							placeholder="yyyy-mm-dd" >
					</div>
					<br>
					<div>
						<span class="label label-default ">From Date(Nepali)*</span> <br>
						<input type="text" maxlength="10" id="nepaliDate" name="fromDateNep"
							class="form-control date" placeholder="yyyy-mm-dd"  value="${sessionScope.feeInvoice.fromDateNep }">
					</div>
				</div>
				<div id="client">
					<div>
						<span class="label label-default ">To Date(English)*</span> <br>
						<input type="text" maxlength="10" id="englishDate1"
							class="form-control date" name="toDateEn" form="addBillForm"
							placeholder="yyyy-mm-dd" value="${sessionScope.feeInvoice.toDateEn }">
					</div>
					<br>
					<div>
						<span class="label label-default ">To Date(Nepali)*</span> <br>
						<input type="text" maxlength="10" id="nepaliDate1" name="toDateNep"
							class="form-control date" placeholder="yyyy-mm-dd" value="${sessionScope.feeInvoice.toDateNep }" >
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
							form="addBillForm" value="${sessionScope.feeInvoice.invoiceNo }">
					</h4>

					<h4 class="name">
						<span class="label label-default">Student Admission No*</span><input
							type="text" class="form-control " name="student.studentid" value="${sessionScope.feeInvoice.student.studentid }"
							form="addBillForm" >
					</h4>
				</div>
				<div id="client">

					<div class="date">
						<span class="label label-default">Bill Date(English)*</span> <input
							type="text" maxlength="10" id="billDateEnglish"
							class="form-control date" name="invoiceDateEn" form="addBillForm"
							placeholder="yyyy-mm-dd" value="${sessionScope.feeInvoice.invoiceDateEn }" >
					</div>
					<br>
					<div class="date">
						<span class="label label-default">Bill Date(Nepali)*</span> <input
							type="text" maxlength="10" id="billDateNepali" name="invoiceDateNep"
							class="form-control date" placeholder="yyyy-mm-dd" value="${sessionScope.feeInvoice.invoiceDateNep }">
					</div>
				</div>

			</div>

			<table border="0" cellspacing="0" cellpadding="0">
				<thead>
					<tr>
						<th class="desc"><button class="btn btn-default add">+</button></th>
						<th colspan="1">Category</th>
						<th class="desc" colspan="4">DESCRIPTION</th>
						<th class="desc" colspan="1">CHARGES</th>
						<th class="desc" colspan="1">PAYMENTS</th>
						<th class="total itemdetailinput " colspan="1">BALANCE</th>

					</tr>
				</thead>
				<tbody>


					<tr id="tablerow">
						<td><button onclick="deleteRow(this)" class="removebutton">X</button></td>
						<td colspan="1"><select class="form-control"
							name="category.categoryId" form="addBillForm" >
								<option value="">Select</option>
								<c:forEach items="${categorylist }" var="c">
									<option value="${c.categoryId }">${c.categoryHead }</option>
								</c:forEach>
						</select></td>
						<td class="desc" colspan="4"><input type="text"
							class="form-control input" name="description" form="addBillForm" value=""
							></td>
						<td class="desc" colspan="1"><input type="text"
							class="form-control one" name="charges" form="addBillForm"
							></td>
						<td class="desc" colspan="1"><input type="text"
							class="form-control two" name="payments" id="itemName"
							form="addBillForm" ></td>
						<td class="total" colspan="1"><input
							class="form-control balance" type="number" step="any"
							name="balance" form="addBillForm" ></td>


					</tr>

				</tbody>
				<tfoot>

					<tr>
						<td colspan="7"></td>
						<td colspan="1">SUB-TOTAL(Rs)</td>
						<td><input class="form-control subtotal" type="number"
							step="any"  name="subTotal" value="${sessionScope.feeInvoice.subTotal }" form="addBillForm" readonly
							></td>
					</tr>
					<tr>
						<td colspan="7"></td>
						<td colspan="1"><span class="label label-default">Discount
								%*</span><br> <input form="addBillForm" name="discountPercentage"
							type="number" step="any" min=0 max=100
							class="form-control discountPercentage inputdetails " value="${sessionScope.feeInvoice.discountPercentage }"></td>

						<td><span class="label label-default">Discount(Rs)</span> <input
							value="0" form="addBillForm" name="discountAmount" type="number"
							step="any"  class="form-control discountAmount " value="${sessionScope.feeInvoice.discountAmount }" readonly
							></td>
					</tr>
					<tr>
						<td colspan="7"></td>
						<td colspan="1">TOTAL(Rs)</td>
						<td><input class="form-control resulttotal" type="number"
							step="any"  form="addBillForm" name="total" value="${sessionScope.feeInvoice.total }"
							readonly></td>
					</tr>
					<tr>
						<td colspan="7"></td>
						<td colspan="1"><span class="label label-default">TAX
								%*</span><br> <input name="taxPercentage" form="addBillForm"
							step="any" type="number" min=0 max=100
							class="form-control taxPercentage inputdetails" value="${sessionScope.feeInvoice.taxPercentage }"></td>
						<td><span class="label label-default">TAX Amount(Rs)</span> <input
							value="0" name="taxAmount" form="addBillForm" type="number"
							step="any"  class="form-control taxAmount" value="${sessionScope.feeInvoice.taxAmount }"></td>
					</tr>

					<tr>
						<td colspan="7"></td>
						<td colspan="1">GRAND TOTAL(Rs)</td>
						<td><input name="grandTotal" id="grand-total" form="addBillForm"
							type="number" step="any"  class="form-control grandTotal" value="${sessionScope.feeInvoice.grandTotal }"
							 readonly></td>
					</tr>
					<tr>
						<td colspan="7"></td>
						<td colspan="1">AMOUNT PAID(Rs)</td>
						<td><input name="amountPaid" id="number" form="addBillForm"
							type="number" step="any"  class="form-control" value="${sessionScope.feeInvoice.amountPaid }"
							></td>
					</tr>
					<tr>
						<td colspan="7"></td>
						<td colspan="1">BALANCE DUE(Rs)</td>
						<td><input name="balanceDue" id="balance-due" form="addBillForm"
							type="number" step="any"  class="form-control" value="${sessionScope.feeInvoice.balanceDue }"
							></td>
					</tr>
					<tr>
						<td colspan="6"></td>
						<td colspan="1"><h5>IN WORDS</h5></td>
						<td colspan="2"><textarea id="result" cols="30"
								name="inwords" form="addBillForm" class="form-control" value="${sessionScope.feeInvoice.inwords }"
								rows="3" readonly></textarea></td>
					</tr>
					<tr>
						<td colspan="6"></td>
						<td colspan="1"><h5>REMARKS</h5></td>
						<td colspan="2"><textarea id="remarks" cols="30"
								name="remarks" form="addBillForm" class="form-control" rows="3" value="${sessionScope.feeInvoice.remarks }"></textarea></td>
					</tr>
				</tfoot>
			</table>

			<div id="notices">
				<div>
					<button class="btn btn-danger submitbtn" type="submit" form="addBillForm">SUBMIT</button>
				</div>
				<div class="notice"></div>
			</div>

			</main>
		</div>

		<div class="col-md-1"></div>
	</div>
	<script src="<spring:url value="/resources/js/dynamicpurchase.js"/>"></script>
	<script src="<spring:url value="/resources/js/dateAction.js"/>"></script>
	<script>

	$("table").on("change", "input", function () {  /* //use event delegation */
		  var tableRow = $(this).closest("tr");  /* //from input find row */
		  var one = Number(tableRow.find(".one").val());  /* //get first textbox */
		  var two = Number(tableRow.find(".two").val());  /* //get second textbox */
		  var balance = one - two; /*  //calculate total */
		  tableRow.find(".balance").val(balance); 
		});

$(document).on('blur', "input", function() {
	 calculateSubTotal();
}); 
 function calculateSubTotal(){
	  var sum = 0;
	   $(".balance").each(function(){
	        sum += +$(this).val();
	    });
	    $(".subtotal").val(sum);
	 
}
 
 $("#balance-due").focus(function(){
	 var grandTotal = $("#grand-total").val();
	 var amountPaid = $("#number").val();
	 var balanceDue = grandTotal - amountPaid;
	$("#balance-due").val(balanceDue); 
 });
 
 $('#englishDate1').change(function(){
		$('#nepaliDate1').val(AD2BS($('#englishDate1').val()));
	});

	$('#nepaliDate1').change(function(){
		$('#englishDate1').val(BS2AD($('#nepaliDate1').val()));
	});
	
	$(".date").keyup(function(){
        if ($(this).val().length == 4){
            $(this).val($(this).val() + "-");
        }else if ($(this).val().length == 7){
            $(this).val($(this).val() + "-");
        }
    });
	</script>
</body>

</html>