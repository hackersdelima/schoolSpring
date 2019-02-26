<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<tag:header title="INITIAL DETAILS"/>
			<spring:url value="/operation/initialdetailadd" var="formUrl"/>
				<div class="" role="tabpanel" data-example-id="togglable-tabs">
					<ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
						<li role="presentation" class="active"><a
							href="#tab_content1" id="home-tab" role="tab" data-toggle="tab"
							aria-expanded="true">Language</a></li>
						<li role="presentation" class=""><a href="#tab_content2"
							role="tab" id="profile-tab" data-toggle="tab"
							aria-expanded="false">Section</a></li>
						<li role="presentation" class=""><a href="#tab_content3"
							role="tab" id="profile-tab2" data-toggle="tab"
							aria-expanded="false">House Group</a></li>
						<li role="presentation" class=""><a href="#tab_content4"
							role="tab" id="profile-tab3" data-toggle="tab"
							aria-expanded="false">Ethnic Group</a></li>
						<li role="presentation" class=""><a href="#tab_content5"
							role="tab" id="profile-tab4" data-toggle="tab"
							aria-expanded="false">Special Interest</a></li>
						<li role="presentation" class=""><a href="#tab_content6"
							role="tab" id="profile-tab4" data-toggle="tab"
							aria-expanded="false">Academic Classes</a></li>
						<li role="presentation" class=""><a href="#tab_content7"
							role="tab" id="profile-tab5" data-toggle="tab"
							aria-expanded="false">Exam Type</a></li>
					</ul>
					<div id="myTabContent" class="tab-content">
						<div role="tabpanel" class="tab-pane fade active in"
							id="tab_content1" aria-labelledby="home-tab">
							<form:form  class="form" action="${formUrl }" 
								style="width: 20%; margin-top: 10px;">
								<h6>
									<strong>Language Name:</strong>
								</h6>
								<input type="text" class="form-control" name="languagename"
									placeholder="Language name..." required> <br>
								<button type="submit" class="btn btn-success">+ ADD</button>
							</form:form>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="tab_content2"
							aria-labelledby="profile-tab">
							<form action="${formUrl }" method="post"
								style="width: 20%; margin-top: 10px;" class="form">
								<h6>
									<strong>Section Name:</strong>
								</h6>
								<input type="text" class="form-control" name="sectionname"
									placeholder="Section name..." required> <br>
								<button type="submit" class="btn btn-success">+ ADD</button>
							</form>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="tab_content3"
							aria-labelledby="profile-tab">
							<form action="${formUrl }" method="post"
								style="width: 20%; margin-top: 10px;" class="form">
								<h6>
									<strong>House Group Name:</strong>
								</h6>
								<input type="text" class="form-control" name="housegroupname"
									placeholder="House Group name..." required> <br>
								<button type="submit" class="btn btn-success">+ ADD</button>
							</form>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="tab_content4"
							aria-labelledby="profile-tab">
							<form action="${formUrl }" method="post"
								style="width: 20%; margin-top: 10px;" class="form">
								<h6>
									<strong>Ethnic Group Name:</strong>
								</h6>
								<input type="text" class="form-control" name="castename"
									placeholder="Ethnic group name..." required> <br>
								<button type="submit" class="btn btn-success">+ ADD</button>
							</form>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="tab_content5"
							aria-labelledby="profile-tab">
							<form action="${formUrl }" method="post"
								style="width: 20%; margin-top: 10px;" class="form">
								<h6>
									<strong>Special Interest Name:</strong>
								</h6>
								<input type="text" class="form-control"
									name="specialinterestname"
									placeholder="Special interest name..." required> <br>
								<button type="submit" class="btn btn-success">+ ADD</button>
							</form>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="tab_content6"
							aria-labelledby="profile-tab">
							<form action="${formUrl }" method="post"
								style="width: 20%; margin-top: 10px;" class="form">
								<h6>
									<strong>Academic Class Name:</strong>
								</h6>
								<input type="text" class="form-control" name="classname"
									placeholder="Academic class name..." required> <br>
								<button type="submit" class="btn btn-success">+ ADD</button>
							</form>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="tab_content7"
							aria-labelledby="profile-tab">
							<form action="${formUrl }" method="post"
								style="width: 20%; margin-top: 10px;" class="form"
								id="examtypeform">
								<h6>
									<strong>Exam Type Name:</strong>
								</h6>
								<input type="text" class="form-control" name="examtypename"
									placeholder="Exam type name..." required><br>
								<h6>
									<strong>Exam Type Description:</strong>
								</h6>
								<textarea class="form-control" name="examdescription"
									form="examtypeform" value="" rows="5"></textarea>
								<br>
								<button type="submit" class="btn btn-success">+ ADD</button>
							</form>
						</div>
					</div>
				</div>
		<tag:footer/>
	<div class="col-md-12 col-sm-12 col-xs-12">

		<div class="x_panel">
			<div class="x_title">
				<h2>AVAILABLE INITIAL DETAILS</h2>
				<ul class="nav navbar-right panel_toolbox">
					<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
					</li>
					<li><a class="close-link"><i class="fa fa-close"></i></a>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<table class="table jambo_table table-striped table-bordered"
					style="font-size: 95%;">
					<thead>
						<tr>
							<th>Languages</th>
							<th>Sections</th>
							<th>House Groups</th>
							<th>Ethnic Groups</th>
							<th>Special Interests</th>
							<th>Admission Class</th>
							<th>Exam Type</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<ol>
								<c:forEach items="${language }" var="lan">
									<li><a href="<spring:url value="/initialDetails/languageEdit?id=${lan.languageid }&value=${lan.languagename }"/>"><i class="glyphicon glyphicon-edit" aria-hidden="true"
										style="color: blue"></i> ${lan.languagename } </a>
									</li>
									</c:forEach>
								</ol>
							</td>
							<td>
								<ol>
									<c:forEach items="${section }" var="sec">
									<li><a href="<spring:url value="/initialDetails/sectionEdit?id=${sec.sectionid }&value=${sec.sectionname}"/>"><i class="glyphicon glyphicon-edit" aria-hidden="true"
										style="color: blue"></i>${sec.sectionname }</a>
									</li>
									</c:forEach>
								</ol>
							</td>
							<td>
								<ol>
									<c:forEach items="${housegroup }" var="hg">
									<li><a href="<spring:url value="/initialDetails/housegroupEdit?id=${hg.housegroupid }&value=${hg.housegroupname }"/>"><i class="glyphicon glyphicon-edit" aria-hidden="true"
										style="color: blue"></i>${hg.housegroupname }</a>
									</li>
									</c:forEach>
									
								</ol>
							</td>
							<td>
								<ol>
							
									<c:forEach items="${caste }" var="cas">
									<li><a href="<spring:url value="/initialDetails/ethnicgroupEdit?id=${cas.casteid}&value=${cas.castename }"/>"><i class="glyphicon glyphicon-edit" aria-hidden="true"
										style="color: blue"></i>${cas.castename }</a>
									</li>
									</c:forEach>
								
								</ol>
							</td>
							<td>
								<ol>
									<c:forEach items="${specialinterest }" var="si">
									<li><a href="<spring:url value="/initialDetails/specialInterestEdit?id=${si.specialInterestId }&value=${si.specialInterestName}"/>"><i class="glyphicon glyphicon-edit" aria-hidden="true"
										style="color: blue"></i>${si.specialInterestName }</a>
									</li>
									</c:forEach>
								</ol>
							</td>
							<td>
								<ol>
								
									<c:forEach items="${adclass }" var="ac">
									<li><a href="<spring:url value="/initialDetails/admissionClassEdit?id=${ac.classid }&value=${ac.classname}"/>"><i class="glyphicon glyphicon-edit" aria-hidden="true"
										style="color: blue"></i>${ac.classname }</a>
									</li>
									
									</c:forEach>
								
								</ol>
							</td>
							<td>
								<ol>
									<c:forEach items="${examtype }" var="exam">
										<li><a href="<spring:url value="/initialDetails/examTypeEdit?id=${exam.examtypeid }&value=${exam.examtypename }"/>"><i class="glyphicon glyphicon-edit" aria-hidden="true"
										style="color: blue"></i>${exam.examtypename }</a>
									</li>
										</c:forEach>
								</ol>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<jsp:include page="../msgmodal.jsp"></jsp:include>
	<script>
		$('.form').submit(function() {
			return confirm('CONFIRM SUBMIT?');
		});
		$('[data-toggle="tooltip"]').tooltip();
	</script>
