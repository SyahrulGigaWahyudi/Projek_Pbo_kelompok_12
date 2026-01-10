<%@page import="java.util.List"%>
<%@page import="com.kampus.sistembaranghilang.model.User"%> 
<%@page import="com.kampus.sistembaranghilang.model.Laporan"%>
<%@page import="com.kampus.sistembaranghilang.dao.LaporanDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // --- BAGIAN JAVA (LOGIC) ---
    User currentUser = (User) session.getAttribute("user");
    
    String currentStatus = request.getParameter("status");
    if (currentStatus == null) currentStatus = "";

    String keyword = request.getParameter("keyword");
    LaporanDAO dao = new LaporanDAO();
    List<Laporan> listBarang;

    if (keyword != null && !keyword.isEmpty()) {
        listBarang = dao.cariLaporan(keyword);
    } else if (currentStatus != null && !currentStatus.isEmpty()) {
        listBarang = dao.getLaporanByStatus(currentStatus);
    } else {
        listBarang = dao.getAllLaporan();
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistem Barang Hilang Kampus</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
        <style>
            body { background-color: #f8f9fa; min-height: 100vh; display: flex; flex-direction: column; }
            .main-content { flex: 1; }
            .footer-bawah { background-color: #212529; color: #aaa; padding: 20px 0; text-align: center; margin-top: auto; }
            .img-detail { max-height: 400px; object-fit: contain; width: 100%; background-color: #f0f0f0; }
            
            /* --- CSS KHUSUS UNTUK CAROUSEL BANNER --- */
            .carousel-item {
                height: 450px; /* Tinggi banner diatur agar tidak terlalu besar */
            }
            .carousel-item img {
                height: 100%;
                object-fit: cover; /* Gambar akan dicrop rapi memenuhi area, tidak gepeng */
                object-position: center;
                filter: brightness(0.6); /* Menggelapkan gambar agar teks putih terbaca jelas */
            }
            .carousel-caption {
                bottom: 20%; /* Posisi teks agak naik */
            }
            .carousel-caption h5 {
                font-size: 2.5rem; /* Ukuran judul lebih besar */
                font-weight: bold;
                text-shadow: 2px 2px 4px rgba(0,0,0,0.7); /* Bayangan teks */
            }
             .carousel-caption p {
                font-size: 1.2rem;
                text-shadow: 1px 1px 2px rgba(0,0,0,0.7);
            }
        </style>
    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top shadow-sm">
            <div class="container">
                <a class="navbar-brand fw-bold" href="index.jsp">
                    <i class="bi bi-search-heart"></i> Lost & Found Kampus
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto align-items-center">
                        <li class="nav-item"><a class="nav-link active" href="index.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
                        
                        <% if (currentUser == null) { %>
                            <li class="nav-item ms-2"><a class="btn btn-primary btn-sm px-4 rounded-pill" href="login.jsp">Login</a></li>
                        <% } else { %>
                            <li class="nav-item ms-3"><span class="nav-link text-warning">Hi, <%= currentUser.getNamaLengkap() %></span></li>
                            <li class="nav-item">
                                <button type="button" class="btn btn-success btn-sm text-white ms-2 px-3 rounded-pill shadow-sm" data-bs-toggle="modal" data-bs-target="#modalLapor">
                                    <i class="bi bi-plus-circle"></i> Lapor Barang
                                </button>
                            </li>
                            <li class="nav-item"><a class="btn btn-outline-danger btn-sm ms-3 rounded-pill" href="#" onclick="konfirmasiLogout(); return false;">Logout</a></li>
                        <% } %>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="main-content">
            
            <div id="carouselExampleCaptions" class="carousel slide mb-5 shadow" data-bs-ride="carousel" data-bs-interval="5000">
              <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
              </div>
              <div class="carousel-inner">
                
                <div class="carousel-item active">
                  <img src="image/1.jpg" class="d-block w-100" alt="Suasana Kampus">
                  <div class="carousel-caption d-none d-md-block">
                    <h5>Selamat Datang di Lost & Found Kampus</h5>
                    <p>Pusat informasi terpercaya untuk melaporkan kehilangan dan menemukan barang di lingkungan kampus kita.</p>
                  </div>
                </div>
                
                <div class="carousel-item">
                  <img src="image/2.jpg" class="d-block w-100" alt="Barang Hilang">
                  <div class="carousel-caption d-none d-md-block">
                    <h5>Kehilangan Barang Berharga?</h5>
                    <p>Jangan panik. Segera buat laporan kehilangan agar komunitas kampus dapat membantu mencarinya.</p>
                  </div>
                </div>
                
                <div class="carousel-item">
                  <img src="image/3.jpg" class="d-block w-100" alt="Menemukan Barang">
                  <div class="carousel-caption d-none d-md-block">
                    <h5>Menemukan Sesuatu Bukan Milikmu?</h5>
                    <p>Jadilah pahlawan hari ini. Laporkan barang temuanmu dan bantu teman kampusmu mendapatkannya kembali.</p>
                  </div>
                </div>
                
              </div>
              <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
              </button>
              <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
              </button>
            </div>
            <div class="container mb-5">
                <div class="row mb-4 border-bottom pb-3 align-items-center">
                    <div class="col-md-5">
                        <h3 class="fw-bold text-dark"><i class="bi bi-list-ul me-2"></i>Daftar Laporan Terbaru</h3>
                    </div>
                    <div class="col-md-7">
                        <div class="d-flex justify-content-md-end gap-2 mt-3 mt-md-0">
                            <form action="index.jsp" method="get" class="d-flex flex-grow-1 flex-md-grow-0">
                                <select name="status" class="form-select me-2 shadow-sm border-primary" onchange="this.form.submit()" style="min-width: 200px;">
                                    <option value="" <%= currentStatus.equals("") ? "selected" : "" %>>📂 Tampilkan Semua</option>
                                    <option value="Hilang" <%= currentStatus.equals("Hilang") ? "selected" : "" %>>🔴 Hilang (Sedang Dicari)</option>
                                    <option value="Ditemukan" <%= currentStatus.equals("Ditemukan") ? "selected" : "" %>>🟡 Ditemukan (Belum Diambil)</option>
                                    <option value="Selesai" <%= currentStatus.equals("Selesai") ? "selected" : "" %>>🟢 Selesai (Sudah Kembali)</option>
                                </select>
                            </form>
                            <form action="index.jsp" method="get" class="d-flex flex-grow-1 flex-md-grow-0">
                                <div class="input-group shadow-sm">
                                    <input class="form-control border-primary" type="search" name="keyword" placeholder="Cari nama barang..." aria-label="Search" value="<%= (keyword != null) ? keyword : "" %>">
                                    <button class="btn btn-primary" type="submit"><i class="bi bi-search"></i></button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <% 
                        if (listBarang != null && !listBarang.isEmpty()) {
                            for (Laporan b : listBarang) {
                    %>
                    
                    <div class="col-md-4 mb-4">
                        <div class="card shadow-sm h-100 border-0 rounded-3 overflow-hidden card-hover">
                            <div class="position-relative" style="height: 220px;">
                                 <% 
                                    String badgeColor = "bg-secondary";
                                    String statusIcon = "";
                                    if (b.getStatus().equalsIgnoreCase("Hilang")) { badgeColor = "bg-danger"; statusIcon = "<i class='bi bi-exclamation-circle-fill me-1'></i>"; }
                                    else if (b.getStatus().equalsIgnoreCase("Ditemukan")) { badgeColor = "bg-warning text-dark"; statusIcon = "<i class='bi bi-info-circle-fill me-1'></i>"; }
                                    else if (b.getStatus().equalsIgnoreCase("Selesai")) { badgeColor = "bg-success"; statusIcon = "<i class='bi bi-check-circle-fill me-1'></i>"; }
                                %>
                                <span class="position-absolute top-0 end-0 m-3 badge <%= badgeColor %> shadow-sm fs-6">
                                    <%= statusIcon %><%= b.getStatus() %>
                                </span>
                                
                                <% if(b.getFoto() != null && !b.getFoto().isEmpty()) { %>
                                    <img src="uploads/<%= b.getFoto() %>" class="w-100 h-100" style="object-fit: cover;" onerror="this.onerror=null;this.src='https://via.placeholder.com/400x300?text=No+Image';">
                                <% } else { %>
                                    <div class="d-flex justify-content-center align-items-center h-100 bg-light text-muted">
                                        <i class="bi bi-image fs-1"></i>
                                    </div>
                                <% } %>
                            </div>
                            
                            <div class="card-body d-flex flex-column">
                                <h5 class="card-title fw-bold text-truncate"><%= b.getNamaBarang() %></h5>
                                <div class="mb-2 text-muted small">
                                     <i class="bi bi-calendar-event me-1"></i><%= b.getTanggalHilang() %>
                                     <br>
                                     <i class="bi bi-geo-alt-fill me-1 text-danger"></i><%= (b.getLokasi() != null) ? b.getLokasi() : "-" %>
                                </div>
                                <p class="card-text text-truncate flex-grow-1"><%= b.getDeskripsi() %></p>
                                
                                <% if (currentUser != null) { %>
                                    <button type="button" class="btn btn-outline-primary w-100 mt-2 rounded-pill" data-bs-toggle="modal" data-bs-target="#modalDetail<%= b.getId() %>">
                                        Lihat Detail <i class="bi bi-arrow-right-short"></i>
                                    </button>
                                <% } else { %>
                                    <a href="login.jsp" class="btn btn-outline-secondary w-100 mt-2 rounded-pill">Login untuk Detail</a>
                                <% } %>
                            </div>
                        </div>
                    </div>

                    <% if (currentUser != null) { %>
                    <div class="modal fade" id="modalDetail<%= b.getId() %>" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog modal-lg modal-dialog-centered">
                            <div class="modal-content rounded-4 border-0 shadow-lg">
                                <div class="modal-header border-0 pb-0">
                                    <h5 class="modal-title fw-bold fs-4"><%= b.getNamaBarang() %></h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="row g-4">
                                        <div class="col-md-6">
                                             <div class="rounded-4 overflow-hidden shadow-sm position-relative bg-light" style="height: 100%; min-height: 300px;">
                                                <% if(b.getFoto() != null && !b.getFoto().isEmpty()) { %>
                                                    <img src="uploads/<%= b.getFoto() %>" class="w-100 h-100 position-absolute top-50 start-50 translate-middle" style="object-fit: contain;" onerror="this.src='https://via.placeholder.com/400x300?text=No+Image';">
                                                <% } else { %>
                                                    <div class="d-flex justify-content-center align-items-center h-100 text-muted">
                                                        <i class="bi bi-image fs-1"></i><span class="ms-2">Tidak ada foto</span>
                                                    </div>
                                                <% } %>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <h6 class="fw-bold mb-3 text-muted">Informasi Detail</h6>
                                            <ul class="list-group list-group-flush rounded-3">
                                                <li class="list-group-item d-flex justify-content-between align-items-center bg-light ps-3 pe-3">
                                                    <span class="fw-bold"><i class="bi bi-info-square me-2"></i>Status</span>
                                                    <span class="badge <%= badgeColor %> fs-6 px-3 py-2 rounded-pill"><%= statusIcon %><%= b.getStatus() %></span>
                                                </li>
                                                <li class="list-group-item ps-3 pe-3"><i class="bi bi-calendar3 me-2 text-muted"></i><strong>Tanggal:</strong> <span class="ms-2"><%= b.getTanggalHilang() %></span></li>
                                                <li class="list-group-item ps-3 pe-3"><i class="bi bi-geo-alt me-2 text-danger"></i><strong>Lokasi:</strong> <span class="ms-2"><%= (b.getLokasi() != null) ? b.getLokasi() : "-" %></span></li>
                                                <li class="list-group-item ps-3 pe-3"><i class="bi bi-person me-2 text-muted"></i><strong>Pelapor:</strong> <span class="ms-2"><%= b.getNamaPelapor() %></span></li>
                                                <li class="list-group-item ps-3 pe-3 bg-light mt-2 rounded">
                                                    <strong class="d-block mb-1"><i class="bi bi-card-text me-2"></i>Deskripsi:</strong>
                                                    <p class="mb-0 text-break"><%= b.getDeskripsi() %></p>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer border-0 pt-0 d-flex justify-content-between">
                                    <div>
                                        <% if (currentUser.getRole() != null && currentUser.getRole().equalsIgnoreCase("admin")) { %>
                                            <a href="HapusLaporanServlet?id=<%= b.getId() %>" class="btn btn-danger rounded-pill px-3" onclick="return confirm('⚠️ PERINGATAN ADMIN ⚠️\n\nYakin ingin menghapus postingan ini secara permanen?');">
                                                <i class="bi bi-trash-fill me-1"></i> Hapus Postingan
                                            </a>
                                        <% } %>
                                    </div>
                                    <div class="d-flex gap-2">
                                        <button type="button" class="btn btn-light rounded-pill px-4" data-bs-dismiss="modal">Tutup</button>
                                         
                                        <% 
                                            // LOGIC UNTUK CEK PEMILIK / ADMIN
                                            boolean isOwner = (currentUser.getId() == b.getUserId());
                                            boolean isAdmin = (currentUser.getRole() != null && currentUser.getRole().equalsIgnoreCase("admin"));
                                            
                                            // BAGIAN TOMBOL HUBUNGI PELAPOR SUDAH DIHAPUS DI SINI
                                        %>

                                        <% if ((isOwner || isAdmin) && !b.getStatus().equalsIgnoreCase("Selesai")) { %>
                                            <a href="UpdateStatusServlet?id=<%= b.getId() %>&status=Selesai" class="btn btn-primary rounded-pill px-4" onclick="return confirm('Apakah barang ini benar-benar sudah selesai urusannya? Status akan berubah menjadi Hijau.');">
                                                <i class="bi bi-check-circle-fill me-1"></i> Tandai Selesai
                                            </a>
                                        <% } %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% } // end if currentuser %> 
                    <% } // end for loop %>
                    
                    <% } else { %>
                        <div class="col-12">
                             <div class="text-center py-5 bg-white rounded-4 shadow-sm">
                                <i class="bi bi-inbox fs-1 text-muted display-1 d-block mb-3"></i>
                                <h4 class="text-muted fw-bold">Belum ada laporan ditemukan.</h4>
                                <p class="text-muted mb-4">Coba ubah filter status atau kata kunci pencarian Anda.</p>
                                <a href="index.jsp" class="btn btn-primary rounded-pill px-4">
                                    <i class="bi bi-arrow-counterclockwise me-2"></i>Reset Filter
                                </a>
                            </div>
                        </div>
                    <% } %>
                </div>
            </div> 
        </div> 

        <% if (currentUser != null) { %>
        <div class="modal fade" id="modalLapor" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content rounded-4 border-0 shadow-lg overflow-hidden">
                    <form action="LaporServlet" method="post" enctype="multipart/form-data">
                        <div class="modal-header bg-primary text-white px-4 py-3">
                            <h5 class="modal-title fw-bold"><i class="bi bi-pencil-square me-2"></i>Buat Laporan Baru</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body px-4 py-4">
                            <div class="mb-3">
                                <label class="form-label fw-bold small text-muted">Nama Barang</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light border-end-0"><i class="bi bi-tag"></i></span>
                                    <input type="text" name="nama_barang" class="form-control bg-light border-start-0" required placeholder="Contoh: Dompet Kulit Coklat">
                                </div>
                            </div>
                            <div class="row mb-3">
                                 <div class="col-md-6">
                                    <label class="form-label fw-bold small text-muted">Status Barang</label>
                                    <div class="input-group">
                                        <span class="input-group-text bg-light border-end-0"><i class="bi bi-info-circle"></i></span>
                                        <select name="status" class="form-select bg-light border-start-0">
                                            <option value="Hilang">🔴 Barang Hilang (Mencari)</option>
                                            <option value="Ditemukan">🟡 Barang Ditemukan (Menemukan)</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                     <label class="form-label fw-bold small text-muted">Tanggal Kejadian</label>
                                     <div class="input-group">
                                        <span class="input-group-text bg-light border-end-0"><i class="bi bi-calendar"></i></span>
                                        <input type="date" name="tanggal" class="form-control bg-light border-start-0" required>
                                     </div>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold small text-muted">Lokasi Kejadian</label>
                                 <div class="input-group">
                                    <span class="input-group-text bg-light border-end-0"><i class="bi bi-geo-alt text-danger"></i></span>
                                    <input type="text" name="lokasi" class="form-control bg-light border-start-0" required placeholder="Contoh: Gedung A Lantai 2, Kantin">
                                </div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold small text-muted">Deskripsi Detail</label>
                                <textarea name="deskripsi" class="form-control bg-light" rows="3" required placeholder="Jelaskan ciri-ciri barang, merek, warna, atau isi di dalamnya..."></textarea>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold small text-muted">Upload Foto</label>
                                <input type="file" name="foto" class="form-control" accept="image/*" required id="formFile">
                                <div class="form-text small"><i class="bi bi-file-earmark-image me-1"></i>Format: JPG, PNG. Maks 2MB.</div>
                            </div>
                        </div>
                        <div class="modal-footer bg-light px-4 py-3 border-top-0">
                            <button type="button" class="btn btn-light rounded-pill px-4" data-bs-dismiss="modal">Batal</button>
                            <button type="submit" class="btn btn-primary rounded-pill px-4 shadow-sm"><i class="bi bi-send me-1"></i> Kirim Laporan</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <% } %>

        <footer class="footer-bawah">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-12">
                        <p class="mb-0">&copy; 2026 Lost & Found Kampus. All rights reserved.</p>
                        <small style="font-size: 12px;">Dibuat oleh Tim IT Kampus</small>
                    </div>
                </div>
            </div>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
            function konfirmasiLogout() {
                Swal.fire({
                    title: 'Yakin ingin keluar?',
                    text: "Anda harus login kembali untuk mengakses akun.",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#d33',
                    cancelButtonColor: '#3085d6',
                    confirmButtonText: 'Ya, Keluar',
                    cancelButtonText: 'Tidak',
                    reverseButtons: true
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = 'LogoutServlet';
                    }
                })
            }
            
            // Pesan sukses/gagal dari URL (Opsional, untuk mempercantik)
            const urlParams = new URLSearchParams(window.location.search);
            const msg = urlParams.get('msg');
            if(msg === 'status_updated'){ Swal.fire('Berhasil!', 'Status laporan telah diperbarui.', 'success'); }
            else if(msg === 'deleted'){ Swal.fire('Berhasil!', 'Laporan telah dihapus oleh Admin.', 'success'); }
        </script>
    </body>
</html>