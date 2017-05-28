/*
SQLyog Community v12.3.1 (64 bit)
MySQL - 10.1.16-MariaDB : Database - bioskop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bioskop` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `bioskop`;

/*Table structure for table `film` */

DROP TABLE IF EXISTS `film`;

CREATE TABLE `film` (
  `id_film` char(10) NOT NULL,
  `nama_film` varchar(100) DEFAULT NULL,
  `tahun_pembuatan` varchar(5) DEFAULT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `pemain` varchar(100) DEFAULT NULL,
  `deskripsi_film` varchar(1000) DEFAULT NULL,
  `tgl_mulai_tayang` date DEFAULT NULL,
  `tgl_selesai_tayang` date DEFAULT NULL,
  `durasi` varchar(15) DEFAULT NULL,
  `klasifikasi` varchar(10) DEFAULT NULL,
  `rating` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id_film`),
  KEY `nama_film` (`nama_film`,`tahun_pembuatan`),
  KEY `namafilm` (`nama_film`,`tahun_pembuatan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `film` */

insert  into `film`(`id_film`,`nama_film`,`tahun_pembuatan`,`genre`,`pemain`,`deskripsi_film`,`tgl_mulai_tayang`,`tgl_selesai_tayang`,`durasi`,`klasifikasi`,`rating`) values 
('F0001','BIG HERO 6','2014','Animation','Ryan Potter, Hiro Takachiho','Big Hero 6 is a 2014 American 3D computer-animated superhero-comedy film produced by Walt Disney Animation Studios and released by Walt Disney Pictures. ','2017-05-10','2017-05-31','120 menit','All Age',NULL),
('F0002','Interstellar','2014','Adventure',' Matthew McConaughey, Anne Hathaway, Jessica Chastain','A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.','2017-05-01','2017-05-30','115 menit','R',0),
('F0003','The Amazing Spiderman 2','2014','Adventure','Andrew Garfield','Confident in his powers as Spider-Man, Peter Parker (Andrew Garfield) embraces his new role as a hero and spends time with Gwen Stacy (Emma Stone) in between protecting New York from criminals. ','2017-05-10','2017-05-26','125 menit','R',0),
('F0004','Dawn of The Planet of The Apes','2014','Fantasy','Andy Serkis, Gary Oldman','Ten years after simian flu wiped out much of the world\'s homosapiens, genetically enhanced chimpanzee Caesar (Andy Serkis) and his ever-growing band of followers have established a thriving colony just outside San Francisco in Muir Woods.','2017-05-23','2017-05-31','131 menit','All Age',0),
('F0005','The Lego Movie','2014','Adventure','Chris Pratt','Emmet (Chris Pratt), an ordinary LEGO figurine who always follows the rules, is mistakenly identified as the Special -- an extraordinary being and the key to saving the world.','2017-05-06','2017-05-31','100 menit','ALl Age',0),
('F0006','The Avengers','2014','Fantasy','Robert Downey Jr.','When Thor\'s evil brother, Loki (Tom Hiddleston), gains access to the unlimited power of the energy cube called the Tesseract, Nick Fury (Samuel L. Jackson), director of S.H.I.E.L.D., ','2017-05-02','2017-05-20','129 menit','R',0),
('F0007','Beauty and The Beast','2017','Fantasy','Emma Watson','Belle (Emma Watson), a bright, beautiful and independent young woman, is taken prisoner by a beast (Dan Stevens) in its castle. ','2017-05-01','2017-06-08','110 menit','R',0),
('F0008','Fast and Furious','2017','Thriller','Vin Diesel, Dwayne Johnson','With Dom and Letty married, Brian and Mia retired and the rest of the crew exonerated, the globe-trotting team has found some semblance of a normal life.','2017-05-23','2017-05-31','100 menit','D',0),
('F0009','Pirates of the Carribean','2017','Action','Johny Depp, Geoffrey Rush','Disney\'s promotional campaign for the long-in-the-works fifth POTC outing has kept the focus on Javier Bardem\'s Captain Salazar and his ghost crew who are out to wipe out all pirates -- especially Captain Jack Sparrow.','2017-05-17','2017-05-31','100 menit','R',0),
('F0010','Baywatch','2017','Comedy','Dwayne Johnson','Devoted lifeguard Mitch Buchanan butts heads with a brash new recruit. Together, they uncover a local criminal plot that threatens the future of the Bay.','2017-05-23','2017-05-31','116 menit','D',0);

/*Table structure for table `histori` */

DROP TABLE IF EXISTS `histori`;

CREATE TABLE `histori` (
  `id_pemesan` varchar(10) DEFAULT NULL,
  `id_film` varchar(10) DEFAULT NULL,
  `action` char(30) DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL,
  KEY `histori_fk_pemesan` (`id_pemesan`),
  KEY `histori_fk_film` (`id_film`),
  CONSTRAINT `histori_fk_film` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `histori_fk_pemesan` FOREIGN KEY (`id_pemesan`) REFERENCES `pemesan` (`id_pemesan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `histori` */

insert  into `histori`(`id_pemesan`,`id_film`,`action`,`tanggal`) values 
('0001','F0006','REVIEW','2017-05-23 23:29:02'),
('0005','F0004','REVIEW','2017-05-21 23:29:39'),
('0005','F0007','REVIEW','2017-05-17 23:30:08'),
('0007','F0006','REVIEW','2017-05-26 23:30:24'),
('0009','F0008','REVIEW','2017-05-10 23:30:44'),
('0003','F0001','REVIEW','2017-05-23 23:31:02'),
('0005','F0004','PESAN','2017-05-14 12:31:47'),
('0004','F0007','PESAN','2017-05-01 02:32:05'),
('0007','F0006','PESAN','2017-05-06 11:32:25'),
('0006','F0010','PESAN','2017-05-31 23:32:45');

/*Table structure for table `memutar` */

DROP TABLE IF EXISTS `memutar`;

CREATE TABLE `memutar` (
  `id_memutar` char(10) NOT NULL,
  `id_film` char(10) NOT NULL,
  `id_studio` char(5) DEFAULT NULL,
  `waktu_pemutaran` time DEFAULT NULL,
  `waktu_selesai` time DEFAULT NULL,
  PRIMARY KEY (`id_memutar`),
  KEY `id_film` (`id_film`),
  KEY `id_studio` (`id_studio`),
  CONSTRAINT `memutar_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`),
  CONSTRAINT `memutar_ibfk_2` FOREIGN KEY (`id_studio`) REFERENCES `studio` (`id_studio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `memutar` */

insert  into `memutar`(`id_memutar`,`id_film`,`id_studio`,`waktu_pemutaran`,`waktu_selesai`) values 
('M0001','F0001','Std1','15:00:00','17:30:00'),
('M0002','F0001','Std1','00:00:17','20:00:00'),
('M0003','F0002','Std1','12:00:00','14:30:00'),
('M0004','F0002','Std2','12:00:00','14:30:00'),
('M0005','F0003','Std2','14:35:00','16:30:00'),
('M0006','F0004','Std2','16:35:00','18:30:00'),
('M0007','F0005','Std2','18:30:00','20:05:00'),
('M0008','F0006','Std2','20:05:00','22:10:00'),
('M0009','F0007','Std1','18:30:00','20:22:00'),
('M0010','F0008','Std3','19:00:00','21:10:00');

/*Table structure for table `pegawai` */

DROP TABLE IF EXISTS `pegawai`;

CREATE TABLE `pegawai` (
  `id_pegawai` char(10) NOT NULL,
  `no_KTP` varchar(20) DEFAULT NULL,
  `nama_pegawai` varchar(100) DEFAULT NULL,
  `alamat` varchar(200) DEFAULT NULL,
  `no_telp` varchar(15) DEFAULT NULL,
  `jabatan` varchar(50) DEFAULT NULL,
  `gaji` int(11) DEFAULT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`id_pegawai`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pegawai` */

insert  into `pegawai`(`id_pegawai`,`no_KTP`,`nama_pegawai`,`alamat`,`no_telp`,`jabatan`,`gaji`,`password`) values 
('PEG0001','129832019389230','Rendy Nur','Surabaya','081273829192','Kasir',4000000,'091827'),
('PEG0002','126372910209127','Frieda','Surabaya','087775891221','Manager',10000000,'qwerty'),
('PEG0003','120927856321298','Pius Pambudi','Surabaya','08128399201','CTO',10000000,'pipau'),
('PEG0004','129382910372820','Marisa Bachri','Surabaya','089837281900','Humas',8000000,'marisasongko'),
('PEG0005','127462821029829','Syifa Labiba','Sidoarjo','081263748292','Kasir',4000000,'labib'),
('PEG0006','882730192197267','Nurul Asia','Gresik','081278278129','Customer Service',4000000,'asiaa'),
('PEG0007','881272171573153','Sheila','Gresik','082912838632','Kasir',4000000,'cilcilcil'),
('PEG0008','881921897218621','Baharuddin','Surabaya','081287291002','Satpam',4000000,'barudin');

/*Table structure for table `pemesan` */

DROP TABLE IF EXISTS `pemesan`;

CREATE TABLE `pemesan` (
  `id_pemesan` char(10) NOT NULL,
  `nama_pemesan` varchar(100) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `no_telfon_pemesan` varchar(15) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_pemesan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pemesan` */

insert  into `pemesan`(`id_pemesan`,`nama_pemesan`,`email`,`no_telfon_pemesan`,`password`) values 
('0001','Nabila','nabil@gmail.com','0812732729921','nabilz'),
('0002','Damai','mae@gmail.com','0812738292103','12345'),
('0003','Nuriman binti Sudjarot','nuri@gmail.com','0812872363526','qwetyu'),
('0004','Sukiyem','sukisuki@gmail.com','0812873276725','matikau'),
('0005','Labidam','bibi@gmail.com','0899273287189','syalala'),
('0006','Muhammad Ray','mray@gmail.com','0899283726765','rere'),
('0007','Sudirman Dimas','dira@gmail.com','0878625614568','didipete'),
('0008','Yuta Jiewanda','yutachan@gmail.com','0812917372891','yuyuyu'),
('0009','Wembito','wembi@gmail.com','0819187726325','w3mb1'),
('0010','Iwaw Kush','zool@gmail.com','081299283756','mommykush');

/*Table structure for table `review` */

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
  `id_review` varchar(10) NOT NULL,
  `id_pemesan` varchar(10) DEFAULT NULL,
  `id_film` varchar(10) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `komentar` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_review`),
  KEY `review_fk_pemesan` (`id_pemesan`),
  KEY `review_fk_film` (`id_film`),
  CONSTRAINT `review_fk_film` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `review_fk_pemesan` FOREIGN KEY (`id_pemesan`) REFERENCES `pemesan` (`id_pemesan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `review` */

insert  into `review`(`id_review`,`id_pemesan`,`id_film`,`rating`,`komentar`) values 
('R0001','0001','F0006',3,'kurang mantap'),
('R0002','0005','F0004',5,'monyetnya lucu'),
('R0003','0005','F0007',5,'mendebarkan'),
('R0004','0007','F0006',4,'Pemainnya tampan'),
('R0005','0009','F0008',3,'FF7 better'),
('R0006','0003','F0001',5,'Perfect'),
('R0007','0004','F0007',5,'Worth waiting for'),
('R0008','0006','F0007',5,'Such a tear jerker'),
('R0009','0010','F0006',5,'Much wow'),
('R0010','0002','F0010',2,'Kurang mantap');

/*Table structure for table `studio` */

DROP TABLE IF EXISTS `studio`;

CREATE TABLE `studio` (
  `id_studio` char(5) NOT NULL,
  `no_studio` char(3) DEFAULT NULL,
  `kapasitas` int(4) DEFAULT NULL,
  PRIMARY KEY (`id_studio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `studio` */

insert  into `studio`(`id_studio`,`no_studio`,`kapasitas`) values 
('Std1','1',100),
('Std2','2',125),
('Std3','3',75);

/*Table structure for table `transaksi` */

DROP TABLE IF EXISTS `transaksi`;

CREATE TABLE `transaksi` (
  `id_transaksi` char(10) NOT NULL,
  `id_pegawai` char(10) NOT NULL,
  `id_memutar` char(10) NOT NULL,
  `id_pemesan` char(10) NOT NULL,
  `jumlah_tiket` int(3) DEFAULT NULL,
  `harga_pertiket` int(11) DEFAULT NULL,
  `tanggal_pembelian` date DEFAULT NULL,
  `total_pembayaran` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_transaksi`),
  KEY `id_pegawai` (`id_pegawai`),
  KEY `id_memutar` (`id_memutar`),
  KEY `id_pemesan` (`id_pemesan`),
  KEY `tanggal_pembelian` (`tanggal_pembelian`,`jumlah_tiket`),
  KEY `tanggalpembelian` (`tanggal_pembelian`,`jumlah_tiket`),
  CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`),
  CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_memutar`) REFERENCES `memutar` (`id_memutar`),
  CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`id_pemesan`) REFERENCES `pemesan` (`id_pemesan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `transaksi` */

insert  into `transaksi`(`id_transaksi`,`id_pegawai`,`id_memutar`,`id_pemesan`,`jumlah_tiket`,`harga_pertiket`,`tanggal_pembelian`,`total_pembayaran`) values 
('T0001','PEG0001','M0001','0001',5,50000,'2017-05-23',250000),
('T0002','PEG0001','M0003','0006',12,50000,'2017-05-23',600000),
('T0003','PEG0001','M0006','0007',10,50000,'2017-05-25',500000),
('T0004','PEG0005','M0007','0002',1,50000,'2017-05-26',50000),
('T0005','PEG0005','M0008','0002',2,50000,'2017-05-22',100000),
('T0006','PEG0006','M0005','0009',5,50000,'2017-05-23',250000),
('T0007','PEG0007','M0006','0010',2,50000,'2017-05-23',100000),
('T0008','PEG0007','M0005','0004',1,50000,'2017-05-31',50000),
('T0009','PEG0007','M0006','0007',2,50000,'2017-05-23',100000),
('T0010','PEG0005','M0007','0010',2,50000,'2017-05-27',100000);

/*!50106 set global event_scheduler = 1*/;

/* Event structure for event `hapusfilm` */

/*!50106 DROP EVENT IF EXISTS `hapusfilm`*/;

DELIMITER $$

/*!50106 CREATE DEFINER=`root`@`localhost` EVENT `hapusfilm` ON SCHEDULE EVERY 1 DAY STARTS '2017-05-20 13:05:13' ON COMPLETION NOT PRESERVE ENABLE DO begin
	delete from film where film.tgl_selesai_tayang >=NOW();
end */$$
DELIMITER ;

/* Function  structure for function  `bonus` */

/*!50003 DROP FUNCTION IF EXISTS `bonus` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `bonus`(tanggal date) RETURNS int(11)
    DETERMINISTIC
begin
	declare untung int;
	select (sum(jumlah_tiket*harga_pertiket) - sum(jumlah_tiket*5000)) into untung
	from transaksi
	where tanggal_pembelian = tanggal;
RETURN untung;
end */$$
DELIMITER ;

/* Function  structure for function  `hitungtot` */

/*!50003 DROP FUNCTION IF EXISTS `hitungtot` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `hitungtot`() RETURNS int(11)
    DETERMINISTIC
begin
	declare total int;
	select jumlah_tiket * harga_pertiket into total from transaksi ;
	return total ;
end */$$
DELIMITER ;

/* Procedure structure for procedure `bonus` */

/*!50003 DROP PROCEDURE IF EXISTS  `bonus` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `bonus`()
begin
	declare done int default 0;
	declare total int;
	declare id char(10);
	declare jab varchar(50);
	declare cursor1 cursor for select id_pegawai, jabatan, gaji from pegawai;
	declare continue handler for sqlstate "02000" set done=1;
	open cursor1;
	repeat
	fetch cursor1 into id, jab, total;
	if not done then
	if jab = "pegawai" then 
	update pegawai set gaji=total+1000000 where id_pegawai = id;
	else
	update pegawai set gaji = total where id_pegawai = id;
	end if;
	end if;
	until done end repeat;
	close cursor1;
end */$$
DELIMITER ;

/* Procedure structure for procedure `cursor` */

/*!50003 DROP PROCEDURE IF EXISTS  `cursor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `cursor`()
begin
	declare done int default 0;
	declare total int;
	declare id char(10);
	declare cursor1 cursor for select id_transaksi, total_pembayaran from transaksi;
	declare continue handler for sqlstate "02000" set done=1;
	open cursor1;
	repeat
	fetch cursor1 into id,total;
	if not done then
	if total>200000 then
		update transaksi set total_pembayaran=total-(10/100*total) where id_transaksi = id;
		else
		update transaksi set total_pembayaran=total where id_transaksi = id;
	end if;
	end if;
	until done end repeat;
	close cursor1;
end */$$
DELIMITER ;

/* Procedure structure for procedure `filmapa` */

/*!50003 DROP PROCEDURE IF EXISTS  `filmapa` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `filmapa`(gen varchar(50))
begin
	update film set genre = "romansa" where genre = gen;
	if row_count() > 0 then
	select concat ("film yang diubah bergenre ", gen, "dan berjumlah ", row_count()) "Jumlah film berubah";
	else select concat("tidak berubah") "Jumlah film berubah";
	end if;
end */$$
DELIMITER ;

/* Procedure structure for procedure `hapusputar` */

/*!50003 DROP PROCEDURE IF EXISTS  `hapusputar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `hapusputar`()
begin 
	delete from memutar where memutar.id_film = film.id_film and film.tgl_selesai_tayang >= NOW();
end */$$
DELIMITER ;

/* Procedure structure for procedure `lihatgenre` */

/*!50003 DROP PROCEDURE IF EXISTS  `lihatgenre` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `lihatgenre`(gen varchar(50))
begin
	select * from genre where film.genre = gen;
end */$$
DELIMITER ;

/* Procedure structure for procedure `lihatrating` */

/*!50003 DROP PROCEDURE IF EXISTS  `lihatrating` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `lihatrating`()
begin
	select * from rating;
end */$$
DELIMITER ;

/* Procedure structure for procedure `tayang` */

/*!50003 DROP PROCEDURE IF EXISTS  `tayang` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `tayang`(tgl date)
begin
	select * from film where film.tgl_mulai_tayang >=NOW() and film.tgl_selesai_tayang <=NOW();
end */$$
DELIMITER ;

/* Procedure structure for procedure `test_cursor` */

/*!50003 DROP PROCEDURE IF EXISTS  `test_cursor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `test_cursor`()
begin
	declare done int default 0;
	declare a, b int;
	declare cur1 cursor for select id,`data` from test1;
	declare continue handler for sqlstate "02000" set done=1;
	open cur1;
	repeat
	fetch cur1 into a,b;
	if not done then
	if a > b then
	update test1 set keterangan=concat(a,">",b) where id=a;
	else
	update test1 set keterangan=concat(a,"<",b) where id=a;
	end if;
	end if;
	until done end repeat;
	close cur1;
end */$$
DELIMITER ;

/* Procedure structure for procedure `tot` */

/*!50003 DROP PROCEDURE IF EXISTS  `tot` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `tot`(total int)
begin
	update transaksi
	set total_pembayaran = jumlah_tiket*harga_pertiket
	where total_pembayaran = total;
end */$$
DELIMITER ;

/* Procedure structure for procedure `update` */

/*!50003 DROP PROCEDURE IF EXISTS  `update` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `update`()
begin
	declare id char(10);
	declare done int default 0;
	declare curs cursor for select id_transaksi from transaksi;
	declare continue handler for sqlstate "02000"set done=1;
	open curs;
	repeat
	fetch curs into id;
	update transaksi
	set total_pembayaran=jumlah_tiket*harga_pertiket
	where id_transaksi=id;
	until done end repeat;
	close curs;
end */$$
DELIMITER ;

/*Table structure for table `genre` */

DROP TABLE IF EXISTS `genre`;

/*!50001 DROP VIEW IF EXISTS `genre` */;
/*!50001 DROP TABLE IF EXISTS `genre` */;

/*!50001 CREATE TABLE  `genre`(
 `genre` varchar(50) 
)*/;

/*Table structure for table `nontonapa` */

DROP TABLE IF EXISTS `nontonapa`;

/*!50001 DROP VIEW IF EXISTS `nontonapa` */;
/*!50001 DROP TABLE IF EXISTS `nontonapa` */;

/*!50001 CREATE TABLE  `nontonapa`(
 `nama_pemesan` varchar(100) ,
 `waktu_pemutaran` time ,
 `nama_film` varchar(100) 
)*/;

/*Table structure for table `rating` */

DROP TABLE IF EXISTS `rating`;

/*!50001 DROP VIEW IF EXISTS `rating` */;
/*!50001 DROP TABLE IF EXISTS `rating` */;

/*!50001 CREATE TABLE  `rating`(
 `max(rating)` decimal(10,0) 
)*/;

/*View structure for view genre */

/*!50001 DROP TABLE IF EXISTS `genre` */;
/*!50001 DROP VIEW IF EXISTS `genre` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `genre` AS select `film`.`genre` AS `genre` from `film` */;

/*View structure for view nontonapa */

/*!50001 DROP TABLE IF EXISTS `nontonapa` */;
/*!50001 DROP VIEW IF EXISTS `nontonapa` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `nontonapa` AS select `pes`.`nama_pemesan` AS `nama_pemesan`,`put`.`waktu_pemutaran` AS `waktu_pemutaran`,`f`.`nama_film` AS `nama_film` from (((`pemesan` `pes` join `film` `f`) join `memutar` `put`) join `transaksi` `t`) where ((`pes`.`nama_pemesan` = 'Nadia Rahmatin') and (`t`.`tanggal_pembelian` < '2017-03-07') and (`t`.`id_pemesan` = `pes`.`id_pemesan`) and (`put`.`id_memutar` = `t`.`id_memutar`) and (`put`.`id_film` = `f`.`id_film`)) union select `pes`.`nama_pemesan` AS `nama_pemesan`,`put`.`waktu_pemutaran` AS `waktu_pemutaran`,`f`.`nama_film` AS `nama_film` from (((`pemesan` `pes` join `film` `f`) join `memutar` `put`) join `transaksi` `t`) where ((`pes`.`nama_pemesan` = 'Nanang Taufan') and (`t`.`tanggal_pembelian` < '2017-03-07') and (`t`.`id_pemesan` = `pes`.`id_pemesan`) and (`put`.`id_memutar` = `t`.`id_memutar`) and (`put`.`id_film` = `f`.`id_film`)) */;

/*View structure for view rating */

/*!50001 DROP TABLE IF EXISTS `rating` */;
/*!50001 DROP VIEW IF EXISTS `rating` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rating` AS select max(`film`.`rating`) AS `max(rating)` from `film` */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
