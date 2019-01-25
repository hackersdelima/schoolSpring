<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/paymentVoucher/review" var="formUrl" />

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
table th {
    width: auto !important;
}
</style>
</head>
<body class="background">
	
	
	<form action="${formUrl }" method="post">
	<div class="x_panel">
		<input type="hidden" name="receivedby"
			value="${sessionScope.userDetail.username }">
		<spring:url value="/account/generateAccountName" var="accountNameUrl" />
		<input type="hidden" name="accountName" class="accountNameUrl"
			value="${accountNameUrl }">

		<div class="row">

			<div class="col-md-12">
				<header class="clearfix">

					<div id="logo"></div>

					<h2 class="name">
						<strong>PAYMENT VOUCHER</strong>
					</h2>

					<hr>

					<div id="notices">
						<div class="form-group">
							<div class="col-md-12 col-sm-12 col-xs-12 col-md-offset-3">

								<button class="btn btn-info" type="button" id="validate">Validate</button>
								<a class="btn btn-danger" id="cancel"
									href="<spring:url value="/paymentVoucher/cancel" />">Cancel</a>
								<input type="submit" id="submitbtn" class="btn btn-success" value="Submit">

							</div>
						</div>

						<div class="notice"></div>
					</div>
				</header>
			</div>

			<div id="seller" class="col-md-12">
				<div>
					<h3>${sessionScope.systemdetail[0].settingsdescription }</h3>
					<h4>${sessionScope.systemdetail[2].settingsdescription }</h4>
					<h4>${sessionScope.systemdetail[3].settingsdescription }</h4>
					<h4>${sessionScope.systemdetail[7].settingsdescription }</h4>

				</div>
			</div>
			



			<div id="details" class="clearfix">
				<div id="seller">

					<h4 class="name">
						<span class="label label-default">Transaction Id*</span><input
							type="text" class="form-control " name="transactionId"
							value="${mid }" readonly>
					</h4>

					<h4 class="name">
						<span class="label label-default">Reference No*</span><input
							type="text" class="form-control " id="referenceNo"
							name="referenceNo"
							value="${sessionScope.paymentVoucher.referenceNo }">
					</h4>
				</div>

				<div id="client">

					<div class="date">
						<span class="label label-default">Booking Eng Date*</span> <input
							type="text" maxlength="10" id="bookingDateen"
							class="form-control date bookingdateen" name="bookingDateen"
							placeholder="yyyy-mm-dd"
							value="${sessionScope.paymentVoucher.bookingDateen }"
							onblur="englishToNepali('.bookingdate','.bookingdateen')">
					</div>
					<br>
					<div class="date">
						<span class="label label-default">Booking nep Date*</span> <input
							type="text" maxlength="10" id="bookingDate" name="bookingDate"
							class="form-control date bookingdate" placeholder="yyyy-mm-dd"
							value="${sessionScope.paymentVoucher.bookingDate}"
							onblur="nepaliToEnglish('.bookingdate','.bookingdateen')">
					</div>
				</div>
				<div id="client">
					<div class="date">
						<span class="label label-default">Value Eng Date*</span> <input
							type="text" maxlength="10" id="valueDateen"
							class="form-control date valuedateen" name="valueDateen"
							placeholder="yyyy-mm-dd"
							value="${sessionScope.paymentVoucher.valueDateen}"
							onblur="englishToNepali('.valuedate','.valuedateen')">
					</div>
					<br>
					<div class="date">
						<span class="label label-default dob">Value nep Date*</span> <input
							type="text" maxlength="10" id="valueDate" name="valueDate"
							class="form-control date valuedate" placeholder="yyyy-mm-dd"
							value="${sessionScope.paymentVoucher.valueDate }"
							onblur="nepaliToEnglish('.valuedate','.valuedateen')">
					</div>
				</div>
			</div>
			</div>
		
		
			<div class="x-panel">
			
			
			
				<table border="0" cellspacing="0" cellpadding="0">
					<thead>
						<tr>
							<th  class="desc col-md-2"><a onclick="addRow()" id="newrow"
								class="btn btn-primary">Add Row</a></th>
							<th colspan="1" class="col-md-2">Account Number</th>
							<th class="desc col-md-2" colspan="3">Account Name</th>
							<th class="desc col-md-2" colspan="1">Cheque No.</th>
							<th class="desc col-md-2" colspan="1">Dr/Cr</th>
							<th class="desc col-md-2">Narration</th>
							<th class="desc col-md-2" colspan="1">Amount</th>

						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when
								test="${empty sessionScope.paymentVoucher.paymentVoucherAccount.accountNo}">
								<tr  id="tablerow">
									<td><button onclick="deleteRow(this)"
											class="removebutton btn btn-danger">Delete</button></td>
									<td colspan="1"><input type="text"
										class="form-control accountno"
										name="paymentVoucherAccount.accountNo" value=""></td>
									<td colspan="3" ><input type="text"
										name="paymentVoucherAccount.accountName"
										class="form-control accountName " id="accountName" value=""
										readonly></td>
									<td colspan="1"><input type="text" class="form-control chequeNo"
										name="paymentVoucherAccount.chequeNo" value=""></td>
									<td class="desc col-md-2" colspan="1"><select
										class="form-control one drcr"
										name="paymentVoucherAccount.drcr" required>
											<option value="">None</option>
											<option value="dr">Dr.</option>
											<option value="cr">Cr.</option>
									</select></td>

									<td><input type="text" class="form-control"
										name="paymentVoucherAccount.narration"></td>
									<td colspan="1"><input type="text"
										class="form-control two" name="paymentVoucherAccount.amount"
										id="amount" value="" contenteditable='true' onkeyup='calculfac()'></td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach
									items="${sessionScope.paymentVoucher.paymentVoucherAccount.accountNo }"
									var="desc" varStatus="descIndex">

									<tr id="tablerow">
										<td><button onclick="deleteRow(this)"
												class="removebutton btn btn-danger">Delete</button></td>
										<td colspan="1"><input type="text"
											class="form-control accountno"
											name="paymentVoucherAccount.accountNo"
											value="${sessionScope.paymentVoucher.paymentVoucherAccount.accountNo[descIndex.index] }"></td>
										<td colspan="2" width="50%"><input type="text"
											name="accountName" class="form-control accountName "
											id="accountName"
											value="${sessionScope.paymentVoucher.paymentVoucherAccount.accountName[descIndex.index] }"
											readonly></td>
										<td><input type="text" class="form-control chequeNo"
											name="paymentVoucherAccount.chequeNo"
											value="${sessionScope.paymentVoucher.paymentVoucherAccount.chequeNo[descIndex.index] }"></td>
										<td class="desc" colspan="1"><select class="form-control"
											name="paymentVoucherAccount.drcr" required>
												<option value="dr"
													<c:if test="${sessionScope.paymentVoucher.paymentVoucherAccount.drcr[descIndex.index] eq 'dr' }">selected</c:if>>Dr.</option>
												<option value="cr"
													<c:if test="${sessionScope.paymentVoucher.paymentVoucherAccount.drcr[descIndex.index] eq 'cr' }">selected</c:if>>Cr.</option>
										</select></td>
										<td><input type="text" class="form-control"
											name="paymentVoucherAccount.narration"
											value="${sessionScope.paymentVoucher.paymentVoucherAccount.narration[descIndex.index] }"></td>
										<td class="desc" colspan="1"><input type="text"
											class="form-control two" name="paymentVoucherAccount.amount"
											id="amount"
											value="${sessionScope.paymentVoucher.paymentVoucherAccount.amount[descIndex.index] }"></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="5"></td>
							<td colspan="1"><h5>NARRATION</h5></td>
							<td colspan="2"><textarea id="narration" cols="30"
									name="narration" class="form-control" rows="3">${sessionScope.paymentVoucher.narration }</textarea></td>
						</tr>
						<tr>
							<td colspan="5"></td>
							<td colspan="1">Total Debit Amount</td>
							<td colspan="2"><input class="form-control totalDr"
								type="number" step="any" name="totalDebitAmount"
								value="${sessionScope.paymentVoucher.totalDebitAmount }"
								readonly></td>
						</tr>

						<tr>
							<td colspan="5"></td>
							<td colspan="1">Total Credit Amount</td>
							<td colspan="2"><input class="form-control totalCr"
								type="number" step="any" name="totalCreditAmount"
								value="${sessionScope.paymentVoucher.totalCreditAmount }"
								readonly></td>
						</tr>

						<%-- <tr>
							<td colspan="3"></td>
							<td colspan="1"><h5>IN WORDS</h5></td>
							<td colspan="3"><textarea id="result" cols="30"
									name="inwords" class="form-control" rows="3" readonly>${sessionScope.paymentVoucher.inwords }</textarea></td>
						</tr> --%>
						<tr>
							<td colspan="1">Prepared By:</td>
							<td colspan="3"><input type="text" class="form-control"
								name="preparedBy" value="${sessionScope.userDetail.username}"></td>
							<td colspan="1"></td>
							<td>Checked By:</td>
							<td colspan="2"><input type="text" class="form-control"
								name="checkedBy"
								value="${sessionScope.paymentVoucher.checkedBy }"></td>

						</tr>
						<tr>
							<td>Approved By:</td>
							<td><input type="text" class="form-control"
								name="approvedBy"
								value="${sessionScope.paymentVoucher.approvedBy }"></td>
						</tr>


					</tfoot>
				</table>


			</div>
			

			
		</div>
	</form>
	
	<script src="<spring:url value="/resources/js/dateAction.js"/>"></script>
	
	<script>
	
	function calculfac() {
		
		/* alert("function running");
	     
	    	  
	    	  
	    	  var drcr = $("table tr#tablerow").closest("tbody").find(".drcr").val();
	    	  alert(drcr);
				var amount = $(this).find("#amount").val();

				if (drcr == 'dr') {
					drTotal = parseInt(drTotal, 10) + parseInt(amount, 10);
					$(".totalDr").val(drTotal);
				} else {
					crTotal = parseInt(crTotal, 10) + parseInt(amount, 10);
					$(".totalCr").val(crTotal);

				}
				 */
				
				
	       

	      
	      
		}
	
		$("#validate").click(function() {

			var drTotal = 0;
			var crTotal = 0;

			$("table tr#tablerow").each(function() {
				var id = $(this).find("input.accountno").val();
				var accountName = $(this).find("input.accountName");

				var row_index = $(this).index();
				var accountNameUrl = $(".accountNameUrl").val();
				var dataString = 'id=' + id;

				/* 	-----------------------------for dr/cr total---------------------------------------------------- */

				var drcr = $(this).find(".drcr").val();
				var amount = $(this).find("#amount").val();

				if (drcr == 'dr') {
					drTotal = parseInt(drTotal, 10) + parseInt(amount, 10);
				} else {
					crTotal = parseInt(crTotal, 10) + parseInt(amount, 10);

				}

				$.ajax({
					type : "POST",
					url : accountNameUrl,
					data : dataString,
					cache : false,
					success : function(html) {
						accountName.val(html);
					}
				});

			});
			$(".totalDr").val(drTotal);
			$(".totalCr").val(crTotal);
			
			if(drTotal==crTotal)
				{
				 $('#submitbtn').prop('disabled', false);
				}
			else
				{
				 $('#submitbtn').prop('disabled', true);
				}

		});
		function deleteRow(btn) {
			var row = btn.parentNode.parentNode;
			row.parentNode.removeChild(row);
		};
		function addRow() {
			var tbody = $("table tbody");
			tbody.find("tr:eq(0)").clone().appendTo(tbody)
					.find("input, select").val("");
		};

		function accountno() {

		}
	</script>
	<script>
		function nepaliToEnglish(nepalidate, englishdate) {
			var date = $(nepalidate).val();
			var dataString = {
				'nepalidate' : date
			};
			$.ajax({
				type : "POST",
				url : "nepaliToEnglish",
				data : dataString,
				cache : false,
				success : function(html) {
					$(englishdate).val(html);
				},
				error : function() {
					alert("error occured");
				}

			});
		}
		function englishToNepali(nepalidate, englishdate) {
			var date = $(englishdate).val();
			var dataString = {
				'englishdate' : date
			};
			$.ajax({
				type : "POST",
				url : "englishToNepali",
				data : dataString,
				cache : false,
				success : function(html) {
					$(nepalidate).val(html);
				},
				error : function() {
					alert("error occured");
				}
			});
		}
	</script>
</body>

</html>