package com.kampus.sistembaranghilang.controller;

import com.kampus.sistembaranghilang.dao.LaporanDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "UpdateStatusServlet", urlPatterns = {"/UpdateStatusServlet"})
public class UpdateStatusServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String idParam = request.getParameter("id");
        String statusBaru = request.getParameter("status"); // Isinya akan "Selesai"
        
        if (idParam != null && statusBaru != null) {
            try {
                int id = Integer.parseInt(idParam);
                LaporanDAO dao = new LaporanDAO();
                
                // Panggil fungsi update di DAO
                boolean sukses = dao.updateStatusLaporan(id, statusBaru);
                
                if (sukses) {
                    // Redirect kembali ke index dengan pesan sukses
                    response.sendRedirect("index.jsp?msg=status_updated");
                } else {
                    response.sendRedirect("index.jsp?error=db_fail");
                }
            } catch (NumberFormatException e) {
                response.sendRedirect("index.jsp?error=invalid_id");
            }
        } else {
            response.sendRedirect("index.jsp");
        }
    }
}