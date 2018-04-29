<jsp:include page="/includefile"></jsp:include>
<html>
<head></head>
<body class="hiddenscroll bgcolor background">
	<div class="breadcrumb-line">
		<nav aria-label="breadcrumb" role="navigation">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home"
					aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">Multi Transaction</li>
				<li class="breadcrumb-item active" aria-current="page">Edit</li>
			</ol>
		</nav>
	</div>
	<div class="panel panel-default" style="width: 95%; margin: auto;">
		<div class="panel-heading">
			<h6>
				<strong>Insert Multi Transaction No</strong>
			</h6>
			
			<input type="text" class="form-control input" value="${id}" style="width: 20%;">
			
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
	        url: "multitxneditdisplayform.click",
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
</body>
</html>