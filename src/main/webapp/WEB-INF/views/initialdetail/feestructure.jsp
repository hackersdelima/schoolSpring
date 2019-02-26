<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<tag:header title="ADD FEE STRUCTURE"/>
					<spring:url value="/fee/add" var="formUrl"></spring:url>
			
				<form:form class="form-horizontal form-label-left input_mask"
					action="${formUrl }">
					<input type="text" id="membername" class="form-control"
								name="membername" value="" readonly>
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
								<input type="text" id="memberid" class="form-control memberid"
									name="studentid" value="" data-validation="number"
									data-validation-error-msg=" " required>
							</div>
							<div class="col-md-8 col-sm-8 col-xs-12 ">
								<span id="customername"></span>
							</div>
						</div>
						<div class="form-group" id="cashDeposit">
							<label class="control-label col-md-2 col-sm-2 col-xs-12">
								Category</label>
							<div class="col-md-4 col-sm-4 col-xs-12">
								<select class="form-control categoryid" name="categoryid"
									id="categories">
									<option value="">Select Category</option>
									<c:forEach items="${categorylist }" var="c">
										<option value="${c.categoryId }">${c.categoryId }-${c.categoryHead }</option>
									</c:forEach>
								</select>

							</div>

						</div>
						<div class="form-group">
							<label class="control-label col-md-2 col-sm-2 col-xs-12">Amount</label>
							<div class="col-md-4 col-sm-4 col-xs-12">
								<input type="text" class="form-control amount" id="amount"
									name="amount" value="" data-validation="number"
									data-validation-error-msg=" " required readonly>
							</div>
						</div>
						<div class="form-group" id="cashDeposit">
							<label class="control-label col-md-2 col-sm-2 col-xs-12">
								Start Month</label>
							<div class="col-md-4 col-sm-4 col-xs-12">
								<select class="form-control categoryid" name="startmonth"
									id="startmonth">
									<option value="">Select Month</option>
									<c:forEach items="${monthlist }" var="m">
										<option value="${m.month }">${m.month }-${m.value }</option>
									</c:forEach>
								</select>

							</div>

						</div>
						<div class="form-group">
							<label class="control-label col-md-2 col-sm-2 col-xs-12">Frequency (In Month)
							</label>
							<div class="col-md-5 col-sm-5 col-xs-12">
								<input type="text" class="form-control memberid"
									name="frequency" id="frequency" value="">
							</div>
						</div> 
						
						<div class="form-group" id="cashDeposit">
							<label class="control-label col-md-2 col-sm-2 col-xs-12">
								Payment Type</label>
							<div class="col-md-4 col-sm-4 col-xs-12">
								<select class="form-control categoryid" name="paymenttype"
									id="startmonth">
									<option value="">Select Month</option>
									<option value="O">One Time Setup</option>
									<option value="M">Monthly Setup</option>
									
								</select>

							</div>

						</div>
						
						

						<div class="form-group">
							<label class="control-label col-md-2 col-sm-2 col-xs-12">Discount
								Amount </label>
							<div class="col-md-5 col-sm-5 col-xs-12">
								<input type="text" class="form-control memberid"
									name="discountamount" id="discountamount" value="">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-2 col-sm-2 col-xs-12">Discount
								Rate </label>
							<div class="col-md-5 col-sm-5 col-xs-12">
								<input type="text" class="form-control memberid"
									name="discountrate" id="discountrate" value="">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-2 col-sm-2 col-xs-12">Note
							</label>
							<div class="col-md-5 col-sm-5 col-xs-12">
								<input type="text" class="form-control memberid" name="note"
									id="note" value="">
							</div>
						</div>



				</form:form>
		
	<jsp:include page="../msgmodal.jsp"></jsp:include>
<tag:footer/>
	<script>
		$("#validate").click(function() {
			accountno();
			membername();

		});
		function membername() {
			var id = $('.memberid').val();
			var dataString = 'id=' + id;
			$.ajax({
				type : "POST",
				url : "../account/membername",
				data : dataString,
				cache : false,
				success : function(html) {
					$("#membername").val(html);
					$("#accountname").val(html);
				}
			});
		};
		function accountno() {
			var id = $('.memberid').val();
			var catId = $('.categoryId').val();
			var dataString = {
				'id' : id,
				'categoryId' : catId
			};
			$.ajax({
				type : "POST",
				url : "../account/generateAccNo",
				data : dataString,
				cache : false,
				success : function(html) {
					$("#accountno").val(html);
				}
			});
		}
		$("#categories").change(function() {
			var catId = $(this).val();
			var id = $('.memberid').val();
			var dataString = {
					'id': + id,
					'catId':+catId
					};

			$.ajax({
				type : "POST",
				url : "../fee/getFeeAmount",
				data : dataString,
				dataType: "html",
				success : function(html) {
					$("#amount").val(html);
				}
			});

		});
	</script>