<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<jsp:include page="../include.jsp"></jsp:include>

<html>
<head>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style>
h5 {
	font-size: 80%;
	font-weight: bold;
}
</style>

</head>
<body class="hiddenscroll background">
	<div class="breadcrumb-line">
		<nav aria-label="breadcrumb" role="navigation">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home"
					aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">Account</li>
				<li class="breadcrumb-item active" aria-current="page">Edit</li>
			</ol>
		</nav>
	</div>
	<div class="panel panel-default" style="width: 95%; margin: auto;">
		<div class="panel-heading">
			<h6>
				<strong>Insert Account No</strong>
			</h6>
			
			<input type="text" class="form-control input" data-validation="number" value="${accountNumber}" style="width: 20%;">
			
			<br> <input type="submit" class="btn btn-info searchbtn"
				value="SEARCH">
		</div>
	</div>
	<div class="displayform"></div>
	<script>
$(document).ready(function()
        {
	 $(".searchbtn").click(function()
		        {
		 var id=$(".input").val();
		 var dataString = 'id='+ id;
		 $.ajax
	        ({
	        type: "POST",
	        url: "accounteditdisplayform.click",
	        data: dataString,
	        cache: false,
	        success: function(html)
	        {
	        $(".displayform").html(html);
	        } 
	        });
		 
	});
});
</script>
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