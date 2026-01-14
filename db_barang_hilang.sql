-- 1. Bersihkan tabel lama jika ada (agar tidak error saat dijalankan ulang)
DROP TABLE IF EXISTS public.laporan;
DROP TABLE IF EXISTS public.users;

-- 2. Membuat Tabel Users
CREATE TABLE public.users (
    id SERIAL PRIMARY KEY, -- Menggunakan SERIAL untuk auto-increment (pengganti sequence manual)
    nama_lengkap VARCHAR(100),
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) DEFAULT 'mahasiswa'
);

-- 3. Membuat Tabel Laporan
CREATE TABLE public.laporan (
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    nama_barang VARCHAR(100),
    deskripsi TEXT,
    foto VARCHAR(255),
    tanggal_hilang DATE,
    status VARCHAR(50),
    lokasi VARCHAR(100),
    CONSTRAINT fk_user 
        FOREIGN KEY (user_id) 
        REFERENCES public.users(id) 
        ON DELETE CASCADE
);

-- 4. Memasukkan Data ke Tabel Users
-- Kita memasukkan ID secara eksplisit agar relasi dengan tabel laporan tetap terjaga sesuai dump
INSERT INTO public.users (id, nama_lengkap, email, password, role) VALUES
(1, 'Admin', 'admin@kampus.ac.id', '123', 'admin'),
(2, 'syahrul giga wahyudi', 'giga@test.com', '123', 'siswa'),
(4, 'budi santoso', 'budi@kampus.ac.id', '123', 'siswa');

-- 5. Memasukkan Data ke Tabel Laporan
INSERT INTO public.laporan (id, user_id, nama_barang, deskripsi, foto, tanggal_hilang, status, lokasi) VALUES
(12, 1, 'Buku Atomic Habits', 'Buku Berjudul Atomic Habits dengan cover masih bagus', '1768040857367_photo_2026-01-10_17-26-16.jpg', '2026-01-08', 'Ditemukan', 'Gedung A Ruang 402'),
(13, 1, 'Stopkontak', 'Stopkontak 4 Colokan', '1768041030948_photo_2026-01-10_17-26-06.jpg', '2026-01-09', 'Ditemukan', 'Gendung B ruang 301'),
(14, 1, 'Tws putih', 'Tws Merek Robot warna putih', '1768041124247_photo_2026-01-10_17-26-14.jpg', '2026-01-07', 'Ditemukan', 'Gendung B ruang 303'),
(15, 2, 'Chager Handphone', 'kepala Chager warna hijau dan kabel warna putih merek robot', '1768041293028_photo_2026-01-10_17-26-12.jpg', '2026-01-10', 'Hilang', 'Gedung A Ruang 403'),
(16, 4, 'Tws hitam', 'tws hitam merek ripple', '1768041381764_photo_2026-01-10_17-26-10.jpg', '2026-01-10', 'Hilang', 'Gendung B ruang 302'),
(17, 2, 'Powerbank', 'powerbank 20.000 mah merek vention warna hitam', '1768041462723_photo_2026-01-10_17-26-09.jpg', '2026-01-10', 'Ditemukan', 'Gedung A Ruang 401'),
(19, 4, 'Kunci motor', 'kunci motor merek honda', '1768400813006_kunci motor.jpeg', '2026-01-11', 'Ditemukan', 'Gedung A Ruang 301');

-- 6. Update Sequence (Penting!)
-- Karena kita memasukkan ID secara manual (seperti ID 4 dan 19), 
-- kita harus memberitahu database angka terakhir agar insert selanjutnya tidak error/duplikat.
SELECT setval('public.users_id_seq', (SELECT MAX(id) FROM public.users));
SELECT setval('public.laporan_id_seq', (SELECT MAX(id) FROM public.laporan));
