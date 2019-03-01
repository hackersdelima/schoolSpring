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

