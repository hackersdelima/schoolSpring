<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	
	<title>Editable Invoice</title>
	
	<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/resources/css/style.css' />
	<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/resources/css/print.css' media="print" />

</head>

<body>

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
            Admission No: 203
           </p>

            <table id="meta">
                <tr>
                    <td class="meta-head">Invoice #</td>
                    <td><p>000123</p></td>
                </tr>
                <tr>
                    <td class="meta-head">Invoice Date</td>
                    <td><p id="date">2074/11/11</p></td>
                </tr>
                <tr>

                    <td class="meta-head">Date From</td>
                    <td><p id="date">2074/11/11</p></td>
                </tr>
                <tr>

                    <td class="meta-head">Date To</td>
                    <td><p id="date">2074/12/11</p></td>
                </tr>
                <tr>
                    <td class="meta-head">Amount Due</td>
                    <td><div class="due">875.00</div></td>
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
		  
		  <tr class="item-row">
		      <td class="item-name">cateogry name</td>
		      <td class="description">Description</td>
		      <td><p class="cost">650.00</p></td>
		      <td><p class="qty">1.00</p></td>
		      <td><span class="price">649.00</span></td>
		  </tr>
		  
		  <tr>
		      <td colspan="2" class="blank"> </td>
		      <td colspan="2" class="total-line">Subtotal</td>
		      <td class="total-value"><div id="subtotal">$875.00</div></td>
		  </tr>
		   <tr>
		      <td colspan="2" class="blank"> </td>
		      <td colspan="2" class="total-line">Discount</td>
		      <td class="total-value"><div id="subtotal">$875.00</div></td>
		  </tr>
		   <tr>

		      <td colspan="2" class="blank"> </td>
		      <td colspan="2" class="total-line">Total</td>
		      <td class="total-value"><div id="total">$875.00</div></td>
		  </tr>
		   <tr>
		      <td colspan="2" class="blank"> </td>
		      <td colspan="2" class="total-line">Tax Amount</td>
		      <td class="total-value"><div id="subtotal">$875.00</div></td>
		  </tr>
		  <tr>

		      <td colspan="2" class="blank"> </td>
		      <td colspan="2" class="total-line">Grand Total</td>
		      <td class="total-value"><div id="total">$875.00</div></td>
		  </tr>
		  <tr>
		      <td colspan="2" class="blank"> </td>
		      <td colspan="2" class="total-line">Amount Paid</td>
		      <td class="total-value"><p id="paid">$0.00</p></td>
		  </tr>
		  <tr>
		      <td colspan="2" class="blank"> </td>
		      <td colspan="2" class="total-line balance">Balance Due</td>
		      <td class="total-value balance"><div class="due">$875.00</div></td>
		  </tr>
		
		</table>
		
		<div id="terms">
		  <h5>Terms</h5>
		  <textarea>NET 30 Days. Finance Charge of 1.5% will be made on unpaid balances after 30 days.</textarea>
		</div>
	
	</div>
	
</body>

</html>