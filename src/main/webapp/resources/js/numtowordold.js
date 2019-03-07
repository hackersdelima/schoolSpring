
//----------------------------------------ADD AND REMOVE TABLE ROW DYNAMICALLY-------------------------------------------------

 function deleteRow(btn) {
	  var row = btn.parentNode.parentNode;
	  row.parentNode.removeChild(row);
	};
//----------------------------------------------SUM OF TWO INPUTS WITH SAME NAME IN DYNAMIC ROW-------------------------------- 
	
//------------------------------------------------SUB TOTAL OF DYNAMIC ADDED INPUT'S SUM(TOTAL)-------------------------------- 

 //-------------------------------------------------DISCOUNT CALCULATION FROM SUBTOTAL--------------------------------------
 $(document).on('blur',"input",function(){
	 discountCalculator();
 });
  function discountCalculator(){
	  var discountAmount=0;
	   var discountPercentage=$('.discountPercentage').val();
	   var subtotal=$('.subtotal').val();
	   var discount=discountPercentage/100;
	   if(discountPercentage<=100 && discountPercentage>0){
	    discountAmount=discount * subtotal;
	   }
	  
	   else {
		   discountAmount=0;
	   }
	   $('.discountAmount').val(discountAmount);
  }
 //----------------------------------------------------TOTAL AFTER DISCOUNT-----------------------------------------------

  $(document).on('blur',"input",function(){
	totalCalculator(); 
 });
 
  function totalCalculator(){
	  var subtotal=$('.subtotal').val();
	  var discountAmount=$('.discountAmount').val();
	  var total=subtotal - discountAmount;
	  $('.resulttotal').val(total);
  }
 //------------------------------------------------------TAX CALCULATION--------------------------------------------------
  $(document).on('change',".taxPercentage",function(){
	 taxCalculator(); 
  });
  function taxCalculator(){
	  var taxPercentage=$('.taxPercentage').val();
	  var total=$('.resulttotal').val();
	  var taxAmount=$('.taxAmount').val();
	  var tax=taxPercentage/100;
	  taxAmount=tax * total;
	  $('.taxAmount').val(taxAmount);
	  
	  
  }
 //-------------------------------------------------------GRAND TOTAL AFTER VAT-------------------------------------------
  $(document).on('blur',"input",function(){
	 grandTotalCalculator(); 
  });
  function grandTotalCalculator(){
	  var total=parseFloat($('.resulttotal').val());
	  var taxAmount=parseFloat($('.taxAmount').val());
	  var grandTotal=total + taxAmount;
	  $('.grandTotal').val(grandTotal);
	  
  }
  
  //------------------------------------------------------------NUMBER INTO WORDS------------------------------------------
  $(document).on('blur',"input",function(){
	  convert_no_to_words();
  });
  function getBelowHundred(t){return teens[t]}function translate_nepali_num_into_words(t){if(isNaN(t)||""==t)return"N/A";var n="",e=0;if(-1!=t.indexOf(".")&&(number_parts=t.split("."),t=number_parts[0],e=number_parts[1],decimal_tens=e.substring(0,2).toString(),1==decimal_tens.length&&(decimal_tens=decimal_tens.toString()+"0"),decimal_words=teens[parseInt(decimal_tens)].toString()+" Paisa"),t.length>13)return void alert("Number greater than kharab not supported");var r=Math.floor(t%100);if(t.toString().length>2)var s=t.toString().substring(t.toString().length-3,t.toString().length-2);var i=Math.floor(t%1e5);i=i.toString(),i=i.substring(0,i.length-3);var a=Math.floor(t%1e7);a=a.toString(),a=a.substring(0,a.length-5);var o=Math.floor(t%1e9);o=o.toString(),o=o.substring(0,o.length-7);var g=Math.floor(t%1e11);g=g.toString(),g=g.substring(0,g.length-9);var l=Math.floor(t%1e13);return l=l.toString(),l=l.substring(0,l.length-11),l>0&&(n+=teens[l]+" Kharab"),g>0&&(n+=" "+teens[g]+" Aarab"),o>0&&(n+=" "+teens[o]+" Crore"),a>0&&(n+=" "+teens[a]+" Lakh"),i>0&&(n+=" "+teens[i]+" Thousand"),s>0&&(n+=" "+units[s]+" Hundred"),r>0&&(n+=" "+teens[r]),n+=" Rupees",e>0&&(n+=", "+decimal_words),n}var units=["Zero","One","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten"],teens=["Zero","One","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten","Eleven","Twelve","Thirteen","Fourteen","Fifteen","Sixteen","Seventeen","Eighteen","Nineteen","Twenty","Twenty-one","Twenty-two","Twenty-three","Twenty-four","Twenty-five","Twenty-six","Twenty-seven","Twenty-eight","Twenty-nine","Thrity","Thrity-one","Thrity-two","Thrity-three","Thrity-four","Thrity-five","Thrity-six","Thrity-seven","Thrity-eight","Thrity-nine","Fourty","Fourty-one","Fourty-two","Fourty-three","Fourty-four","Fourty-five","Fourty-six","Fourty-seven","Fourty-eight","Fourty-nine","Fifty","Fifty-one","Fifty-two","Fifty-three","Fifty-four","Fifty-five","Fifty-six","Fifty-seven","Fifty-eight","Fifty-nine ","Sixty","Sixty-one","Sixty-two","Sixty-three","Sixty-four","Sixty-five","Sixty-six","Sixty-seven","Sixty-eight","Sixty-nine","Seventy","Seventy-one","Seventy-two","Seventy-three","Seventy-four","Seventy-five","Seventy-six","Seventy-seven","Seventy-eight","Seventy-nine","Eighty","Eighty-one","Eighty-two","Eighty-three","Eighty-four","Eighty-five","Eighty-six","Eighty-seven","Eighty-eight","Eighty-nine","Ninety","Ninety-one","Ninety-two","Ninety-three","Ninety-four","Ninety-five","Ninety-six","Ninety-seven","Ninety-eight","Ninety-nine"],tens=["","Ten","Twenty","Thrity","Fourty","Fifty","Sixty","Seventy","Eighty","Ninety"];
 
  function convert_no_to_words(){ document.getElementById('result').value = translate_nepali_num_into_words(document.getElementById('amount-paid').value); }
