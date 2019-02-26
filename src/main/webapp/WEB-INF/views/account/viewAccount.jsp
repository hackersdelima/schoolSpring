<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<tag:header title="MEMBER ACCOUNT DETAILS ${msg }"/>
<style>
.resulttable{
display:none;}
</style>

				<a href="<spring:url value="/nav/account" />" class="btn btn-info pull-right btn-sm"
					href="">Add New Account</a>
			<div class="loader"><p>Loading Please Wait......</p></div>
				<table id="datatable"
					class="table jambo_table table-striped table-bordered resulttable"
					style="font-size: 100%;">
					<thead>
						<tr>
							<th>Member Id</th>
							<th>Account Number</th>
							<th>Account Type</th>
							<th>Account Name</th>
							<th>Category</th>
							<th>Balance</th>
							<th>Action</th>
							<th>Statements</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${accountlist }" var="list">
							<tr>
								<td>${list.memberId }</td>
								<td>${list.accountNumber }</td>
								<td>${list.accountTypeModel.accountType }</td>
								<td>${list.accountName }</td>
								<td>${list.categoryModel.categoryHead }</td>
								<td>${list.workingBal }</td>
								<td><a
									href="<spring:url value="/account/edit/${list.accountNumber}" />">Edit</a>
										<%-- <a href="account.del?id=${list.accountNumber }"
									class="clickbtn btn btn-danger btn-xs">Remove</a> --%></td>
									<td><a
									href="<spring:url value="/nav/viewStatements/${list.accountNumber}" />">View Statements</a>
										</td>
							</tr>
						</c:forEach>
						
					</tbody>
				</table>
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-body">
					<p>${msg }</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<tag:footer/>
	<script type="text/javascript">
	 $('#datatable').each(function() 
				{
			$(".resulttable").show();
					$(".loader").hide();
				});
			$('.clickbtn').click(function() {
				return confirm('CONFIRM?');
			}); 
		$('.clickbtn').click(function() {
			return confirm('CONFIRM?');
		});
	<%if (request.getAttribute("msg") != null) {%>
		$('#myModal').modal('show');
	<%}%>
		$('#example').DataTable();
	</script>

