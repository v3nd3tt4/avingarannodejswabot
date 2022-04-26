-- Adminer 4.8.1 MySQL 5.5.5-10.4.21-MariaDB dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP DATABASE IF EXISTS `db_avira`;
CREATE DATABASE `db_avira` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `db_avira`;

DROP TABLE IF EXISTS `registrasi`;
CREATE TABLE `registrasi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nohp` varchar(255) DEFAULT NULL,
  `email` varchar(155) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `tb_bantuan`;
CREATE TABLE `tb_bantuan` (
  `id_bantuan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_bantuan` text NOT NULL,
  `jawaban` text NOT NULL,
  `id_menu_utama` int(11) NOT NULL,
  `link_bantuan` varchar(255) NOT NULL,
  `id_user` int(11) DEFAULT 1,
  `tgl_input` datetime DEFAULT NULL,
  `status` enum('aktif','hapus','edit') DEFAULT NULL,
  `tampilkan` enum('ya','tidak') DEFAULT NULL,
  PRIMARY KEY (`id_bantuan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `tb_bantuan` (`id_bantuan`, `nama_bantuan`, `jawaban`, `id_menu_utama`, `link_bantuan`, `id_user`, `tgl_input`, `status`, `tampilkan`) VALUES
(1,	'Apa saja syarat pelimpahan berkas perkara pidana (dewasa/anak)?',	'- Tanda terima Pelimpahan (P-33)\r\n- Tanda terima Barang Bukti (P-34)*\r\n- Surat Penunjukan JPU (P-16A)\r\n- Surat Dakwaan (P-29)\r\n- Soft File Dakwaan\r\n- Berkas Perkara dari Penyidik\r\n\r\n*Barang bukti dititipkan di Kejaksaan Negeri Rantau',	3,	'/20210225052714',	1,	'2021-02-25 05:27:14',	'aktif',	NULL),
(2,	'Apakah itu aplikasi E-Court? Siapa saja yang bisa menggunakan E-Court? Bagaimana cara Berperkara melalui E-Court?',	'1. e-Court adalah layanan bagi Pengguna Terdaftar untuk Pendaftaran Perkara Secara Online, Mendapatkan Taksiran Panjar Biaya Perkara secara online, Pembayaran secara online dan Pemanggilan yang dilakukan dengan saluran elektronik.\r\n* Dasar Hukum E-Court di Pengadilan :\r\nBerdasarkan Peraturan Mahkamah Agung Republik Indonesia Nomor 3 Tahun 2018 Tentang Adminitrasi Perkara di Pengadilan Secara Elektronik  maka Mahkamah Agung meluncurkan  Aplikasi e-court.\r\n\r\n2. Apa inti layanan dari E-Court?\r\ne-court adalah layanan bagi Pengguna Terdaftar untuk Pendaftaran Perkara Secara Online, Mendapatkan Taksiran Panjar Biaya Perkara secara online, Pembayaran secara online dan Pemanggilan yang dilakukan dengan saluran elektronik. Semua dilakukan melalui sarana elektronik dan jaringan internet.\r\n* Apa saja fitur dari layanan E-Court?\r\nBeberapa layanan untuk pencari keadilan :\r\n• e-Filing (Pendaftaran Perkara Online di Pengadilan)\r\n• e-Payment (Pembayaran Panjar Biaya Perkara Online)\r\n• e-Summons (Pemanggilan Pihak secara online)\r\n• e-Litigation (Persidangan secara online)\r\nJika dahulu layanan ini terbatas pada pengguna dari Kalangan Advokat, kini pengguna umum bisa ikut menggunakan layanan ECourt.\r\n\r\n3. Apakah yang dimaksud dengan e-Filing?\r\ne-Filing adalah Pendaftaran Perkara, dimana Pendaftaran perkara online dilakukan setelah terdaftar sebagai pengguna terdaftar dengan memilih Pengadilan Negeri, Pengadilan Agama, atau Pengadilan TUN yang sudah aktif melakukan pelayanan e-Court. Semua berkas pendaftaran dikirim secara elektronik melalui aplikasi e-Court Makamah Agung RI.\r\n\r\n4. Apa yang dimaksud dengan e-SKUM?\r\ne-Skum adalah Taksiran Biaya Panjar Perkara. Dengan melakukan pendaftaran perkara online melalui e-Court, Pendaftar akan secara otomatis mendapatkan Taksiran Panjar Biaya (e-SKUM) dan Nomor Pembayaran (Virtual Account) yang dapat dibayarkan melalui saluran elektronik (Multi Channel) yang tersedia.\r\n\r\n5. Apakah fungsi dari e-Payment?\r\nUntuk kelancaran dalam mendukung program e-Court Mahkamah Agung RI bekerja sama dengan Bank Pemerintah dalam hal manajemen Pembayaran Biaya Panjar Perkara . Dalam Hal ini Bank yang telah ditunjuk menyediakan Virtual Account (Nomor Pembayaran) sebagai sarana pembayaran kepada Pengadilan tempat mendaftar perkara. Sehingga meminimalisir bertambahnya biaya siluman di luar biaya resmi yang ditetapkan negara.\r\n\r\n6. Lalu apa yang dimaksud dengan e-Summons?\r\ne-Summons adalah sistem pemanggilan perkara untuk Sidang, Mediasi , atau hal lain yang berkaitan dengan perkara yang berjalan, dengan menggunakan media email serta melihat langsung dari dalam aplikasi E-Court. Maka Panggilan bisa dilakukan dimanapun, kapanpun, tidak dibatasi waktu, selama terdapat jaringan internet.\r\n\r\n7. Siapa saja yang boleh menggunakan layanan e-Court?\r\nSemua orang bisa menggunakan layanan e-Court!\r\nSemua pencari keadilan yang akan mendaftarkan perkara Perdata (Permohonan / Gugatan) bisa mendaftar, dan memanfaatkan layanan ini selama anda memiliki akses kepada jaringan internet dan email.\r\nSistem ini dibuat agar terdapat transparansi, serta kemudahan bagi pihak yang tengah berperkara di Pengadilan Negeri, Agama, dan TUN.\r\n\r\n8. Bagaimana cara mendaftar di aplikasi E-Court?\r\nPencari Keadilan yang ingin mendaftar E-Court Bisa langsung membuka tautan berikut : https://ecourt.mahkamahagung.go.id/Register\r\nDengan mengisi kolom yang telah disediakan di laman tersebut.\r\nBagi yang membutuhkan bantuan petugas, silahkan datang langsung ke pojok e-Court di Pengadilan Negeri Rantau Kelas II, atau Pengadilan yang terdapat di domisili anda di wilayah hukum Republik Indonesia.\r\nInfo lebih lanjut bisa mengakses lama ini https://ecourt.mahkamahagung.go.id/',	4,	'/20210225052926',	7,	'2021-03-02 07:48:27',	'edit',	NULL),
(3,	'Apakah Persyaratan Permohonan',	'-. surat permohonan pemohon',	4,	'/20210226085724',	7,	'2021-02-26 08:57:59',	'hapus',	NULL),
(4,	'Apa saja syarat Pendaftaran Perkara Gugatan?',	'1. Surat Gugatan Asli (Bermaterai 10.000)\r\n2. Surat Kuasa Asli (Bermaterai 10.000) (Bagi yang menggunakan Kuasa)\r\n3. AD/ART Perseroan (Bagi yang menggunakan Kuasa)\r\n4. Foto Copy KTP Penggugat (Kuasa)\r\n5. CD Gugatan (Soft Copy Gugatan)',	4,	'/20210226101122',	7,	'2021-02-26 10:27:04',	'edit',	NULL),
(5,	'Apa saja syarat Pendaftaran Perkara Gugatan Sederhana?',	'1. Surat Gugatan Asli (Bermaterai 10.000)\r\n2. Surat Kuasa Asli (Bermaterai 10.000)(Bagi yang menggunakan Kuasa)\r\n3. Fotocopy KTP Penggugat (Kuasa)\r\n4. CD Gugatan (Soft Copy Gugatan)',	4,	'/20210226103744',	7,	'2021-02-26 10:37:44',	'aktif',	NULL),
(6,	'Apa saja syarat Pendaftaran Perkara Gugatan Perceraian (Khusus Non Muslim)?',	'1. Surat Gugatan Asli (Bermaterai 10.000) \r\n2. Fotocopy KTP (dilegalisir di Kantor Pos)\r\n3. Fotocopy Akta Nikah (dilegalisir di Kantor Pos)\r\n4. Fotocopy Kartu Keluarga/KK (dilegalisir di Kantor Pos)\r\n5. Fotocopy Akta Lahir Anak (apabila sudah mempunyai anak) (dilegalisir di Kantor Pos)\r\n6. CD Gugatan (Soft Copy Gugatan)',	4,	'/20210226104526',	7,	'2021-02-26 10:45:26',	'aktif',	NULL),
(7,	'Apa saja syarat pelimpahan berkas perkara pidana cepat (Tipiring/Tilang)?',	'- Berkas Perkara \r\n- Soft file \r\n- Barang Bukti \r\n',	3,	'/20210301031912',	8,	'2021-03-01 03:19:12',	'aktif',	NULL),
(8,	'Apa saja syarat untuk mengajukan permohonan praperadilan?',	'- Soft file petitum permohonan',	3,	'/20210301031948',	8,	'2021-03-01 03:19:48',	'aktif',	NULL),
(9,	'Apa saja syarat untuk mengajukan permintaan diversi?',	'- Surat Permohonan Diversi   \r\n- Surat Keputusan Diversi   \r\n- Berita Acara Diversi   \r\n- Surat Kesepakatan Diversi   \r\n- Laporan Polisi / Resume Perkara   ',	3,	'/20210301032013',	8,	'2021-03-01 03:20:13',	'aktif',	NULL),
(10,	'Apa saja syarat untuk mengajukan permintaan penggeledahan?',	'- Surat Permohonan dari Penyidik        \r\n- Laporan Polisi        \r\n- Surat Perintah Penyidikan        \r\n- Surat Pemberitahuan dimulainya Penyidikan kepada Kepala Kejaksaan Negeri        \r\n- Surat Perintah Penggeledahan        \r\n- Berita Acara Penggeledahan*  \r\n \r\nKeterangan :     \r\n*Untuk Permintaan Izin Penggeledahan tidak diperlukan        \r\n',	3,	'/20210301032103',	8,	'2021-03-01 03:22:30',	'edit',	NULL),
(11,	'Apa saja syarat untuk mengajukan permintaan penyitaan?',	'- Soft File Permohonan        \r\n- Surat Permohonan dari Penyidik        \r\n- Laporan Polisi        \r\n- Surat Perintah Penyidikan        \r\n- Surat Pemberitahuan dimulainya Penyidikan kepada Kepala Kejaksaan Negeri        \r\n- Surat Perintah Penyitaan        \r\n- Berita Acara Penyitaan*        \r\n- Surat Tanda Penerimaan dari yang menguasai barang kepada Penyidik        \r\n- Berita Acara Penimbangan Barang Bukti** \r\n\r\nKeterangan :       \r\n*   Untuk Permintaan Izin Penyitaan tidak diperlukan        \r\n** Untuk Perkara Narkotika        \r\n',	3,	'/20210301032213',	8,	'2021-03-01 03:22:13',	'aktif',	NULL),
(12,	'Apa saja syarat untuk mengajukan perpanjangan penahanan dari Penyidik dan Penuntut Umum yang ke-I?',	'- Surat Permohonan dari Penyidik        \r\n- Laporan Polisi        \r\n- Resume hasil pemeriksaan dari Penyidik        \r\n- Surat Perintah Penyidikan        \r\n- Surat Pemberitahuan dimulainya Penyidikan kepada Kepala Kejaksaan Negeri        \r\n- Surat Perintah Penahanan dari Penyidik        \r\n- Berita Acara Penahanan        \r\n- Surat Perpanjangan Penahanan dari Kepala Kejaksaan Negeri        \r\n',	3,	'/20210301032315',	8,	'2021-03-01 03:23:15',	'aktif',	NULL),
(13,	'Apa saja syarat untuk mengajukan perpanjangan penahanan dari Penyidik dan Penuntut Umum yang ke-II?',	'- Surat Permohonan dari Penyidik            \r\n- Laporan Polisi            \r\n- Resume hasil pemeriksaan dari Penyidik            \r\n- Surat Perintah Penyidikan            \r\n- Surat Pemberitahuan dimulainya Penyidikan kepada Kepala Kejaksaan Negeri            \r\n- Surat Perintah Penahanan dari Penyidik            \r\n- Berita Acara Penahanan            \r\n- Surat Perpanjangan Penahanan dari Kepala Kejaksaan Negeri            \r\n- Surat Perintah Penahanan/Pengalihan Jenis Penahanan (tingkat penuntutan) dari Kepala Kejaksaan Negeri (T-7)*            \r\n- Surat Penetapan Perpanjangan Penahanan dari Ketua Pengadilan Negeri ke-I \r\n\r\nKeterangan :           \r\n*Apabila permintaan dari Penuntut Umum            \r\n',	3,	'/20210301032435',	8,	'2021-03-01 03:24:35',	'aktif',	NULL),
(14,	'Apa saja syarat untuk mengajukan perpanjangan penahanan dari Penuntut Umum',	'- Surat Permohonan dari Kepala Kejaksaan           \r\n- Laporan Polisi           \r\n- Resume hasil pemeriksaan dari Penyidik           \r\n- Surat Perintah Penyidikan           \r\n- Surat Perintah Penahanan dari Penyidik           \r\n- Berita Acara Penahanan           \r\n- Surat Perintah Penahanan / Pengalihan Jenis Penahanan (tingkat penuntutan) dari Kepala Kejaksaan Negeri (T-7)           \r\n',	3,	'/20210301032542',	8,	'2021-03-01 03:25:42',	'aktif',	NULL),
(15,	'Apa saja syarat untuk mengajukan permohonan izin besuk dan menyerahkan pemberian izin besuk?',	'- Fotokopi KTP          \r\n- Mengisi blanko permohonan izin besuk yang dapat diminta di PTSP Pengadilan Negeri Rantau          \r\n',	3,	'/20210301032614',	8,	'2021-03-01 03:26:14',	'aktif',	NULL),
(16,	'Bagaimana cara mengajukan permohonan upaya hukum?',	'- Surat Kuasa Khusus perlawanan/banding/kasasi/peninjauan kembali/grasi*                 \r\n- Mendatangi meja pidana di PTSP Pengadilan Negeri Rantau untuk menginformasikan adanya upaya hukum perlawanan/banding/kasasi/peninjauan kembali/grasi \r\n\r\nCatatan :                \r\n*Apabila Terdakwa diwakili Penasehat Hukumnya                 \r\n',	3,	'/20210301032702',	8,	'2021-03-01 03:27:02',	'aktif',	NULL),
(17,	'Bagaimana cara mengajukan pencabutan upaya hukum?',	'- Surat Kuasa Khusus perlawanan/banding/kasasi/peninjauan kembali/grasi*                 \r\n- Mendatangi meja pidana di PTSP Pengadilan Negeri Rantau untuk menginformasikan pencabutan upaya hukum perlawanan/banding/kasasi/peninjauan kembali/grasi \r\n\r\nCatatan :               \r\n*Apabila Terdakwa diwakili Penasehat Hukumnya                 \r\n',	3,	'/20210301032743',	8,	'2021-03-01 03:27:43',	'aktif',	NULL),
(18,	'Apa syarat untuk mengajukan permohonan pembantaran?',	'- Surat Permohonan dari Penjamin\r\n- Surat Pernyataan Penjamin\r\n- Fotokopi KTP Penjamin\r\n- Fotokopi KK Penjamin\r\n- Surat Rujukan/Surat Keterangan dari RS\r\n- Surat Kuasa Khusus*\r\n\r\n*Jika diwakili Penasehat Hukum',	3,	'/20210301053428',	6,	'2021-03-01 05:35:20',	'edit',	NULL),
(19,	'Apa syarat untuk mengajukan permohonan izin berobat?',	'- Surat Permohonan\r\n- Surat Keterangan dari Rutan\r\n- Surat Kuasa Khusus*\r\n\r\n*Jika diwakili Penasehat Hukum',	3,	'/20210301053614',	6,	'2021-03-01 05:36:14',	'aktif',	NULL),
(20,	'Apa Syarat Membuat Surat Keterangan ?',	'   1. Fotocopy SKCK dilegalisir 1 (satu) lembar\r\n   2. Fotocopy KTP 1 (satu) lembar\r\n   3. Foto 4x6 sebanyak 3 (tiga) lembar (warna)\r\n   4. Surat Rekomendasi Asli dari Kecamatan\r\n   5. Surat pernyataan (Bermaterai) & Surat permohonanan diri (yang disediakan oleh Pengadilan)',	5,	'/20210301071905',	10,	'2021-03-01 07:19:05',	'aktif',	NULL),
(21,	'Apa syarat pendaftaran Surat Kuasa Khusus ?',	'1.  Fotocopy SK 4 (empat)  lembar \r\n2. Asli SK\r\n3. Fotocopy Kartu Advokat dan KTP\r\n4. BA / Pengambilan Sumpah Advokat\r\n',	5,	'/20210301072049',	10,	'2021-03-01 07:20:49',	'aktif',	NULL),
(22,	'Apa syarat pendaftaran Surat Kuasa Insedentil ?',	'1. surat kuasa yang menerangkan tentang memberikan kuasa\r\n2. Asli Surat Keterangan dari kepala desa bahwa menerangan ada hubungan keluarga \r\n3. Fotocopy KTP kedua belah pihak \r\n4. Fotokopy Kartu Keluarga\r\n',	5,	'/20210301072258',	10,	'2021-03-01 07:22:58',	'aktif',	NULL),
(23,	'Apa syarat Permohonan Permintaan Petikan Putusan/ Salinan Putusan untuk Keperluan Cerai di Pengadilan Agama ?',	'1. Mengisi Formulir atau Blanko dari Pengadilan\r\n2. Fotocopy KTP 1 (satu) lembar\r\n3. Fotocopy KK 1 (satu) lembar\r\n4. Fotocopy Buku Nikah 1 (satu) lembar\r\n',	5,	'/20210301072457',	10,	'2021-03-01 07:24:57',	'aktif',	NULL),
(24,	'Apa Syarat  Permintaan Petikan Putusan / Salinan Putusan Kelengkapan Berkas dari Penyidik ?',	'1. Mengisi Formulir atau Blanko dari Pengadilan\r\n2. Surat Pengantar \r\n3. Fotocopy KTP 1 (satu) lembar\r\n4. Fotocopy Kartu Anggota  1 (satu) lembar\r\n',	5,	'/20210301072640',	10,	'2021-03-01 07:26:40',	'aktif',	NULL),
(25,	'Apa Syarat untuk Legalisasi Surat Akta Di bawah Tangan (Waarmeking) ?',	'1. Surat Pernyataan Ahli Waris Dengan Materai 10.000\r\n2. Surat Keterangan kematian Dari Desa /Kelurahan\r\n3. Surat Keterangan kematian dari Rumah Sakit\r\n4. Surat Keterangan Ahli waris dari Desa / Kelurahan\r\n5. Fotocopy KTP Pewaris dan Ahli waris\r\n6. Fotocopy kartu Keluarga (Lampiran Asli)\r\n7. Fotocopy Akta Kelahiran (Lampiran Asli)\r\n8. Fotocopy Halaman Depan dan saldo Trakhir Buku rekening Tabungan (lampiran Asli)\r\n',	5,	'/20210301072846',	10,	'2021-03-01 07:28:46',	'aktif',	NULL),
(26,	'Apa Saja Persyaratan Mengajukan Permohonan Perubahan Nama/Akta',	'1. KTP\r\n2. Katu Keluarga / KK\r\n3. Akta Kelahiran\r\n4. Akta Nikah atau Perkawinan\r\n5. Ijazah\r\n6. Surat Keterangan dari Kelurahan / Catatan Sipil\r\n7. Surat Permohonan\r\n\r\n   NB :\r\n- No. 1 sd 6 Masing-masing difotocopy 1X dan di Leges di Kantor Pos.\r\n- Surat Permohonan di Print ditanda tangani diatas materai 10.000 dan \r\nFile tanpa tanda tangan dimasukan dalam CD Format Ms. Word (bukan discan)\r\n\r\n*Jika Pendaftaran Online melalui Aplikasi E-Court :\r\n- Dokumen Elektronik berbentuk File Pdf ditambah file rtf (No. 7)\r\n- Nomor Rekening Bank\r\n- Alamat Email dan Nomor Handphone atau Telepon\r\n\r\nInfo lebih lanjut bisa mengakses lama ini https://ecourt.mahkamahagung.go.id/',	4,	'/20210302020359',	7,	'2021-03-02 05:30:19',	'edit',	NULL),
(27,	'Apa Saja Persyaratan Mengajukan Permohonan Ganti Nama',	'1. KTP\r\n2. Katu Keluarga/KK\r\n3. Akta Kelahiran\r\n4. SK BRI (Kewarganegaraan)\r\n5. Surat Ganti Nama\r\n6. Surat Permohonan\r\n\r\n   NB :\r\n-. (No. 1 s/d 5) Masing-masing difotocopy 1X dan di Leges di Kantor Pos.\r\n-. Surat Permohonan di Print ditanda tangani diatas materai 10.000 dan \r\nFile tanpa tanda tangan dimasukan dalam CD Format Ms. Word (bukan discan) \r\n\r\n* Jika Pendaftaran Online melalui Aplikasi E-Court :\r\n-. Dokumen Elektrinik berbentuk File Pdf (No. 1 s/d 6) ditambah File rtf (No. 6)\r\n-. Nomor Rekening Bank\r\n-. Alamat Email dan Nomor Handphone/Telepon\r\n\r\nInfo lebih lanjut bisa mengakses lama ini https://ecourt.mahkamahagung.go.id/',	4,	'/20210302022144',	7,	'2021-03-02 05:31:45',	'edit',	NULL),
(28,	'Apa Saja Persyaratan Mengajukan Permohonan Perwalian Anak dibawah Umur/Ijin Jual Beli/Menjaminkan Harta',	'1. Akta/Surat Kematian\r\n2. Surat Kuasa dan Persetujuan dari Ahli Waris\r\n3. Akta Kelahiran Anak\r\n4. Akta Nikah/Perkawinan\r\n5. KTP + KK Pemilik Harta dan Ahli Waris\r\n6. Surat Pernyataan Ahli Waris\r\n7. Sertifikat Objek (Bukti Kepemilikan Objek)\r\n8. Surat Permohonan\r\n \r\nNB :\r\n-. (No. 1 s/d 7) Masing-masing difotocopy 1X dan di Leges di Kantor Pos\r\n-. Surat Permohonan di Print ditanda tangani diatas materai 10.000 dan \r\n    file tanpa tanda tangan dimasukan dalam CD Format Ms. Word (Bukan discan)\r\n\r\n* Jika Pendaftaran Online melalui Aplikasi E-Court :\r\n-. Dokumen Elektronik berbentuk file Pdf (No. 1 s/d 8) ditambah file rtf (No. 8)\r\n-. Nomor Rekening Bank\r\n-. Alamat Email dan Nomor Handphone/Telepon\r\n\r\nInfo lebih lanjut bisa mengakses lama ini https://ecourt.mahkamahagung.go.id/\r\n',	4,	'/20210302035815',	7,	'2021-03-02 05:32:12',	'edit',	NULL),
(29,	'Apa Saja Persyaratan Mengajukan Permohonan Pengampuan?',	'1. KTP Pengampu\r\n2. KK Pengampu\r\n3. Akta Kelahiran\r\n4. Akta Nikah/Perkawinan\r\n5. Surat Keterangan Dokter Pemerintah\r\n6. Surat Persetujuan dari Ahli Waris\r\n7. Sertifikat (Objek Kepemilikan)\r\n8. Surat Permohonan\r\n\r\nNB :\r\n-. (No. 1 s/d 7) Masing-masing difotocopy 1X dan di Leges di Kantor Pos\r\n-. Surat Permohonan di Print ditandatangani diatas materai 10.000 dan file tanpa tanda tangan dimasukan dalam CD format Ms. Word ( Bukan discan)\r\n\r\n*Jika Pendaftaran Online melalui Aplikasi E-Court :\r\n-. Dokumen Elektronik Berbentuk File Pdf (No. 1 s/d 8) ditambah file rtf (No. 8)\r\n-. Nomor Rekening Bank\r\n-. Alamat Email dan Nomor Handphone/Telepon\r\n\r\nInfo lebih lanjut bisa mengakses lama ini https://ecourt.mahkamahagung.go.id/',	4,	'/20210302040947',	7,	'2021-03-02 05:47:48',	'edit',	NULL),
(30,	'Dimanakah alamat Pengadilan Negeri Rantau?',	'Alamat: Jalan Brigjend. H. Hasan Basry No. 38 Rantau Kelurahan Rantau Kiwa Kecamatan Tapin Utara Kabupaten Tapin Kalimantan Selatan - Indonesia Kode Pos 71111 \r\nFax : 0517-31045 \r\nTelpon : 0517-31009\r\n\r\nWeb : www.pn-rantau.go.id\r\nEmail Utama  :\r\npn.rantau@gmail.com\r\n\r\nEmail Delegasi Perdata  : \r\ndelegasi.pdt.pnrantau@gmail.com \r\n\r\nEmail Kepaniteraan Pidana  : \r\npidana.pnrantau@gmail.com\r\n\r\nEmail Kepaniteraan Hukum  : \r\npnrantau.hukum@gmail.com \r\n\r\nAtau anda bisa melihat melalui Google Maps melalui tautan ini:\r\nhttps://goo.gl/maps/EcPkUkqkvS3GoSHt5',	1,	'/20210302050123',	1,	'2021-03-02 05:02:33',	'edit',	NULL),
(31,	'Jam kerja Pengadilan Negeri Rantau?',	'Senin-Kamis : 08:00 - 16.30 WITA \r\nJumát : 08:00 - 17.00 WITA',	1,	'/20210302050309',	1,	'2021-03-02 05:03:09',	'aktif',	NULL),
(32,	'Apa Saja Persyaratan Mengajukan Permohonan Pengangkatan Anak/Adopsi?',	'1. Surat Permohonan Pemohon\r\n2. Surat Penyerahan Anak \r\n3. Surat Keputusan dari Dinas Sosial tentang Pemberian izin Pengasuhan Anak\r\n4. Surat Keterangan dari Dinas Sosial\r\n5. Surat/Akta Kelahiran Pemohon dan Anak yang diangkat\r\n5. Surat Keterangan Kejiwaan Pemohon dari Rumah Sakit\r\n6. Surat Keterangan Nikah/Akte Nikah Pemohon\r\n7. Kartu Keluarga Pemohon dan Pihak yang menyerahkan Anak\r\n8. KTP Pemohon\r\n9. KTP yang menyerahkan Anak\r\n10. KTP Saksi Penyerahan anak\r\n11. SKCK Pemohon\r\n12. Surat Keterangan tidak Pernah dipidana \r\n13. Slip Gaji Pemohon\r\n\r\nNB :\r\n-. (No. 2 s/d 10) Masing-masing difotocopy 1X dan di Leges di Kantor Pos\r\n-. Surat Permohonan di Print ditandatangani diatas materai 10.000 dan file tanpa tanda tangan dimasukan dalam CD format Ms. Word ( Bukan discan)\r\n\r\n*Jika Pendaftaran Online melalui Aplikasi E-Court :\r\n-. Dokumen Elektronik Berbentuk File Pdf (No. 1 s/d 13) ditambah file rtf (No. 1)\r\n-. Nomor Rekening Bank\r\n-. Alamat Email dan Nomor Handphone/Telepon\r\n\r\nInfo lebih lanjut bisa mengakses lama ini https://ecourt.mahkamahagung.go.id/',	4,	'/20210302060447',	7,	'2021-03-02 06:37:11',	'edit',	NULL),
(33,	'Apa Saja Persyaratan Mengajukan Permohonan Penetapan Kematian?',	'1. KTP + KK Ahli Waris\r\n2. Akta Nikah/Akta Perkawinan Almarhum\r\n3. Surat Pelaporan Kematian dari Kelurahan\r\n4. Surat Penolakan Dinas Kependudukan dan Catatan Sipil\r\n5. Akta Kelahiran Pemohon\r\n6. Surat Permohonan Pemohon\r\n\r\nNB :\r\n-. (No. 1 s/d 5) Masing-masing difotocopy 1X dan di Leges di Kantor Pos\r\n-. Surat Permohonan di Print ditandatangani diatas materai 10.000 dan file tanpa tanda tangan dimasukan dalam CD format Ms. Word ( Bukan discan)\r\n\r\n*Jika Pendaftaran Online melalui Aplikasi E-Court :\r\n-. Dokumen Elektronik Berbentuk File Pdf (No. 1 s/d 6) ditambah file rtf (No. 6)\r\n-. Nomor Rekening Bank\r\n-. Alamat Email dan Nomor Handphone/Telepon\r\n\r\nInfo lebih lanjut bisa mengakses lama ini https://ecourt.mahkamahagung.go.id/',	4,	'/20210302063639',	7,	'2021-03-02 06:36:39',	'aktif',	NULL),
(34,	'Apa Saja Persyaratan Mengajukan Permohonan Perwalian TNI?',	'1. Akta Kelahiran\r\n2. Surat Keterangan Perwalian dari Kelurahan \r\n3. KTP Anak\r\n4. KTP + KK + Akta Nikah Orang Tua Kandung\r\n5. KTP + KK + Akta Nikah Orang Tua Wali\r\n6. Surat Permohonan\r\n\r\nNB :\r\n-. (No. 1 s/d 5) Masing-masing difotocopy 1X dan di Leges di Kantor Pos\r\n-. Surat Permohonan di Print ditandatangani diatas materai 10.000 dan file tanpa tanda tangan dimasukan dalam CD format Ms. Word ( Bukan discan)\r\n\r\n*Jika Pendaftaran Online melalui Aplikasi E-Court :\r\n-. Dokumen Elektronik Berbentuk File Pdf (No. 1 s/d 6) ditambah file rtf (No. 6)\r\n-. Nomor Rekening Bank\r\n-. Alamat Email dan Nomor Handphone/Telepon\r\n\r\nInfo lebih lanjut bisa mengakses lama ini https://ecourt.mahkamahagung.go.id/',	4,	'/20210302064426',	7,	'2021-03-02 06:45:26',	'edit',	NULL),
(35,	'Apa Saja Syarat Pendaftaran Permohonan Banding?',	'1. Batas waktu permohonan Banding 14 (empat belas) hari sejak dibacakan Putusan (jika pihak hadir sewaktu Sidang pembacaan Putusan)\r\n2. Batas waktu permohonan Banding 14 (empat belas) hari sejak Relaas Pemberitahuan Putusan (jika pihak tidak hadir sewaktu Sidang pembacaan Putusan)\r\n3. Surat Kuasa yang sudah terdaftar di bagian hukum (jika menggunakan Kuasa Hukum)\r\n4. Memori Bandingdan file dimasukan dalam CD format Ms. Word atau rtf (Memori Banding tidak wajib)\r\n5. Alamat Email dan No. Telepon Pemohon atau Kuasa Hukum Pemohon\r\n6. Membayar biaya panjar Banding',	4,	'/20210302080429',	7,	'2021-03-02 08:04:29',	'aktif',	NULL),
(36,	'Apa saja syarat Pendaftaran Permohonan Kasasi?',	'1. Batas waktu permohonan Kasasi 14 (empat belas)  hari sejak Relaas Pemberitahuan Putusan Banding \r\n2. Surat Kuasa yang sudah terdaftar di bagian hukum (jika menggunakan Kuasa Hukum)\r\n3. Memori Kasasi dan file dimasukan dalam CD format Ms. Word atau rtf (Maksimal 14 hari sejak pernyataan/pengajuan permohonan Kasasi)\r\n4. Alamat Email dan No. Telepon Pemohon atau Kuasa Hukum Pemohon\r\n5. Membayar biaya panjar Kasasi',	4,	'/20210302082024',	7,	'2021-03-02 08:20:24',	'aktif',	NULL),
(37,	'Apa saja Persyaratan Pendaftaran Permohonan Peninjauan Kembali (PK)?',	'A). BERDASARKAN KEKHILAFAN HAKIM :\r\n1. Batas waktu Permohonan PK 180 (seratus delapan puluh) hari sejak Relaas Pemberitahuan Putusan Kasasi\r\n2. Putusan Pengadilan Negeri, Putusan Banding, Putusan Kasasi dilegalisir (cap stempel basah PN) dan di leges di kantor Pos\r\n3. Surat Kuasa yang sudah terdaftar di bagian Hukum (jika menggunakan Kuasa Hukum)\r\n4. Memori PK dan file dimasukan dalam CD format Ms. Word atau rtf (diserahkan bersamaan dengan Pernyataan/Pengajuan Permohonan PK)\r\n5. Alamat email dan no. Telepon Pemohon atau Kuasa Hukum Pemohon\r\n6. Membayar biaya Panjar Peninjauan Kembali (PK)\r\n\r\nB). BERDASARKAN BUKTI BARU (Novum)\r\n1. Batas waktu Permohonan PK 180 (seratus delapan puluh) hari sejak Relaas Pemberitahuan Putusan Kasasi\r\n2. Bukti baru dilegalisir dan di leges di Kantor Pos\r\n3. Putusan Pengadilan Negeri, Putusan Banding, Putusan Kasasi dilegalisir (cap stempel basah PN) dan di leges di kantor Pos\r\n4. Fotocopy  KTP dan No. Telepon yang menemukan bukti baru (untuk disumpah)\r\n5. Memori PK dan file dimasukan dalam CD format Ms. Word atau rtf (diserahkan bersamaan dengan Pernyataan/Pengajuan Permohonan PK)\r\n6. Surat Kuasa yang sudah terdaftar di bagian Hukum (jika menggunakan Kuasa Hukum)\r\n7. Alamat email dan no. Telepon Pemohon atau Kuasa Hukum Pemohon',	4,	'/20210302083557',	7,	'2021-03-02 09:09:22',	'edit',	NULL),
(38,	'Apakah Persyaratan Permohonan Pendaftaran Konsinyasi?',	'1. Surat permohonan Konsinyasi.\r\n\r\n2. Melampirkan dokumen awal :\r\n-. Fotocopy identitas Pemohon dan Termohon\r\n-. Surat Kuasa yang sudah didaftarkan di kepaniteraan Hukum.\r\n-. Surat tugas dari instansi terkait.\r\n-. Berita acara hasil Musyawarah Penetapan Ganti Kerugian\r\n-. Fotocopy surat penolakan Termohon atas bentuk dan/atau besar Ganti Kerugian berdasarkanMusyawarah Penetapan Ganti Kerugian.\r\n-. Surat keputusan Gubernur, bupati/ walikota tentang penetapan lokasi pembangunan\r\n-. Fotocopy surat dari aprisal perihal nilai ganti rugi\r\n-. Fotocopy bukti bahwa termohon sebagai pihak yang berhak atas objek pengadaan tanah.\r\n\r\n3. Setelah ditelaah dan dipelajari oleh Panitera Muda Perdata dan Panitera selanjutnya dinyatakan dapat diterima pemohon membayar biaya perkara yang telah dihitung oleh kasir\r\n',	4,	'/20210302162838',	7,	'2021-03-02 16:28:38',	'aktif',	NULL),
(39,	'Apa saja syarat Pendaftaran Eksekusi?',	'A). PERMOHONAN EKSEKUSI BERDASRKAN PUTUSAN\r\n1. Fotocopy Salinan Putusan Resmi yang telah BHT dan dilegalisir (cap stempel basah PN)\r\n2. Relaas Pemberitahuan Putusan kepada Pihak Pemohon\r\n3. Surat Pernyataan dari Pemohon bahwa obyek Eksekusi tidak terkait dengan Perkara lain (misalnya Perkara TUN, Pidana dan Tipikor)\r\n4. Surat-surat lain yang dipandang perlu (misalnya fotocopy Sertifikat, dll)\r\n5. Surat Permohonan berisi : \r\n-. Identitas Pemohon Eksekusi (sesuai KTP)\r\n-. Identitas Termohon Eksekusi (nama, tempat tanggal lahir, agama, alamat, pekerjaan, status kawin, pendidikan)\r\n-. Uraian singkat duduk perkara dan alasan pemohon\r\n-. Obyek Perkara\r\n6. File surat Permohonan dimasukan dalam CD format Ms. Word\r\n\r\nB). PERMOHONAN EKSEKUSI BERDASARKAN HAK TANGGUNGAN (HT)\r\n1. Akta Hak Tanggungan\r\n2. Sertifikat Hak Tanggungan\r\n3. Jaminan fidusia \r\n4. Perjanjian Kredit/Pembayaran utang dengan aset yang diambil oleh Kreditur\r\n5. Somasi 1, 2, 3\r\n6. Surat Pernyataan dari Kreditur selaku pemohon lelangyang isinya akan bertanggungjawab apabila terjadi gugatan perdata dan/atau tuntutan pidana dan ditambahkan klausul \"Pemohon Lelang bertanggungjawab penuh terhadap tuntutan, ganti rugi dan/atau dwangsom/uang paksa yang mungkin timbul dikemudian hari dan membebaskan KPKNL/Pejabat Lelang dari segala tuntutan pembayaran ganti rugi dan/atau dwangsom\"\r\n7. Surat Permohonan berisi : \r\n-. Identitas Pemohon Eksekusi (sesuai KTP)\r\n-. Identitas Termohon Eksekusi (nama, tempat tanggal lahir, agama, alamat, pekerjaan, status kawin, pendidikan)\r\n-. Uraian singkat duduk perkara dan alasan pemohon\r\n-. Obyek Perkara\r\n8. File surat Permohonan dimasukan dalam CD format Ms. Word\r\n\r\nC). PERMOHONAN EKSEKUSI HASIL LELANG\r\n1. Fotocopy Petikan Risalah Lelang\r\n2. Fotocopy Sertifikat Obyek\r\n3. Surat Permohonan berisi : \r\n-. Identitas Pemohon Eksekusi (sesuai KTP)\r\n-. Identitas Termohon Eksekusi (nama, tempat tanggal lahir, agama, alamat, pekerjaan, status kawin, pendidikan)\r\n-. Uraian singkat duduk perkara dan alasan pemohon\r\n-. Obyek Perkara\r\n4. File surat Permohonan dimasukan dalam CD format Ms. Word',	4,	'/20210302171617',	7,	'2021-03-02 17:16:17',	'aktif',	NULL),
(40,	'Apa saja syarat untuk mengambil turunan putusan?',	'*. Untuk Mendapatkan Salinan Putusan Yang Diterbitkan Oleh Pengadilan Negeri Rantau, Dapat Dilakukan Dengan Cara Mendatangi Meja Informasi PN Rantau dengan membawa :\r\na. 2 (Dua) Lembar Foto Kopi KK dan Foto Kopi KTP (Jika Pihak Tanpa Kuasa Hukum)\r\nb. 2 (Dua) Lembar Foto Kopi Surat Kuasa Yang Terdaftar (Jika Pihak Menggunakan Kuasa Hukum)\r\nc. 2 (Dua) Lembar Foto Kopi Relaas Pemberitahuan Banding / Kasasi (Jika Memohon Informasi Putusan Banding/Kasasi)\r\n\r\n*. Khusus untuk Perkara E-Court :\r\nSalinan Putusan (Yang Telah Ditandatangani Secara Elektronik) Dapat Diunduh Langsung Pada e-Court\r\n',	4,	'/20210302181636',	7,	'2021-03-02 18:16:36',	'aktif',	NULL),
(41,	'Hotel/Tempat Penginapan Apa saja yang dekat dengan Kantor Pengadilan Negeri Rantau Kelas II',	'1. Hotel Tapin\r\nAlamat Tempat : Rantau Kiwa, Tapin Utara, Kabupaten Tapin, Kalimantan Selatan 71152, Indonesia\r\n\r\n2. Hotel Tanpa Nama\r\nAlamat Tempat : Rantau Kiwa, Tapin Utara, Kabupaten Tapin, Kalimantan Selatan 71152, Indonesia\r\n\r\n3. Hotel Pasupati\r\nJl. Brigjend H. Hasan Basri, Rantau Kiwa, Tapin Utara, Kabupaten Tapin, Kalimantan Selatan 71152\r\n\r\n4. Hotel Sejahtera 1\r\nRantau Kiwa, Tapin Utara, Kabupaten Tapin, Kalimantan Selatan 71152\r\n\r\n5. Guest House “HH” Syariah\r\nAlamat Tempat : Kupang, Tapin Utara, Kabupaten Tapin, Kalimantan Selatan 71152, Indonesia\r\n\r\n6. Keraton Losmen\r\nAlamat Tempat : JL Kesuma Jaya, No. 10 RT 16 RW 4, Rantau Kanan, Tapin Utara, Bungur, Kabupaten Tapin, Kalimantan Selatan 71112, Indonesia\r\n',	1,	'/20210303023705',	11,	'2021-03-03 03:05:33',	'edit',	NULL),
(42,	'Apa syarat untuk membuat surat Tidak sedang dicabut hak pilihnya ?',	'1. Fotocopy SKCK dilegalisir 1 (satu) lembar\r\n2.  Fotocopy KTP 1 (satu) lembar\r\n3.  Foto 4x6 sebanyak 3 (tiga) lembar (warna)\r\n4. Surat Rekomendasi Asli dari Kecamatan\r\n5. Surat pernyataan (Bermaterai) & Surat permohonanan diri (yang disediakan oleh Pengadilan)\r\n',	5,	'/20210303050308',	10,	'2021-03-03 05:03:08',	'aktif',	NULL),
(43,	'Bagaimana syarat untuk membuat surat tidak Dipidana karena kealpaan ringan atau alasan politik ?',	'   1. Fotocopy SKCK dilegalisir 1 (satu) lembar\r\n   2. Fotocopy KTP 1 (satu) lembar\r\n   3. Foto 4x6 sebanyak 3 (tiga) lembar (warna)\r\n   4.  Surat Rekomendasi Asli dari Kecamatan\r\n   5. Surat pernyataan (Bermaterai) & Surat permohonanan diri (yang disediakan oleh Pengadilan)\r\n\r\n',	5,	'/20210303050539',	10,	'2021-03-03 05:05:39',	'aktif',	NULL),
(44,	'Apa Syarat untuk Legalisasi Surat Akta Di bawah Tangan (Waarmeking) ?',	'- surat pernyataan dari ahli waris di tandatangani dengan materai 10.000\r\n- surat keterangan kematian dari kelurahan / desa\r\n- surat keterangan kematian dari rumah sakit\r\n- surat surat keahli warisan\r\n- fotocopy ktp ahli wari dan pewaris\r\n- fotocopy kartu keluarga\r\n- fotocopy akta kelahiran\r\n- fotocopy buku nikah\r\n- fotocopy  buku tabunhgan halam depan dan terakhir',	5,	'/20210324081604',	10,	'2021-03-24 08:16:04',	'aktif',	NULL);

DROP TABLE IF EXISTS `tb_bantuan_new`;
CREATE TABLE `tb_bantuan_new` (
  `id_bantuan_new` int(11) NOT NULL AUTO_INCREMENT,
  `nama_bantuan` text DEFAULT NULL,
  `jawaban` text DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `tgl_create` datetime DEFAULT NULL,
  `has_child` enum('yes','no') DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_bantuan_new`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `tb_kla`;
CREATE TABLE `tb_kla` (
  `id_kla` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kla` text NOT NULL,
  `jawaban` text NOT NULL,
  `id_menu_utama` int(11) NOT NULL,
  `link_kla` varchar(255) NOT NULL,
  `id_user` int(11) DEFAULT 1,
  `tgl_input` datetime DEFAULT NULL,
  `status` enum('aktif','hapus','edit') DEFAULT NULL,
  PRIMARY KEY (`id_kla`),
  UNIQUE KEY `link_bantuan` (`link_kla`),
  KEY `id_menu_utama` (`id_menu_utama`),
  KEY `id_user_cont` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `tb_kla` (`id_kla`, `nama_kla`, `jawaban`, `id_menu_utama`, `link_kla`, `id_user`, `tgl_input`, `status`) VALUES
(1,	'TPM Kesekretariatan',	'https://mahkamahagung.go.id/media/8389',	1,	'/20210421153349',	1,	'2021-04-21 15:47:03',	'edit'),
(2,	'Youtube',	'https://www.youtube.com/watch?v=smbyY2WioCU',	1,	'/20210421153952',	1,	'2021-04-21 15:40:04',	'hapus');

DROP TABLE IF EXISTS `tb_login`;
CREATE TABLE `tb_login` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `level` enum('admin','operator') DEFAULT NULL,
  `privilleges` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `tb_login` (`id_user`, `username`, `password`, `nama`, `level`, `privilleges`) VALUES
(1,	'vendetta',	'123456',	'Okta Pilopa',	'admin',	'all'),
(5,	'afit',	'123456',	'afit',	'admin',	'all'),
(6,	'aldha',	'123456',	'aldha',	'operator',	'3'),
(7,	'amin',	'123456',	'amin',	'operator',	'4'),
(8,	'rahman',	'123456',	'rahman',	'operator',	'3'),
(9,	'redi',	'123456',	'redi',	'operator',	'5'),
(10,	'heni',	'123456',	'heni',	'operator',	'3'),
(11,	'nurdin',	'123456',	'nurdin',	'operator',	'1'),
(12,	'arief',	'123456',	'arief',	'admin',	'all'),
(13,	'eko',	'123456',	'eko',	'admin',	'all'),
(14,	'anisa',	'123456',	'anisa',	'admin',	'all');

DROP TABLE IF EXISTS `tb_menu_utama`;
CREATE TABLE `tb_menu_utama` (
  `id_menu_utama` int(11) NOT NULL AUTO_INCREMENT,
  `nama_menu_utama` text NOT NULL,
  `unique_link_menu_utama` varchar(255) NOT NULL,
  `keterangan_menu_utama` varchar(255) DEFAULT NULL,
  `jawaban_menu_utama` text DEFAULT NULL,
  `show` enum('ya','tidak') DEFAULT 'ya',
  PRIMARY KEY (`id_menu_utama`),
  UNIQUE KEY `unique_link` (`unique_link_menu_utama`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `tb_menu_utama` (`id_menu_utama`, `nama_menu_utama`, `unique_link_menu_utama`, `keterangan_menu_utama`, `jawaban_menu_utama`, `show`) VALUES
(1,	'Umum (meliputi alamat kami, jam pelayanan, akses menuju Pengadilan Negeri Rantau)',	'/pumum',	'umum',	'-',	'ya'),
(3,	'Pidana (meliputi info denda tilang, izin besuk/berobat, pinjam pakai barang bukti, penyitaan/penggeledahan/penahanan)',	'/ppidana',	'pidana',	'-',	'ya'),
(4,	'Perdata (meliputi permohonan, gugatan, eksekusi)',	'/pperdata',	'perdata',	'-',	'ya'),
(5,	'Hukum (meliputi surat keterangan, surat kuasa, legalisasi, salinan putusan / penetapan, info jadwal sidang)',	'/phukum',	'hukum',	'-',	'ya'),
(6,	'Jadwal sidang perkara',	'/jadwal_sidang',	'jadwal sidang',	'Jadwal sidang perkara pada Pengadilan Negeri Rantau dapat di lihat di link berikut ini:\r\nhttp://sipp.pn-rantau.go.id/list_jadwal_sidang',	'ya'),
(7,	'Untuk Berbicara Dengan Petugas PTSP Pengadilan Negeri Rantau',	'/berbicara',	'berbicara',	'Untuk berbicara dengan petugas PTSP Pengadilan Negeri Rantau silahkan klik link berikut ini:\r\nhttps://wa.link/9lsf70',	'ya');

DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nohp` varchar(255) DEFAULT NULL,
  `email` varchar(155) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `tb_wa_reply`;
CREATE TABLE `tb_wa_reply` (
  `id_wa_reply` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) DEFAULT NULL,
  `jawaban` text DEFAULT NULL,
  `judul` text DEFAULT NULL,
  PRIMARY KEY (`id_wa_reply`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `tb_wa_reply` (`id_wa_reply`, `keyword`, `jawaban`, `judul`) VALUES
(1,	'syarat',	'Persyaratan awal Mengajukan Permohonan Perubahan Nama/Akta Kelahiran:\r\n\r\n1. KTP\r\n2. Katu Keluarga / KK\r\n3. Akta Kelahiran\r\n4. Akta/Buku Nikah atau Perkawinan\r\n5. Ijazah\r\n6. Surat Pengantar Dinas Kependudukan dan Catatan Sipil\r\n7. Surat Permohonan\r\n\r\nNB :\r\n- No. 1 sd 6 Masing-masing difotocopy 1X dan di Leges di Kantor Pos.\r\n- Surat Permohonan di Print ditanda tangani diatas materai 10.000 dan\r\nFile tanpa tanda tangan dimasukan dalam CD Format Ms. Word (bukan discan)\r\n',	'Persyaratan Awal Mengajukan Permohonan Perubahan Nama/Akta Kelahiran'),
(2,	'biaya',	'Panjar Biaya Perkara Permohonan Perubahan Nama/Akta:\r\n\r\nRp. 110.000',	'Panjar Biaya Perkara Permohonan Perubahan Nama/Akta:\r\n'),
(3,	'jadwal',	'Jadwal sidang perkara pada Pengadilan Negeri Rantau dapat di lihat di link berikut ini:\r\nhttp://sipp.pn-rantau.go.id/list_jadwal_sidang',	'Jadwal sidang perkara'),
(4,	'tatacara',	'Untuk tatacara pendaftaran permohonan perubahan nama/akta dapat dilihat pada link berikut:',	'Tatacara pendaftaran perkara permohonan perubahan nama/akta');

DROP VIEW IF EXISTS `v_bantuan`;
CREATE TABLE `v_bantuan` (`nama_bantuan` text, `jawaban` text, `id_menu_utama` int(11), `keterangan_menu_utama` varchar(255), `unique_link_menu_utama` varchar(255), `id_panggilan` varchar(267));


DROP VIEW IF EXISTS `v_menu_utama`;
CREATE TABLE `v_menu_utama` (`id_menu_utama` int(11), `nama_menu_utama` text, `jawaban_menu_utama` text, `unique_link_menu_utama` varchar(255), `keterangan_menu_utama` varchar(255));


DROP TABLE IF EXISTS `v_bantuan`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_bantuan` AS select `b`.`nama_bantuan` AS `nama_bantuan`,`b`.`jawaban` AS `jawaban`,`mu`.`id_menu_utama` AS `id_menu_utama`,`mu`.`keterangan_menu_utama` AS `keterangan_menu_utama`,`mu`.`unique_link_menu_utama` AS `unique_link_menu_utama`,concat(lcase(`mu`.`keterangan_menu_utama`),'_',`b`.`id_bantuan`) AS `id_panggilan` from (`tb_bantuan` `b` left join `tb_menu_utama` `mu` on(`mu`.`id_menu_utama` = `b`.`id_menu_utama`)) where `b`.`status` <> 'hapus' order by `b`.`id_menu_utama`;

DROP TABLE IF EXISTS `v_menu_utama`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_menu_utama` AS select `tbmn`.`id_menu_utama` AS `id_menu_utama`,`tbmn`.`nama_menu_utama` AS `nama_menu_utama`,`tbmn`.`jawaban_menu_utama` AS `jawaban_menu_utama`,`tbmn`.`unique_link_menu_utama` AS `unique_link_menu_utama`,lcase(`tbmn`.`keterangan_menu_utama`) AS `keterangan_menu_utama` from `tb_menu_utama` `tbmn` where `tbmn`.`show` = 'ya';

-- 2022-04-26 05:06:46
