<%@page import="com.kampus.sistembaranghilang.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User currentUser = (User) session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gallery - Lost & Found Kampus</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/css/lightbox.min.css">
        <style>
            body { background-color: #f8f9fa; min-height: 100vh; display: flex; flex-direction: column; }
            .main-content { flex: 1; }
            .footer-bawah { background-color: #212529; color: #aaa; padding: 20px 0; text-align: center; margin-top: auto; }
            
            /* CSS KHUSUS GALLERY */
            .gallery-item {
                overflow: hidden;
                border-radius: 15px;
                position: relative;
                box-shadow: 0 4px 15px rgba(0,0,0,0.1);
                cursor: pointer;
                background: white;
            }
            .gallery-item img {
                transition: transform 0.5s ease;
                width: 100%;
                height: 250px; /* Tinggi seragam */
                object-fit: cover;
            }
            .gallery-item:hover img {
                transform: scale(1.1); /* Efek Zoom saat hover */
            }
            .gallery-caption {
                padding: 15px;
                text-align: center;
                background: white;
                border-top: 1px solid #f0f0f0;
            }
            .gallery-header {
                background: linear-gradient(135deg, #0d6efd, #0dcaf0);
                color: white;
                padding: 60px 0;
                border-radius: 0 0 50px 50px;
                margin-bottom: 40px;
                text-align: center;
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
                            <li class="nav-item">
                                <a href="index.jsp" class="btn btn-success btn-sm text-white ms-2 px-3 rounded-pill shadow-sm">
                                    <i class="bi bi-plus-circle"></i> Lapor Barang
                                </a>
                            </li>
                            <li class="nav-item"><a class="btn btn-outline-danger btn-sm ms-3 rounded-pill" href="#" onclick="konfirmasiLogout(); return false;">Logout</a></li>
                        <% } %>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="main-content">
            
            <div class="gallery-header shadow-sm">
                <div class="container">
                    <h1 class="fw-bold display-5">Galeri Kelompok</h1>
                    <p class="lead mb-0">Dokumentasi kegiatan dan momen kebersamaan tim pengembang.</p>
                </div>
            </div>

            <div class="container mb-5">
                <div class="row g-4">
                    
                    <div class="col-md-4">
                        <div class="gallery-item">
                            <img src="https://img.freepik.com/free-photo/group-diverse-people-having-business-meeting_53876-25060.jpg" alt="Foto Full Team">
                            <div class="gallery-caption">
                                <h6 class="fw-bold mb-1">Full Squad Team</h6>
                                <small class="text-muted">Diskusi Proyek di Kampus</small>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="gallery-item">
                            <img src="https://img.freepik.com/free-photo/programming-background-with-person-working-with-codes-computer_23-2150010125.jpg" alt="Coding Session">
                            <div class="gallery-caption">
                                <h6 class="fw-bold mb-1">Coding Session</h6>
                                <small class="text-muted">Begadang ngerjain Backend</small>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="gallery-item">
                            <img src="https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80" alt="Ketua Kelompok">
                            <div class="gallery-caption">
                                <h6 class="fw-bold mb-1">Si Paling Project Manager</h6>
                                <small class="text-muted">Presentasi Progress</small>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="gallery-item">
                            <img src="https://images.unsplash.com/photo-1522202176988-66273c2fd55f?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80" alt="Diskusi">
                            <div class="gallery-caption">
                                <h6 class="fw-bold mb-1">Diskusi Database</h6>
                                <small class="text-muted">Merancang ERD PostgreSQL</small>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="gallery-item">
                            <img src="https://images.unsplash.com/photo-1531545514256-b1400bc00f31?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80" alt="Santai">
                            <div class="gallery-caption">
                                <h6 class="fw-bold mb-1">Break Time</h6>
                                <small class="text-muted">Makan-makan setelah selesai fitur</small>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-4">
                        <div class="gallery-item">
                            <img src="https://images.unsplash.com/photo-1552664730-d307ca884978?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80" alt="Revisi">
                            <div class="gallery-caption">
                                <h6 class="fw-bold mb-1">Revisi Bersama</h6>
                                <small class="text-muted">Memperbaiki bug UI</small>
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