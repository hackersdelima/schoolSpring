<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- <%@page import="com.controller.student.classes.StudentOperations"%>
<%
StudentOperations s=new StudentOperations();
String totalstd=s.totalstudents(); %> --%>
<html>
<head>
 <!-- Theme style -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/AdminLTE.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/_all-skins.min.css">
  
 <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
   <link href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" rel="stylesheet">
    <style>
    	.background{
    	background-color:#F7F7F7;}
    </style>
</head>
<body class="background">

<div class="row">
        <div class="col-lg-3 col-xs-3">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3>${totalstudents }</h3>

              <p>Total Students</p>
            </div>
            <div class="icon">
               <i class="fa fa-users"></i>
               
            </div>
            <a href="#" class="small-box-footer">
              More info <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-3">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3><sup style="font-size: 20px"></sup>${totalteacher }</h3>

              <p>Total Teachers</p>
            </div>
            <div class="icon">
               <i class="fa fa-users"></i>
            </div>
            <a href="#" class="small-box-footer">
              More info <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-3">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3>${totaluser }</h3>

              <p>Total Users</p>
            </div>
            <div class="icon">
              <i class="fa fa-user-plus"></i>
            </div>
            <a href="#" class="small-box-footer">
              More info <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-3">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3>${currentBranch }</h3>

              <p>Current Branch</p>
            </div>
            <div class="icon">
              <i class="fa fa-sitemap"></i>
            </div>
            <a href="#" class="small-box-footer">
              More info <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
        </div>
        <!-- ./col -->
      </div>
      <div class="row">
       <div class="col-md-4"></div>
      <div class="col-md-4">
          <!-- Widget: user widget style 1 -->
          <div class="box box-widget widget-user">
            <!-- Add the bg color to the header using any of the bg-* classes -->
            <div class="widget-user-header bg-aqua-active">
              <h3 class="widget-user-username">${sessionScope.userDetail.username }</h3>
              <h5 class="widget-user-desc">${sessionScope.systemdetail[1].settingsdescription }</h5>
            </div>
            <div class="widget-user-image">
             <%--  <img class="img-circle" src="${pageContext.request.contextPath}/resources/images/download.png" alt="User Avatar"> --%>
              <img class="img-circle" id="myImg" src="//124.41.193.91/images/araniko/Logo.jpg" />
            </div>
            <div class="box-footer">
              <div class="row">
                <div class="col-sm-4 border-right">
                  <div class="description-block">
                    <h5 class="description-header"></h5>
                    <span class="description-text"></span>
                  </div>
                  <!-- /.description-block -->
                </div>
                <!-- /.col -->
                <div class="col-sm-4 border-right">
                  <div class="description-block">
                    <h5 class="description-header"></h5>
                    <span class="description-text"></span>
                  </div>
                  <!-- /.description-block -->
                </div>
                <!-- /.col -->
                <div class="col-sm-4">
                  <div class="description-block">
                    <h5 class="description-header"></h5>
                    <span class="description-text"></span>
                  </div>
                  <!-- /.description-block -->
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->
            </div>
          </div>
          <!-- /.widget-user -->
        </div>
         <div class="col-md-4"></div>
        </div>


</body>
</html>