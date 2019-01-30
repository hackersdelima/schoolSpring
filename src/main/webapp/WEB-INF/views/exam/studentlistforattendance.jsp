<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table id="datatablea"
	class="table jambo_table table-striped table-bordered dt-responsive nowrap display"
	cellspacing="0" width="100%" style="font-size: 95%; color:black;'">
	<thead>
		<tr style="background-color: white; color: black">
			<th >STUDENT NAME</th>
			<th>ROLL NO</th>
			<th >PRESENT DAYS</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${students }" var="std">
			<tr>
				<td>${std.studentname }<input type="hidden"
					name="studentid" value="${std.studentid }"></td>
				<td>${std.rollno }</td>
				<td><input type="text"
					name="presentdays" class="form-control" value="0"></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<script>
$(document).ready(function() {
	 $("#datatablea").DataTable({
		 "scrollY":        "300px",
		 "paging":         false,
		 "searching": false
	 });
});
</script>