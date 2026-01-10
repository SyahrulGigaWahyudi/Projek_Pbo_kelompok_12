package com.kampus.sistembaranghilang.dao;

import com.kampus.sistembaranghilang.db.Koneksi;
import com.kampus.sistembaranghilang.model.Laporan;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LaporanDAO {
    
    // 1. GET ALL
    public List<Laporan> getAllLaporan() {
        return cariLaporan(""); 
    }

    // 2. TAMBAH DATA
    public boolean tambahLaporan(Laporan l) {
        String sql = "INSERT INTO laporan (user_id, nama_barang, deskripsi, foto, tanggal_hilang, status, lokasi) VALUES (?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = Koneksi.getKoneksi();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, l.getUserId());
            ps.setString(2, l.getNamaBarang());
            ps.setString(3, l.getDeskripsi());
            ps.setString(4, l.getFoto());
            ps.setDate(5, Date.valueOf(l.getTanggalHilang())); 
            ps.setString(6, l.getStatus());
            ps.setString(7, l.getLokasi());
            
            return ps.executeUpdate() > 0;
            
        } catch (Exception e) {
            System.out.println("Gagal Input: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    // 3. GET BY ID (DETAIL)
    public Laporan getLaporanById(int id) {
        Laporan lap = null;
        String sql = "SELECT l.*, u.nama_lengkap FROM laporan l JOIN users u ON l.user_id = u.id WHERE l.id = ?";
        
        try (Connection conn = Koneksi.getKoneksi();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                lap = mapRowToLaporan(rs);
            }
        } catch (Exception e) {
            System.out.println("Error Detail: " + e.getMessage());
        }
        return lap;
    }

    // ==========================================
    // BAGIAN PENYELAMAT (UPDATE STATUS)
    // ==========================================

    // Method Baru (Yang dipakai UpdateStatusServlet)
    public boolean updateStatusLaporan(int id, String statusBaru) {
        String sql = "UPDATE laporan SET status = ? WHERE id = ?";
        try (Connection conn = Koneksi.getKoneksi();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, statusBaru);
            ps.setInt(2, id);
            return ps.executeUpdate() > 0;
            
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Method Lama (Supaya StatusServlet TIDAK EROR)
    public boolean ubahStatus(int id, String statusBaru) {
        return updateStatusLaporan(id, statusBaru); // Numpang panggil method baru
    }

    // ==========================================
    // BAGIAN PENYELAMAT (HAPUS)
    // ==========================================

    // Method Baru (Standar Baru)
    public boolean hapusLaporan(int id) {
        String sql = "DELETE FROM laporan WHERE id = ?";
        try (Connection conn = Koneksi.getKoneksi();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
            
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method Lama (Supaya HapusServlet TIDAK EROR)
    public boolean deleteLaporan(int id) {
        return hapusLaporan(id); // Numpang panggil method baru
    }

    // ==========================================

    // 6. PENCARIAN
    public List<Laporan> cariLaporan(String keyword) {
        List<Laporan> listLaporan = new ArrayList<>();
        String sql = "SELECT l.*, u.nama_lengkap FROM laporan l JOIN users u ON l.user_id = u.id " +
                     "WHERE l.nama_barang ILIKE ? OR l.deskripsi ILIKE ? ORDER BY l.id DESC";
        
        try (Connection conn = Koneksi.getKoneksi();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");
            
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                listLaporan.add(mapRowToLaporan(rs));
            }
        } catch (Exception e) {
            System.out.println("Error Cari: " + e.getMessage());
        }
        return listLaporan;
    }
    
    // 7. FILTER BY STATUS
    public List<Laporan> getLaporanByStatus(String status) {
        List<Laporan> listLaporan = new ArrayList<>();
        String sql = "SELECT l.*, u.nama_lengkap FROM laporan l JOIN users u ON l.user_id = u.id " +
                     "WHERE l.status = ? ORDER BY l.id DESC";
        
        try (Connection conn = Koneksi.getKoneksi();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, status);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()) {
                listLaporan.add(mapRowToLaporan(rs));
            }
        } catch (Exception e) {
            System.out.println("Error Filter Status: " + e.getMessage());
        }
        return listLaporan;
    }
    
    // --- HELPER METHOD ---
    private Laporan mapRowToLaporan(ResultSet rs) throws Exception {
        Laporan l = new Laporan();
        l.setId(rs.getInt("id"));
        l.setUserId(rs.getInt("user_id"));
        l.setNamaBarang(rs.getString("nama_barang"));
        l.setDeskripsi(rs.getString("deskripsi"));
        l.setFoto(rs.getString("foto"));
        
        l.setTanggalHilang(rs.getDate("tanggal_hilang").toString()); 
        l.setStatus(rs.getString("status"));
        
        try {
            l.setLokasi(rs.getString("lokasi"));
        } catch (Exception e) {
            l.setLokasi("-");
        }
        
        try {
            l.setNamaPelapor(rs.getString("nama_lengkap"));
        } catch (Exception e) {
            l.setNamaPelapor("User ID " + rs.getInt("user_id"));
        }
        
        return l;
    }
}