<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<!-- Theme style -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/AdminLTE.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/_all-skins.min.css">
<tag:header title="Find Assigned Subjects By:"/>
<div class="panel panel-primary">
  <div class="panel-heading">Find Assigned Subjects By:</div>
  <div class="panel-body">
   <div class="col-lg-3 col-xs-3">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <p>CLASS</p>
            </div>
            <div class="icon">
               <i class="fa fa-users"></i>
            </div>
            <a href="<spring:url value="/nav/v/assignedsubjectsclass"/>" class="small-box-footer">
             Click Here <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
        </div>
        <div class="col-lg-3 col-xs-3">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">

              <p>STUDENTS</p>
            </div>
            <div class="icon">
               <i class="fa fa-users"></i>
               
            </div>
            <a href="<spring:url value="/nav/v/assignedsubjectsstd"/>" class="small-box-footer">
              Click Here <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
        </div>
  
  </div>
</div>
<tag:footer/>