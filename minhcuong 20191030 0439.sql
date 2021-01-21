﻿--
-- Script was generated by Devart dbForge Studio 2019 for MySQL, Version 8.1.45.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 10/30/2019 4:39:02 AM
-- Server version: 5.5.5-10.4.6-MariaDB
-- Client version: 4.1
--

-- 
-- Disable foreign keys
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Set SQL mode
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Set character set the client will use to send SQL statements to the server
--
SET NAMES 'utf8';

--
-- Set default database
--
USE minhcuong;

--
-- Drop table `lichsu`
--
DROP TABLE IF EXISTS lichsu;

--
-- Drop view `view_khohang`
--
DROP VIEW IF EXISTS view_khohang CASCADE;

--
-- Drop view `view_khohangg`
--
DROP VIEW IF EXISTS view_khohangg CASCADE;

--
-- Drop table `khohang`
--
DROP TABLE IF EXISTS khohang;

--
-- Drop view `view_phieucam`
--
DROP VIEW IF EXISTS view_phieucam CASCADE;

--
-- Drop view `view_phieucam2`
--
DROP VIEW IF EXISTS view_phieucam2 CASCADE;

--
-- Drop table `phieucam`
--
DROP TABLE IF EXISTS phieucam;

--
-- Drop view `view_thuchi`
--
DROP VIEW IF EXISTS view_thuchi CASCADE;

--
-- Drop table `phieuthuchi`
--
DROP TABLE IF EXISTS phieuthuchi;

--
-- Drop view `view_phieuvay`
--
DROP VIEW IF EXISTS view_phieuvay CASCADE;

--
-- Drop view `view_phieuvay2`
--
DROP VIEW IF EXISTS view_phieuvay2 CASCADE;

--
-- Drop table `phieuvay`
--
DROP TABLE IF EXISTS phieuvay;

--
-- Drop table `chungtu`
--
DROP TABLE IF EXISTS chungtu;

--
-- Drop table `loaiphieuthuchi`
--
DROP TABLE IF EXISTS loaiphieuthuchi;

--
-- Drop view `view_user`
--
DROP VIEW IF EXISTS view_user CASCADE;

--
-- Drop table `taikhoan`
--
DROP TABLE IF EXISTS taikhoan;

--
-- Drop table `chucvu`
--
DROP TABLE IF EXISTS chucvu;

--
-- Drop table `nhomhanghoa`
--
DROP TABLE IF EXISTS nhomhanghoa;

--
-- Drop table `cachtinhlai`
--
DROP TABLE IF EXISTS cachtinhlai;

--
-- Drop table `nguoi`
--
DROP TABLE IF EXISTS nguoi;

--
-- Set default database
--
USE minhcuong;

--
-- Create table `nguoi`
--
CREATE TABLE nguoi (
  Id int(11) NOT NULL AUTO_INCREMENT,
  Ten varchar(255) DEFAULT NULL,
  Sdt varchar(255) DEFAULT NULL,
  SoCMT varchar(255) DEFAULT NULL,
  NgayCap varchar(255) DEFAULT NULL,
  NoiCap varchar(255) DEFAULT NULL,
  DiaChi varchar(255) DEFAULT NULL,
  PRIMARY KEY (Id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 17,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci;

--
-- Create table `cachtinhlai`
--
CREATE TABLE cachtinhlai (
  Id int(11) NOT NULL AUTO_INCREMENT,
  TenLai varchar(255) DEFAULT NULL,
  TiLeLai double DEFAULT NULL,
  KieuTinh varchar(255) DEFAULT NULL,
  QuyDoi double DEFAULT NULL,
  ChuThich varchar(255) DEFAULT NULL,
  PRIMARY KEY (Id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 4,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci;

--
-- Create table `nhomhanghoa`
--
CREATE TABLE nhomhanghoa (
  Id int(11) NOT NULL AUTO_INCREMENT,
  NhomHangHoa varchar(255) DEFAULT NULL,
  DonViTinh varchar(255) DEFAULT NULL,
  ChuThich varchar(255) DEFAULT NULL,
  PRIMARY KEY (Id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 7,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci;

--
-- Create table `chucvu`
--
CREATE TABLE chucvu (
  Id int(11) NOT NULL AUTO_INCREMENT,
  Ten varchar(255) DEFAULT NULL,
  QuyenMacDinh varchar(255) DEFAULT NULL,
  PRIMARY KEY (Id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 3,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci;

--
-- Create table `taikhoan`
--
CREATE TABLE taikhoan (
  Id int(11) NOT NULL AUTO_INCREMENT,
  TenTaiKhoan varchar(255) DEFAULT NULL,
  MatKhau varchar(255) DEFAULT NULL,
  ChucVuId int(11) DEFAULT NULL,
  QuyenHan longtext DEFAULT NULL,
  PRIMARY KEY (Id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 4,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci;

--
-- Create foreign key
--
ALTER TABLE taikhoan
ADD CONSTRAINT FK_taikhoan_ChucVuId FOREIGN KEY (ChucVuId)
REFERENCES chucvu (Id) ON DELETE NO ACTION;

--
-- Create view `view_user`
--
CREATE
DEFINER = 'root'@'localhost'
VIEW view_user
AS
SELECT
  `taikhoan`.`TenTaiKhoan` AS `TenTaiKhoan`,
  `taikhoan`.`MatKhau` AS `MatKhau`,
  `chucvu`.`Ten` AS `Ten`,
  `taikhoan`.`QuyenHan` AS `QuyenHan`
FROM (`taikhoan`
  JOIN `chucvu`
    ON (`taikhoan`.`ChucVuId` = `chucvu`.`Id`));

--
-- Create table `loaiphieuthuchi`
--
CREATE TABLE loaiphieuthuchi (
  Id int(11) NOT NULL AUTO_INCREMENT,
  Ten varchar(255) DEFAULT NULL,
  ChuThich varchar(255) DEFAULT NULL,
  PRIMARY KEY (Id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 3,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci;

--
-- Create table `chungtu`
--
CREATE TABLE chungtu (
  Id int(11) NOT NULL AUTO_INCREMENT,
  NguoiChungTu float DEFAULT NULL,
  NgayChungTu date DEFAULT NULL,
  PRIMARY KEY (Id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 37,
AVG_ROW_LENGTH = 2730,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci;

--
-- Create table `phieuvay`
--
CREATE TABLE phieuvay (
  Id int(11) NOT NULL AUTO_INCREMENT,
  ChungTuId int(11) DEFAULT NULL,
  NguoiId int(11) DEFAULT NULL,
  SoTien double DEFAULT NULL,
  CachTinhLaiId int(11) DEFAULT NULL,
  NgayVay date DEFAULT NULL,
  HanTra date DEFAULT NULL,
  NoiCatGiu varchar(255) DEFAULT NULL,
  NoiDung varchar(255) NOT NULL,
  TrangThai varchar(255) DEFAULT NULL,
  PRIMARY KEY (Id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 6,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci;

--
-- Create foreign key
--
ALTER TABLE phieuvay
ADD CONSTRAINT FK_phieuvay_CachTinhLaiId FOREIGN KEY (CachTinhLaiId)
REFERENCES cachtinhlai (Id) ON DELETE NO ACTION;

--
-- Create foreign key
--
ALTER TABLE phieuvay
ADD CONSTRAINT FK_phieuvay_ChungTuId FOREIGN KEY (ChungTuId)
REFERENCES chungtu (Id) ON DELETE NO ACTION;

--
-- Create foreign key
--
ALTER TABLE phieuvay
ADD CONSTRAINT FK_phieuvay_NguoiVayId FOREIGN KEY (NguoiId)
REFERENCES nguoi (Id) ON DELETE NO ACTION;

--
-- Create view `view_phieuvay2`
--
CREATE
DEFINER = 'root'@'localhost'
VIEW view_phieuvay2
AS
SELECT
  `phieuvay`.`SoTien` AS `SoTien`,
  `phieuvay`.`HanTra` AS `HanTra`,
  `phieuvay`.`NoiCatGiu` AS `NoiCatGiu`,
  `phieuvay`.`NoiDung` AS `NoiDung`,
  `cachtinhlai`.`TenLai` AS `TenLai`,
  `cachtinhlai`.`QuyDoi` AS `QuyDoi`,
  `phieuvay`.`NguoiId` AS `NguoiId`,
  `phieuvay`.`Id` AS `Id`
FROM (`phieuvay`
  JOIN `cachtinhlai`
    ON (`phieuvay`.`CachTinhLaiId` = `cachtinhlai`.`Id`));

--
-- Create view `view_phieuvay`
--
CREATE 
	DEFINER = 'root'@'localhost'
VIEW view_phieuvay
AS
	select `nguoi`.`Ten` AS `Ten`,`nguoi`.`SoCMT` AS `SoCMT`,`nguoi`.`Sdt` AS `Sdt`,`phieuvay`.`NgayVay` AS `NgayVay`,`phieuvay`.`HanTra` AS `HanTra`,`phieuvay`.`SoTien` AS `SoTien`,`cachtinhlai`.`QuyDoi` AS `QuyDoi`,to_days(curdate()) - to_days(`phieuvay`.`HanTra`) AS `NgayQuaHan`,`phieuvay`.`SoTien` / 1000000 * cast(to_days(curdate()) - to_days(`phieuvay`.`NgayVay`) as double) * `cachtinhlai`.`QuyDoi` AS `TongLai`,`nguoi`.`Id` AS `NguoiId`,`phieuvay`.`Id` AS `Id`,`phieuvay`.`TrangThai` AS `TrangThai` from ((`phieuvay` join `nguoi` on(`phieuvay`.`NguoiId` = `nguoi`.`Id`)) join `cachtinhlai` on(`phieuvay`.`CachTinhLaiId` = `cachtinhlai`.`Id`));

--
-- Create table `phieuthuchi`
--
CREATE TABLE phieuthuchi (
  Id int(11) NOT NULL AUTO_INCREMENT,
  LoaiPhieuId int(11) DEFAULT NULL,
  ChungTuId int(11) DEFAULT NULL,
  NguoiId int(11) DEFAULT NULL,
  Sotien double DEFAULT NULL,
  NoiDung varchar(255) DEFAULT NULL,
  PRIMARY KEY (Id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 6,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci;

--
-- Create foreign key
--
ALTER TABLE phieuthuchi
ADD CONSTRAINT FK_phieuthuchi_ChungTuId FOREIGN KEY (ChungTuId)
REFERENCES chungtu (Id) ON DELETE NO ACTION;

--
-- Create foreign key
--
ALTER TABLE phieuthuchi
ADD CONSTRAINT FK_phieuthuchi_LoaiPhieuId FOREIGN KEY (LoaiPhieuId)
REFERENCES loaiphieuthuchi (Id) ON DELETE NO ACTION;

--
-- Create foreign key
--
ALTER TABLE phieuthuchi
ADD CONSTRAINT FK_phieuthuchi_NguoiId FOREIGN KEY (NguoiId)
REFERENCES nguoi (Id) ON DELETE NO ACTION;

--
-- Create view `view_thuchi`
--
CREATE
DEFINER = 'root'@'localhost'
VIEW view_thuchi
AS
SELECT
  `loaiphieuthuchi`.`Ten` AS `LoaiPhieu`,
  `nguoi`.`Ten` AS `KhachHang`,
  `nguoi`.`Sdt` AS `Sdt`,
  `chungtu`.`NguoiChungTu` AS `NguoiChungTu`,
  `chungtu`.`NgayChungTu` AS `NgayLap`,
  `phieuthuchi`.`Sotien` AS `Sotien`,
  `phieuthuchi`.`NoiDung` AS `NoiDung`
FROM (((`phieuthuchi`
  JOIN `chungtu`
    ON (`phieuthuchi`.`ChungTuId` = `chungtu`.`Id`))
  JOIN `loaiphieuthuchi`
    ON (`phieuthuchi`.`LoaiPhieuId` = `loaiphieuthuchi`.`Id`))
  JOIN `nguoi`
    ON (`phieuthuchi`.`NguoiId` = `nguoi`.`Id`));

--
-- Create table `phieucam`
--
CREATE TABLE phieucam (
  Id int(11) NOT NULL AUTO_INCREMENT,
  ChungTuId int(11) DEFAULT NULL,
  NguoiId int(11) DEFAULT NULL,
  SoTien double DEFAULT NULL,
  CachTinhLaiId int(11) DEFAULT NULL,
  NgayVay date DEFAULT NULL,
  HanTra date DEFAULT NULL,
  NoiCatGiu varchar(255) DEFAULT NULL,
  NoiDung varchar(255) DEFAULT NULL,
  TrangThai varchar(255) DEFAULT NULL,
  PRIMARY KEY (Id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 14,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci;

--
-- Create index `FK_phieucam_NguoiVayId` on table `phieucam`
--
ALTER TABLE phieucam
ADD INDEX FK_phieucam_NguoiVayId (NguoiId);

--
-- Create foreign key
--
ALTER TABLE phieucam
ADD CONSTRAINT FK_phieucam_CachTinhLaiId FOREIGN KEY (CachTinhLaiId)
REFERENCES cachtinhlai (Id) ON DELETE NO ACTION;

--
-- Create foreign key
--
ALTER TABLE phieucam
ADD CONSTRAINT FK_phieucam_ChungTuId FOREIGN KEY (ChungTuId)
REFERENCES chungtu (Id) ON DELETE NO ACTION;

--
-- Create foreign key
--
ALTER TABLE phieucam
ADD CONSTRAINT FK_phieucam_Id FOREIGN KEY (NguoiId)
REFERENCES nguoi (Id) ON DELETE NO ACTION;

--
-- Create view `view_phieucam2`
--
CREATE
DEFINER = 'root'@'localhost'
VIEW view_phieucam2
AS
SELECT
  `phieucam`.`SoTien` AS `SoTien`,
  `phieucam`.`HanTra` AS `HanTra`,
  `phieucam`.`NoiCatGiu` AS `NoiCatGiu`,
  `phieucam`.`NoiDung` AS `NoiDung`,
  `cachtinhlai`.`TenLai` AS `TenLai`,
  `cachtinhlai`.`QuyDoi` AS `QuyDoi`,
  `phieucam`.`NguoiId` AS `NguoiId`,
  `phieucam`.`Id` AS `Id`
FROM (`phieucam`
  JOIN `cachtinhlai`
    ON (`phieucam`.`CachTinhLaiId` = `cachtinhlai`.`Id`));

--
-- Create view `view_phieucam`
--
CREATE
DEFINER = 'root'@'localhost'
VIEW view_phieucam
AS
SELECT
  `nguoi`.`Ten` AS `Ten`,
  `nguoi`.`SoCMT` AS `SoCMT`,
  `nguoi`.`Sdt` AS `Sdt`,
  `phieucam`.`NgayVay` AS `NgayVay`,
  `phieucam`.`HanTra` AS `HanTra`,
  `phieucam`.`SoTien` AS `SoTien`,
  `cachtinhlai`.`QuyDoi` AS `QuyDoi`,
  TO_DAYS(CURDATE()) - TO_DAYS(`phieucam`.`HanTra`) AS `NgayQuaHan`,
  `phieucam`.`SoTien` / 1000000 * (TO_DAYS(CURDATE()) - TO_DAYS(`phieucam`.`NgayVay`)) * `cachtinhlai`.`QuyDoi` AS `TongLai`,
  `nguoi`.`Id` AS `NguoiId`,
  `phieucam`.`Id` AS `Id`,
  `phieucam`.`TrangThai` AS `TrangThai`
FROM ((`phieucam`
  JOIN `cachtinhlai`
    ON (`phieucam`.`CachTinhLaiId` = `cachtinhlai`.`Id`))
  JOIN `nguoi`
    ON (`phieucam`.`NguoiId` = `nguoi`.`Id`));

--
-- Create table `khohang`
--
CREATE TABLE khohang (
  Id int(11) NOT NULL AUTO_INCREMENT,
  NhomId int(11) DEFAULT NULL,
  PhieuCamId int(11) DEFAULT NULL,
  TrangThai varchar(255) DEFAULT NULL,
  TenHang varchar(255) DEFAULT NULL,
  SoLuong int(11) DEFAULT NULL,
  DinhGia double DEFAULT NULL,
  ChuThich varchar(255) DEFAULT NULL,
  PRIMARY KEY (Id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 12,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci;

--
-- Create foreign key
--
ALTER TABLE khohang
ADD CONSTRAINT FK_hangcam_NhomId FOREIGN KEY (NhomId)
REFERENCES nhomhanghoa (Id) ON DELETE NO ACTION;

--
-- Create foreign key
--
ALTER TABLE khohang
ADD CONSTRAINT FK_hangcam_PhieuCamId FOREIGN KEY (PhieuCamId)
REFERENCES phieucam (Id) ON DELETE NO ACTION;

--
-- Create view `view_khohangg`
--
CREATE
DEFINER = 'root'@'localhost'
VIEW view_khohangg
AS
SELECT
  `khohang`.`Id` AS `Id`,
  `khohang`.`TenHang` AS `TenHang`,
  `khohang`.`SoLuong` AS `SoLuong`,
  `nhomhanghoa`.`NhomHangHoa` AS `NhomHangHoa`,
  `nhomhanghoa`.`DonViTinh` AS `DonViTinh`,
  `khohang`.`DinhGia` AS `DinhGia`,
  `khohang`.`ChuThich` AS `ChuThich`,
  `khohang`.`TrangThai` AS `TrangThai`
FROM (`khohang`
  JOIN `nhomhanghoa`
    ON (`khohang`.`NhomId` = `nhomhanghoa`.`Id`));

--
-- Create view `view_khohang`
--
CREATE
DEFINER = 'root'@'localhost'
VIEW view_khohang
AS
SELECT
  `khohang`.`Id` AS `Id`,
  `khohang`.`PhieuCamId` AS `PhieuCamId`,
  `nhomhanghoa`.`NhomHangHoa` AS `NhomHangHoa`,
  `khohang`.`TenHang` AS `TenHang`,
  `nhomhanghoa`.`DonViTinh` AS `DonViTinh`,
  `khohang`.`SoLuong` AS `SoLuong`,
  `khohang`.`DinhGia` AS `DinhGia`,
  `khohang`.`ChuThich` AS `ChuThich`
FROM (`khohang`
  JOIN `nhomhanghoa`
    ON (`khohang`.`NhomId` = `nhomhanghoa`.`Id`));

--
-- Create table `lichsu`
--
CREATE TABLE lichsu (
  Id int(11) NOT NULL AUTO_INCREMENT,
  Loai varchar(255) DEFAULT NULL,
  SoTien double DEFAULT NULL,
  NguonGoc varchar(255) DEFAULT NULL,
  ThoiGian date DEFAULT NULL,
  NguoiThucHien varchar(255) DEFAULT NULL,
  PRIMARY KEY (Id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 14,
AVG_ROW_LENGTH = 1260,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci;

-- 
-- Dumping data for table chucvu
--
INSERT INTO chucvu VALUES
(1, 'Admin', NULL),
(2, 'Nhân viên', NULL);

-- 
-- Dumping data for table cachtinhlai
--
INSERT INTO cachtinhlai VALUES
(1, 'Cách tính lãi 1', 2500, 'Nghìn/Triệu/Ngày', 2500, '2.5k/Ngày/Triệu'),
(3, 'Cách tính lãi 2', 2.5, '%/Tháng', 833.3, '2.5% tháng');

-- 
-- Dumping data for table nguoi
--
INSERT INTO nguoi VALUES
(13, 'Nguyễn Văn A', '0969696969', '123456789', '2019/10/30', 'Hải Phòng', 'An Dương'),
(14, 'Nguyễn Thi B', '096666666', '987654321', '2019/10/30', 'Hà Nội', 'Hà Đông'),
(15, 'Lò Thị Vi Sóng', '03133355', '456987123', '2019/10/30', 'Hải Phòng', 'An Dương'),
(16, 'Check Thử Gia Han', '999999999', '1', '2019/10/30', 'abc', 'abc');

-- 
-- Dumping data for table loaiphieuthuchi
--
INSERT INTO loaiphieuthuchi VALUES
(1, 'Phiếu thu', 'Các khoản thu bên ngoài'),
(2, 'Phiếu chi', 'Các khoản chi bên ngoài');

-- 
-- Dumping data for table chungtu
--
INSERT INTO chungtu VALUES
(31, 1, '2019-10-30'),
(32, 1, '2019-10-30'),
(33, 1, '2019-10-30'),
(34, 1, '2019-10-30'),
(35, 1, '2019-10-30'),
(36, 1, '2019-10-30');

-- 
-- Dumping data for table phieucam
--
INSERT INTO phieucam VALUES
(12, 31, 13, 100000000, 1, '2019-10-30', '2019-11-01', 'Cơ sở 1', 'Vay cầm đồ', 'Bình thường'),
(13, 35, 16, 100000000, 1, '2019-10-30', '2019-11-29', 'abc', 'acb', 'Đã thanh toán');

-- 
-- Dumping data for table nhomhanghoa
--
INSERT INTO nhomhanghoa VALUES
(4, 'Xe cộ', 'cái', 'cách loại xe cộ'),
(5, 'Giấy tờ', 'bộ', 'sổ đỏ, sổ lương'),
(6, 'Vàng', 'chỉ', 'Tính theo chỉ');

-- 
-- Dumping data for table taikhoan
--
INSERT INTO taikhoan VALUES
(1, '1', '1', 1, NULL),
(3, 'nv', 'nv', 2, NULL);

-- 
-- Dumping data for table phieuvay
--
INSERT INTO phieuvay VALUES
(4, 32, 14, 30000000, 1, '2019-10-30', '2019-11-09', 'Cơ sở 1', 'Vay tiền', 'Bình thường'),
(5, 36, 16, 100000000, 1, '2019-10-25', '2019-11-29', 'acb', 'sdvsd', 'Đã thanh toán');

-- 
-- Dumping data for table phieuthuchi
--
INSERT INTO phieuthuchi VALUES
(4, 1, 33, 15, 10000000, 'Trả tiền abc'),
(5, 2, 34, 15, 5000000, 'Thu tiền nhà');

-- 
-- Dumping data for table lichsu
--
INSERT INTO lichsu VALUES
(1, 'Chi', 100000000, 'Cho Nguyễn Văn A cầm đồ', '2019-10-30', '1'),
(2, 'Chi', 30000000, 'Cho Nguyễn Thi Bvay tiền', '2019-10-30', '1'),
(3, 'Thu', 10000000, 'Phiếu thu của Lò Thị Vi Sóng', '2019-10-30', '1'),
(4, 'Chi', 5000000, 'Phiếu chi của Lò Thị Vi Sóng', '2019-10-30', '1'),
(5, 'Chi', 1000000, 'Nhâp hàng vào kho', '2019-10-30', '1'),
(6, 'Chi', 15000000, 'Nhâp hàng vào kho', '2019-10-30', '1'),
(7, 'Thu', 15000000, 'Thanh lý hàng trong kho', '2019-10-30', '1'),
(8, 'Chi', 100000000, 'Cho Check Thử Gia Han cầm đồ', '2019-10-30', '1'),
(9, 'Chi', 100000000, 'Cho Check thử Gia hạnvay tiền', '2019-10-30', '1'),
(10, 'Thu', 7250000, 'Gia hạn phiếu vay của Check Thử Gia Han', '2019-10-30', '1'),
(11, 'Thu', 7250000, 'Gia hạn phiếu cầm của Check Thử Gia Han', '2019-10-30', '1'),
(12, 'Thu', 100000000, 'Thanh toán phiếu cầm của Check Thử Gia Han', '2019-10-30', '1'),
(13, 'Thu', 101250000, 'Thanh toán phiếu vay của Check Thử Gia Han', '2019-10-30', '1');

-- 
-- Dumping data for table khohang
--
INSERT INTO khohang VALUES
(8, 4, 12, 'Hàng khách cầm', 'Ô tô', 1, 50000000, 'Phiếu cầm của Nguyễn Văn A'),
(9, 4, NULL, 'Hàng mua ngoài', 'Giấc mơ Trung Hoa', 1, 1000000, 'Hàng mua bên ngoài bởi 1'),
(10, 4, NULL, 'Đã thanh lý', 'Ex', 1, 15000000, 'Hàng mua bên ngoài bởi 1'),
(11, 6, 13, 'Khách đã chuộc', 'Nhẫn', 1, 4000000, 'Phiếu cầm của Check Thử Gia Han');

-- 
-- Restore previous SQL mode
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Enable foreign keys
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;