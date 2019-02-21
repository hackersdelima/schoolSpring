
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<jsp:include page="../../include.jsp"></jsp:include>
<body class="background">

	<div class="col-md-12 col-sm-12 col-xs-12">
		<spring:url value="/nav/viewClaimBill/${id }" var="formUrl"></spring:url>
		<form method="get" action="${formUrl }">
			<div class="x_panel">
				<div class="x_title">
					<h2>Student Claim Bill Search</h2>
					<input type="submit" class="btn btn-success" value="Submit">
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<label class="control-label col-md-2 col-sm-2 col-xs-12">Student
						Id</label>
					<div class="col-md-2 col-sm-2 col-xs-12">
						<input type="text" value="${id }" name="studentid"
							class="form-control" readonly>
					</div>
					<label class="control-label col-md-2 col-sm-2 col-xs-12">Month</label>
					<div class="col-md-2 col-sm-2 col-xs-12">
						<select name="month" class="form-control">
							<option value="01-Baishak">01-Baishak</option>
							<option value="02-Jestha">02-Jestha</option>
							<option value="03-Asar">03-Asar</option>
							<option value="04-Shrawan">04-Shrawan</option>
							<option value="05-Bhadra">05-Bhadra</option>
							<option value="06-Ashoj">06-Ashoj</option>
							<option value="07-Kartik">07-Kartik</option>
							<option value="08-Mangsir">08-Mangsir</option>
							<option value="09-Poush">09-Poush</option>
							<option value="10-Magh">10-Magh</option>
							<option value="11-Falgun">11-Falgun</option>
							<option value="12-Chaitra">12-Chaitra</option>
						</select>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>