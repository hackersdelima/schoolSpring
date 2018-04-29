<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/includefile"></jsp:include>
<html>
<head>

</head>
<body class="bgcolor hiddenscroll background">
	<div class="breadcrumb-line">
		<nav aria-label="breadcrumb" role="navigation">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home"
					aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">Multi Transaction</li>
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
			<table id="example" class="display table table-striped table-bordered"
				cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>S. No.</th>
						<th>Transaction Id</th>
						<th>Transaction Number</th>
						<th>Booking Date</th>
						
						<th><i class="fa fa-cog" aria-hidden="true"></i></th>
					</tr>
				</thead>
				<tbody>
				<%int sno=1; %>
						<c:forEach items="${multitransactionlist }" var="list">				
					<tr>
						<td><%=sno %></td>
						<td>${list.transactionid }</td>
						<td>${list.transactionno }</td>
						<td>${list.bookingdate }</td>
						<td><div class="dropdown">
								<button class="btn btn-default dropdown-toggle" type="button"
									data-toggle="dropdown">
									Action <span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="editmultitxn.click?id=${list.transactionid}" style="color: blue;"><i
											class="fa fa-eye" aria-hidden="true"></i> Show Detail</a></li>
									<li><a class="clickbtn" href="multitransaction.del?id=${list.transactionid }"
										style="color: red;"><i class="fa fa-trash-o"
											aria-hidden="true"></i> Delete</a></li>
								</ul>
							</div>
							</td>
					</tr>
					<%sno++; %>
					</c:forEach>	
				</tbody>
			</table>
		</div>
	</div>

	<jsp:include page="/msgmodal"></jsp:include>
	<script type="text/javascript">
	$('.clickbtn').click(function() {
		return confirm('CONFIRM?');
	});
	<%if (request.getAttribute("msg") != null) {%>
	$('#myModal').modal('show');
<%}%>
	 $('#example').DataTable();
		
		
	</script>
</body>
</html>
