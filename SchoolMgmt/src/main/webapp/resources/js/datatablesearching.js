$(document).ready(function() {
	    $('#datatablee').DataTable( {
	    	"searching": false,
	    	"order": [[ 2, 'asc' ]], 
	    	"scrollX": true,
	    	scrollY:        '15vh',
	    	"paging":false,
	        initComplete: function () {
	            this.api().columns('.select-filter').every( function () {
	            	
	                var column = this;
	                var select = $('<select><option value="">Search</option></select>')
	                    .appendTo( $(column.footer()).empty() )
	                    .on( 'change', function () {
	                        var val = $.fn.dataTable.util.escapeRegex(
	                            $(this).val()
	                        );
	 
	                        column
	                            .search( val ? '^'+val+'$' : '', true, false )
	                            .draw();
	                    } );
	 
	                column.data().unique().sort().each( function ( d, j ) {
	                    select.append( '<option value="'+d+'">'+d+'</option>' )
	                } );
	            } );
	        }
	    } );
	} );