<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<tag:header title="CREATE NEW STUDENT STATUS"/>
<div class="col-md-12" style="color:red;">
${msg }
</div>
				<spring:url value="/status/save" var="formUrl"/>
						<form:form class="form form-horizontal form-label-left input_mask"
				action="${formUrl }" method="post">
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
						<label class="control-label col-md-2 col-sm-2 col-xs-12">Status Name</label>
						<div class="col-md-2 col-sm-2 col-xs-12">
							 <input type="text" id="name"
									class="form-control" name="name"
									 required>
						</div>
					
					</div>
			</form:form>
	<tag:footer/>
<script>
 $(".form").submit(function(){
	 return confirm("CONFIRM SUBMIT?");
 });
</script>

