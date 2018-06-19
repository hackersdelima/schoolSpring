<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table id="datatable-buttons"
	class="table jambo_table table-striped table-bordered dt-responsive nowrap display"
	cellspacing="0" width="100%" style="font-size: 95%;'">
	<thead>

		<tr style="background-color:white; color:black">
			<th colspan="2" style="text-align:center">STUDENT NAME</th>
			<th colspan="2">FULL MARKS</th>
			<th colspan="2">PASS MARKS</th>
			<th colspan="3">OBTAINED MARKS</th>
			
			<th rowspan="2">REMARKS</th>
		</tr>
		<tr class="headings">
			<th>Name</th>
			<th>Roll No</th>
			
			<th>Th. Marks</th>
			<th>Pr. Marks</th>
			
			<th>Th. Marks</th>
			<th>Pr. Marks</th>
			
			<th>Th. Marks</th>
			<th>Pr. Marks</th>
			<th>Grade</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${students }" var="std">
		<tr>
		<td>${std.studentname }<input type="hidden" name="studentidlist" value="${std.studentid }"></td>
			<td>${std.rollno }</td>
			
			<td><input type="text" name="subjects.fullmarkslist" value="${subjectdetail.fullmarks }" class="form-control" /></td>
				<td><input type="text" name="subjects.fullmarks_prlist" value="${subjectdetail.fullmarks_pr }"class="form-control" /></td>
				
			<td><input type="text" name="subjects.passmarkslist" value="${subjectdetail.passmarks }" class="form-control" /></td>
			<td><input type="text" name="subjects.passmarks_prlist" value="${subjectdetail.passmarks_pr}" class="form-control" /></td>
			
			<td><input type="text" name="subjects.thmarkslist" value="" class="form-control"/></td>
			<td><input type="text" name="subjects.prmarkslist" value="" class="form-control" /></td>
			<td><input type="text" name="subjects.totalgradelist" value="" class="form-control" /></td>
			
			<td><input type="text" name="subjects.remarkslist" value="" class="form-control" /></td>
			
		</tr>
		</c:forEach>
		
	</tbody>
	
</table>