<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/AdminLTE.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/_all-skins.min.css">
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<div class="row"></div>

<div class="content">

	<div class="container">
		<div class="row">
			<div class="col-xs-12"></div>
			
				<div class="jumbrotron">
					<h1>${errorTitle }</h1>
					<hr/>
					
					<blockquote>
						${errorDescription }
					</blockquote>
				</div>
		</div>


	</div>
</div>

<tag:footer />