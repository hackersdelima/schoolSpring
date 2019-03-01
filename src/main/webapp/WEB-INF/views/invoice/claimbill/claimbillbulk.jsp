<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<tag:header title="BLUCK CLAIM BILL"/>
			
		
			<spring:url value="/claimbill/viewClassClaimBill" var="formUrl"/>
			
		
		
			<button type="submit" class="btn btn-success" form="form">
					<i class="fa fa-check"></i> Generate
				</button>
		
			
				
				<form:form action="${formUrl }" id="form">
				<table class="table">
					<tbody>
						<tr>
						
							<td><h6>Month *</h6> <select class="form-control " name="month"
									id="month">
									<option value="">Select Month</option>
									<c:forEach items="${monthlist }" var="m">
										<option value="${m.month }-${m.value }">${m.month }-${m.value }</option>
									</c:forEach>
								</select></td>
								
								<td><h6>
									<strong>Class*</strong>
								</h6>
								<select class="form-control class" name="classid" id="class" required>
									<option value="">Select Class</option>
									<c:forEach items="${classlist }" var="cl">
									<option value="${cl.classid }">${cl.classname }</option>
									</c:forEach>
									
									
								</select></td>
								
								<td>
								
								<h6>
									<strong>Section</strong>
								</h6>
								<select class="form-control" name="sectionname" id="section">
									<option value="n">Select Section</option>
									<c:forEach items="${section }" var="sec">
									<option value="${sec.sectionname }">${sec.sectionname}</option>
									</c:forEach>
								</select>
							
								</td>
							
						</tr>
					</tbody>
				</table>
				</form:form>
	<tag:footer/>
	<script>
		$('#form').submit(function() {
			return confirm('CONFIRM SAVE?');
		});
		$('.delete').click(function() {
			return confirm('CONFIRM EXAM DELETE?');
		});
		

	function nepaliToEnglish(nepalidate,englishdate){
		var date = $(nepalidate).val();
		var dataString = {'nepalidate' : date};
		$.ajax({
			type : "POST",
			url : "nepaliToEnglish",
			data : dataString,
			cache : false,
			success : function(html) {
			 	$(englishdate).val(html); 
			},
		error : function() {
			alert("error occured");
		}
		
		});
	}
	function englishToNepali(nepalidate,englishdate){
		var date = $(englishdate).val();
		var dataString = {
			'englishdate' : date
		};
		$.ajax({
			type : "POST",
			url : "englishToNepali",
			data : dataString,
			cache : false,
			success : function(html) {
				$(nepalidate).val(html);
			},
			error : function() {
				alert("error occured");
			}
		});
	}
	
	$('.delete').click(function() {
		return confirm('CONFIRM SUBJECT DELETE?');
	});
	</script>

