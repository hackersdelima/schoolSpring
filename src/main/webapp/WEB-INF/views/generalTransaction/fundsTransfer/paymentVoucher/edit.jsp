<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../../include.jsp"></jsp:include>
<html>
<head>

</head>
<body class="bgcolor hiddenscroll background">
	<div class="breadcrumb-line">
		<nav aria-label="breadcrumb" role="navigation">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home"
					aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">Multi
					Transaction</li>
				<li class="breadcrumb-item active" aria-current="page">View</li>
			</ol>
		</nav>
	</div>

	<div class="panel panel-default " style="width: 95%; margin: auto;">
		<div class="panel-heading">
			<h6>
				<strong>Account Details</strong>
			</h6>
		</div>
		<div class="panel-body">
			<table id="datatable"
				class="table jambo_table table table-striped table-bordered">
				<thead>
					<tr>
						<th>S. No.</th>
						<th>Transaction Id</th>
						<th>Booking Date</th>
						<th>Amount</th>

						<th><i class="fa fa-cog" aria-hidden="true"></i></th>
					</tr>
				</thead>
				<tbody>
					<%int sno=1; %>
					<c:forEach items="${multitransactionlist }" var="list">
						<tr>
							<td><%=sno %></td>
							<td class="transactionid">${list.transactionid }</td>
							<td>${list.bookingdate }</td>
							<td>${list.amount }</td>
							<td><a class="view btn-link"  > View </a> <%-- <a class="clickbtn" href="multitransaction.del?id=${list.transactionid }"
										style="color: red;"><i class="fa fa-trash-o"
											aria-hidden="true"></i> Delete</a> --%></td>
						</tr>
						<%sno++; %>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade modal-lg" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<table class="display table table-striped table-bordered">
						<thead>
							<tr>
								<th>Transaction Id</th>
								<th>Currency</th>
								<th>Booking Date</th>
							</tr>
							</thead>
							<tbody>
								<tr>
									<td id="tid"></td>
									<td>NPR</td>
									<td id="bookingdate"></td>
								</tr>
							</tbody>
							
							</table>
					
				</div>
				<div class="modal-body">
					
					<table id="table"
						class="display table table-striped table-bordered">
						<thead>
							<tr>
								<th>Account No</th>
								<th>Value Date</th>
								<th>Narration</th>
								<th>Trans. Code</th>
								<th>Amount</th>
								<th>Cheque Number</th>
								<th>Trans. Type</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<a type="button" class="btn btn-danger"
						data-dismiss="modal">Delete</a>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	$('.clickbtn').click(function() {
		return confirm('CONFIRM?');
	});
	</script>
	<script type="text/javascript">
	$(".view").click(function(event){
		var transactionId = $(this).closest("tr").find('.transactionid').html(); 
	var url = "http://124.41.193.91/sahakariapi/multransaction/findById/"+transactionId;
		$.ajax({
			url : url
		}).then(function(data) {
			$("#table").dataTable().fnDestroy();
			
			$("#tid").html(data.data[0].transactionId);
			$("#currency").html(data.data[0].currency);
			$("#bookingdate").html(data.data[0].bookingDate);
			
			var datatable = $('#table').dataTable({
				bFilter:false,
				paging : false,
				aaData : data.data,
				aoColumns : [ {
					"mData" : "accountNumber"
				}, {
					"mData" : "valueDate"
				}, {
					"mData" : "narrative"
				}, {
					"mData" : "transactionCode"
				}, {
					"mData" : "amount"
				},{
					"mData" : "cheqNumber"
				}, 
				{
					"mData" : "drcr"
				}, 
				]
			});
			
			$("#exampleModal").modal('show');
		});

	});
	
	</script>

</body>
</html>
