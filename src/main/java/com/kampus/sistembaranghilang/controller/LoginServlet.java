package com.kampus.sistembaranghilang.controller;

import com.kampus.sistembaranghilang.dao.UserDAO;
import com.kampus.sistembaranghilang.model.User;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. PERUBAHAN DISINI: Ambil parameter 'email', bukan 'username'
        String emailInput = request.getParameter("email");
        String passInput = request.getParameter("password");
        
        UserDAO dao = new UserDAO();
        
        // 2. Kirim email ke DAO
        User userLogin = dao.cekLogin(emailInput, passInput);
        
        if (userLogin != null) {
            // Jika berhasil, simpan user di session
            HttpSession session = request.getSession();
            session.setAttribute("user", userLogin);
            response.sendRedirect("index.jsp"); 
        } else {
            // Jika gagal
            request.setAttribute("error", "Email atau Password salah!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}