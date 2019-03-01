<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<tag:header title="BASIC SETTINGS"/>
<p style="color:red">${msg }</p>
				<spring:url value="/generaldetails/update" var="formUrl"/>
						<form class="form-horizontal form-label-left input_mask" method="post"' action="${formUrl }" >
					<div class="form-group">
						
					<div class="form-group">
						<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
							<button class="btn btn-info" type="button" id="validate">Validate</button>
							<button class="btn btn-primary" type="reset">Reset</button>
							<input type="submit" class="btn btn-success" value="Submit">
						</div>
					</div>
					<div class="ln_solid"></div>
						<label class="control-label col-md-2 col-sm-2 col-xs-12">Name</label>
						<div class="col-md-2 col-sm-2 col-xs-12">
							 <input type="text" class="form-control memberid" name="name" value="${g.name }" >
						</div>
						
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-2 col-xs-12">Title
						</label>
						<div class="col-md-5 col-sm-5 col-xs-12">
							<input type="text"
									class="form-control " name="title" value="${g.title }">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-2 col-xs-12">Address
						</label>
						<div class="col-md-5 col-sm-5 col-xs-12">
							<input type="text"
									class="form-control " name="address" value="${g.address }">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-2 col-xs-12">Phone
						</label>
						<div class="col-md-5 col-sm-5 col-xs-12">
							<input type="number"
									class="form-control " name="phone" value="${g.phone }">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-2 col-xs-12">Email
						</label>
						<div class="col-md-5 col-sm-5 col-xs-12">
							<input type="text"
									class="form-control " name="email" value="${g.email }">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-2 col-xs-12">Academic Date(NP)
						</label>
						<div class="col-md-5 col-sm-5 col-xs-12">
							<input type="text"
									class="form-control " name="academicdate" value="${g.academicdate }">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-2 col-xs-12">Academic Date(EN)
						</label>
						<div class="col-md-5 col-sm-5 col-xs-12">
							<input type="text"
									class="form-control " name="academicdateen" value="${g.academicdateen }" >
						</div>
					</div>
			</form>
	<tag:footer/>


