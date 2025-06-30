![SIPEDESV2](https://github.com/alamahul/TB_BASDAT_V2/blob/main/public/assets/img/readme/mockup_opresent.png "SIPEDESV2")

# Sistem Informasi Pengelolaan Desa (SIPEDES V2)

[![made-with-codeigniter4](https://img.shields.io/badge/Made%20with-CodeIgniter4-DD4814.svg)](https://www.codeigniter.com/) [![Open Source? Yes!](https://badgen.net/badge/Open%20Source%3F/Yes%21/blue?icon=github)](https://github.com/josephines1/o-present)

## Aplikasi Presensi Online Berbasis Web

Presensi online tanpa ribet! Catat kehadiran dengan cepat menggunakan foto dan GPS. Manajemen presensi yang lebih pintar dan praktis!

## Requirements

- [CodeIgniter 4](https://codeigniter.com/user_guide/intro/index.html)
- [Composer](https://getcomposer.org/)
- [XAMPP 8.2.4 or later](https://www.apachefriends.org/download.html)
- Geolocation-enabled Browser. Read the location access conditions [here](https://www.chromium.org/Home/chromium-security/prefer-secure-origins-for-powerful-new-features/).

## Features

Temukan fitur-fitur lengkap pada aplikasi presensi O-Present:

- Presensi Berdasarkan GPS Pegawai
- Presensi Berdasarkan Foto Selfie
- Export Laporan Presensi ke dalam Bentuk Microsoft Excel
- Cetak Laporan bentuk PDF
- Temukan Data dengan Filter dan Live Search
- Simpan Data Presensi, Lokasi Presensi, hingga Data Pegawai
- Sistem Otentikasi (Auth) Multiuser untuk Pegawai, Admin, dan Kepala Desa

## Getting Started

Anda perlu melakukan sedikit konfigurasi di bawah ini sebelum mulai menjalankan web SIPEDES V2:

1. Anda dapat mengunduh kode sumber aplikasi ini dari repositori GitHub dengan tombol "Download ZIP" atau jalankan perintah berikut di terminal Anda:

   ```console
   git clone https://github.com/alamahul/TB_BASDAT_V2
   ```

2. Ekstrak file Zip TB_BASDAT_V2 yang sudah diunduh dan lokasikan folder aplikasi di dalam folder htdocs.

3. Buka folder project tersebut di Code Editor (seperti Visual Studio Code)

4. Buka terminal, dan pastikan path pada terminal sudah terarah pada directory project website.
5. Jalankan perintah berikut ini pada terminal untuk memuat package yang dibutuhkan website.
   ```console
   composer install
   ```
6. Copy file `env` dan beri nama file duplikatnya menjadi `.env`

   - Pertama, ubah konfigurasi CI_ENVIROMENT menjadi seperti di bawah ini.
     ```
      CI_ENVIRONMENT = development
     ```
   - Lalu, konfigurasikan url utama untuk web Anda.
     ```
      app.baseURL = 'http://localhost:8080/'
     ```
   - Kemudian, konfirgurasikan database. Sesuaikan dengan database milik Anda.
     ```
      database.default.hostname = localhost
      database.default.database = db_sipedesv2
      database.default.username = root
      database.default.password =
      database.default.DBDriver = MySQLi
      database.default.DBPrefix =
      database.default.port = 3306
     ```

7. Buka file `Email.php` dalam folder `app/Config/Email.php`.
8. Isi fromName dan fromEmail untuk digunakan saat mengirim email untuk reset password, dan sebagainya.
   ```
   public string $fromEmail  = 'your email here';
   public string $fromName   = 'SIPEDESV2';
   ```
9. Isi nilai SMTPUser dengan email yang sama dengan yang Anda masukkan di $fromEmail.
   ```
   public string $SMTPUser = 'your email here';
   ```
10. Isi nilai SMTPPass dengan kode yang Anda dapatkan dari verifikasi dua langkah pada Akun Google Anda untuk Aplikasi XAMPP. Untuk cara lengkap memperoleh kode verifikasi 2 langkah Akun Google dapat dilihat pada link ini https://support.google.com/accounts/answer/185833?hl=en.
    ```
    public string $SMTPPass = 'your code here';
    ```
11. Aktifkan server Apache dan MySQL di XAMPP Control Panel Anda untuk memulai server pengembangan lokal.
12. Kunjungi `localhost/phpmyadmin` pada browser Anda, lalu buat database baru dengan nama o-present atau sesuaikan dengan nama database yang Anda inginkan

13. import DB pada Folder DB/sipedesv2.sqp

14. Selanjutnya, start server dengan menjalankan perintah berikut ini di terminal.
    ```console
    php spark serve
    ```
15. Selesai! Anda dapat mengakses web melalui port 8080 `http://localhost:8080` di server lokal.

## First Usage

Setelah melakukan instalasi dan konfigurasi O-Present, Anda dapat melakukan login pada aplikasi dengan email dan password sebagai berikut.

### Kepala Desa

```
username: kartika
Password: 123456
```

### Admin

```
username: pian123
Password: 123456
```

### Pegawai

```
username: yunussubagja
Password: 123456
```

Setelah berhasil melakukan login, Anda dapat mencoba untuk menambahkan lokasi presensi baru untuk mencoba melakukan presensi masuk dan presensi keluar.

## Services

Layanan di bawah ini tersedia pada aplikasi SIPEDESV2.

#### Presensi Masuk & Keluar

Pada role Admin dan Pegawai, pengguna dapat melakukan presensi masuk pada lokasi presensi yang sudah diatur. Untuk layanan ini, akses kamera dan lokasi diperlukan untuk melakukan presensi masuk dan keluar. Foto presensi yang sudah ter-capture, akan disimpan dalam folder public\assets\img\foto_presensi.

#### Rekap Presensi

Pada role Admin dan Pegawai, pengguna dapat melihat rekap presensi yang sudah tercatat dalam database, serta mengunduhnya dalam bentuk Microsoft Excel.

#### Laporan Presensi Harian dan Bulanan

Pada role Head dan Admin, pengguna dapat melihat laporan presensi harian dan bulanan milik seluruh pegawai yang sudah tercatat dalam database, serta mengunduhnya dalam bentuk Microsoft Excel.

#### Pengajuan Ketidakhadiran

Pada role Admin dan Pegawai, pengguna dapat mengajukan ketidakhadiran dengan batas H-3 dan durasi ketidakhadiran selama 3 bulan. Pengguna diwajibkan menggunggah file surat keterangan tidak hadir dalam bentuk PDF. File yang sudah terunggah disimpan dalam folder public\assets\file\surat_keterangan_ketidakhadiran. Pengguna dapat mengunduh daftar ketidakhadirannya dalam satu bulan ke dalam bentuk Microsoft Excel.

Detail tipe ketidakhadiran adalah sebagai berikut
**Cuti**

- Pengajuan: Dapat diajukan beberapa hari sebelumnya sesuai kebijakan perusahaan, yang diatur di rules `daysAfter[]` di file `app\Controllers\Ketidakhadiran.php`.
- Status Approval: Memerlukan persetujuan dari atasan. Tidak ada persetujuan otomatis.

**Izin**

- Pengajuan: Dapat diajukan pada hari yang sama atau untuk hari mendatang, tetapi tidak dapat untuk tanggal kemarin atau sebelumnya.
- Status Approval: Memerlukan persetujuan dari atasan. Tidak ada persetujuan otomatis.

**Sakit**

- Pengajuan: Hanya dapat diajukan pada hari ini atau hari esok. Tidak bisa untuk tanggal lebih dari hari esok.
- Status Approval: Otomatis disetujui tanpa perlu persetujuan dari atasan.

#### Kelola Ketidakhadiran

Pada role Head, pengguna dapat mengelola ijin ketidakhadiran, yang meliputi PENDING, APPROVED, dan REJECTED. Pengguna dapat mengunduh daftar ketidakhadiran dari seluruh pegawai ke dalam bentuk Microsoft Excel.

Pada website, batas pengajuan ketidakhadiran dapat dilakukan minimal 3 hari sebelum tanggal mulai cuti untuk pengguna dengan role Head menentukan status pengajuan kehadiran. Untuk memodifikasi batas pengajuan, dapat dilakukan pada rules `daysAfter[]` di file `app\Controllers\Ketidakhadiran.php` pada validasi tanggal mulai (baris ke 287 dan 385) menjadi seperti ini:

```
'tanggal_mulai' => [
                'rules' => 'required|valid_date[Y-m-d]|daysAfter[3]',
                'errors' => [
                    'required' => 'Tanggal mulai ketidakhadiran wajib diisi.',
                    'valid_date' => 'Tanggal harus dalam format YYYY-MM-DD.',
                    'daysAfter' => 'Pengajuan cuti harus minimal 3 hari sebelum tanggal cuti yang diinginkan.'
                ]
            ],
```

#### Master Data

Pada role Head dan Admin, pengguna dapat mengelola data jabatan, lokasi presensi, dan pegawai. Pengguna dapat menemukan data-data tersebut dengan memanfaatkan fitur filter data dan live search data sehingga data dapat ditemukan dengan cepat dan efisien. Pengguna juga dapat mengunduh data-data tersebut ke dalam bentuk Microsoft Excel.

Untuk data beserta akun pegawai yang baru ditambahkan, pegawai dapat mengakses website setelah melewati proses aktivasi, dengan password default '123456'. Pengguna dengan role Head dan Admin dapat menambahkan akun baru untuk pegawai dan menentukan langsung status aktivasi nya (Aktivasi Instan, Aktivasi Melalui Email, atau Aktivasi Nanti).

#### Kelola Profile

Untuk semua role, pengguna dapat mengelola profile nya, yang meliputi ubah foto profile, ubah username, ubah nama dan info profile lainnya.

#### Lupa & Ubah Password

Untuk pengguna yang lupa password, pengguna dapat memilih opsi "Lupa Password" yang tersedia pada halaman Login. Untuk pengguna yang ingin melakukan perubahan password, pengguna dapat memilih opsi "Reset Password" yang tersedia pada halaman profile. Sistem akan mengirimkan email kepada pengguna untuk instruksi reset password.

#### Ubah Email

Untuk pengguna yang ingin melakukan perubahan email, pengguna dapat memilih opsi "Ubah Email" yang tersedia pada halaman profile. Sistem akan mengirimkan token ke alamat email pengguna saat ini, untuk instruksi selanjutnya dalam melakukan perubahan alamat email.

## Database

Berikut ini adalah struktur table database untuk aplikasi SIPEDESV2.
![SIPEDESV2 Database](https://github.com/josephines1/o-present/blob/main/public/assets/img/readme/db_opresent.png "SIPEDESV2")

## Tech

Teknologi dalam aplikasi ini:

- [CodeIgniter 4](https://www.codeigniter.com/) - a flexible application development framework.
- [Myth/Auth](https://github.com/lonnieezell/myth-auth) - a flexible, Powerful, Secure auth package for CodeIgniter 4.
- [Tabler.io](https://tabler.io/) - a free and open source web application UI kit based on Bootstrap 5.
- [jQuery](https://jquery.com/) - a fast, small, and feature-rich JavaScript library.
- [WebcamJS](https://pixlcore.com/read/WebcamJS) - a small standalone JavaScript library for capturing still images
- [Leaflet](https://leafletjs.com/) - a JavaScript library used to build web mapping applications.

## Tips & Troubleshooting

Jika Anda mendapat pesan error saat menjalankan source code O-Present, silahkan melihat solusi-solusi di bawah ini.

1. **Mengatasi Error "Only secure origins are allowed"**
   Jika Anda ingin mencoba mengakses web O-Present di device yang berbeda dengan device server menggunakan IP Address dan Port, kemungkinan akan mengalami error ini karena masalah izin akses lokasi menggunakan HTTP. Anda bisa menggunakan ngrok untuk membuat tunneling ke HTTPS.

   **Solusi:** Jalankan `ngrok http [port]` untuk mengakses aplikasi Anda melalui HTTPS.

2. **Mengatasi Error "Origin Does Not Have Permission to use Geolocation Service" pada iOS**
   Pengguna iOS mungkin mengalami bug di mana mereka tidak bisa menggunakan layanan geolocation dan menerima pesan error "Origin Does Not Have Permission to use Geolocation Service" saat mencoba melakukan absen.

   **Solusi:** Untuk mengatasi masalah ini, tambahkan header berikut pada konfigurasi web server NGINX:

   ```nginx
   add_header Content-Security-Policy "upgrade-insecure-requests";
   ```

## Credits

> Made by [Josephine](https://josephines1.github.io/).
> Modify by [alamahul](https://alamahul.github.io).
> Template by [tabler.io](tabler.io)

# Credit buat pembuat

Terima kasih kepada [Josephine](https://josephines1.github.io/) yang telah membuat aplikasi ini dan telah memberikan akses open source untuk kami untuk modifikasi.
