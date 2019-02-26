<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<tag:header title="CREATE FINANCIAL ACCOUNT"/>
		<spring:url value="/nav/financialAccountNo" var="accountGen"></spring:url>
<spring:url value="/account/add" var="formUrl" />
			<form  action="${formUrl }" method="post">
				<div id="1" class="tab-pane fade in active">
					<table class="table">
						<tbody>
							<tr>
							
							<td>
							
			<input type="button" id="validate" class="btn btn-success" value="validate"></button>
								<input type="submit" class="btn btn-success"
									value="Save"></td>
							</tr>
							<tr>
									<td>
										<h5>Account No</h5> <input type="text"
									class="form-control" name="accountNumber" value="" id="accountNumber" >
										<input type="hidden" name="accountGen" class="accountGen" value="${accountGen }">
										<input type="text" name="appl" id="appl" value="${appl }" hidden>
										<input type="text" name="pid" id="pid" value="" hidden>
									</td>
								<td>
									<h5>Alternative Account ID</h5> <input type="text"
									class="form-control" name="alternativeAccounId" value="" data-validation="number" data-validation-error-msg=" " data-validation-optional="true">
								</td>
							</tr>
							<tr>
								 <td>
									<h5>Category</h5> <select class="form-control categoryid black_color"
									name="categoryModel.categoryId" id="categoryid">
										<option value="">Select Category</option>
										<c:forEach items="${categorylist }" var="c">
										<option value="${c.categoryId }">${c.categoryId }-${c.categoryHead }</option>
										</c:forEach>
								</select>
								</td> 
								 <td>
									<h5>Account Type</h5> <select class="form-control accounttype black_color"
									name="accountTypeModel.accountType">
										<option>Select Account Type</option>
										<c:forEach items="${accounttypelist }" var="a">
										<option value="${a.accountType}">${a.accountType }-${a.accountTypeHead }</option>
										</c:forEach>
								</select>
								</td> 
							</tr>
							<tr>
								<td>
									<h5>Account Name</h5> <input type="text"
									class="form-control memberid" name="accountName" value="" data-validation="alphanumeric" data-validation-error-msg=" ">
								</td>
<!-- 								<td>
									<h5>Limit Reference</h5> <input type="text"
									class="form-control" name="limitRef" value="">
								</td> -->
							</tr>
						</tbody>
					</table>
				</div>
			</form>
	<jsp:include page="../../msgmodal.jsp"></jsp:include>
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
<tag:footer/>
	<script>
	<%if(request.getAttribute("msg")!=null){%>
	   $('#myModal').modal('show');
	   <%}%>
	  
</script>
<script>
  $('#categoryid').change(function(){
	  var id=$(this).val();
	  var dataString = 'categoryid='+ id;
	  var accountGen=$(".accountGen").val();
	 
	 
	  $.ajax
	     ({
	     type: "POST",
	     url: "../nav/financialAccountNo",
	     data: dataString,
	     cache: false,
	     success: function(html)
	     {
	     $("#accountNumber").val(html);
	     } 
	     });
  });
</script>

