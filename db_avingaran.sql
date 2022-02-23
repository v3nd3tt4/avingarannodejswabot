/*
SQLyog Professional v12.5.1 (64 bit)
MySQL - 10.4.13-MariaDB : Database - db_avira
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_avira` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `db_avira`;

/*Table structure for table `registrasi` */

DROP TABLE IF EXISTS `registrasi`;

CREATE TABLE `registrasi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) DEFAULT NULL,
  `nama` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nohp` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(155) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `registrasi` */

/*Table structure for table `tb_bantuan` */

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_bantuan` */

insert  into `tb_bantuan`(`id_bantuan`,`nama_bantuan`,`jawaban`,`id_menu_utama`,`link_bantuan`,`id_user`,`tgl_input`,`status`,`tampilkan`) values 
(1,'Apa Saja Persyaratan Mengajukan Permohonan Pengangkatan Anak/Adopsi?','1. Surat Permohonan Pemohon\r\n2. Surat Penyerahan Anak\r\n3. Surat Keputusan dari Dinas Sosial tentang Pemberian izin Pengasuhan Anak\r\n4. Surat Keterangan dari Dinas Sosial\r\n5. Surat/Akta Kelahiran Pemohon dan Anak yang diangkat\r\n5. Surat Keterangan Kejiwaan Pemohon dari Rumah Sakit\r\n6. Surat Keterangan Nikah/Akte Nikah Pemohon\r\n7. Kartu Keluarga Pemohon dan Pihak yang menyerahkan Anak\r\n8. KTP Pemohon\r\n9. KTP yang menyerahkan Anak\r\n10. KTP Saksi Penyerahan anak\r\n11. SKCK Pemohon\r\n12. Surat Keterangan tidak Pernah dipidana\r\n13. Slip Gaji Pemohon\r\n14. KTP Saksi (dua orang)\r\n\r\nNB :\r\n-. (No. 2 s/d 10) Masing-masing difotocopy 1X dan di Leges di Kantor Pos\r\n-. Surat Permohonan di Print ditandatangani diatas materai 10.000 dan file tanpa tanda tangan dimasukan dalam CD format Ms. Word ( Bukan discan)\r\n\r\n*Jika Pendaftaran Online melalui Aplikasi E-Court :\r\n-. Dokumen Elektronik Berbentuk File Pdf (No. 1 s/d 13) ditambah file rtf (No. 1)\r\n-. Nomor Rekening Bank\r\n-. Alamat Email dan Nomor Handphone/Telepon\r\n\r\n*Syarat khusus:*\r\n- disclaimer: dimungkinkan ada penambahan bukti berdasarkan petunjuk hakim yang menangani perkara\r\n- 2 orang saksi yang mengetahui tentang yang dimohonkan',6,'/20210914040633',1,'2021-09-21 09:25:30','edit',NULL),
(2,'Apa Saja Persyaratan Mengajukan Permohonan Pengampuan?','1. KTP Pengampu\r\n2. KK Pengampu\r\n3. Akta Kelahiran\r\n4. Akta Nikah/Perkawinan\r\n5. Surat Keterangan Dokter Pemerintah\r\n6. Surat Persetujuan dari Ahli Waris\r\n7. Sertifikat (Objek Kepemilikan)\r\n8. Surat Permohonan\r\n9. KTP Saksi (dua orang)\r\n\r\nNB :\r\n-. (No. 1 s/d 7) Masing-masing difotocopy 1X dan di Leges di Kantor Pos\r\n-. Surat Permohonan di Print ditandatangani diatas materai 10.000 dan file tanpa tanda tangan dimasukan dalam CD format Ms. Word ( Bukan discan)\r\n\r\n*Jika Pendaftaran Online melalui Aplikasi E-Court :\r\n-. Dokumen Elektronik Berbentuk File Pdf (No. 1 s/d 8) ditambah file rtf (No. 8)\r\n-. Nomor Rekening Bank\r\n-. Alamat Email dan Nomor Handphone/Telepon\r\n\r\n*Syarat khusus:*\r\n- disclaimer: dimungkinkan ada penambahan bukti berdasarkan petunjuk hakim yang menangani perkara\r\n- 2 orang saksi yang mengetahui tentang yang dimohonkan\r\n',6,'/20210914041316',1,'2021-09-21 09:25:05','edit',NULL),
(3,'Apa Saja Persyaratan Mengajukan Permohonan Perwalian Anak dibawah Umur/Ijin Jual Beli/Menjaminkan Harta','1. Akta/Surat Kematian\r\n2. Surat Kuasa dan Persetujuan dari Ahli Waris\r\n3. Akta Kelahiran Anak\r\n4. Akta Nikah/Perkawinan\r\n5. KTP + KK Pemilik Harta dan Ahli Waris\r\n6. Surat Pernyataan Ahli Waris\r\n7. Sertifikat Objek (Bukti Kepemilikan Objek)\r\n8. Surat Permohonan\r\n9. KTP Saksi (dua orang)\r\n\r\nNB :\r\n-. (No. 1 s/d 7) Masing-masing difotocopy 1X dan di Leges di Kantor Pos\r\n-. Surat Permohonan di Print ditanda tangani diatas materai 10.000 dan\r\nfile tanpa tanda tangan dimasukan dalam CD Format Ms. Word (Bukan discan)\r\n\r\n* Jika Pendaftaran Online melalui Aplikasi E-Court :\r\n-. Dokumen Elektronik berbentuk file Pdf (No. 1 s/d 8) ditambah file rtf (No. 8)\r\n-. Nomor Rekening Bank\r\n-. Alamat Email dan Nomor Handphone/Telepon\r\n\r\n*Syarat khusus:*\r\n- disclaimer: dimungkinkan ada penambahan bukti berdasarkan petunjuk hakim yang menangani perkara\r\n- 2 orang saksi yang mengetahui tentang yang dimohonkan',6,'/20210914041452',1,'2021-09-21 09:24:44','edit',NULL),
(4,'Apa Saja Persyaratan Awal Mengajukan Permohonan Perubahan Nama/Akta','1. KTP\r\n2. Katu Keluarga / KK\r\n3. Akta Kelahiran\r\n4. Akta/buku Nikah atau Perkawinan\r\n5. Ijazah\r\n6. Surat Pengantar dari Kelurahan / Catatan Sipil\r\n7. Surat Permohonan\r\n8. KTP Saksi (dua orang)\r\n\r\nNB :\r\n- No. 1 sd 6 Masing-masing difotocopy 1X dan di Leges di Kantor Pos.\r\n- Surat Permohonan di Print ditanda tangani diatas materai 10.000 dan\r\nFile tanpa tanda tangan dimasukan dalam CD Format Ms. Word (bukan discan)\r\n\r\n*Jika Pendaftaran Online melalui Aplikasi E-Court :\r\n- Dokumen Elektronik berbentuk File Pdf ditambah file rtf (No. 7)\r\n- Nomor Rekening Bank\r\n- Alamat Email dan Nomor Handphone atau Telepon\r\n\r\n*Syarat khusus:*\r\n- disclaimer: dimungkinkan ada penambahan bukti berdasarkan petunjuk hakim yang menangani perkara\r\n- 2 orang saksi yang mengetahui tentang yang dimohonkan',6,'/20210914041546',1,'2021-09-23 03:51:30','edit',NULL),
(5,'Apa Saja Persyaratan Awal Mengajukan Permohonan Dispensasi Nikah','1. Surat Permohonan Dispensasi Nikah\r\n2. Fotokopi KTP Pemohon;\r\n3. Fotokopi Kartu Keluarga Pemohon;\r\n4. Fotokopi Akta Perkawinan Pemohon;\r\n5. Surat Keterangan dari Kantor Dukcapil mengenai penolakan perkawinan karena belum cukup umur;\r\n6. Fotokopi Akta Kelahiran kedua calon mempelai;\r\n7. Fotokopi Ijazah kedua calon mempelai (jika ada);\r\n8. KTP Saksi (dua orang)\r\n\r\nNB :\r\n- No. 2 sd 7 Masing-masing difotocopy 1X dan di Leges di Kantor Pos.\r\n- Surat Permohonan di Print ditanda tangani diatas materai 10.000 dan\r\nFile tanpa tanda tangan dimasukan dalam CD Format Ms. Word (bukan discan)\r\n\r\n*Jika Pendaftaran Online melalui Aplikasi E-Court :\r\n- Dokumen Elektronik berbentuk File Pdf ditambah file rtf (No. 1)\r\n- Nomor Rekening Bank\r\n- Alamat Email dan Nomor Handphone atau Telepon\r\n\r\n*Syarat khusus:*\r\n- disclaimer: dimungkinkan ada penambahan bukti berdasarkan petunjuk hakim yang menangani perkara\r\n- 2 orang saksi yang mengetahui tentang yang dimohonkan',6,'/20210914090455',1,'2021-09-21 09:24:01','edit',NULL),
(6,'Apa Saja Persyaratan Awal Mengajukan Permohonan Pengangkatan Wali','1. Surat permohonan\r\n2. Surat Kuasa dari orang tua kandung ke calon Wali\r\n3. Foto copy KTP Calon Wali\r\n4. Foto copy KTP Anak\r\n5. Foto copy Kartu Keluarga (KK)\r\n6. Foto copy akta kelahiran/ Foto copy Surat Keterangan Lahir dari Rumah Sakit/Bidan\r\n7. Foto copy ijazah anak\r\n8. Foto copy buku nikah/ akta perkawinan\r\n9. KTP Saksi (dua orang)\r\n\r\nNB :\r\n- No. 2 sd 8 Masing-masing difotocopy 1X dan di Leges di Kantor Pos.\r\n- Surat Permohonan di Print ditanda tangani diatas materai 10.000 dan\r\nFile tanpa tanda tangan dimasukan dalam CD Format Ms. Word (bukan discan)\r\n\r\n*Jika Pendaftaran Online melalui Aplikasi E-Court :\r\n- Dokumen Elektronik berbentuk File Pdf ditambah file rtf (No. 1)\r\n- Nomor Rekening Bank\r\n- Alamat Email dan Nomor Handphone atau Telepon\r\n\r\n*Syarat khusus:*\r\n- disclaimer: dimungkinkan ada penambahan bukti berdasarkan petunjuk hakim yang menangani perkara\r\n- 2 orang saksi yang mengetahui tentang yang dimohonkan',6,'/20210914092502',1,'2021-09-21 09:23:45','edit',NULL),
(7,'Apa Saja Persyaratan Awal Mengajukan Permohonan Pembatalan Perkawinan','1.  Surat Permohonan.\r\n2. Asli Kutipan Akta Nikah/Duplikat Kutipan Akta Nikah yang akan dibatalkan.\r\n3. Fotocopy Kutipan Akta Nikah Pemohon/Penggugat.\r\n4. Fotocopy KTP Pemohon/Penggugat.\r\n5. Surat Ijin/Keterangan Pembatalan Nikah dari Pejabat yang berwenang bagi PNS, TNI/POLRI.\r\n6. KTP Saksi (dua orang)\r\n\r\nNB :\r\n- No. 2 sd 5 Masing-masing difotocopy 1X dan di Leges di Kantor Pos.\r\n- Surat Permohonan di Print ditanda tangani diatas materai 10.000 dan\r\nFile tanpa tanda tangan dimasukan dalam CD Format Ms. Word (bukan discan)\r\n\r\n*Jika Pendaftaran Online melalui Aplikasi E-Court :\r\n- Dokumen Elektronik berbentuk File Pdf ditambah file rtf (No. 1)\r\n- Nomor Rekening Bank\r\n- Alamat Email dan Nomor Handphone atau Telepon\r\n\r\nSyarat khusus:\r\n- disclaimer: dimungkinkan ada penambahan bukti berdasarkan petunjuk hakim yang menangani perkara\r\n- 2 orang saksi yang mengetahui tentang yang dimohonkan\r\n',6,'/20210914094901',1,'2021-09-21 09:23:29','edit',NULL),
(8,'Tatacara Pendaftaran Perkara Permohonan Melalui E-Court','Mohon Maaf Data Belum Tersedia',4,'/20210921095322',1,'2021-09-22 01:57:19','hapus',NULL),
(9,'Tatacara Pendaftaran Perkara Permohonan Konvensional','Mohon Maaf Data Belum Tersedia',4,'/20210921095415',1,'2021-09-22 01:57:14','hapus',NULL);

/*Table structure for table `tb_bantuan_new` */

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

/*Data for the table `tb_bantuan_new` */

/*Table structure for table `tb_kla` */

DROP TABLE IF EXISTS `tb_kla`;

CREATE TABLE `tb_kla` (
  `id_kla` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kla` text COLLATE utf8_unicode_ci NOT NULL,
  `jawaban` text COLLATE utf8_unicode_ci NOT NULL,
  `id_menu_utama` int(11) NOT NULL,
  `link_kla` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_user` int(11) DEFAULT 1,
  `tgl_input` datetime DEFAULT NULL,
  `status` enum('aktif','hapus','edit') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_kla`),
  UNIQUE KEY `link_bantuan` (`link_kla`),
  KEY `id_menu_utama` (`id_menu_utama`),
  KEY `id_user_cont` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tb_kla` */

insert  into `tb_kla`(`id_kla`,`nama_kla`,`jawaban`,`id_menu_utama`,`link_kla`,`id_user`,`tgl_input`,`status`) values 
(1,'TPM Kesekretariatan','https://mahkamahagung.go.id/media/8389',1,'/20210421153349',1,'2021-04-21 15:47:03','edit'),
(2,'Youtube','https://www.youtube.com/watch?v=smbyY2WioCU',1,'/20210421153952',1,'2021-04-21 15:40:04','hapus');

/*Table structure for table `tb_login` */

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_login` */

insert  into `tb_login`(`id_user`,`username`,`password`,`nama`,`level`,`privilleges`) values 
(1,'vendetta','123456','Okta Pilopa','admin','all'),
(5,'afit','123456','afit','admin','all'),
(6,'aldha','123456','aldha','operator','3'),
(7,'amin','123456','amin','operator','4'),
(8,'rahman','123456','rahman','operator','3'),
(9,'redi','123456','redi','operator','5'),
(10,'heni','123456','heni','operator','3'),
(11,'nurdin','123456','nurdin','operator','1'),
(12,'arief','123456','arief','admin','all'),
(13,'eko','123456','eko','admin','all'),
(14,'anisa','123456','anisa','admin','all');

/*Table structure for table `tb_menu_utama` */

DROP TABLE IF EXISTS `tb_menu_utama`;

CREATE TABLE `tb_menu_utama` (
  `id_menu_utama` int(11) NOT NULL AUTO_INCREMENT,
  `nama_menu_utama` text COLLATE utf8_unicode_ci NOT NULL,
  `unique_link_menu_utama` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `keterangan_menu_utama` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `jawaban_menu_utama` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `show` enum('ya','tidak') COLLATE utf8_unicode_ci DEFAULT 'ya',
  PRIMARY KEY (`id_menu_utama`),
  UNIQUE KEY `unique_link` (`unique_link_menu_utama`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tb_menu_utama` */

insert  into `tb_menu_utama`(`id_menu_utama`,`nama_menu_utama`,`unique_link_menu_utama`,`keterangan_menu_utama`,`jawaban_menu_utama`,`show`) values 
(1,'JENIS – JENIS PERMOHONAN YANG DAPAT DIAJUKAN MELALUI PENGADILAN NEGERI adalah sebagai berikut :','jenis permohonan','jenis permohonan','JENIS – JENIS PERMOHONAN YANG DAPAT DIAJUKAN MELALUI PENGADILAN NEGERI adalah sebagai berikut :\r\n\r\n1.	Permohonan pengangkatan wali bagi anak yang belum dewasa adalah 18 tahun (menurut Undang-undang No. 1 Tahun 1974 tentang Perkawinan Pasal 47; menurut Undang-undang No. 3 Tahun 1997 tentang Pengadilan Anak Pasal 1; menurut Undang-undang No 23 Tahun 2002 Pasal 1 butir ke 1).\r\n\r\n2.	Permohonan pengangkatan pengampuan bagi orang dewasa yang kurang ingatannya atau orang dewasa yang tidak bisa mengurus hartanya lagi, misalnya karena pikun.\r\n\r\n3.	Permohonan dispensasi nikah bagi pria yang belum mencapai umur 19 tahun dan bagi wanita yang belum mencapai umur 16 tahun (Pasal 7 Undang-undang No. 1 Tahun 1974).\r\n\r\n4.	Permohonan izin nikah bagi calon mempelai yang belum berumur 21 tahun (Pasal 6 ayat (5) Undang¬-undang No.1 Tahun 1974).\r\n\r\n5.	Permohonan pembatalan perkawinan (Pasal 25, 26 dan 27 Undang-undang No.1 Tahun 1974).\r\n\r\n6.	Permohonan pengangkatan anak (harus diperhatikan SEMA No. 6/1983).\r\n\r\n7.	Permohonan untuk memperbaiki kesalahan dalam akta catatan sipil, misalnya apabila nama anak secara salah disebutkan dalam akta tersebut (Penduduk Jawa dan Madura Ordonantie Pasal 49 dan 50, Peraturan Catatan Sipil keturunan Cina Ordonantie 20 Maret 1917-130 jo 1929-81 Pasal 95 dan 96, Untuk golongan Eropa KUH Perdata Pasal 13 dan 14), permohonan akta kelahiran, akta kematian.\r\n\r\n8.	Permohonan untuk menunjuk seorang atau beberapa orang wasit oleh karena para pihak tidak bisa atau tidak bersedia untuk menunjuk wasit (Pasal 13 dan 14 UU No. 30 Tahun 1999 tentang Arbitrase dan Alternatif Penyelesaian Sengketa).\r\n\r\n9.	Permohonan agar seseorang dinyatakan dalam keadaan tidak hadir (Pasal 463 BW) atau dinyatakan meninggal dunia (Pasal 457 BW).\r\n\r\n10.	Permohonan agar ditetapkan sebagai wakil/ kuasa untuk menjual harta warisan.','ya'),
(2,'PERMOHONAN YANG TIDAK DAPAT DIAJUKAN MELALUI PENGADILAN NEGERI adalah sebagai berikut :','permohonan yang tidak bisa','permohonan yang tidak bisa','PERMOHONAN YANG TIDAK DAPAT DIAJUKAN MELALUI PENGADILAN NEGERI adalah sebagai berikut :\r\n\r\n1.	Permohonan untuk menetapkan status kepemilikan atas suatu benda, baik benda bergerak ataupun tidak bergerak. Status kepemilikan suatu benda diajukan dalam bentuk gugatan.\r\n\r\n2.	Permohonan untuk menetapkan status keahliwarisan seseorang. Status keahlian warisan ditentukan dalam suatu gugatan.\r\n\r\n3.	Permohonan untuk menyatakan suatu dokumen atau sebuah akta adalah sah. Menyatakan suatu dokumen atau sebuah akta adalah sah harus dalam bentuk gugatan.','ya'),
(3,'Contoh-Contoh Surat Permohonan','contoh surat permohonan','contoh surat permohonan','contoh blanko surat permohonan sebagai berikut:\r\n\r\n1. Contoh Surat Permohonan Ganti Nama/Perbaikan Akta \r\n  download di link berikut ini https://drive.google.com/file/d/1xXIt774Zc8G_a0dYQCyitGMB1QQpXZcq/view\r\n\r\n2. Contoh Surat Permohonan Pengangkatan Wali\r\n    download di link berikut ini https://docs.google.com/document/d/1mRrjH5aokYvguFp5K9oju-jcfDJisRhm/edit?usp=sharing&ouid=110843724546581585164&rtpof=true&sd=true\r\n\r\n3. Contoh Surat Permohonan Pengangkatan Anak\r\n    download di link berikut ini https://drive.google.com/file/d/1uSJEZ2HwDpT58c_1KOSQ8Ekd9HPHh-a6/view\r\n\r\n4. Contoh Surat Permohonan Dispensasi/Izin Nikah \r\n    download di link berikut ini https://docs.google.com/document/d/1m4IdljzGXfUO8pFY0Wq1fvas0cXLjqSN/edit?usp=sharing&ouid=110843724546581585164&rtpof=true&sd=true\r\n\r\n5. Contoh Surat Permohonan pengampuan\r\ndownload di link berikut ini https://docs.google.com/document/d/1MpNdFOZl49MollAQ2UwK_9nZdPUH5WFA/edit?usp=sharing&ouid=110843724546581585164&rtpof=true&sd=true\r\n\r\n6. Contoh Surat Permohonan agar ditetapkan sebagai wakil/kuasa untuk menjual harta\r\ndownload di link berikut ini https://docs.google.com/document/d/1cv9WNJHcg_y2U7aLzGW-7AHYoBjgeg8Q/edit?usp=sharing&ouid=110843724546581585164&rtpof=true&sd=true\r\n\r\n7. Contoh Surat Permohonan pembatalan perkawinan\r\ndownload di link berikut ini https://docs.google.com/document/d/10FJWy6AJL1m_5PxQ2IOu_sItfpC63Gtf/edit?usp=sharing&ouid=110843724546581585164&rtpof=true&sd=true\r\n','ya'),
(4,'Tata cara pendaftaran perkara permohonan','tatacara','tatacara','berikut merupakan tatacara pendaftaran:\r\n\r\ntatacara pendaftaran perkara permohonan perdata pada Pengadilan Negeri Rantau dapat diunduh melalui link berikut ini\r\nhttps://drive.google.com/file/d/18KRHQSbVsOtrPzFOYKOFTzEv_bEL5Act/view?usp=sharing','ya'),
(5,'Berapa panjar biaya perkara permohonan?','panjar biaya permohonan','panjar biaya permohonan','Berikut merupakan rincian biaya perkara permohonan:\r\n\r\nBiaya Tetap:\r\n> Pendaftaran (PNBP) Rp. 30.000\r\n> Redaksi Penetapan Rp. 10.000\r\n> Meterai Rp. 10.000\r\n> Biaya Proses Rp. 50.000\r\n> PNBP Relaas Panggilan Pertama Kepada Pemohon Rp. 10.000\r\n> PNBP Relaas Panggilan Pertama Kepada Termohon Rp. 10.000\r\n> PNBP Relaas Panggilan Pertama kepada Termohon (Melalui Iklan/Radio/Pengumuman) Rp. 10.000\r\n> PNBP Pemberitahuan Penetapan ke Pemohon Rp. 10.000\r\n> PNBP Pemberitahuan Penetapan ke Termohon Rp. 10.000\r\n\r\nBiaya Tidak Tetap:\r\n> Biaya Panggilan ke Pemohon (2 x) Rp. (sesuai radius)\r\n> Biaya Panggilan ke Termohon (3 x) Rp. (sesuai radius)\r\n> Biaya Pemberitahuan Penetapan ke Pemohon* Rp. (sesuai radius)\r\n> Biaya Pemberitahuan Penetapan ke Termohon* Rp. (sesuai radius)\r\n> Biaya Sumpah Saksi (per orang) Rp. 20.000\r\n> Biaya Penerjemah (per orang) Rp. 150.000\r\n\r\n*Catatan: \r\n- Biaya Panggilan dan Pemberitahuan kepada Pemohon NIHIL apabila dilakukan melalui aplikasi e court.\r\nhttps://ecourt.mahkamahagung.go.id/\r\n- Untuk setiap penambahan 1 (satu) pihak dikenakan tambahan biaya (sesuai radius)*','ya'),
(6,'Apa saja persyaratan awal untuk mengajukan permohonan','persyaratan','persyaratan','-','ya'),
(7,'Informasi Jadwal Sidang','jadwal sidang','jadwal sidang','Jadwal sidang perkara pada Pengadilan Negeri Rantau dapat di lihat di link berikut ini:\r\nhttp://sipp.pn-rantau.go.id/list_jadwal_sidang','ya'),
(8,'Untuk Berbicara Dengan Petugas PTSP Pengadilan Negeri Rantau','berbicara','berbicara','Untuk berbicara dengan petugas PTSP Pengadilan Negeri Rantau silahkan klik link berikut ini:\r\n\r\nhttps://wa.link/9lsf70\r\n','ya');

/*Table structure for table `tb_user` */

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

/*Data for the table `tb_user` */

/*Table structure for table `tb_wa_reply` */

DROP TABLE IF EXISTS `tb_wa_reply`;

CREATE TABLE `tb_wa_reply` (
  `id_wa_reply` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) DEFAULT NULL,
  `jawaban` text DEFAULT NULL,
  `judul` text DEFAULT NULL,
  PRIMARY KEY (`id_wa_reply`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_wa_reply` */

insert  into `tb_wa_reply`(`id_wa_reply`,`keyword`,`jawaban`,`judul`) values 
(1,'syarat','Persyaratan awal Mengajukan Permohonan Perubahan Nama/Akta Kelahiran:\r\n\r\n1. KTP\r\n2. Katu Keluarga / KK\r\n3. Akta Kelahiran\r\n4. Akta/Buku Nikah atau Perkawinan\r\n5. Ijazah\r\n6. Surat Pengantar Dinas Kependudukan dan Catatan Sipil\r\n7. Surat Permohonan\r\n\r\nNB :\r\n- No. 1 sd 6 Masing-masing difotocopy 1X dan di Leges di Kantor Pos.\r\n- Surat Permohonan di Print ditanda tangani diatas materai 10.000 dan\r\nFile tanpa tanda tangan dimasukan dalam CD Format Ms. Word (bukan discan)\r\n','Persyaratan Awal Mengajukan Permohonan Perubahan Nama/Akta Kelahiran'),
(2,'biaya','Panjar Biaya Perkara Permohonan Perubahan Nama/Akta:\r\n\r\nRp. 110.000','Panjar Biaya Perkara Permohonan Perubahan Nama/Akta:\r\n'),
(3,'jadwal','Jadwal sidang perkara pada Pengadilan Negeri Rantau dapat di lihat di link berikut ini:\r\nhttp://sipp.pn-rantau.go.id/list_jadwal_sidang','Jadwal sidang perkara'),
(4,'tatacara','Untuk tatacara pendaftaran permohonan perubahan nama/akta dapat dilihat pada link berikut:','Tatacara pendaftaran perkara permohonan perubahan nama/akta');

/*Table structure for table `v_bantuan` */

DROP TABLE IF EXISTS `v_bantuan`;

/*!50001 DROP VIEW IF EXISTS `v_bantuan` */;
/*!50001 DROP TABLE IF EXISTS `v_bantuan` */;

/*!50001 CREATE TABLE  `v_bantuan`(
 `nama_bantuan` text ,
 `jawaban` text ,
 `id_menu_utama` int(11) ,
 `keterangan_menu_utama` varchar(255) ,
 `unique_link_menu_utama` varchar(255) ,
 `id_panggilan` varchar(267) 
)*/;

/*Table structure for table `v_menu_utama` */

DROP TABLE IF EXISTS `v_menu_utama`;

/*!50001 DROP VIEW IF EXISTS `v_menu_utama` */;
/*!50001 DROP TABLE IF EXISTS `v_menu_utama` */;

/*!50001 CREATE TABLE  `v_menu_utama`(
 `id_menu_utama` int(11) ,
 `nama_menu_utama` text ,
 `jawaban_menu_utama` text ,
 `unique_link_menu_utama` varchar(255) ,
 `keterangan_menu_utama` varchar(255) 
)*/;

/*View structure for view v_bantuan */

/*!50001 DROP TABLE IF EXISTS `v_bantuan` */;
/*!50001 DROP VIEW IF EXISTS `v_bantuan` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_bantuan` AS (select `b`.`nama_bantuan` AS `nama_bantuan`,`b`.`jawaban` AS `jawaban`,`mu`.`id_menu_utama` AS `id_menu_utama`,`mu`.`keterangan_menu_utama` AS `keterangan_menu_utama`,`mu`.`unique_link_menu_utama` AS `unique_link_menu_utama`,concat(lcase(`mu`.`keterangan_menu_utama`),'_',`b`.`id_bantuan`) AS `id_panggilan` from (`tb_bantuan` `b` left join `tb_menu_utama` `mu` on(`mu`.`id_menu_utama` = `b`.`id_menu_utama`)) where `b`.`status` <> 'hapus' order by `b`.`id_menu_utama`) */;

/*View structure for view v_menu_utama */

/*!50001 DROP TABLE IF EXISTS `v_menu_utama` */;
/*!50001 DROP VIEW IF EXISTS `v_menu_utama` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_menu_utama` AS (select `tbmn`.`id_menu_utama` AS `id_menu_utama`,`tbmn`.`nama_menu_utama` AS `nama_menu_utama`,`tbmn`.`jawaban_menu_utama` AS `jawaban_menu_utama`,`tbmn`.`unique_link_menu_utama` AS `unique_link_menu_utama`,lcase(`tbmn`.`keterangan_menu_utama`) AS `keterangan_menu_utama` from `tb_menu_utama` `tbmn` where `tbmn`.`show` = 'ya') */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
