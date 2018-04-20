<div class="modal fade bs-example-modal-lg" id="categoryModal" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-body">
          <table id="datatable" class="table jambo_table table-striped table-bordered"
					style="font-size: 95%;">
				<thead>
					<tr>
						
						<th>Category Id</th>
						<th>Category Head</th>
						<th>Account Type</th>
						<th>Inputter</th>
						
					</tr>
				</thead>
				<tbody>
	
											
					<tr class="categories">
						
						<td>${categorydetail.categoryId }</td>
						<td>${categorydetail.categoryHead }</td>
						<td>${categorydetail.accountType }</td>
						<td>${categorydetail.inputter }</td>
					</tr>
					
				</tbody>
			</table>
        </div>
        <div class="modal-footer">
        <div class="pull-left">
        <a class="btn btn-success" id="update" href="updateCategory.click?id=${categorydetail.categoryId }">Edit</a>
        <a class="btn btn-danger cm" href="category.del?id=${categorydetail.categoryId }">Delete</a>
        </div>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
</div>
<script>
$('.cm').click(function(){
	return confirm('Confirm?');
});
</script>