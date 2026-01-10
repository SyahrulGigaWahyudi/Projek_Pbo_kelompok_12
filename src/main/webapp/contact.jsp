<%@page import="com.kampus.sistembaranghilang.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User currentUser = (User) session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact - Lost & Found Kampus</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
        <style>
            body { background-color: #f8f9fa; min-height: 100vh; display: flex; flex-direction: column; }
            .main-content { flex: 1; }
            .footer-bawah { background-color: #212529; color: #aaa; padding: 20px 0; text-align: center; margin-top: auto; }
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

        <div class="main-content container py-5">
            <div class="row justify-content-center">
                <div class="col-md-8 text-center mb-5">
                    <h2 class="fw-bold text-primary">Hubungi Kami</h2>
                    <p class="text-muted">Punya pertanyaan atau kendala teknis? Tim kami siap membantu.</p>
                </div>
            </div>
            
            <div class="row g-4 justify-content-center">
                <div class="col-md-4">
                    <div class="card border-0 shadow-sm h-100 text-center py-4">
                        <div class="card-body">
                            <i class="bi bi-envelope-at fs-1 text-primary mb-3 d-block"></i>
                            <h5 class="fw-bold">Email</h5>
                            <p class="text-muted">admin@kampus-found.ac.id</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card border-0 shadow-sm h-100 text-center py-4">
                        <div class="card-body">
                            <i class="bi bi-whatsapp fs-1 text-success mb-3 d-block"></i>
                            <h5 class="fw-bold">WhatsApp Admin</h5>
                            <p class="text-muted">+62 812-3456-7890</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card border-0 shadow-sm h-100 text-center py-4">
                        <div class="card-body">
                            <i class="bi bi-building fs-1 text-danger mb-3 d-block"></i>
                            <h5 class="fw-bold">Pos Satpam Utama</h5>
                            <p class="text-muted">Gedung Rektorat Lt. 1</p>
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