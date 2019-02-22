<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../include.jsp"></jsp:include>
<spring:url value="/fee/add" var="formUrl"></spring:url>
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
				<li class="breadcrumb-item active" aria-current="page">Settings</li>
				<li class="breadcrumb-item active" aria-current="page">Fee
					Structure</li>
			</ol>
		</nav>
	</div>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="col-md-8 col-xs-12">
			<div class="x_panel">
				<form:form class="form-horizontal form-label-left input_mask"
					action="${formUrl }">

					<div class="x_title">
						<h2>Add New Fee Structure</h2>
						<div class="col-md-4 col-sm-4 col-xs-12 pull-right">
							<input type="text" id="membername" class="form-control"
								name="membername" value="" readonly>
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
						<!-- <div class="form-group">
							<label class="control-label col-md-2 col-sm-2 col-xs-12">Payment
								Term</label>
							<table>

								<tr>

									<td><label><input type="checkbox" id="dashboard"
											name="M" value="M1" class="js-switch"
											<c:if test=""> checked="checked"</c:if>>
											M1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
									<td><label><input type="checkbox" id="dashboard"
											name="M" value="M2" class="js-switch"
											<c:if test=""> checked="checked"</c:if>>
											M2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
									<td><label><input type="checkbox" id="dashboard"
											name="M" value="M3" class="js-switch"
											<c:if test=""> checked="checked"</c:if>>
											M3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
									<td><label><input type="checkbox" id="dashboard"
											name="M" value="M4" class="js-switch"
											<c:if test=""> checked="checked"</c:if>>
											M4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
									<td><label><input type="checkbox" id="dashboard"
											name="M" value="M5" class="js-switch"
											<c:if test=""> checked="checked"</c:if>>
											M5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
									<td><label><input type="checkbox" id="dashboard"
											name="M" value="M6"
											class="js-switch" <c:if test=""> checked="checked"</c:if>>
											M6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>

								</tr>

								<tr>

									<td><label><input type="checkbox" id="dashboard"
											name="M" value="M7" class="js-switch"
											<c:if test=""> checked="checked"</c:if>>
											M7&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
									<td><label><input type="checkbox" id="dashboard"
											name="M" value="M8" class="js-switch"
											<c:if test=""> checked="checked"</c:if>>
											M8&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
									<td><label><input type="checkbox" id="dashboard"
											name="M" value="M9" class="js-switch"
											<c:if test=""> checked="checked"</c:if>>
											M9&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
									<td><label><input type="checkbox" id="dashboard"
											name="M" value="M10" class="js-switch"
											<c:if test=""> checked="checked"</c:if>>
											M10&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
									<td><label><input type="checkbox" id="dashboard"
											name="M" value="M11" class="js-switch"
											<c:if test=""> checked="checked"</c:if>>
											M11&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
									<td><label><input type="checkbox" id="dashboard"
											name="M" value="M12" class="js-switch"
											<c:if test=""> checked="checked"</c:if>>
											M12&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
									<td><label><input type="checkbox" id="dashboard"
											name="M" value="MAll" class="js-switch"
											<c:if test=""> checked="checked"</c:if>>
											All&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>

								</tr>
							</table>
						</div> -->
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
							<label class="control-label col-md-2 col-sm-2 col-xs-12">Frequency
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



					</div>
				</form:form>
			</div>
		</div>
	</div>
	<jsp:include page="../msgmodal.jsp"></jsp:include>

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
</body>
</html>
