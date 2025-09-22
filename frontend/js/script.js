// Toggle Sidebar
function toggleSidebar() {
    document.getElementById("sidebar").classList.toggle("expanded");
}

// Datatables
$(document).ready(function() {
    $('#table').DataTable({
        layout: {
            topStart: 'info',
            bottomStart: {
                pageLength: {
                    menu: [ 10, 25, 50, 100 ]
                }
            },
            bottomEnd: 'paging'
        },
        paging: true,
        searching: true,
        ordering:  true,
        pageLength: 10
    });
});