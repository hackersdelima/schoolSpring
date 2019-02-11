<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url value="/nav/viewClaimBill/${id }" var="formUrl"></spring:url>
<form method="get" action="${formUrl }">

	<input type="text" value="${id }" name="studentid" readonly><br>
	<select name="month">
		<option value="01">01-Baishak</option>
		<option value="02">02</option>
		<option value="03">03-</option>
		<option value="09">09-</option>
	</select>
	<input type="submit" value="Submit">
</form>
