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
        createdRow: function (row){
            $(row).addClass('hover:bg-[#EFF5FC]');
            $('td', row).addClass('align-middle');
        },
    });
});

// Dropdown
document.addEventListener('DOMContentLoaded', function () {
    const dropdowns = document.querySelectorAll('[data-dropdown]');

    dropdowns.forEach(dropdown => {
        const btn = dropdown.querySelector('[data-dropdown-button]');
        const menu = dropdown.querySelector('[data-dropdown-menu]');
        const icon = dropdown.querySelector('[data-dropdown-icon]');

        // Toggle dropdown
        const toggleDropdown = () => {
            const isOpen = !menu.classList.contains('hidden');
            closeAllDropdowns(); // Tutup dropdown lain

            if (isOpen) {
                menu.classList.add('hidden');
                btn.setAttribute('aria-expanded', 'false');
                icon.style.transform = 'rotate(0deg)';
            } else {
                menu.classList.remove('hidden');
                btn.setAttribute('aria-expanded', 'true');
                icon.style.transform = 'rotate(180deg)';
            }
        };

        // Klik tombol
        btn.addEventListener('click', (e) => {
            e.stopPropagation();
            toggleDropdown();
        });
    });

    // Klik di luar dropdown → tutup semua
    document.addEventListener('click', () => {
        closeAllDropdowns();
    });

    function closeAllDropdowns() {
        document.querySelectorAll('[data-dropdown-menu]').forEach(menu => {
            menu.classList.add('hidden');
        });
        document.querySelectorAll('[data-dropdown-button]').forEach(btn => {
            btn.setAttribute('aria-expanded', 'false');
        });
        document.querySelectorAll('[data-dropdown-icon]').forEach(icon => {
            icon.style.transform = 'rotate(0deg)';
        });
    }
});