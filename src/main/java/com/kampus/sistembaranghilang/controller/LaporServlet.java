package com.kampus.sistembaranghilang.controller;

import com.kampus.sistembaranghilang.dao.LaporanDAO;
import com.kampus.sistembaranghilang.model.Laporan;
import com.kampus.sistembaranghilang.model.User;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet(name = "LaporServlet", urlPatterns = {"/LaporServlet"})
@MultipartConfig 
public class LaporServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Cek User Login
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // 2. Ambil Data Text (DITAMBAHKAN DI SINI)
        String namaBarang = request.getParameter("nama_barang");
        String deskripsi = request.getParameter("deskripsi");
        
        // --- DATA BARU DARI FORM ---
        String lokasi = request.getParameter("lokasi"); // BARU: Ambil lokasi
        String tanggal = request.getParameter("tanggal"); // BARU: Ambil tanggal
        String status = request.getParameter("status");   // BARU: Ambil status (Hilang/Ditemukan)
        // ---------------------------
        
        // 3. PROSES UPLOAD FILE GAMBAR
        Part filePart = request.getPart("foto"); 
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); 
        
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir(); 
        
        String finalFileName = System.currentTimeMillis() + "_" + fileName;
        filePart.write(uploadPath + File.separator + finalFileName);

        // 4. Masukkan ke Database
        Laporan l = new Laporan();
        l.setUserId(user.getId());
        l.setNamaBarang(namaBarang);
        l.setDeskripsi(deskripsi);
        l.setFoto(finalFileName);
        
        // --- SET DATA BARU KE MODEL ---
        l.setLokasi(lokasi);         // BARU: Masukkan lokasi ke object Laporan
        l.setTanggalHilang(tanggal); // BARU: Masukkan tanggal
        l.setStatus(status);         // BARU: Masukkan status
        // ------------------------------

        LaporanDAO dao = new LaporanDAO();
        boolean sukses = dao.tambahLaporan(l);

        if (sukses) {
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("lapor.jsp?error=1");
        }
    }
}