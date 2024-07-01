<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
    <div class="input-group">
        <input type="text" id="searchInput" class="form-control bg-light border-0 small" placeholder="Cari..." aria-label="Search" aria-describedby="basic-addon2">
        <div class="input-group-append">
            <button class="btn btn-primary" type="button">
                <i class="fas fa-search fa-sm"></i>
            </button>
        </div>
    </div>
</form>


<script>
    document.addEventListener("DOMContentLoaded", function() {
        var searchInput = document.getElementById("searchInput");
        var currentPath = window.location.pathname;

        if (currentPath.includes("produk")) {
            searchInput.placeholder = "Cari Produk";
        } else if (currentPath.includes("kategori")) {
            searchInput.placeholder = "Cari Kategori";
        } else if (currentPath.includes("kasir")) {
            searchInput.placeholder = "Cari Kasir";
        } else if (currentPath.includes("transaksi")) {
            searchInput.placeholder = "Cari Riwayat Transaksi";
        } else {
            searchInput.placeholder = "Cari...";
        }
    });
</script>
