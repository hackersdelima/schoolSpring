<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<tag:header title="PAYMENTS"/>
				<table id="datatable"
					class="table jambo_table table-striped table-bordered">
					<thead>
					<tr >
						<th>Transaction ID</th>
						<th>Value Date</th>
						<th>Booking Date</th>
						<th>Action</th>
						
					
					</tr>
						
					</thead>
					<tbody>
					<c:forEach items="${txn }" var="t">
						<tr>
							<td class="transactionid">${t.transactionId }</td>
							<td>${t.valueDate }</td>
							<td>${t.bookingDate }</td>
							
							<td><a href="<spring:url value="/paymentVoucher/view/${t.payment_voucher_id }"/>">View</a>
							<a href="<spring:url value="/paymentVoucher/viewPaymentVoucher/${t.payment_voucher_id }"/>">Print</a></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
	
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
<tag:footer/>
	<script type="text/javascript">
	$('.clickbtn').click(function() {
		return confirm('CONFIRM?');
	});
	</script>
	<script type="text/javascript">
	$(".view").click(function(event){
		var transactionId = $(this).closest("tr").find('.transactionid').html(); 
	var url = "../paymentVoucher/view/"+transactionId;
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
	
	
	<script>
		$('#form').submit(function() {
			return confirm('CONFIRM SUBJECT SAVE?');
		});
		$('.delete').click(function() {
			return confirm('CONFIRM SUBJECT DELETE?');
		});
		
	</script>
