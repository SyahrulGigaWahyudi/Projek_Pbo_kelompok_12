package com.kampus.sistembaranghilang.servlet; // Sesuaikan dengan package kamu

import java.io.IOException;
// Perhatikan: SEMUA "javax" diganti jadi "jakarta"
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "LogoutServlet", urlPatterns = {"/LogoutServlet"})
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Ambil session saat ini
        HttpSession session = request.getSession(false);
        
        // 2. Jika session ada, hapus (logout)
        if (session != null) {
            session.invalidate();
        }
        
        // 3. Kembalikan ke halaman login
        response.sendRedirect("login.jsp");
    }
}