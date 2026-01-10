<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.kampus.sistembaranghilang.model.User"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Tentang Aplikasi - Lost & Found</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            /* --- CSS Agar Footer Selalu di Bawah (Sticky Footer) --- */
            body {
                background-color: #f8f9fa; /* bg-light */
                min-height: 100vh;      /* Tinggi minimal setinggi layar */
                display: flex;          /* Mode Flexbox */
                flex-direction: column; /* Susunan vertikal */
            }

            .main-content {
                flex: 1; /* Konten utama akan mengisi ruang kosong */
            }

            .footer-bawah {
                background-color: #212529; /* Warna gelap */
                color: #aaa;
                padding: 20px 0;
                text-align: center;
                margin-top: auto;
                width: 100%;
            }
            /* ------------------------------------------------------- */
        </style>
    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
            <div class="container">
                <a class="navbar-brand fw-bold" href="index.jsp">🔍 Lost & Found Kampus</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto align-items-center">
                        <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link active" href="about.jsp">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
                        
                        <% 
                            User user = (User) session.getAttribute("user");
                            if(user != null) { 
                        %>
                            <li class="nav-item ms-3"><span class="nav-link text-warning">Halo, <%= user.getNamaLengkap() %></span></li>
                            <li class="nav-item"><a class="btn btn-danger btn-sm text-white ms-2" href="#" onclick="konfirmasiLogout(); return false;">Logout</a></li>
                        <% } else { %>
                            <li class="nav-item ms-2"><a class="btn btn-primary btn-sm px-3" href="login.jsp">Login</a></li>
                        <% } %>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="main-content">
            <div class="container mt-5 mb-5">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="card shadow border-0">
                            <div class="card-body p-5">
                                <h2 class="text-primary fw-bold mb-4">Tentang Aplikasi</h2>
                                <p class="lead">
                                    <strong>Lost & Found Kampus</strong> adalah platform digital yang dirancang untuk membantu mahasiswa dan civitas akademika dalam melaporkan serta menemukan barang yang hilang di lingkungan kampus.
                                </p>
                                <hr>
                                
                                <h4 class="mt-4">🛠️ Teknologi yang Digunakan</h4>
                                <p>Aplikasi ini dibangun menggunakan teknologi standar industri pemrograman Java:</p>
                                
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item"><strong>Backend:</strong> Java Servlet & JSP</li>
                                    <li class="list-group-item"><strong>Database:</strong> PostgreSQL</li>
                                    <li class="list-group-item"><strong>Frontend:</strong> Bootstrap 5</li>
                                    <li class="list-group-item"><strong>Tools:</strong> Apache NetBeans & Tomcat</li>
                                </ul>

                                <h4 class="mt-4">👨‍💻 Tim Pengembang</h4>
                                <div class="alert alert-info">
                                    Dibuat oleh: <strong>Syahrul Giga Wahyudi</strong>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

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
                    cancelButtonText: 'Tidak'
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = 'LogoutServlet';
                    }
                })
            }
        </script>
    </body>
</html>