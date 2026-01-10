<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login - Sistem Barang Hilang</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light d-flex align-items-center justify-content-center" style="height: 100vh;">
        
        <div class="card shadow p-4" style="width: 400px;">
            <div class="text-center mb-4">
                <h4 class="text-primary fw-bold">Login Sistem</h4>
                <p class="text-muted">Silakan masuk dengan akun Anda</p>
            </div>
            
            <% if(request.getParameter("msg") != null && request.getParameter("msg").equals("registered")) { %>
                <div class="alert alert-success text-center">
                    Pendaftaran berhasil!<br>Silakan Login.
                </div>
            <% } %>

            <% String pesan = (String) request.getAttribute("error"); %>
            <% if (pesan != null) { %>
                <div class="alert alert-danger text-center"><%= pesan %></div>
            <% } %>

            <form action="LoginServlet" method="post">
                <div class="mb-3">
                    <label>Email Kampus</label>
                    <input type="email" name="email" class="form-control" required placeholder="Contoh: nama@kampus.ac.id">
                </div>
                
                <div class="mb-3">
                    <label>Password</label>
                    <input type="password" name="password" class="form-control" required placeholder="Masukan password">
                </div>
                
                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-primary">Masuk</button>
                    <a href="register.jsp" class="btn btn-outline-secondary">Belum punya akun? Daftar</a>
                </div>
            </form>
            
            <div class="mt-3 text-center">
                <a href="index.jsp" class="text-decoration-none small">&larr; Kembali ke Home</a>
            </div>
        </div>

    </body>
</html>