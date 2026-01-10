package com.kampus.sistembaranghilang.controller;

import com.kampus.sistembaranghilang.dao.LaporanDAO;
import java.io.IOException;
// PERHATIAN: Jika 'jakarta' di bawah ini merah, ganti menjadi 'javax'
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// Anotasi ini PENTING supaya JSP bisa nemu file ini
@WebServlet(name = "HapusLaporanServlet", urlPatterns = {"/HapusLaporanServlet"})
public class HapusLaporanServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            // 1. Ambil ID dari URL (misal: ?id=5)
            String idStr = request.getParameter("id");
            
            if (idStr != null && !idStr.isEmpty()) {
                int id = Integer.parseInt(idStr);
                
                // 2. Panggil DAO untuk hapus
                LaporanDAO dao = new LaporanDAO();
                boolean berhasil = dao.hapusLaporan(id);
                
                if (berhasil) {
                    System.out.println("Berhasil menghapus laporan ID: " + id);
                } else {
                    System.out.println("Gagal menghapus laporan ID: " + id);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        // 3. Apapun yang terjadi, kembalikan ke halaman index
        response.sendRedirect("index.jsp");
    }
}