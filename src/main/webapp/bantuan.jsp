<%@page import="com.kampus.sistembaranghilang.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // --- AMBIL USER DARI SESSION UNTUK NAVBAR ---
    User currentUser = (User) session.getAttribute("user");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bantuan - Lost & Found Kampus</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
        <style>
            body { background-color: #f8f9fa; min-height: 100vh; display: flex; flex-direction: column; }
            .main-content { flex: 1; }
            .footer-bawah { background-color: #212529; color: #aaa; padding: 20px 0; text-align: center; margin-top: auto; }
            
            /* CSS KHUSUS HALAMAN BANTUAN */
            .help-card {
                border: none;
                transition: transform 0.3s;
                border-radius: 15px;
            }
            .help-card:hover {
                transform: translateY(-5px);
            }
            .step-number {
                width: 40px;
                height: 40px;
                background-color: #0d6efd;
                color: white;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                font-weight: bold;
                margin-right: 15px;
                flex-shrink: 0;
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
                        <li class="nav-item"><a class="nav-link" href="gallery.jsp">Gallery</a></li>
                        <li class="nav-item"><a class="nav-link" href="bantuan.jsp">Bantuan</a></li>
                        
                        <% if (currentUser == null) { %>
                            <li class="nav-item ms-2"><a class="btn btn-primary btn-sm px-4 rounded-pill" href="login.jsp">Login</a></li>
                        <% } else { %>
                            <li class="nav-item ms-3"><span class="nav-link text-warning">Hi, <%= currentUser.getNamaLengkap() %></span></li>
                            
                            <li class="nav-item"><a class="btn btn-outline-danger btn-sm ms-3 rounded-pill" href="#" onclick="konfirmasiLogout(); return false;">Logout</a></li>
                        <% } %>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="main-content container py-5">
            <div class="text-center mb-5">
                <h1 class="fw-bold text-primary mb-3">Pusat Bantuan</h1>
                <p class="text-muted lead">Panduan lengkap menggunakan Sistem Barang Hilang Kampus</p>
            </div>

            <div class="row g-4">
                <div class="col-md-6">
                    <div class="card help-card shadow h-100">
                        <div class="card-body p-4">
                            <h3 class="card-title fw-bold text-danger mb-4">
                                <i class="bi bi-exclamation-triangle-fill me-2"></i>Barang Hilang
                            </h3>
                            <p class="text-muted mb-4">Ikuti langkah ini jika Anda kehilangan barang berharga di area kampus.</p>
                            
                            <div class="d-flex align-items-center mb-3">
                                <div class="step-number bg-danger">1</div>
                                <div><strong>Login Akun:</strong> Masuk menggunakan akun mahasiswa/staf Anda.</div>
                            </div>
                            <div class="d-flex align-items-center mb-3">
                                <div class="step-number bg-danger">2</div>
                                <div><strong>Klik 'Lapor Barang':</strong> Tombol hijau di pojok kanan atas.</div>
                            </div>
                            <div class="d-flex align-items-center mb-3">
                                <div class="step-number bg-danger">3</div>
                                <div><strong>Isi Formulir:</strong> Pilih status "Hilang", isi lokasi, tanggal, dan upload foto.</div>
                            </div>
                            <div class="d-flex align-items-center">
                                <div class="step-number bg-danger">4</div>
                                <div><strong>Pantau:</strong> Cek berkala apakah ada notifikasi barang ditemukan.</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card help-card shadow h-100">
                        <div class="card-body p-4">
                            <h3 class="card-title fw-bold text-success mb-4">
                                <i class="bi bi-search me-2"></i>Menemukan Barang
                            </h3>
                            <p class="text-muted mb-4">Ikuti langkah ini jika Anda menemukan barang milik orang lain.</p>
                            
                            <div class="d-flex align-items-center mb-3">
                                <div class="step-number bg-success">1</div>
                                <div><strong>Amankan Barang:</strong> Simpan atau serahkan ke pos satpam terdekat.</div>
                            </div>
                            <div class="d-flex align-items-center mb-3">
                                <div class="step-number bg-success">2</div>
                                <div><strong>Buat Laporan:</strong> Login dan buat laporan dengan status "Ditemukan".</div>
                            </div>
                            <div class="d-flex align-items-center mb-3">
                                <div class="step-number bg-success">3</div>
                                <div><strong>Detail Lokasi:</strong> Jelaskan di mana barang ditemukan atau diamankan.</div>
                            </div>
                            <div class="d-flex align-items-center">
                                <div class="step-number bg-success">4</div>
                                <div><strong>Selesai:</strong> Jika pemilik mengambilnya, klik tombol "Tandai Selesai".</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="mt-5">
                <h4 class="fw-bold mb-4"><i class="bi bi-question-circle me-2"></i>Pertanyaan Umum</h4>
                <div class="accordion shadow-sm" id="accordionExample">
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingOne">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne">
                                Apakah layanan ini gratis?
                            </button>
                        </h2>
                        <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
                            <div class="accordion-body text-muted">
                                Ya, sistem ini sepenuhnya gratis untuk digunakan oleh seluruh civitas akademika kampus.
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingTwo">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo">
                                Bagaimana jika saya lupa password?
                            </button>
                        </h2>
                        <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                            <div class="accordion-body text-muted">
                                Silakan hubungi admin IT kampus atau gunakan menu Contact untuk bantuan reset password.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <footer class="footer-bawah">
            <div class="container">
                <p class="mb-0">&copy; 2026 Lost & Found Kampus. All rights reserved.</p>
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
        </script>
    </body>
</html>