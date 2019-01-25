<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/claimbill/review" var="formUrl" />
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
		<div id="notices" class="x_panel">
					<div class="form-group" class="x_title">
						<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3 x_content">

							<button class="btn btn-info" type="button" id="validate">Validate</button>
							<a class="btn btn-danger" id="cancel"
								href="<spring:url value="/invoice/cancel" />">Cancel</a> <input
								type="submit" class="btn btn-success" value="Submit">

						</div>
					</div>

					<div class="notice"></div>
				</div><br>

			<div class="col-md-12 x_panel">
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
								value="${sessionScope.claimBill.fromDateEn }"
								placeholder="yyyy-mm-dd">
						</div>
						<br>
						<div>
							<span class="label label-default ">From Date(Nepali)*</span> <br>
							<input type="text" maxlength="10" id="nepaliDate"
								name="fromDateNep" class="form-control date"
								placeholder="yyyy-mm-dd"
								value="${sessionScope.claimBill.fromDateNep }">
						</div>
					</div>
					<div id="client">
						<div>
							<span class="label label-default ">To Date(English)*</span> <br>
							<input type="text" maxlength="10" id="englishDate1"
								class="form-control date" name="toDateEn"
								placeholder="yyyy-mm-dd"
								value="${sessionScope.claimBill.toDateEn }">
						</div>
						<br>
						<div>
							<span class="label label-default ">To Date(Nepali)*</span> <br>
							<input type="text" maxlength="10" id="nepaliDate1"
								name="toDateNep" class="form-control date"
								placeholder="yyyy-mm-dd"
								value="${sessionScope.claimBill.toDateNep }">
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
								value="${sessionScope.claimBill.invoiceNo }">
						</h4>

						<h4 class="name">
							<span class="label label-default">Student Admission No*</span><input
								type="text" class="form-control " id="studentid" name="student.studentid"
								<c:if test="${not empty sessionScope.claimBill.student.studentid}">value="${sessionScope.claimBill.student.studentid }"</c:if><c:if test="${empty sessionScope.claimBill.student.studentid}">value="${s.studentid }"</c:if>>
						</h4>
					</div>
					<div id="client">

						<div class="date">
							<span class="label label-default">Bill Date(English)*</span> <input
								type="text" maxlength="10" id="billDateEnglish"
								class="form-control date" name="invoiceDateEn"
								placeholder="yyyy-mm-dd"
								value="${sessionScope.claimBill.invoiceDateEn }">
						</div>
						<br>
						<div class="date">
							<span class="label label-default">Bill Date(Nepali)*</span> <input
								type="text" maxlength="10" id="billDateNepali"
								name="invoiceDateNep" class="form-control date"
								placeholder="yyyy-mm-dd"
								value="${sessionScope.claimBill.invoiceDateNep }">
						</div>
					</div>

				</div>

				<table border="0" cellspacing="0" cellpadding="0">
					<thead>
						<tr>
							<th >Account No</th>
							<th>Category Id</th>
							<th>Category Head</th>
							<th class="desc" colspan="1">Non Taxable Amount</th>
							<th class="desc" colspan="1">Taxable Amount</th>
							<th class="total itemdetailinput " colspan="1">Total Amount</th>

						</tr>
					</thead>
					<tbody>
						<%-- <c:choose>
							<c:when test="${empty sessionScope.claimBill.category.categoryIdList}"> --%>
							<c:forEach items="${details}" var="c">
								<tr id="tablerow">
									
										<td><input type="text"
										class="form-control" name="account" value="${c.accountNumber }"></td>
										<td><input type="text"
										class="form-control" name="category.categoryIdList" value="${c.category.categoryId }"></td>
										<td><input type="text"
										class="form-control" name="category.categoryHeadList" value="${c.category.categoryHead }"></td>
									
									
									
									
									<td class="desc" colspan="1"><input type="text"
										class="form-control one" name="nontaxableamount" <c:if test="${c.taxable eq 'n' }">value="${c.frate }"</c:if>></td>
									<td class="desc" colspan="1"><input type="text"
										class="form-control two" name="taxableamount"
										<c:if test="${c.taxable eq 'y' }">value="${c.frate }"</c:if>></td>
									<td class="total" colspan="1"><input
										class="form-control balance" type="text"  value="${c.frate }"
										name="totalamount"></td>


								</tr>
								</c:forEach>
							<%-- </c:when> --%>
							<%-- <c:otherwise>
								<c:forEach items="${sessionScope.claimBill.category.categoryIdList }"
									var="desc" varStatus="descIndex">

									<tr id="tablerow">
									
									
										<td><input type="text"
										class="form-control" name="account" value="${c.accountNumber }"></td>
										<td><input type="text"
										class="form-control" name="category.categoryIdList" value="${c.categoryId }"></td>
										<td><input type="text"
										class="form-control" name="category.categoryHeadList" value="${c.categoryHead }"></td>
										<td class="desc" colspan="1"><input type="text"
											class="form-control one" name="nontaxableamount"
											value="${sessionScope.claimBill.nontaxableamount[descIndex.index] }"></td>
										<td class="desc" colspan="1"><input type="text"
											class="form-control two" name="taxableamount" id="taxableamount"
											value="${sessionScope.claimBill.taxableamount[descIndex.index] }"></td>
										<td class="total" colspan="1"><input
											class="form-control balance" type="text" 
											value="${sessionScope.claimBill.totalamount[descIndex.index] }"
											name="totalamount"></td>


									</tr>
								</c:forEach>
							</c:otherwise> --%>
						<%-- </c:choose>
					</tbody> --%>
					<tfoot>
<tr>
<td colspan="3">Total Fees</td>
<td ><input type="text" value="${sessionScope.claimBill.nontaxable_totalfees }" name="nontaxable_totalfees" class="form-control nontaxabletotal"></td>
<td ><input type="text" value="${sessionScope.claimBill.taxable_totalfees }" name="taxable_totalfees" class="form-control taxabletotal"></td>
<td class="total"><input type="text" value="${sessionScope.claimBill.totalfees }" name="totalfees" class="form-control subtotal " readonly></td>
</tr>
<tr>
<td colspan="3">Less:Scholarship/Discount</td>
<td><input class="form-control  col1discount" type="text"  name="nontaxable_discount" value="${sessionScope.claimBill.nontaxable_discount }"></td>
<td><input class="form-control col2discount" type="text" name="taxable_discount" value="${sessionScope.claimBill.taxable_discount }"></td>
<td class="total"><input class="form-control totaldiscount" type="text" name="totaldiscount"  value="${sessionScope.claimBill.totaldiscount}"></td>
</tr>
<tr>
<td colspan="3">Total Amount</td>
<td ><input class="form-control col1_total" type="text" name="nontaxable_total" value="${sessionScope.claimBill.nontaxable_total }"></td>
<td ><input class="form-control col2_total" type="text" name="taxable_total" value="${sessionScope.claimBill.taxable_total }"></td>
<td ><input class="form-control col3_total" type="text" name="total" value="${sessionScope.claimBill.total }"></td>
</tr>
<tr>
<td colspan="4">Education Service Tax(%)</td>
<td><input type="number" min=0 max=100 class="form-control taxPercentage inputdetails" name="tax_percentage" value="${sessionScope.claimBill.tax_percentage }"></td>
<td ><input type="text" class="taxAmount" name="tax_amount" value="${sessionScope.claimBill.tax_amount }"></td>
</tr>

<tr>
<td colspan="5">Grand Total</td>
<td><input type="text" class="gtotal" name="grand_total" value="${sessionScope.claimBill.grand_total }"></td>
</tr>
<tr>
<td colspan="5">Dr/Cr Previous Balance</td>
<td><input type="text" class="preBalance form-control" name="drcr_previous_balance" value="${sessionScope.claimBill.drcr_previous_balance }"></td>
</tr>
<tr>
<td colspan="5">Total Receivable</td>
<td><input type="text" class="totalReceivable form-control" name="total_receivable" value="${sessionScope.claimBill.total_receivable }"></td>
</tr>
					</tfoot>
				</table>

				

				</main>
			</div>

			<div class="col-md-1"></div>
		</div>
	</form>
	<script src="<spring:url value="/resources/js/dynamicpurchase.js"/>"></script>
	<script src="<spring:url value="/resources/js/dateAction.js"/>"></script>
	<script>
	$("table").on("change","select",function(){
		var tableRow = $(this).closest("tr");
		var categoryHead = tableRow.find(".category :selected").text();
		tableRow.find(".categoryHead").val(categoryHead);
	});
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
		$(document).on('click', "#validate", function() {
			
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