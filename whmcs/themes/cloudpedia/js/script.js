// Toggle Sidebar
function toggleSidebar() {
    document.getElementById("sidebar").classList.toggle("expanded");
}

// Submenu Sidebar
document.querySelectorAll('.sidebar .has-submenu > a').forEach(function(menu){
    menu.addEventListener('click', function(e){
        e.preventDefault(); // biar nggak reload halaman
        const parent = this.parentElement;

        // tutup submenu lain (jika ada)
        document.querySelectorAll('.sidebar .has-submenu').forEach(function(item){
            if(item !== parent){
                item.classList.remove('open');
            }
        });

        // tambah class open pada submenu
        parent.classList.toggle('open');
    });
});

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
        order: [],
        paging: true,
        searching: true,
        ordering:  true,
        pageLength: 10,
        pagingType: "simple_numbers",
        language: {
            paginate: {
                next: "Next",
                previous: "Previous"
            }
        },
    });
});