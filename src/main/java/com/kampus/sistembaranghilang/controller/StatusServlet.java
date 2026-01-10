package com.kampus.sistembaranghilang.controller;

import com.kampus.sistembaranghilang.dao.LaporanDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "StatusServlet", urlPatterns = {"/StatusServlet"})
public class StatusServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Ambil ID Barang dari tombol yang diklik
        int idBarang = Integer.parseInt(request.getParameter("id_laporan"));
        
        // 2. Panggil DAO untuk ubah status jadi "Ditemukan"
        LaporanDAO dao = new LaporanDAO();
        dao.ubahStatus(idBarang, "Ditemukan");
        
        // 3. Kembalikan user ke halaman detail barang tersebut
        response.sendRedirect("detail.jsp?id=" + idBarang);
    }
}