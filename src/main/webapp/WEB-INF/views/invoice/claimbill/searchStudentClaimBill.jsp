
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<tag:header title="STUDENT CLAIM BILL"/>
				<spring:url value="/claimbill/viewClaimBill/${id }" var="viewUrl"/>
		<spring:url value="/claimbill/save/${id }" var="saveUrl"/>
		<form method="post" action="">
		<div class="col-md-12">
		<input formaction="${viewUrl }" type="submit" class="btn btn-success" value="View">
					<input formaction="${saveUrl }" type="submit" class="btn btn-success" value="Save">
					</div>
					<div class="col-md-12">
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
			
		</form>
<tag:footer/>