<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../include.jsp"></jsp:include>
<spring:url value="/account/add" var="formUrl"></spring:url>
<html>
<head>
<style>
h5 {
	font-size: 80%;
	font-weight: bold;
}
</style>
</head>
<body class="background">
	<div class="breadcrumb-line">
		<nav aria-label="breadcrumb" role="navigation">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home"
					aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">Account</li>
				<li class="breadcrumb-item active" aria-current="page">Add
					Account</li>
			</ol>
		</nav>
	</div>
	<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="col-md-8 col-xs-12">
		<div class="x_panel">
			<form:form class="form-horizontal form-label-left input_mask"
				action="${formUrl }">

				<div class="x_title">
					<h2>Add New Account</h2>
					<div class="col-md-4 col-sm-4 col-xs-12 pull-right">
						<input type="text" id="membername"
									class="form-control" name="membername"
									value="" readonly >
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<br />

					<div class="form-group">
						
					<div class="form-group">
						<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
							<button class="btn btn-info" type="button" id="validate">Validate</button>
							<button class="btn btn-primary" type="reset">Reset</button>
							<input type="submit" class="btn btn-success" value="Submit">
						</div>
					</div>
					<div class="ln_solid"></div>
						<label class="control-label col-md-2 col-sm-2 col-xs-12">ID</label>
						<div class="col-md-2 col-sm-2 col-xs-12">
							 <input type="text" id="memberid"
									class="form-control memberid" name="memberId"
									value="" data-validation="number" data-validation-error-msg=" " required>
						</div>
						<div class="col-md-8 col-sm-8 col-xs-12 ">
							<span id="customername"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-2 col-xs-12">Account 
							No</label>
						<div class="col-md-4 col-sm-4 col-xs-12">
							 <input type="text"
									class="form-control accountNumber" id="accountno" name="accountNumber"
									value="" data-validation="number"
									data-validation-error-msg=" " required readonly>
						</div>
					</div>
					<div class="form-group" id="cashWithdraw">
						<label class="control-label col-md-2 col-sm-2 col-xs-12">Alternate
							Account No</label>
						<div class="col-md-4 col-sm-4 col-xs-12">
							<input type="text" 
									class="form-control" name="alternativeAccountId" value=""
									data-validation="number"  >
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12 ">
							<span class="accountName"></span>
						</div>
					</div>
					<div class="form-group" id="cashDeposit">
						<label class="control-label col-md-2 col-sm-2 col-xs-12">
							Category</label>
						<div class="col-md-4 col-sm-4 col-xs-12">
							<select class="form-control categoryId" name="categoryModel.categoryId" id="categories">
										<option value="">Select Category</option>
										<c:forEach items="${categorylist }" var="c">
											<option value="${c.categoryId }">${c.categoryHead }</option>
										</c:forEach>
								</select>

						</div>
						<div class="col-md-6 col-sm-6 col-xs-12 ">
							<span class="accountName"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-2 col-xs-12">
							Account Type</label>
						<div class="col-md-4 col-sm-4 col-xs-12">
							<select class="form-control"
									name="accountTypeModel.accountType" id="accounttype">
										<option value="">Select Account Type</option>
								</select>

						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-2 col-xs-12">Account Name
						</label>
						<div class="col-md-5 col-sm-5 col-xs-12">
							<input type="text"
									class="form-control memberid" name="accountName" id="accountname" value="">
						</div>
					</div>
				</div>
			</form:form>
		</div>
							</div>
	</div>
	<jsp:include page="../msgmodal.jsp"></jsp:include>
	
<script>
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
$("#categories").change(function()
		{
		var id=$(this).val();
		var dataString = 'id='+ id;

		$.ajax
		({
		type: "POST",
		url: "../category/getAccountType",
		
		data: dataString,
		cache: false,
		success: function(html)
		{
		$("#accounttype").html(html);
		} 
		});

		});

</script>
</body>
</html>
