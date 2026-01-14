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
                            <img src="image/galeri1.jpeg" alt="Foto Full Team">
                            <div class="gallery-caption">
                                <h6 class="fw-bold mb-1">Full Squad Team</h6>
                                
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="gallery-item">
                            <img src="image/galeri2.jpeg" alt="Coding Session">
                            <div class="gallery-caption">
                                <h6 class="fw-bold mb-1">Coding Session</h6>
                                
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="gallery-item">
                            <img src="image/galeri3.jpeg" alt="Ketua Kelompok">
                            <div class="gallery-caption">
                                <h6 class="fw-bold mb-1">Diskusi Projek</h6>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="gallery-item">
                            <img src="image/galeri4.jpeg" alt="Diskusi">
                            <div class="gallery-caption">
                                <h6 class="fw-bold mb-1">Diskusi Desain UI</h6>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="gallery-item">
                            <img src="image/galeri5.jpeg">
                            <div class="gallery-caption">
                                <h6 class="fw-bold mb-1">Diskusi Desain UI</h6>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-4">
                        <div class="gallery-item">
                            <img src="image/galeri6.jpeg" alt="Revisi">
                            <div class="gallery-caption">
                                <h6 class="fw-bold mb-1">Coding Session</h6>
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