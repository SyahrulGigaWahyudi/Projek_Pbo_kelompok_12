package com.kampus.sistembaranghilang.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class Koneksi {
    
    // 1. Pengaturan Database
    // Jika passwordmu bukan '123456', GANTI BAGIAN INI:
    private static final String URL = "jdbc:postgresql://localhost:5432/db_barang_hilang";
    private static final String USER = "postgres";
    private static final String PASSWORD = "12345678";
    
    // 2. Method untuk membuka koneksi
    public static Connection getKoneksi() {
        Connection conn = null;
        try {
            // Memanggil Driver PostgreSQL (dari pom.xml tadi)
            Class.forName("org.postgresql.Driver");
            
            // Mencoba menghubungkan
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Koneksi Sukses!");
            
        } catch (Exception e) {
            System.out.println("Koneksi GAGAL: " + e.getMessage());
        }
        return conn;
    }
    
    // 3. Method main untuk TES (Klik Kanan -> Run File)
    public static void main(String[] args) {
        getKoneksi();
    }
}