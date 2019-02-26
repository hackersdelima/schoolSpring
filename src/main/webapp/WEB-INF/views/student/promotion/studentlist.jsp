<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<input type="checkbox" id="selectall" />
<label for="selectall">Select All</label>
<table id="datatablee"
								class="table jambo_table table-striped table-bordered "
								  style="font-size: 95%;'">
								<thead>

									<tr class="headings">
										<th>Checkbox</th>
										<th class="select-filter">STUDENT NAME</th>
										<th>ROLL NO</th>

									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>Checkbox</th>
										<th>Student Name</th>
										<th>Roll No</th>
									</tr>
								</tfoot>
								<tbody>
									<c:forEach items="${slist }" var="s">
										<tr>
											<td><input type="checkbox" name="studentid"
												value="${s.studentid }"></td>
											<td>${s.studentname }</td>
											<td>${s.rollno }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<script>
								$("#datatablee").DataTable({
									paging: false,
									"scrollY": "500px",
								});
								
								var $tblChkBox = $("#datatablee input:checkbox");
							    $("#selectall").on("click", function () {
							        $($tblChkBox).prop('checked', $(this).prop('checked'));
							    });
							
							</script>