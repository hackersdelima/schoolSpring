<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<table id="datatable-buttons"
	class="table jambo_table table-striped table-bordered dt-responsive nowrap display"
	cellspacing="0" width="100%" style="font-size: 95%;'">
	<thead>

		<tr style="background-color:white; color:black">
			<th colspan="3" style="text-align:center">SUBJECT</th>
			<th colspan="2">FULL MARKS</th>
			<th colspan="2">PASS MARKS</th>
			<th colspan="3">OBTAINED MARKS</th>
			
			<th rowspan="2">REMARKS</th>
		</tr>
		<tr class="headings">
			<th>Name</th>
			<th>Code</th>
			<th>Type</th>
			
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
	<c:forEach items="${subjectslist }" var="sublist">
		<tr>
		<td><input type="text" name="subjects.subjectidlist" value="${sublist.subjectid }" hidden>${sublist.subjectname }</td>
			<td>${sublist.subjectcode }</td>
			<td><input type="text" name="subjects.subjecttypelist" value="${sublist.subjecttype }" hidden>${sublist.subjecttype }</td>
			
			<td><input type="text" name="subjects.fullmarkslist" value="${sublist.fullmarks }"class="form-control" /></td>
				<td><input type="text" name="subjects.fullmarks_prlist" value="${sublist.fullmarks_pr }"class="form-control" /></td>
				
			<td><input type="text" name="subjects.passmarkslist" value="${sublist.passmarks }" class="form-control" /></td>
			<td><input type="text" name="subjects.passmarks_prlist" value="${sublist.passmarks_pr }" class="form-control" /></td>
			
			<td><input type="text" name="subjects.thmarkslist" class="form-control"/></td>
			<td><input type="text" name="subjects.prmarkslist" class="form-control" /></td>
			<td><input type="text" name="subjects.totalgradelist" class="form-control" /></td>
			
			<td><input type="text" name="subjects.remarkslist" class="form-control" /></td>
			
		</tr>
	</c:forEach>
	</tbody>
	
</table>