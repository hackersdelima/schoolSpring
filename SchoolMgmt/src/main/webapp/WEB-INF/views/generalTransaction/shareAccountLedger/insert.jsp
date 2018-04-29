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
				<li class="breadcrumb-item active" aria-current="page">Share
					Account Legder</li>
				<li class="breadcrumb-item active" aria-current="page">New
					Legder</li>
			</ol>
		</nav>
	</div>

	<div class="col-md-12 col-xs-12">
		<div class="x_panel">
			<form class="form-horizontal form-label-left input_mask"
				method="post" action="shareAccountLedger.add">

				<div class="x_title">
					<h2>New Share Account Ledger</h2>

					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<br />

					<div class="form-group">
						<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
							<button class="btn btn-info" type="button" id="validate">Validate</button>
							<button class="btn btn-primary" type="reset">Reset</button>
							<input type="submit" class="btn btn-success" value="Submit">
						</div>
					</div>
					<div class="ln_solid"></div>

					<div class="form-group">
						<label class="control-label col-md-2 col-sm-2 col-xs-12">Legacy
							Account No</label>
						<div class="col-md-3 col-sm-3 col-xs-12">
							<input type="text" class="form-control" name="legacyAccountNo"
								placeholder="" value="">
						</div>

					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-2 col-xs-12">Account
							Number</label>
						<div class="col-md-3 col-sm-3 col-xs-12">
							<input type="text" class="form-control" placeholder=""
								name="accountNo" value="">
						</div>
						<p class="memberName"></p>
					</div>
					<div class="form-group" id="cashWithdraw">
						<label class="control-label col-md-2 col-sm-2 col-xs-12">Member
							Id</label>
						<div class="col-md-3 col-sm-3 col-xs-12">
							<input type="text" class="form-control" name="pid"
								placeholder="">
						</div>
						<label class="control-label col-md-2 col-sm-2 col-xs-12">Narration
						</label>
						<div class="col-md-4 col-sm-4 col-xs-12">
							<input type="text" name="narration" class="form-control"
								placeholder="">
						</div>
					</div>
					<div class="form-group" id="cashWithdraw">
						<label class="control-label col-md-2 col-sm-2 col-xs-12">Date(B.S.)</label>
						<div class="col-md-3 col-sm-3 col-xs-12">
							<input type="text" class="form-control datenp"
								placeholder="" onblur="nepaliToEnglish('.datenp','.date')">
						</div>
						<label class="control-label col-md-2 col-sm-2 col-xs-12">Date(A.D.)
						</label>
						<div class="col-md-4 col-sm-4 col-xs-12">
							<input type="text" name="date" class="form-control date"
								placeholder="" onblur="englishToNepali('.datenp','.date')">
						</div>
					</div>
					<div class="ln_solid"></div>

					<div class="form-group">
						<label class="control-label col-md-2 col-sm-2 col-xs-12">Dr
							Quantity </label>
						<div class="col-md-2 col-sm-2 col-xs-12">
							<input type="text" name="drQuantity" class="form-control"
								placeholder="">
						</div>
						<label class="control-label col-md-2 col-sm-2 col-xs-12">Cr
							Quantity </label>
						<div class="col-md-2 col-sm-2 col-xs-12">
							<input type="text" name="crQuantity" class="form-control"
								placeholder="">
						</div>
						<label class="control-label col-md-2 col-sm-2 col-xs-12">Balance
							Quantity </label>
						<div class="col-md-2 col-sm-2 col-xs-12">
							<input type="text" name="balanceQuantity" class="form-control"
								placeholder="">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-2 col-xs-12">Dr
							Amount </label>
						<div class="col-md-2 col-sm-2 col-xs-12">
							<input type="text" name="drAmount" class="form-control"
								placeholder="">
						</div>
						<label class="control-label col-md-2 col-sm-2 col-xs-12">Cr
							Amount </label>
						<div class="col-md-2 col-sm-2 col-xs-12">
							<input type="text" name="crAmount" class="form-control"
								placeholder="">
						</div>
						<label class="control-label col-md-2 col-sm-2 col-xs-12">Balance
							Amount </label>
						<div class="col-md-2 col-sm-2 col-xs-12">
							<input type="text" name="balanceAmount" class="form-control"
								placeholder="">
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
