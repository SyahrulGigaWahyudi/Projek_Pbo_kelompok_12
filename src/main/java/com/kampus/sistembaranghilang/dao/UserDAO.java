package com.kampus.sistembaranghilang.dao;

import com.kampus.sistembaranghilang.db.Koneksi;
import com.kampus.sistembaranghilang.model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    // Method untuk mengecek Login
   public User cekLogin(String email, String password) {
        User u = null;
        try {
            Connection conn = Koneksi.getKoneksi();
            
            // PERBAIKAN UTAMA ADA DI SINI:
            // Dulu: WHERE username = ?
            // Sekarang GANTI JADI: WHERE email = ?
            String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
            
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email); // Masukkan email ke tanda tanya pertama
            ps.setString(2, password); // Masukkan password ke tanda tanya kedua
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                u = new User();
                u.setId(rs.getInt("id"));
                u.setNamaLengkap(rs.getString("nama_lengkap"));
                u.setEmail(rs.getString("email")); // Pastikan ini ambil 'email'
                u.setPassword(rs.getString("password"));
                u.setRole(rs.getString("role"));
            }
        } catch (Exception e) {
            System.out.println("Error Login: " + e.getMessage());
        }
        return u;
    }

    // Test Login di Console
    public static void main(String[] args) {
        UserDAO dao = new UserDAO();

        // Coba login dengan data dummy yang kita buat di database tadi
        User hasil = dao.cekLogin("budi", "123");

        if (hasil != null) {
            System.out.println("Login SUKSES! Halo, " + hasil.getNamaLengkap());
            System.out.println("Role anda: " + hasil.getRole());
        } else {
            System.out.println("Login GAGAL! Username/Password salah.");
        }
    }
// ... kode cekLogin dan lainnya ada di atas sini ...

    // METHOD BARU: DAFTAR USER
    public boolean registerUser(User u) {
        try {
            Connection conn = Koneksi.getKoneksi();
            // Default role kita set 'siswa' biar aman. Admin buat manual di database aja.
            String sql = "INSERT INTO users (nama_lengkap, email, password, role) VALUES (?, ?, ?, 'siswa')";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, u.getNamaLengkap());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPassword());

            int hasil = ps.executeUpdate();
            return hasil > 0; // Kalau lebih dari 0 berarti berhasil input

        } catch (Exception e) {
            System.out.println("Gagal Register: " + e.getMessage());
            return false;
        }
    }
}


