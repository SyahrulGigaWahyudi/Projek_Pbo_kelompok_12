package com.kampus.sistembaranghilang.controller;

import com.kampus.sistembaranghilang.dao.UserDAO;
import com.kampus.sistembaranghilang.model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Ambil data dari Form
        String nama = request.getParameter("nama");
        String email = request.getParameter("email");
        String pass = request.getParameter("password");

        // 2. Masukkan ke Objek User
        User u = new User();
        u.setNamaLengkap(nama);
        u.setEmail(email);
        u.setPassword(pass);

        // 3. Panggil DAO
        UserDAO dao = new UserDAO();
        boolean sukses = dao.registerUser(u);

        if (sukses) {
            // Kalau berhasil, arahkan ke login dengan pesan sukses
            response.sendRedirect("login.jsp?msg=registered");
        } else {
            // Kalau gagal, kembalikan ke form daftar
            response.sendRedirect("register.jsp?error=1");
        }
    }
}
