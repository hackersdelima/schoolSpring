<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="../include.jsp"></jsp:include>

<html>
<head>
<style>
.green {
	color: green
}

.red {
	color: red
}

.updatebtn {
	display: none;
}

h6 {
	font-weight: bold;
}

<%--
<%
if (request.getAttribute ("updatebtn ") != null ) { %> .updatebtn {
	display: block;
}

.submitbtn {
	display: none;
}
<%
}
%>
--%>
</style>
</head>
<body class="background">
	<spring:url value="/user/update" var="updateUrl"></spring:url>

	<div class="breadcrumb-line">
		<nav aria-label="breadcrumb" role="navigation">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home"
					aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">Settings</li>
				<li class="breadcrumb-item active" aria-current="page">User
					Settings</li>
				<li class="breadcrumb-item active" aria-current="page">Add
					Users</li>
			</ol>
		</nav>
	</div>

	<div class="panel panel-default" style="width: 100%; margin: auto;">

		<div class="panel-body">
			<div class="panel panel-default" style="width: 100%;">
				<div class="panel-heading count">
					<strong>Add New User</strong>
				</div>
				<div class="panel-body">
					<form method="post" action="${updateUrl }" name="form">
						<table class="table">
							<tbody>
								<tr>

									<td>
									
										<h6>Username</h6> <input type="hidden" 
										value="${useredit.userid}" name="userid"> <input
										type="text" name="username" class="form-control" 
										data-validation="number" value="${useredit.username }"
										required>
									</td>
									<td>
										<h6>Role Name</h6> <select class="form-control"
										name="givenrole" >
											<option value="">Select Role</option>
											<c:forEach items="${rolelist }" var="role">
												<option value="${role.name }">${role.name}</option>
											</c:forEach>
											<option value="${role.name }"
												<c:if test="${role.name eq 'admin' }">selected</c:if>>${role.name }</option>
											<option value="${role.name }"
												<c:if test="${role.name eq 'staff' }">selected</c:if>>${role.name }</option>
									</select>
									</td>
									<td>
										<h6>Full Name</h6> <input type="text" class="form-control"
										name="fullName"  value="${useredit.fullName }">
									</td>

								</tr>
								<tr>
									<td>
										<h6>Post</h6> <input type="text" class="form-control"
										name="post"  value="${useredit.post }">
									</td>
									<td>
										<h6>Staff Code</h6> <input type="text" class="form-control"
										name="staffCode"  value="${ useredit.staffCode}"
										required>
									</td>
									<td>
										<h6>Branch Code</h6> <input type="text" class="form-control"
										name="branch.branchId" 
										value="${ useredit.branch.branchId}" required>
									</td>
								</tr>
								<tr>
									<td>
										<h6>Start Date</h6> <input type="text" class="form-control"
										name="startDate"  value="${ useredit.startDate}">
									</td>
									<td>
										<h6>End Date</h6> <input type="text" class="form-control"
										name="endDate"  value="${ useredit.endDate}"
										required>
									</td>
									<td>
										<h6>Branch Allowed</h6> <select multiple id="branches"
										name="branchAllowed">
											<c:forEach items="${branchlist }" var="b">
												<option value="${b.branchId }-${b.branchName}">${b.branchId }-${b.branchName}</option>
											</c:forEach>
									</select>
									</td>
								</tr>

								<tr>
									<td>

										<h6>Function Allowed</h6> <input  type="text"
										name="functionAllowed" class="form-control "
										value="${ useredit.functionAllowed}" />


									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<caption>
								<h4>Additional Functions</h4>
							</caption>
							<tr>

								<td><label><input type="checkbox" id="dashboard"
										name="additionalFunctions" value="#dashboard"
										class="js-switch"
										<c:if test="${fn:contains(functionAllowed,'#dashboard')}"> checked="checked"</c:if>>
										Dashboard &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
								<td><label><input type="checkbox" id="exam"
										name="additionalFunctions" value="#exam" class="js-switch"
										<c:if test="${fn:contains(functionAllowed,'#exam')}"> checked="checked"</c:if>>
										Exam &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
								<td><label><input type="checkbox" id="student"
										name="additionalFunctions" value="#student" class="js-switch"
										<c:if test="${fn:contains(functionAllowed,'#retailoperation')}"> checked="checked"</c:if>>
										Student &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>

								<td><label><input type="checkbox"
										id="generaltransaction" name="additionalFunctions"
										value="#generaltransaction" class="js-switch"
										<c:if test="${fn:contains(functionAllowed,'#generaltransaction')}"> checked="checked"</c:if>>
										General Transaction &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
								<td><label><input type="checkbox" id="account"
										name="additionalFunctions" value="#account" class="js-switch"
										<c:if test="${fn:contains(functionAllowed,'#account')}"> checked="checked"</c:if>>
										Account &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
								<td><label><input type="checkbox"
										id="adminsettings" name="additionalFunctions"
										value="#adminsettings" class="js-switch"
										<c:if test="${fn:contains(functionAllowed,'#adminsettings')}"> checked="checked"</c:if>>
										Admin Settings &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
							</tr>

						</table>



						<input type="submit" name="button" value="Update"
							class="btn btn-primary">



					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="panel panel-default" style="width: 100%; margin: auto;">

		<div class="panel-body">
			<div class="panel panel-default" style="width: 100%;">
				<div class="panel-heading count">
					<strong>Existing Users</strong>
				</div>
				<div class="panel-body">

					<table
						class="table display jambo_table table-striped table-bordered"
						id="datatable">
						<thead>
							<tr>
								<th>User Name</th>
								<th>Actions</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach items="${userList}" var="user">
								<tr>
									<td>${user.username }</td>

									<td><a
										href="edituser.user?userid=${user.userid }&username=${user.username}"><i
											class="fa fa-pencil-square-o"></i></a> <a class="confirmbtn"
										href="deleteuser.user?userid=${user.userid }&username=${user.username}"><i
											class="fa fa-trash" id="deletebtn" aria-hidden="true"
											style="color: red"></i></a></td>


								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

		</div>
	</div>

	<script>
		$(document).ready(function() {

			$('#button').click(function() {
				$('input[type="text"]').val('');
			});
			var $others = $('input[name="role"]').not('#admin')
			$('#admin').change(function() {
				if (this.checked) {
					$others.bootstrapToggle('off')
				}
			});
			$others.change(function() {
				if (this.checked) {
					$('#admin').bootstrapToggle('off')
				}
			})

			var t = $('#table').DataTable({
				"iDisplayLength" : 50

			});
			t.on('order.dt search.dt', function() {
				t.column(0, {
					search : 'applied',
					order : 'applied'
				}).nodes().each(function(cell, i) {
					var c = cell.innerHTML = i + 1;
				});
			}).draw();

			$(".username").blur(function() {
				var id = $(this).val();
				var dataString = 'id=' + id;
				$.ajax({
					type : "POST",
					url : "checkusername.check",
					data : dataString,
					cache : false,
					success : function(html) {
						$(".usercheck").html(html);
					}
				});

			});
			$(".confirmbtn").click(function(event) {
				return confirm("CONFIRM?");
			});
			$(".staffcode").blur(function() {
				var id = $(this).val();
				var dataString = 'id=' + id;
				$.ajax({
					type : "POST",
					url : "checkstaffcode.check",
					data : dataString,
					cache : false,
					success : function(html) {
						$(".staffcheck").html(html);
						var user = $('.staffcheck').html().val();
						if (user = "Unavailable!") {
							alert('hello');
						}
					}
				});

			});
		});
	</script>


	<c:if test="${msg!=null }">
		<script>
			$('#myModal').modal('show');
		</script>
	</c:if>
	<!-- <script>
$('.hash').on('keypress',function(e){
	var value=$(this).val();
	$('.hash').val('#'+value);
});
</script> -->

	<script
		src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		$(function() {
			$('#branches').multiselect({
				includeSelectAllOption : true
			});
			$('#btnSelected').click(function() {
				var selected = $("#lstFruits option:selected");
				var message = "";
				selected.each(function() {
					message += $(this).text() + " " + $(this).val() + "\n";
				});
				alert(message);
			});
		});
		$('form').submit(function() {
			return confirm('Confirm Submission?');
		})
	</script>
</body>

</html>
