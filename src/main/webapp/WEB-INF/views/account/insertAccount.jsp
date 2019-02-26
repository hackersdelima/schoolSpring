<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<tag:header title="CREATE NEW ACCOUNT"/>
				<spring:url value="/account/createBulkAccounts" var="formUrl"></spring:url>
						<form:form class="form-horizontal form-label-left input_mask"
				action="${formUrl }">
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
					<!-- <div class="form-group">
						<label class="control-label col-md-2 col-sm-2 col-xs-12">Account 
							No</label>
						<div class="col-md-4 col-sm-4 col-xs-12">
							 <input type="text"
									class="form-control accountNumber" id="accountno" name="accountNumber"
									value="" data-validation="number"
									data-validation-error-msg=" " required readonly>
						</div>
					</div> -->
					<!-- <div class="form-group" id="cashWithdraw">
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
					</div> -->
					<%-- <div class="form-group" id="cashDeposit">
						<label class="control-label col-md-2 col-sm-2 col-xs-12">
							Category</label>
						<div class="col-md-4 col-sm-4 col-xs-12">
							<select class="form-control categoryId" name="categoryModel.categoryId" id="categories">
										<option value="">Select Category</option>
										<c:forEach items="${categorylist }" var="c">
											<option value="${c.categoryId }">${c.categoryId }-${c.categoryHead }</option>
										</c:forEach>
								</select>

						</div>
						<div class="col-md-6 col-sm-6 col-xs-12 ">
							<span class="accountName"></span>
						</div>
					</div> --%>
					<%-- <div class="form-group">
						<label class="control-label col-md-2 col-sm-2 col-xs-12">
							Account Type</label>
						<div class="col-md-4 col-sm-4 col-xs-12">
							<select class="form-control"
									name="accountTypeModel.accountType" id="accounttype">
									<option>Select Account Type</option>
										<c:forEach items="${accounttypelist }" var="a">
										<option value="${a.accountType}">${a.accountType }-${a.accountTypeHead }</option>
										</c:forEach>
								</select>

						</div>
					</div> --%>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-2 col-xs-12">Account Name
						</label>
						<div class="col-md-5 col-sm-5 col-xs-12">
							<input type="text"
									class="form-control memberid" name="accountName" id="accountname" value="" readonly>
						</div>
					</div>
			</form:form>
	<jsp:include page="../msgmodal.jsp"></jsp:include>
	<tag:footer/>
<script>
 $("#validate").click(function()
		{
	 	//accountno();
		membername();
		
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
	 var catId=$('.categoryId').val();
	 var dataString = {'id': id, 'categoryId': catId };
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

