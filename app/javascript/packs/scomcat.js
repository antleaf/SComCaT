$(document).ready(function () {
    $('.unsorted-table').dataTable({
        "bSort": false,
        "bInfo": false,
        "bFilter": false,
        "bPaginate": false,
        "fixedHeader": false,
        "order": [[0, "asc"]]
    });
});

$(document).ready(function () {
    $('.sorted-table').dataTable({
        "bSort": true,
        "bInfo": false,
        "bFilter": false,
        "bPaginate": false,
        "fixedHeader": false,
        "order": [[0, "asc"]],
        "columnDefs": [{targets: 'actions', orderable: false}],
        stateSave: true
    });
});

$(document).ready(function () {
    $('.reverse-sorted-table').dataTable({
        "bSort": true,
        "bInfo": false,
        "bFilter": false,
        "bPaginate": false,
        "fixedHeader": false,
        "order": [[0, "desc"]]
    });
});

$('document').ready(function() {
	setTimeout(function() {
		$('.alert-success').slideUp();
	}, 3000);
});

// $(document).ready(function () {
//     $(".alert").fadeTo(2000, 500).slideUp(500, function () {
//         $(".alert").slideUp(500);
//     });
// });