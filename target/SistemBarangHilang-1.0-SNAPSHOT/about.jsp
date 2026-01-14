<%@page import="com.kampus.sistembaranghilang.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User currentUser = (User) session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About - Lost & Found Kampus</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
        <style>
            body { background-color: #f8f9fa; min-height: 100vh; display: flex; flex-direction: column; }
            .main-content { flex: 1; }
            .footer-bawah { background-color: #212529; color: #aaa; padding: 20px 0; text-align: center; margin-top: auto; }
            
            /* Styles Khusus Halaman About */
            .tech-card {
                border: 1px solid #e0e0e0;
                border-radius: 10px;
                transition: all 0.3s;
                background: white;
                height: 100%;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                padding: 20px;
            }
            .tech-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 20px rgba(0,0,0,0.1);
                border-color: #0d6efd;
            }
            
            /* PERUBAHAN DISINI: Memperbesar Ukuran Foto Tim */
            .team-card img {
                width: 180px;  /* Diperbesar dari 120px */
                height: 180px; /* Diperbesar dari 120px */
                object-fit: cover;
                border: 5px solid white; /* Border ditebalkan sedikit */
                box-shadow: 0 8px 20px rgba(0,0,0,0.15); /* Shadow dipertegas */
            }
            
            .team-card {
                background: white;
                border-radius: 15px;
                padding: 40px 20px; /* Padding ditambah biar lega */
                transition: transform 0.3s;
            }
            .team-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 20px rgba(0,0,0,0.08);
            }
            
            /* Style Khusus ERD Container */
            .erd-container {
                background: white;
                padding: 10px;
                border-radius: 15px;
                box-shadow: 0 10px 30px rgba(0,0,0,0.1);
                border: 1px solid #dee2e6;
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

        <div class="main-content">
            
            <div class="container py-5">
                <div class="row align-items-center mb-5">
                    <div class="col-md-6 order-md-2">
                        <img src="image/istockphoto-477273563-612x612-removebg-preview.png" class="img-fluid" alt="About App">
                    </div>
                    <div class="col-md-6 order-md-1">
                        <span class="badge bg-primary px-3 py-2 rounded-pill mb-3">Tentang Platform</span>
                        <h2 class="fw-bold display-5 mb-4">Solusi Cerdas Barang Hilang di Kampus</h2>
                        <p class="lead text-muted">
                            Aplikasi Lost & Found Kampus hadir untuk mendigitalisasi proses pencarian dan pelaporan barang di lingkungan akademik.
                        </p>
                        <p class="text-secondary">
                            Kami menyadari bahwa metode konvensional seringkali tidak efektif. Dengan aplikasi ini, informasi dapat tersebar secara <strong>real-time</strong>, transparan, dan dapat diakses oleh siapa saja, kapan saja menggunakan teknologi web modern.
                        </p>
                        <ul class="list-unstyled mt-4">
                            <li class="mb-2"><i class="bi bi-check-circle-fill text-success me-2"></i>Pelaporan Cepat & Mudah</li>
                            <li class="mb-2"><i class="bi bi-check-circle-fill text-success me-2"></i>Notifikasi Status (Hilang/Ditemukan/Selesai)</li>
                            <li class="mb-2"><i class="bi bi-check-circle-fill text-success me-2"></i>Keamanan Data Pengguna</li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="bg-white py-5">
                <div class="container">
                    <div class="text-center mb-5">
                        <h3 class="fw-bold">Teknologi yang Digunakan</h3>
                        <p class="text-muted">Dibangun menggunakan tools dan framework handal.</p>
                    </div>
                    <div class="row g-4 justify-content-center">
                        
                        <div class="col-6 col-md-2">
                            <div class="tech-card shadow-sm">
                                <i class="bi bi-code-square fs-1 text-warning mb-2"></i>
                                <h6 class="fw-bold mb-0">Apache NetBeans</h6>
                                <small class="text-muted">Development IDE</small>
                            </div>
                        </div>

                        <div class="col-6 col-md-2">
                            <div class="tech-card shadow-sm">
                                <i class="bi bi-database-fill fs-1 text-primary mb-2"></i>
                                <h6 class="fw-bold mb-0">PostgreSQL</h6>
                                <small class="text-muted">Relational Database</small>
                            </div>
                        </div>

                        <div class="col-6 col-md-2">
                            <div class="tech-card shadow-sm">
                                <i class="bi bi-bootstrap-fill fs-1 text-purple mb-2" style="color: #6f42c1;"></i>
                                <h6 class="fw-bold mb-0">Bootstrap 5</h6>
                                <small class="text-muted">Frontend Framework</small>
                            </div>
                        </div>

                        <div class="col-6 col-md-2">
                            <div class="tech-card shadow-sm">
                                <i class="bi bi-filetype-java fs-1 text-danger mb-2"></i>
                                <h6 class="fw-bold mb-0">Java JSP</h6>
                                <small class="text-muted">Backend Logic</small>
                            </div>
                        </div>
                        
                         <div class="col-6 col-md-2">
                            <div class="tech-card shadow-sm">
                                <i class="bi bi-diagram-3 fs-1 text-success mb-2"></i>
                                <h6 class="fw-bold mb-0">JDBC & MVC</h6>
                                <small class="text-muted">Architecture</small>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="container py-5">
                <div class="row justify-content-center">
                    <div class="col-lg-10 text-center">
                        <div class="mb-4">
                            <span class="badge bg-info text-dark px-3 py-2 rounded-pill mb-2">Database Architecture</span>
                            <h3 class="fw-bold">Entity Relationship Diagram (ERD)</h3>
                            <p class="text-muted">Struktur rancangan database yang menghubungkan User dan Laporan.</p>
                        </div>
                        
                        <div class="erd-container">
                            <img src="image/Diagram ERD Lost&found.png" 
                                 class="img-fluid rounded" 
                                 alt="Diagram ERD">
                        </div>
                        
                    </div>
                </div>
            </div>

           <div class="bg-white py-5"> 
                <div class="container">
                    <div class="text-center mb-5">
                        <h6 class="text-primary fw-bold text-uppercase">Meet The Team</h6>
                        <h2 class="fw-bold">Tim Pengembang</h2>
                        <p class="text-muted">Mahasiswa di balik pengembangan sistem ini.</p>
                    </div>

                    <div class="row justify-content-center g-4">
                        
                        <div class="col-md-6 col-lg-4"> 
                            <div class="team-card text-center h-100 shadow-sm">
                                <img src="image/anggota1.jpeg" class="rounded-circle mb-3" alt="Foto">
                                <h6 class="fw-bold mb-1">Syahrul Giga Wahyudi</h6>
                                <small class="text-muted d-block mb-2">0110224085</small>
                                <small class="text-muted d-block mb-2">Backend Dev + Frontend Dev</small>
                            </div>
                        </div>

                        <div class="col-md-6 col-lg-4">
                            <div class="team-card text-center h-100 shadow-sm">
                                <img src="image/anggota2.jpeg" class="rounded-circle mb-3" alt="Foto">
                                <h6 class="fw-bold mb-1">Anfasa Umar</h6>
                                <small class="text-muted d-block mb-2">0110224130</small>
                                <small class="text-muted d-block mb-2">Frontend Dev</small>
                            </div>
                        </div>

                        <div class="col-md-6 col-lg-4">
                            <div class="team-card text-center h-100 shadow-sm">
                                <img src="image/anggota3.jpeg" class="rounded-circle mb-3" alt="Foto">
                                <h6 class="fw-bold mb-1">Fathan aqilla bestari</h6> 
                                <small class="text-muted d-block mb-2">0110224024</small>
                                <small class="text-muted d-block mb-2">Frontend Dev</small>
                            </div>
                        </div>

                        <div class="col-md-6 col-lg-4">
                            <div class="team-card text-center h-100 shadow-sm">
                                <img src="image/anggota4.jpeg" class="rounded-circle mb-3" alt="Foto">
                                <h6 class="fw-bold mb-1">Aqila Apta Shohan</h6> 
                                <small class="text-muted d-block mb-2">0110224129</small>
                                <small class="text-muted d-block mb-2">Frontend Dev</small>
                            </div>
                        </div>

                        <div class="col-md-6 col-lg-4">
                            <div class="team-card text-center h-100 shadow-sm">
                                <img src="image/anggota5.jpeg" class="rounded-circle mb-3" alt="Foto">
                                <h6 class="fw-bold mb-1">M luthfi Sahrul fadilah</h6>
                                <small class="text-muted d-block mb-2">0110224023</small>
                                <small class="text-muted d-block mb-2">Frontend Dev</small>
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
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#d33',
                    cancelButtonColor: '#3085d6',
                    confirmButtonText: 'Ya, Keluar'
                }).then((result) => {
                    if (result.isConfirmed) { window.location.href = 'LogoutServlet'; }
                })
            }
        </script>
    </body>
</html>