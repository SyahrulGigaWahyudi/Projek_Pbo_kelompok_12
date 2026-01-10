package com.kampus.sistembaranghilang.model;

public class Laporan {
    private int id;
    private int userId;
    private String namaBarang;
    private String deskripsi;
    private String foto;
    private String status;
    
    // --- TAMBAHAN BARU ---
    private String lokasi;       // Untuk menyimpan lokasi
    private String tanggalHilang; // Kita ubah jadi String biar gampang ambil dari Form HTML
    private String namaPelapor;   // Tidak disimpan di tabel laporan, tapi diambil lewat JOIN table user
    // ---------------------

    // 1. Constructor Kosong
    public Laporan() {
    }

    // 2. Constructor Lengkap (Update dengan field baru)
    public Laporan(int id, int userId, String namaBarang, String deskripsi, String foto, String tanggalHilang, String status, String lokasi) {
        this.id = id;
        this.userId = userId;
        this.namaBarang = namaBarang;
        this.deskripsi = deskripsi;
        this.foto = foto;
        this.tanggalHilang = tanggalHilang;
        this.status = status;
        this.lokasi = lokasi;
    }

    // ==========================
    // GETTER
    // ==========================
    public int getId() { return id; }
    public int getUserId() { return userId; }
    public String getNamaBarang() { return namaBarang; }
    public String getDeskripsi() { return deskripsi; }
    public String getFoto() { return foto; }
    public String getStatus() { return status; }
    
    // Getter Baru
    public String getTanggalHilang() { return tanggalHilang; }
    public String getLokasi() { return lokasi; }
    public String getNamaPelapor() { return namaPelapor; }

    // ==========================
    // SETTER
    // ==========================
    public void setId(int id) { this.id = id; }
    public void setUserId(int userId) { this.userId = userId; }
    public void setNamaBarang(String namaBarang) { this.namaBarang = namaBarang; }
    public void setDeskripsi(String deskripsi) { this.deskripsi = deskripsi; }
    public void setFoto(String foto) { this.foto = foto; }
    public void setStatus(String status) { this.status = status; }

    // Setter Baru
    public void setTanggalHilang(String tanggalHilang) { this.tanggalHilang = tanggalHilang; }
    public void setLokasi(String lokasi) { this.lokasi = lokasi; }
    public void setNamaPelapor(String namaPelapor) { this.namaPelapor = namaPelapor; }
}