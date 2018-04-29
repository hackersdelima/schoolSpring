<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../include.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Purchase Invoice</title>
    <link rel="stylesheet" href="<spring:url value="/resources/css/invoice.css"/>" media="all" />
    <style>
    					
    					.displaynone {
							display: none;
						}
						.itemdetailinput{
						width:10%;
						}
						.inputdetails{
						width:60%;
						float:right;}
						.top{
						width:65%;
						float:right;}
						
						
    
    </style>
</head>
  <body class="background">
  
 <div class="row">

 <div class="col-md-12">
    <header class="clearfix">
    <form id="addBillForm" method="post" action="addPurchase" target="_blank"></form>
      <div id="logo">
       
      </div>
      <center><h2 class="name"><strong>STUDENT FEE INVOICE</strong></h2></center>
      <div id="company">
     
	        <div><span class="label label-default ">From Date(English)*</span> <br>
	        	<input type="text" maxlength="10" id="englishDate" class="form-control " name="fromDate" form="addBillForm" placeholder="yyyy-mm-dd"required>
	        </div>
	        <br>
	        <div><span class="label label-default ">From Date(Nepali)*</span> <br>
	        	<input type="text" maxlength="10" id="nepaliDate" class="form-control"  placeholder="yyyy-mm-dd" required>
	        </div>
	        <br>
	        <div><span class="label label-default ">To Date(English)*</span> <br>
	        	<input type="text" maxlength="10" id="englishDate1" class="form-control " name="toDate" form="addBillForm" placeholder="yyyy-mm-dd"required>
	        </div>
	        <br>
	        <div><span class="label label-default ">To Date(Nepali)*</span> <br>
	        	<input type="text" maxlength="10" id="nepaliDate1"class="form-control"  placeholder="yyyy-mm-dd" required>
	        </div>
	        <br>
      </div>
      
    </header>
    <main>
    
    <div id="details" class="clearfix">
        <div id="seller">
         
	          <h4 class="name"><span class="label label-default">Invoice No*</span><input type="text" class="form-control " name="invoiceNo" form="addBillForm" required>
			</h4>
		
			 <h4 class="name"><span class="label label-default">Student Admission No*</span><input type="text" class="form-control " name="studentid" form="addBillForm" required>
			</h4>
			 <h4 class="name"><span class="label label-default">Fee Category*</span><select class="form-control" name="feeCategory" form="addBillForm" required>
			 	<option value="">Select Category</option>
			 </select>
			</h4>
			
       
        </div>
        <div id="client">

          <div class="date">
          	<span class="label label-default">Bill Date(English)*</span> 
          	<input type="text" maxlength="10" id="billDateEnglish" class="form-control" name="billDate" form="addBillForm" placeholder="yyyy-mm-dd" required>
          </div>
          <br>
          <div class="date">
          	<span class="label label-default">Bill Date(Nepali)*</span> 
          	<input type="text"  maxlength="10" id="billDateNepali" class="form-control" placeholder="yyyy-mm-dd" required>
          </div>
        </div>
        
      </div>
      
      <table border="0" cellspacing="0" cellpadding="0" >
        <thead>
          <tr>
          	<th class="desc"><button  class="btn btn-default add" >+</button></th>
            <th class="no">#</th>
            <th class="desc" colspan="4">DESCRIPTION</th>
             <th class="desc" colspan="1">CHARGES</th>
            <th class="desc" colspan="1">PAYMENTS</th>
            <th class="total itemdetailinput " colspan="1">BALANCE</th>
           
          </tr>
        </thead>
        <tbody>
     
         
          <tr id="tablerow">
          	<td><button onclick="deleteRow(this)" class="removebutton">X</button></td>
          	
            <td class="no" ></td>
            <td class="desc" colspan="4"><input type="text" class="form-control input" name="description"  form="addBillForm" required></td>
           <td class="desc" colspan="1"><input type="text" class="form-control one" name="charges"  form="addBillForm" required></td>
           <td class="desc" colspan="1">
           		<input type="text" class="form-control two" name="payments" id="itemName" form="addBillForm" required>
			</td>
            <td class="total" colspan="1">
            	<input  class="form-control balance" type="number" step="any" min=1 name="balance" form="addBillForm"   required>
            </td>
            
           
          </tr>
          
        </tbody>
        <tfoot>
        	
          <tr>
            <td colspan="7"></td>
            <td colspan="1" >SUB-TOTAL(Rs)</td>
            <td ><input  class="form-control subtotal" type="number" step="any" min=1 name="subTotal" form="addBillForm" readonly required> </td>
          </tr>
          <tr>
            <td colspan="7"></td>
            <td colspan="1" > <span class="label label-default">Discount %*</span><br> <input  form="addBillForm" name="discountPercentage" type="number" step="any"  min=0  max=100 class="form-control discountPercentage inputdetails " required></td>
           
            <td><span class="label label-default">Discount(Rs)</span> <input value="0" form="addBillForm" name="discountAmount" type="number"  step="any" min=1 class="form-control discountAmount " readonly required></td>
          </tr>
          <tr>
            <td colspan="7"></td>
            <td colspan="1" >TOTAL(Rs)</td>
            <td ><input  class="form-control resulttotal" type="number" step="any" min=1 form="addBillForm" name="totalAmount" required readonly></td>
          </tr>
          <tr>
            <td colspan="7"></td>
            <td colspan="1"> <span class="label label-default">TAX %*</span><br> <input name="vatPercentage" form="addBillForm" step="any" type="number" min=0  max=100 class="form-control taxPercentage inputdetails"  required></td>
            <td><span class="label label-default">TAX Amount(Rs)</span> <input value="0" name="vatAmount" form="addBillForm" type="number" step="any" min=1 class="form-control taxAmount" required></td>
          </tr>
          
          <tr>
            <td colspan="7"></td>
            <td colspan="1">GRAND TOTAL(Rs)</td>
            <td ><input name="grandTotal" id="number" form="addBillForm" type="number" step="any" min=1 class="form-control grandTotal"  required readonly></td>
          </tr>
          <tr>
            <td colspan="6"></td>
            <td colspan="1"><h5>IN WORDS</h5></td>
            <td colspan="2"><textarea id="result" cols="30" name="grandTotalInWords" form="addBillForm" class="form-control" rows="3"  readonly></textarea></td>
          </tr>
          <tr>
            <td colspan="6"></td>
            <td colspan="1"><h5>REMARKS</h5></td>
            <td colspan="2"><textarea id="remarks" cols="30" name="remarks" form="addBillForm" class="form-control" rows="3"  ></textarea></td>
          </tr>
        </tfoot>
      </table>
      
      <div id="notices">
        <div><button class="btn btn-danger " type="submit"
							form="addBillForm">SUBMIT</button></div>
        <div class="notice"></div>
      </div>
      
    </main>
  </div>
  
   <div class="col-md-1"></div>
   </div>
	<script src="<spring:url value="/resources/js/dynamicpurchase.js"/>"></script>
	<script src="<spring:url value="/resources/js/dateAction.js"/>"></script>
	<script>

	$("table").on("change", "input", function () {  /* //use event delegation */
		  var tableRow = $(this).closest("tr");  /* //from input find row */
		  var one = Number(tableRow.find(".one").val());  /* //get first textbox */
		  var two = Number(tableRow.find(".two").val());  /* //get second textbox */
		  var balance = one - two; /*  //calculate total */
		  tableRow.find(".balance").val(balance); 
		});

$(document).on('blur', "input", function() {
	 calculateSubTotal();
}); 
 function calculateSubTotal(){
	  var sum = 0;
	   $(".balance").each(function(){
	        sum += +$(this).val();
	    });
	    $(".subtotal").val(sum);
	 
}
	
	</script>
    </body>

</html>