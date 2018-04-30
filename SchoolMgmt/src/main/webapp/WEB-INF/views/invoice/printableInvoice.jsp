<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	
	<title>Editable Invoice</title>
	
	<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/resources/css/style.css' />
	<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/resources/css/print.css' media="print" />

</head>

<body>
<a href="<spring:url value="/invoice/add" />">Edit</a>
<a href="<spring:url value="/invoice/save" />">Save</a>
	<div id="page-wrap">

		<textarea id="header">INVOICE</textarea>
		
		<div id="identity">
		
            <p id="address">${sessionScope.systemdetail[0].settingsdescription },<br>
            ${sessionScope.systemdetail[2].settingsdescription },<br>
            Phone: ${sessionScope.systemdetail[3].settingsdescription }</p>

            <div id="logo">
              <div id="logohelp">
                <input id="imageloc" type="text" size="50" value="" /><br />
                (max width: 540px, max height: 100px)
              </div>
              <img id="image" src="${pageContext.request.contextPath}/resources/img/logo.png" alt="logo" />
            </div>
		
		</div>
		
		<div style="clear:both"></div>
		
		<div id="customer">

            <p id="customer-title">
            Ramesh Karki<br>
            Admission No: ${sessionScope.feeInvoice.toDateEn }
           </p>

            <table id="meta">
                <tr>
                    <td class="meta-head">Invoice #</td>
                    <td><p>000123</p></td>
                </tr>
                <tr>
                    <td class="meta-head">Invoice Date</td>
                    <td><p id="date">${sessionScope.feeInvoice.invoiceDateEn }</p></td>
                </tr>
                <tr>

                    <td class="meta-head">Date From</td>
                    <td><p id="date">${sessionScope.feeInvoice.fromDateEn }</p></td>
                </tr>
                <tr>

                    <td class="meta-head">Date To</td>
                    <td><p id="date">${sessionScope.feeInvoice.toDateEn }</p></td>
                </tr>
                <tr>
                    <td class="meta-head">Amount Due</td>
                    <td><div class="due">${sessionScope.feeInvoice.balanceDue }</div></td>
                </tr>

            </table>
		
		</div>
		
		<table id="items">
		
		  <tr>
		      <th>Category</th>
		      <th>Description</th>
		      <th>Charges</th>
		      <th>Payment</th>
		      <th>Balance</th>
		  </tr>
		  <c:forEach items="${sessionScope.feeInvoice.description }"> 
		  <tr class="item-row">
		      <td class="item-name">cateogry name</td>
		      <td class="description">${sessionScope.feeInvoice.description }</td>
		      <td><p class="cost">${sessionScope.feeInvoice.charges }</p></td>
		      <td><p class="qty">${sessionScope.feeInvoice.payments }</p></td>
		      <td><span class="price">${sessionScope.feeInvoice.balance }</span></td>
		  </tr>
		  </c:forEach>
		  
		  <tr>
		      <td colspan="2" class="blank"> </td>
		      <td colspan="2" class="total-line">Subtotal</td>
		      <td class="total-value"><div id="subtotal">${sessionScope.feeInvoice.subTotal }</div></td>
		  </tr>
		   <tr>
		      <td colspan="2" class="blank"> </td>
		      <td colspan="2" class="total-line">Discount</td>
		      <td class="total-value"><div id="subtotal">${sessionScope.feeInvoice.discountAmount }</div></td>
		  </tr>
		   <tr>

		      <td colspan="2" class="blank"> </td>
		      <td colspan="2" class="total-line">Total</td>
		      <td class="total-value"><div id="total">${sessionScope.feeInvoice.total }</div></td>
		  </tr>
		   <tr>
		      <td colspan="2" class="blank"> </td>
		      <td colspan="2" class="total-line">Tax Amount</td>
		      <td class="total-value"><div id="subtotal">${sessionScope.feeInvoice.taxAmount }</div></td>
		  </tr>
		  <tr>

		      <td colspan="2" class="blank"> </td>
		      <td colspan="2" class="total-line">Grand Total</td>
		      <td class="total-value"><div id="total">${sessionScope.feeInvoice.grandTotal }</div></td>
		  </tr>
		  <tr>
		      <td colspan="2" class="blank"> </td>
		      <td colspan="2" class="total-line">Amount Paid</td>
		      <td class="total-value"><p id="paid">${sessionScope.feeInvoice.amountPaid }</p></td>
		  </tr>
		  <tr>
		      <td colspan="2" class="blank"> </td>
		      <td colspan="2" class="total-line balance">Balance Due</td>
		      <td class="total-value balance"><div class="due">${sessionScope.feeInvoice.balanceDue }</div></td>
		  </tr>
		
		</table>
		
		<div id="terms">
		  <h5>Remarks</h5>
		  <p>${sessionScope.feeInvoice.remarks }</p>
		</div>
	
	</div>
	
</body>

</html>