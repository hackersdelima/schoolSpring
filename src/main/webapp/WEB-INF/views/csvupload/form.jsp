<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<tag:header title="UPLOAD CSV"/>
			<spring:url value="/csv/upload" var="formUrl"/>
				<form action="${formUrl }" style="margin-top: 10px;"
					class="form" enctype="multipart/form-data" method="post">
					<div role="tabpanel" class="tab-pane" aria-labelledby="profile-tab">
						<div class="form-group">
							<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
								<button class="btn btn-info" type="button" id="validate">Validate</button>
								<button class="btn btn-primary" type="reset">Reset</button>
								<input type="submit" class="btn btn-success" value="Submit">
							</div>
						</div>
						<br>
						<div class="ln_solid"></div>
						
						<div class="col-md-12">
							<div class="col-md-3">
								<h6>
									<strong>Table</strong>
								</h6>
								<select class="form-control" name="tablename">
									<option value="">Select Table</option>
									<c:forEach items="${list }" var="l">
									<option value="${l.tablename }">${l.relatedname }</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-md-3">
								<h6>
									<strong>File(CSV)</strong>
								</h6>
								<input type="file" class="form-control" name="files" accept=".csv"
								 required> <br>
							</div>
						</div>
					</div>
				</form>
		<tag:footer/>