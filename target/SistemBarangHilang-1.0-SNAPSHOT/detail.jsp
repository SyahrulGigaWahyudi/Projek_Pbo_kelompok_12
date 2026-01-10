<%@page import="com.kampus.sistembaranghilang.model.User"%>
<%@page import="com.kampus.sistembaranghilang.model.Laporan"%>
<%@page import="com.kampus.sistembaranghilang.dao.LaporanDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Detail Barang</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light">

        <div class="container mt-5">
            <%
                String idStr = request.getParameter("id");
                if (idStr == null || idStr.isEmpty()) {
                    response.sendRedirect("index.jsp");
                    return;
                }

                int id = Integer.parseInt(idStr);
                LaporanDAO dao = new LaporanDAO();
                Laporan barang = dao.getLaporanById(id);

                // Ambil data user yang sedang login
                User currentUser = (User) session.getAttribute("user");

                if (barang == null) {
            %>
                <div class="alert alert-danger">Barang tidak ditemukan! <a href="index.jsp">Kembali</a></div>
            <% } else { %>

            <div class="card shadow">
                <div class="card-header bg-white">
                    <a href="index.jsp" class="btn btn-outline-secondary btn-sm">&larr; Kembali</a>
                    
                    <% if(barang.getStatus().equals("Ditemukan")) { %>
                        <span class="float-end badge bg-success fs-6">SUDAH DITEMUKAN</span>
                    <% } else { %>
                        <span class="float-end badge bg-warning text-dark fs-6">MASIH HILANG</span>
                    <% } %>
                </div>
                
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-5">
                            <div class="border rounded overflow-hidden shadow-sm">
                                <img src="uploads/<%= barang.getFoto() %>" class="img-fluid w-100" alt="Detail Barang">
                            </div>
                        </div>
                        
                        <div class="col-md-7">
                            <h2 class="text-primary fw-bold"><%= barang.getNamaBarang() %></h2>
                            <p class="text-muted"><small>Dilaporkan: <%= barang.getTanggalHilang() %></small></p>
                            
                            <hr>
                            <h5>Deskripsi:</h5>
                            <p class="fs-5"><%= barang.getDeskripsi() %></p>
                            
                            <% 
                                // Tombol Hapus & Ubah Status HANYA MUNCUL JIKA USER ADALAH ADMIN
                                if (currentUser != null && currentUser.getRole().equals("admin")) {
                            %>
                                <div class="mt-4 p-3 bg-light border rounded">
                                    <h6 class="fw-bold text-danger">⚠️ Menu Admin</h6>
                                    
                                    <div class="d-flex gap-2">
                                        <% if (barang.getStatus().equals("Hilang")) { %>
                                            <form action="StatusServlet" method="post">
                                                <input type="hidden" name="id_laporan" value="<%= barang.getId() %>">
                                                <button type="submit" class="btn btn-success">✅ Tandai Ditemukan</button>
                                            </form>
                                        <% } %>
                                        
                                        <form action="HapusServlet" method="post" onsubmit="return confirm('Yakin ingin menghapus laporan ini? Data akan hilang permanen.');">
                                            <input type="hidden" name="id_laporan" value="<%= barang.getId() %>">
                                            <button type="submit" class="btn btn-danger">🗑️ Hapus Postingan</button>
                                        </form>
                                    </div>
                                </div>
                            <% } %>
                            </div>
                    </div>
                </div>
            </div>
            <% } %>
        </div>

    </body>
</html>