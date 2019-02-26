<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<tag:header title="SYSTEM SETTINGS"/>
							<form method="post" action="<spring:url value="/operation/updateGeneralSetting"/>" class="form-horizontal form-label-left input_mask" >
				
					<br />
					<c:forEach items="${sessionScope.systemdetail}" var="sysdetail">
						<div class="form-group">
							<label class="control-label col-md-2 col-sm-2 col-xs-12">${sysdetail.settingstype }</label>
							<div class="col-md-4 col-sm-4 col-xs-12">
							<input type="hidden" name="type" value="${sysdetail.settingstype }">
								<input type="text" class="form-control" name="description" value="${sysdetail.settingsdescription }"
									placeholder="" value="">
							</div>
						</div>
					</c:forEach>
					<div class="ln_solid"></div>
					<div class="form-group">
						<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
							<button class="btn btn-info" type="button" id="validate">Validate</button>
							<button class="btn btn-primary" type="reset">Reset</button>
							<input type="submit" class="btn btn-success" value="Save">
						</div>
					</div>


			</form>
	<jsp:include page="../msgmodal.jsp"></jsp:include>
	<tag:footer/>