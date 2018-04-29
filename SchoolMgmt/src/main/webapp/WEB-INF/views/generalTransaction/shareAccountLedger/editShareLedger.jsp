<jsp:include page="/includefile"></jsp:include>
<html>
<head></head>
<body class="hiddenscroll bgcolor background">
	<div class="breadcrumb-line">
		<nav aria-label="breadcrumb" role="navigation">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home"
					aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">Transaction</li>
				<li class="breadcrumb-item active" aria-current="page">Edit</li>
			</ol>
		</nav>
	</div>
	<div class="panel panel-default" style="width: 95%; margin: auto;">
		<div class="panel-heading">
			<h6>
				<strong>Insert Share Account Ledger Id</strong>
			</h6>
			<form method="post" action="shareAccountLedgerDisplay.click">
			<input name="pid" type="text" class="form-control input" value="${id}" style="width: 20%;">
			
			<br> <input type="submit" class="btn btn-info searchbtn"
				value="SEARCH">
				</form>
		</div>
	</div>
	
</body>
</html>