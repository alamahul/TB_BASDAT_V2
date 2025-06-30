![SIPEDES V2](https://github.com/alamahul/TB_BASDAT_V2/blob/main/public/assets/img/readme/mockup_opresent.png)

# 💼 SIPEDES V2 - Sistem Informasi Pengelolaan Desa

**Aplikasi Presensi Online Berbasis Web**

[![Made with CodeIgniter4](https://img.shields.io/badge/Made%20with-CodeIgniter4-DD4814.svg)](https://codeigniter.com/)  
[![Open Source](https://badgen.net/badge/Open%20Source/Yes/blue?icon=github)](https://github.com/alamahul/TB_BASDAT_V2)

---

## 📌 Deskripsi Proyek

**SIPEDES V2 (O-Present)** adalah sistem informasi berbasis web yang dirancang untuk memudahkan proses **presensi pegawai desa** secara online. Dilengkapi dengan fitur foto dan lokasi GPS, aplikasi ini menyederhanakan proses pencatatan kehadiran dan ketidakhadiran. Proyek ini dikembangkan sebagai bagian dari **Tugas Besar Mata Kuliah Basis Data**.

---

## 🧩 Teknologi yang Digunakan

- **CodeIgniter 4** – PHP framework MVC ringan dan efisien
- **Myth/Auth** – Autentikasi aman untuk CodeIgniter 4
- **MySQL** – Database relasional untuk pengelolaan data presensi
- **Bootstrap 5 & Tabler** – UI modern dan responsif
- **jQuery & WebcamJS** – Penangkapan foto presensi real-time
- **Leaflet.js** – Penentuan lokasi berbasis peta interaktif

---

## 🚀 Fitur Utama

✅ Presensi berbasis **GPS** dan **foto selfie**  
✅ **Otentikasi multi-user**: Admin, Pegawai, Kepala Desa  
✅ Export laporan ke format **Excel dan PDF**  
✅ **Filter & Live Search** untuk kemudahan pencarian data  
✅ Pengelolaan **data pegawai, jabatan, lokasi, dan absensi**  
✅ Pengajuan **ketidakhadiran online** dengan status otomatis/manual  
✅ Fitur **lupa password, ubah email, ubah profile**

---

## 🏗️ Arsitektur Database

Struktur database dirancang berdasarkan kebutuhan real-time attendance system dan dioptimalkan untuk pencatatan data secara efisien.

![Database Diagram](https://github.com/josephines1/o-present/blob/main/public/assets/img/readme/db_opresent.png)

---

## ⚙️ Langkah Instalasi

### 1. Clone Repositori

```bash
git clone https://github.com/alamahul/TB_BASDAT_V2
```

### 2. Setup Project

- Ekstrak dan pindahkan ke `htdocs/`
- Jalankan terminal di folder project
- Jalankan:
  ```bash
  composer install
  ```

### 3. Konfigurasi `.env`

Salin file `env` menjadi `.env` lalu ubah:

```ini
CI_ENVIRONMENT = development
app.baseURL = 'http://localhost:8080/'
database.default.hostname = localhost
database.default.database = db_sipedesv2
database.default.username = root
database.default.password =
```

### 4. Konfigurasi Email Reset Password (opsional)

Edit `app/Config/Email.php` sesuai akun Gmail Anda.

1. Buka file `Email.php` dalam folder `app/Config/Email.php`.
2. Isi fromName dan fromEmail untuk digunakan saat mengirim email untuk reset password, dan sebagainya.
   ```
   public string $fromEmail  = 'your email here';
   public string $fromName   = 'SIPEDESV2';
   ```
3. Isi nilai SMTPUser dengan email yang sama dengan yang Anda masukkan di $fromEmail.
   ```
   public string $SMTPUser = 'your email here';
   ```
4. Isi nilai SMTPPass dengan kode yang Anda dapatkan dari verifikasi dua langkah pada Akun Google Anda untuk Aplikasi XAMPP. Untuk cara lengkap memperoleh kode verifikasi 2 langkah Akun Google dapat dilihat pada link ini https://support.google.com/accounts/answer/185833?hl=en.
   ```
   public string $SMTPPass = 'your code here';
   ```

### 5. Import Database

- Buka `localhost/phpmyadmin`
- Buat database `db_sipedesv2`
- Import file `DB/sipedesv2.sql`

### 6. Jalankan Server

```bash
php spark serve
```

Buka: [http://localhost:8080](http://localhost:8080)

---

## 👤 Akun Default

| Role        | Username       | Password |
| ----------- | -------------- | -------- |
| Kepala Desa | `kartika`      | `123456` |
| Admin       | `pian123`      | `123456` |
| Pegawai     | `yunussubagja` | `123456` |

---

## 📊 Modul & Layanan

### 📍 Presensi Masuk & Keluar

> Kamera dan GPS wajib aktif untuk melakukan presensi.

### 📆 Rekap & Laporan Presensi

> Laporan dapat dicetak per hari/bulan dalam format Excel atau PDF.

### 📁 Pengajuan & Approval Ketidakhadiran

> Tipe: **Cuti, Izin, Sakit**  
> Validasi tanggal & upload file surat keterangan

### 👥 Master Data

> Kelola pegawai, jabatan, lokasi presensi dengan fitur pencarian & export data

### 🔐 Sistem Otentikasi & Manajemen Akun

> Reset password, ubah email, ubah data diri, aktivasi akun baru

---

## 🛠️ Troubleshooting

### 1. "Only secure origins are allowed"

> Gunakan `ngrok` untuk HTTPS:

```bash
ngrok http 8080
```

### 2. Geolocation Error di iOS

> Tambahkan header NGINX:

```nginx
add_header Content-Security-Policy "upgrade-insecure-requests";
```

---

## 🎓 Tugas Besar Basis Data

Aplikasi ini dikembangkan untuk memenuhi **Tugas Besar Basis Data**, dengan fokus pada:

- **Perancangan basis data relasional**
- **Implementasi trigger & prosedur tersimpan**
- **Optimasi query dan integrasi sistem otentikasi**
- **Penerapan CRUD dan validasi data**

---

## 🙏 Kredit

- **Original Creator**: [Josephine](https://josephines1.github.io/)
- **Modified By**: [Alamahul Bayan](https://alamahul.github.io)
- **UI Template**: [Tabler.io](https://tabler.io)

---

> 📌 _Dokumentasi ini dibuat sebagai bagian dari laporan proyek Tugas Besar Basis Data pada Program Studi Teknik Informatika._
