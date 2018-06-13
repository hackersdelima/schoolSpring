<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../include.jsp"></jsp:include>
<html>


<head>

</head>

<body class="background">

<div class="panel panel-default " style="width: 95%; margin: auto;">
		
		<div class="panel-body">

			<form class="form-horizontal" id="form1" method="post"
				action="account.update">
				<div id="1" class="tab-pane fade in active">
					<table class="table">
						<tbody>
							<tr>
								<td><input type="submit" class="btn btn-success"
									value="Update"></td>
							</tr>
							<tr>
								<td>
									<h5>Member Id</h5> <input type="text"
									class="form-control sharecertmemberid" data-validation="number" name="pid" value="${accountdetail.pid }">
								</td>
							</tr>
							<tr>
									<td>
									<input type="hidden"
									class="form-control" name="previousAccountNumber" value="${accountdetail.accountNumber }">
										<h5>Account No</h5> <input type="text"
									class="form-control" name="accountNumber" value="${accountdetail.accountNumber }" required>
									</td>
								<td>
									<h5>Alternative Account ID</h5> <input type="text"
									class="form-control" name="alternativeAccounId" value="${accountdetail.alternativeAccounId }">
								</td>
							</tr>
							<tr>
								<td>
									<h5>Category</h5> <select class="form-control categoryid"
									name="categoryId">
										<option value="${accountdetail.categoryId }">${accountdetail.categoryId }</option>
										<c:forEach items="${categorylist }" var="c">
										<option value="${c.categoryId }">${c.categoryHead }</option>
										</c:forEach>
								</select>
								</td>
								<td>
									<h5>Account Type</h5> <select class="form-control accounttype"
									name="accountType">
										<option value="${accountdetail.accountType }">${accountdetail.accountType }</option>
								</select>
								</td>
							</tr>
							<tr>
								<td>
									<h5>Account Name</h5> <input type="text"
									class="form-control memberid" data-validation="alphanumeric" name="accountName" value="${accountdetail.accountName }">
								</td>
								<td>
									<h5>Limit Reference</h5> <input type="text"
									class="form-control" name="limitRef" value="${accountdetail.limitRef }">
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</form>
		</div>
	</div>
	<div class="modal fade" id="memberidmsgmodal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-body">
          <p id="modalmsg"></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
</div>


<input type="hidden" class="memberidstatus" value="">

<script>
  $.validate({
    lang: 'en',
    modules : 'date,toggleDisabled',
	  disabledFormFilter : 'form.toggle-disabled',
	 showErrorDialogs : false

    });
</script>
</body>
</html>
