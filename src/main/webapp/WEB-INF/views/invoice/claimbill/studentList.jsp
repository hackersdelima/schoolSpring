<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<tag:header title="STUDENT LIST"/>

				<table id="datatable-buttons"
					class="table jambo_table table-striped table-bordered dt-responsive nowrap display"
					cellspacing="0" width="100%" style="font-size: 95%;'">
					<thead>
					
						<tr class="headings">
							<th>S No.</th>
							<th>STUDENT NAME</th>
							<th>ROLL NO</th>
							<th>CLASS</th>
							<th>SECTION</th>
							<th>ADMISSION NO</th>
							<th>ADMISSION DATE</th>
							<th><i class="fa fa-cog" aria-hidden="true"></i></th>
						</tr>
					</thead>
					 <tfoot>
            <tr>
                <th>S No.</th>
                <th>Student Name</th>
                <th>Roll No</th>
                <th>Class</th>
                <th>Section</th>
                <th>Admission No</th>
                <th>Admission Date</th>
                <th></th>
            </tr>
        </tfoot>
					<tbody>
						<%
			int sn=1;
			%>
						<c:forEach items="${slist }" var="s">
							<tr>
								<th scope="row"><%=sn %></th>
								<td>${s.studentname }</td>
								<td>${s.rollno }</td>
								<td>${s.admissionclass }</td>
								<td>${s.section }</td>
								<td>${s.studentid }</td>
								<td>${s.admissiondate }</td>
								<td>
								<a href="<spring:url value="/nav/searchStudentClaimbill/${s.studentid }" />">Generate</a>
								<%--  <a href="<spring:url value="/nav/viewClaimBill/${s.studentid }" />"> Old Generate</a>  --%>
								</td>
							</tr>
							<%sn++;%>
						</c:forEach>
					</tbody>
				</table>
<div class="modal fade bs-example-modal-lg" id="studentDetailModal" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                      <div class="modal-content studentdetail">

                        

                      </div>
                    </div>
                  </div>
	
	<tag:footer/>
	<script>

<%if(request.getAttribute("msg")!=null){%>
$('#myModal').modal('show');
<%}%> 

$(document).ready(function() {
    // Setup - add a text input to each footer cell
    $("tfoot").css({"display":"table-header-group"});
    $('#datatable-buttons tfoot th').each( function () {
        var title = $(this).text();
        $(this).html( '<input type="text"  placeholder="Search '+title+'" />' );
    } );
 
    // DataTable
    var table = $('#datatable-buttons').DataTable();
 
    // Apply the search
    table.columns().every( function () {
        var that = this;
 
        $( 'input', this.footer() ).on( 'keyup change', function () {
            if ( that.search() !== this.value ) {
                that
                    .search( this.value )
                    .draw();
            }
        } );
    } );
} );
$(".viewdetail").click(function()
		{
		var id=$(this).data("value");
		var dataString = 'id='+ id;
		$.ajax
		({
		type: "POST",
		url: "view/modals/studentdetailmodal.jsp",
		data: dataString,
		cache: false,
		success: function(html)
		{
		$(".studentdetail").html(html);
		$('#studentDetailModal').modal('show');
		} 
		});
});
</script>
