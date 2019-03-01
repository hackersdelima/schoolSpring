<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<tag:header title="STUDENT STATUS LIST"/>
	<table id="datatable"
					class="table jambo_table table-striped table-bordered resulttable"
					style="font-size: 100%;">
					<thead>
						<tr>
							<th>Status Id</th>
							<th>Status Name</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${status }" var="l">
						<tr>
							<td>${l.id }</td>
							<td>${l.name }</td>
							<td><a href="<spring:url value="/status/editpage/${l.id }"/>">Edit</a></td>
						</tr>
						</c:forEach>
					</tbody>
					</table>
					
<tag:footer/>