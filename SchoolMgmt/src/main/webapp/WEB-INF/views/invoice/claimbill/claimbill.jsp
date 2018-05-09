<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/invoice/review" var="formUrl" />
<jsp:include page="../../include.jsp"></jsp:include>
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
		<div class="row">

			<div class="col-md-12">
				<header class="clearfix">

					<div id="logo"></div>
					<center>
						<h2 class="name">
							<strong>Claim Bill INVOICE</strong>
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
								value="${sessionScope.feeInvoice.student.studentid }">
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
							<th class="desc"><a onclick="addRow()" id="newrow">Add
									Row+</a></th>
							<th colspan="1">Fee Description</th>
							<th class="desc" colspan="1">Non Taxable Amount</th>
							<th class="desc" colspan="1">Taxable Amount</th>
							<th class="total itemdetailinput " colspan="1">Total Amount</th>

						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty sessionScope.feeInvoice.charges}">
								<tr id="tablerow">
									<td><a onclick="deleteRow(this)" class="removebutton">X</a></td>
									<td colspan="1"><select class="form-control"
										name="category.categoryId">
											<option value="">Select</option>
											<c:forEach items="${categorylist }" var="c">
												<option value="${c.categoryId }">${c.categoryHead }</option>
											</c:forEach>
									</select></td>
									
									<td class="desc" colspan="1"><input type="text"
										class="form-control one" name="charges" value=""></td>
									<td class="desc" colspan="1"><input type="text"
										class="form-control two" name="discount"
										value=""></td>
									<td class="total" colspan="1"><input
										class="form-control balance" type="text"  value=""
										name="balance"></td>


								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${sessionScope.feeInvoice.charges }"
									var="desc" varStatus="descIndex">

									<tr id="tablerow">
										<td><button onclick="deleteRow(this)"
												class="removebutton">X</button></td>
										<td colspan="1"><select class="form-control"
											name="category.categoryId">
												<option value="">Select</option>
												<c:forEach items="${categorylist }" var="c">
													<option value="${c.categoryId }">${c.categoryHead }</option>
												</c:forEach>
										</select></td>
									
										<td class="desc" colspan="1"><input type="text"
											class="form-control one" name="charges"
											value="${sessionScope.feeInvoice.charges[descIndex.index] }"></td>
										<td class="desc" colspan="1"><input type="text"
											class="form-control two" name="payments" id="itemName"
											value="${sessionScope.feeInvoice.payments[descIndex.index] }"></td>
										<td class="total" colspan="1"><input
											class="form-control balance" type="text" 
											value="${sessionScope.feeInvoice.balance[descIndex.index] }"
											name="balance"></td>


									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
					<tfoot>
<tr>
<td colspan="2">Total Fees</td>
<td ><input type="text" value="" class="form-control nontaxabletotal"></td>
<td ><input type="text" value="" class="form-control taxabletotal"></td>
<td class="total"><input type="text" value=""  class="form-control subtotal " readonly></td>
</tr>
<tr>
<td colspan="2">Less:Scholarship/Discount</td>
<td><input class="form-control  col1discount" type="text"  value=""></td>
<td><input class="form-control col2discount" type="text"  value=""></td>
<td class="total"><input class="form-control totaldiscount" type="text" value=""></td>
</tr>
<tr>
<td colspan="2">Total Amount</td>
<td ><input class="form-control col1_total" type="text" value=""></td>
<td ><input class="form-control col2_total" type="text" value=""></td>
<td ><input class="form-control col3_total" type="text" value=""></td>
</tr>
<tr>
<td colspan="3">Education Service Tax(%)</td>
<td><input name="taxPercentage" type="number" min=0 max=100
								class="form-control taxPercentage inputdetails"
								value="${sessionScope.feeInvoice.taxPercentage }"></td>
<td ><input type="text" class="taxAmount" value=""></td>
</tr>

<tr>
<td colspan="4">Grand Total</td>
<td><input type="text" class="gtotal"></td>
</tr>
<tr>
<td colspan="4">Dr/Cr Previous Balance</td>
<td><input type="text" class="preBalance form-control"></td>
</tr>
<tr>
<td colspan="4">Total Receivable</td>
<td><input type="text" class="totalReceivable form-control"></td>
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
		$("table").on("keyup", "input", function() { /* //use event delegation */
			var tableRow = $(this).closest("tr"); /* //from input find row */
		
			var one = Number(tableRow.find(".one").val()); /* //get first textbox */
			
			var two = Number(tableRow.find(".two").val()); /* //get second textbox */
			if(one==""){
				tableRow.find(".balance").val(two);
			}
			else{
				tableRow.find(".balance").val(one);
			}
			
		});
		$(document).on('keyup', "input", function() {
			calculateSubTotal();
			calculateNonTaxable();
			calculateTaxable();
			col1diff();
			coldiscount();
			totaldiscount();
			col2discount();
			grandTotal();
			totalReceivable();
		});
//calculate total fees
		function calculateSubTotal() {
			var sum = 0;
			$(".balance").each(function() {
				sum += +$(this).val();
			});
			$(".subtotal").val(sum);
		}
		
/* scholorship/discount */
function col1diff(){
	var col1_diff=$(".nontaxabletotal").val()-$(".col1discount").val();
	$(".col1_total").val(col1_diff);
}
function coldiscount(){
	var coldiscount=Number($(".col1discount").val())+Number($(".col2discount").val());
	$(".totaldiscount").val(coldiscount);
}

/* Total fees */
	function calculateNonTaxable() {
			var sum = 0;
			$(".one").each(function() {
				sum += +$(this).val();
			});
			$(".nontaxabletotal").val(sum);

		}
		function calculateTaxable() {
			var sum = 0;
			$(".two").each(function() {
				sum += +$(this).val();
			});
			$(".taxabletotal").val(sum);

		}

function col2discount(){
	var col2_diff=$(".taxabletotal").val()-$(".col2discount").val();
	$(".col2_total").val(col2_diff);
	
};

function totaldiscount(){
	var col3_diff=$(".subtotal").val()-$(".totaldiscount").val();
	$(".col3_total").val(col3_diff);
	
};
		$("#balance-due").focus(function() {
			var grandTotal = $("#number").val();
			var amountPaid = $("#amount-paid").val();
			var balanceDue = grandTotal - amountPaid;
			$("#balance-due").val(balanceDue);
		});
		
		
		$("#validate").click(function() {
			var grandTotal = $("#number").val();
			var amountPaid = $("#amount-paid").val();
			var balanceDue = grandTotal - amountPaid;
			
			var nontaxAmount=$()
			$("#balance-due").val(balanceDue);
			
		});

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
			   tbody.find("tr:eq(0)").clone().appendTo(tbody).find("input").val("");
			};
			
			 //------------------------------------------------------TAX CALCULATION--------------------------------------------------
			  $(document).on('keyup',".taxPercentage",function(){
				 taxCalculator(); 
			  });
			  function taxCalculator(){
				  var taxPercentage=$('.taxPercentage').val();
				  var total=$('.col2_total').val();
				  var taxAmount=$('.taxAmount').val();
				  var tax=taxPercentage/100;
				  taxAmount=tax * total;
				  $('.taxAmount').val(taxAmount);
				  
				  
			  }
			  $(".taxPercentage").change(function(){
				  grandTotal();
			  });
			  
			  //--------------------Grand Total------------------------
			  function grandTotal(){
				  var gTotal=Number($(".col3_total").val())+Number($(".taxAmount").val());
				  $(".gtotal").val(gTotal);
				  
			  }
			  
			  //----------------Total Receivable----------------
			  function totalReceivable(){
				  var gTotal=Number($(".gtotal").val())+Number($(".preBalance").val());
				  $(".totalReceivable").val(gTotal);
			  }
	</script>
</body>

</html>