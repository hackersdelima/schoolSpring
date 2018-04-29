<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/includefile"></jsp:include>
<html>
<head>

<style>
h5 {
	font-size: 80%;
	font-weight: bold;
}
#${
type


}
{
display


:none


;
}
</style>
</head>
<body class="hiddenscroll bgcolor background">

	<div class="breadcrumb-line">
		<nav aria-label="breadcrumb" role="navigation">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home"
					aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">Transaction</li>
				<li class="breadcrumb-item active" aria-current="page">Add
					Teller Transaction</li>
			</ol>
		</nav>
	</div>
	
	<div class="col-md-8 col-xs-12">
		<div class="x_panel">
			<form class="form-horizontal form-label-left input_mask"
				method="post" action="teller.add">

				<div class="x_title">
					<h2>Teller Operation</h2>
					<div class="col-md-4 col-sm-4 col-xs-12 pull-right">
						<input type="text" class="form-control" placeholder=""
							name="transactionid" value="${tellerid }" readonly>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<br />

					<div class="form-group">
						<label class="control-label col-md-2 col-sm-2 col-xs-12">Customer</label>
						<div class="col-md-2 col-sm-2 col-xs-12">
							<input type="text" class="form-control memberid" placeholder=""
								value="" readonly>
						</div>
						<div class="col-md-8 col-sm-8 col-xs-12 ">
							<span id="customername"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-2 col-xs-12">Booking
							Date(B.S/A.D)</label>
						<div class="col-md-4 col-sm-4 col-xs-12">
							<input type="text" class="form-control" name=""
								placeholder="" value="${todayNepaliDate }" readonly>
						</div>
						<div class="col-md-4 col-sm-4 col-xs-12">
							<input type="text" class="form-control" name="bookingdate"
								placeholder="" value="${todayDate }" readonly>
						</div>
						
					</div>
					<div class="form-group" id="cashWithdraw">
						<label class="control-label col-md-2 col-sm-2 col-xs-12">Credit
							Account</label>
						<div class="col-md-4 col-sm-4 col-xs-12">
							<input type="text" class="form-control"
								name="creditaccountnumber" id="creditaccountnumber"
								placeholder="">
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12 ">
							<span class="accountName"></span>
						</div>
					</div>
					<div class="form-group" id="cashDeposit">
						<label class="control-label col-md-2 col-sm-2 col-xs-12">Debit
							Account</label>
						<div class="col-md-4 col-sm-4 col-xs-12">
							<input type="text" id="debitaccountnumber" class="form-control"
								name="debitaccountnumber" placeholder="">
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12 ">
							<span class="accountName"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-2 col-xs-12">Amount
						</label>
						<div class="col-md-3 col-sm-3 col-xs-12">
							<input type="text" name="amount" class="form-control"
								placeholder="">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-2 col-xs-12">Value
							Date(B.S/A.D) </label>
						<div class="col-md-4 col-sm-4 col-xs-12">
							<input type="text" name="nepvaluedate" class="form-control valuedatenep" onblur="nepaliToEnglish('.valuedatenep','.valuedateen')"
								placeholder="" value="${todayNepaliDate }" >
						</div>
						<div class="col-md-4 col-sm-4 col-xs-12">
							<input type="text" name="valuedate" class="form-control valuedateen"
								placeholder="" value="${todayDate }" onblur="englishToNepali('.valuedatenep','.valuedateen')">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-2 col-xs-12">Cheque
							No</label>
						<div class="col-md-5 col-sm-5 col-xs-12">
							<input type="text" class="form-control" name="chequenumber"
								placeholder="">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-2 col-xs-12">Narrative</label>
						<div class="col-md-5 col-sm-5 col-xs-12">
							<input type="text" class="form-control" name="narrative"
								placeholder="">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-2 col-xs-12">New
							Current Balance</label>
						<div class="col-md-4 col-sm-4 col-xs-12">
							<input type="text" class="form-control" disabled placeholder="">
						</div>
					</div>

					<div class="ln_solid"></div>
					<div class="form-group">
						<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
							<button class="btn btn-info" type="button" id="validate">Validate</button>
							<button class="btn btn-primary" type="reset">Reset</button>
							<input type="submit" class="btn btn-success" value="Submit">
						</div>
					</div>


				</div>
			</form>
		</div>
</div>
	<div class="scriptdiv"></div>
	<jsp:include page="/msgmodal"></jsp:include>
	<script>
		
	</script>
	<script type="text/javascript" src="template/js/form.js"></script>
	<script type="text/javascript" src="template/js/dateconverter.js"></script>
	<script>
		
	<%if (request.getAttribute("msg") != null) {%>
		$('#myModal').modal('show');
	<%}%>
		
	</script>
	<script>
		//Ajax

		$("#validate").click(function() {

			var craccount = $('#creditaccountnumber').val();
			var draccount = $('#debitaccountnumber').val();
			var dataString = {
				'craccount' : craccount,
				'draccount' : draccount
			};
			$.ajax({
				type : "POST",
				url : "showaccountname.click",
				data : dataString,
				dataType : "json",
				cache : false,
				success : function(res) {

					var data = "";
					var p = JSON.parse(res[0]);
					$('.memberid').val(p.memberid);
					$('.accountName').html(p.accountname);
					$('#customername').html(p.membername);

				},
				error : function() {
					$alert("error occured");
				}
			});
		});
		
		
		
	</script>
</body>
</html>
