package com.kampus.sistembaranghilang.model;

public class User {
    private int id;
    private String namaLengkap;
    private String email;
    private String password;
    private String role;

    // Constructor Kosong (Wajib ada)
    public User() {
    }

    // Constructor Lengkap
    public User(int id, String namaLengkap, String email, String password, String role) {
        this.id = id;
        this.namaLengkap = namaLengkap;
        this.email = email;
        this.password = password;
        this.role = role;
    }

    // GETTER & SETTER (Pastikan isinya seperti ini, bukan "throw new...")

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNamaLengkap() {
        return namaLengkap;
    }

    public void setNamaLengkap(String namaLengkap) {
        this.namaLengkap = namaLengkap; // <--- INI YANG BENAR
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}