<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Daftar Akun Baru</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light d-flex align-items-center justify-content-center" style="height: 100vh;">

        <div class="card shadow p-4" style="width: 400px;">
            <h3 class="text-center mb-4">Daftar Akun</h3>
            
            <% if(request.getParameter("error") != null) { %>
                <div class="alert alert-danger">Gagal mendaftar! Email mungkin sudah dipakai.</div>
            <% } %>

            <form action="RegisterServlet" method="post">
                <div class="mb-3">
                    <label>Nama Lengkap</label>
                    <input type="text" name="nama" class="form-control" required placeholder="Contoh: Budi Santoso">
                </div>
                
                <div class="mb-3">
                    <label>Email Kampus</label>
                    <input type="email" name="email" class="form-control" required placeholder="nama@kampus.ac.id">
                </div>
                
                <div class="mb-3">
                    <label>Password</label>
                    <input type="password" name="password" class="form-control" required>
                </div>
                
                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-success">Daftar Sekarang</button>
                    <a href="login.jsp" class="btn btn-outline-secondary">Sudah punya akun? Login</a>
                </div>
            </form>
        </div>

    </body>
</html>