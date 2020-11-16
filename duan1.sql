﻿CREATE DATABASE duan1_final
GO
USE duan1_final
GO

CREATE TABLE NHANVIEN
(
	MANV NVARCHAR(15) PRIMARY KEY NOT NULL,
	MATKHAU NVARCHAR(50) NOT NULL,
	TENNV NVARCHAR(50) NOT NULL,
	DIACHI NVARCHAR(50) NULL,
	SDT NVARCHAR(20) NOT NULL,
	VAITRO BIT NOT NULL DEFAULT 0,
	NGAYSINH DATE NOT NULL,
	EMAIL NVARCHAR(50) NULL,
);

CREATE TABLE KHACHHANG
(
	MAKH INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	TENKH NVARCHAR(50) NOT NULL,
	DIACHI NVARCHAR(100) NULL,
	SDT NVARCHAR(20) NOT NULL,
	NGAYSINH DATE NULL,
	EMAIL NVARCHAR(50) NULL,
	GIOITINH BIT NOT NULL DEFAULT 0
);



CREATE TABLE NHACUNGCAP 
(
	MANCC NVARCHAR(15) PRIMARY KEY NOT NULL,
	TENNCC NVARCHAR(50) NOT NULL,
	SDT NVARCHAR(20) NOT NULL,
	DIACHI NVARCHAR(100) NOT NULL,
);

CREATE TABLE LOAISANPHAM
(
	MALOAI NVARCHAR(15) PRIMARY KEY NOT NULL,
	TENLOAI NVARCHAR(50) NOT NULL,
);

CREATE TABLE SANPHAM
(
	MASP INT  PRIMARY KEY  IDENTITY(1000,1) NOT NULL,
	TENSP NVARCHAR(100) NOT NULL,
	GIA FLOAT NOT NULL,
	SOLUONG INT NOT NULL,
	HINH NVARCHAR(100) NULL,
	MOTA NVARCHAR(100) NULL,
	MANCC NVARCHAR(15) NOT NULL,
	MALOAI NVARCHAR(15) NOT NULL,
	FOREIGN KEY (MANCC) REFERENCES NHACUNGCAP(MANCC) ON UPDATE CASCADE,
	FOREIGN KEY (MALOAI) REFERENCES LOAISANPHAM(MALOAI) ON UPDATE CASCADE, 
	UNIQUE(TENSP),
	CHECK(GIA > 0 AND SOLUONG > 0)
);

CREATE TABLE THANHTOAN
(
	MATT BIT NOT NULL PRIMARY KEY,
	TENTT NVARCHAR(50) NOT NULL,	

);
 
CREATE TABLE DONHANG
(
	MADH INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	NGAYMUA DATE NOT NULL default getdate(),
	MAKH INT NOT NULL,
	MATT BIT NOT NULL,
	MANV NVARCHAR(15) NOT NULL,

	FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH) ON UPDATE CASCADE,
	FOREIGN KEY (MATT) REFERENCES THANHTOAN(MATT) ON UPDATE CASCADE,
	FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV) ON UPDATE CASCADE,

);


CREATE TABLE CHITIETDONHANG
(
	MADH INT NOT NULL,
	MASP INT NOT NULL,
	SOLUONG INT NOT NULL,
	GIA FLOAT NOT NULL,

	PRIMARY KEY (MADH,MASP),
	FOREIGN KEY (MADH) REFERENCES DONHANG(MADH) ON UPDATE CASCADE,
	FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP) ON UPDATE CASCADE,
);

INSERT INTO NHANVIEN VALUES('PHUCVH','123',N'VŨ HOÀNG PHÚC',N'ĐỒNG THÁP','0969141969',1,'2001-11-09','PHUCVHPS12860@FPT.EDU.VN')
INSERT INTO NHANVIEN VALUES('DATHX','123',N'HOÀNG XUÂN ĐẠT',N'ĐĂK LĂK','0393688714',1,'2001-06-21','DATHXPS12656@FPT.EDU.VN')
INSERT INTO NHANVIEN VALUES('VUONGNM','123',N'NGUYỄN MINH VƯƠNG',N'PHAN THIẾT','000000000',1,'2001-05-08','VUONGNMPS12651@FPT.EDU.VN')
INSERT INTO NHANVIEN VALUES('DIEMPHUOC','123',N'QUÁCH DIÊM PHƯỚC',N'TP HCM','0963230016',1,'2001-11-04','DIEMPHUOC@FPT.EDU.VN')
INSERT INTO NHANVIEN VALUES('BOSS','123',N'NGUYỄN VĂN TÈO',N'TP HCM','0123456781',0,'2001-12-05','TEOBOSS@FPT.EDU.VN')


INSERT INTO NHACUNGCAP VALUES('SS01','SAMSUNG','02839157310',N'Số 2, đường Hải Triều, Phường Bến Nghé, Quận 1, TP.HCM')
INSERT INTO NHACUNGCAP VALUES('AP01','APPLE','02873000911',N'Số 72B Đinh Tiên Hoàng, P. Đa Kao, Quận 1,TP.HCM')
INSERT INTO NHACUNGCAP VALUES('OP01','OPPO','1800577776',N' 27 Đường Nguyễn Trung Trực, Phường Bến Thành, Quận 1, TP.HCM')
INSERT INTO NHACUNGCAP VALUES('AS01','ASUS','18006588',N'Hẻm 285 Cách Mạng Tháng Tám, Phường 12, Quận 10, TP.HCM')
INSERT INTO NHACUNGCAP VALUES('AC01','ACER','19002655',N' Số 27 đường Cổ Linh, Long Biên, Hà Nội')
INSERT INTO NHACUNGCAP VALUES('HW01','HUAWEI','18001085',N'30 Bờ Bao Tân Thắng, Sơn Kỳ, Tân Phú, TP.HCM')
INSERT INTO NHACUNGCAP VALUES('XM01','XIAOMI','0326175888',N'Số 31L Láng Hạ, Chợ Dừa, Ba Đình, Hà Nội ')
INSERT INTO NHACUNGCAP VALUES('HP01','HP','1800588868',N'9 Lê Duẩn, Bến Nghé, Quận 1, TP.HCM')
INSERT INTO NHACUNGCAP VALUES('DL01','DELL','02363653848',N'36 Hàm Nghi, P. Thạc Gián, Q.Thanh Khê, Đà Nẵng')
INSERT INTO NHACUNGCAP VALUES('VM01','VSMART','1900636420',N'22 Nguyễn Đình Khơi, Phường 4, Tân Bình, TP.HCM')
INSERT INTO NHACUNGCAP VALUES('SN01','SONY','0909636798',N'163 Quang Trung, Phường 10, Gò Vấp, TP.HCM')
INSERT INTO NHACUNGCAP VALUES('LN01','LENOVO','1900555567',N'343 Trần Khát Chân, Thanh Nhàn, Hai Bà Trưng, Hà Nội')
INSERT INTO NHACUNGCAP VALUES('NK01','NOKIA','02439445826',N'179 Bà Triệu, Quận Hoàn Kiếm, Hàng Bài, Hoàn Kiếm, Hà Nội')
INSERT INTO NHACUNGCAP VALUES('MS01','MSI','0935868913',N'264 Nguyễn Thị Minh Khai Phường 6 Quận 3, TP.HCM')


INSERT INTO LOAISANPHAM VALUES('DT01',N'ĐIỆN THOẠI'),
							  ('PK01',N'PHỤ KIỆN'),
							  ('LT01',N'LAPTOP'),
							  ('TB01',N'MÁY TÍNH BẢNG')




-- SAMSUNG--
-- ĐIỆN THOẠI
INSERT INTO SANPHAM VALUES('GALAXY NOTE 20',14000000,40,'NOTE20.png',N'','SS01','DT01')
INSERT INTO SANPHAM VALUES('Galaxy A21s',4390000,25,'A21S.png',N'','SS01','DT01')
INSERT INTO SANPHAM VALUES('Galaxy A11',3140000,65,'A11.png',N'Giảm ngay 35% Samsung Watch Active 2 khi mua kèm điện thoại Samsung','SS01','DT01')
INSERT INTO SANPHAM VALUES('Galaxy Note 20 Ultra',24990000,52,'NOTE20UNTRAL.png',N'','SS01','DT01')
INSERT INTO SANPHAM VALUES('Galaxy Z Fold2 5G',50000000,10,'fold5G.png',N'','SS01','DT01')
INSERT INTO SANPHAM VALUES('Galaxy Note 10 Lite',9740000,48,'note10-lite.png',N'','SS01','DT01')
INSERT INTO SANPHAM VALUES('Galaxy Z Flip',29000000,54,'ss-Z-flip.png',N'','SS01','DT01')
INSERT INTO SANPHAM VALUES('Galaxy M31',5490000,18,'ss-m31.png',N'','SS01','DT01')
INSERT INTO SANPHAM VALUES('Galaxy A71',8990000,17,'ss-a71.png',N'','SS01','DT01')
INSERT INTO SANPHAM VALUES('Galaxy A51',7490000,19,'ss-a51.png',N'','SS01','DT01')
INSERT INTO SANPHAM VALUES('Galaxy A30s',4290000,87,'ss-a30s.png',N'','SS01','DT01')
INSERT INTO SANPHAM VALUES('Galaxy A20',3540000,58,'ss-galaxy-a20.png',N'','SS01','DT01')
INSERT INTO SANPHAM VALUES('Galaxy A10s',3140000,49,'SS-a10s.png',N'','SS01','DT01')
INSERT INTO SANPHAM VALUES('Galaxy A01 Core',1990000,87,'ss-a01-core.png',N'','SS01','DT01')

-- LAPTOP
INSERT INTO SANPHAM VALUES('ATIV Book 9 Lite',15000000,4,'ATIV_Book_9_Lite.jpg',N'','SS01','LT01')
-- PHỤ KIỆN
INSERT INTO SANPHAM VALUES(N'Tai nghe Galaxy Buds Live',3290000,200,'samsung-buds-live.jpg',N'','SS01','PK01')
INSERT INTO SANPHAM VALUES('Tai nghe Galaxy Buds+',3990000,32,'',N'gbuds+.jpg','SS01','PK01')
INSERT INTO SANPHAM VALUES('Tai nghe Samsung C&T ItFit Bluetooth',1100000,80,'c&t_itfit.jpg',N'','SS01','PK01')
INSERT INTO SANPHAM VALUES(N'Chuột SAMSUNG H200',120000,120,'Ch200.jpg',N'Thiết kế dành riêng cho game thủ. Cảm biến quang học hiện đại','SS01','PK01')
INSERT INTO SANPHAM VALUES(N'Loa Tháp Samsung MX-T70/XV',7920000,4,'mx_t70_xv.jpg',N'','SS01','PK01')
INSERT INTO SANPHAM VALUES(N'Loa thanh Samsung HW-T420',2790000,15,'hw-t420-2.jpg',N'','SS01','PK01')

-- MÁY TÍNH BẢNG
INSERT INTO SANPHAM VALUES('Galaxy Tab S7',179900000,14,'tab-s7.png',N'Trả góp 0%','SS01','TB01')
INSERT INTO SANPHAM VALUES('Galaxy Tab A7 (2020)',79900000,114,'tab-a7.png',N'Giảm ngay 500,000đ (Quà tặng Galaxy)','SS01','TB01')
INSERT INTO SANPHAM VALUES('Galaxy Tab A8 (2019)',3690000,150,'tab-a8-2019.png',N'Thu cũ đổi mới - Trợ giá ngay 15%','SS01','TB01')
INSERT INTO SANPHAM VALUES('Tab A 10.1 (2019)',7490000,144,'tab-a-101.png',N'Trả góp 0%','SS01','TB01')
INSERT INTO SANPHAM VALUES('Galaxy Tab A Plus 8.0 (2019)',6990000,24,'tab-a-plus-8.png',N'Trả góp 0%','SS01','TB01')
INSERT INTO SANPHAM VALUES('Galaxy Tab S6 Lite',9990000,24,'tab-s6-lite.png',N'Trả góp 0%','SS01','TB01')


--APPLE--
-- ĐIỆN THOẠI
INSERT INTO SANPHAM VALUES('iPhone 12',24900000,40,'IP12.jpg',N'','AP01','DT01')
INSERT INTO SANPHAM VALUES('iPhone 12 Pro Xax',33900000,42,'IP12PROMAX.jpg',N'','AP01','DT01')
INSERT INTO SANPHAM VALUES('iPhone 11 Pro Max 64GB',27900000,14,'IP11PROMAX64.png',N'','AP01','DT01')
INSERT INTO SANPHAM VALUES('iPhone 11 Pro Max 512GB',33990000,19,'IP11PROMAX512.png',N'','AP01','DT01')
INSERT INTO SANPHAM VALUES('iPhone 11 64GB',17900000,33,'IP1164.png',N'','AP01','DT01')
INSERT INTO SANPHAM VALUES('iPhone XR 64GB',13900000,45,'IP-XR.jpg',N'','AP01','DT01')
INSERT INTO SANPHAM VALUES('iPhone 8 Plus 64GB',13490000,120,'IP8+64.jpg',N'','AP01','DT01')
INSERT INTO SANPHAM VALUES('iPhone 8 Plus 128GB',13990000,200,'IP8+128.png',N'','AP01','DT01')
INSERT INTO SANPHAM VALUES('iPhone 7 Plus',9990000,120,'IP7+.png',N'','AP01','DT01')
INSERT INTO SANPHAM VALUES('iPhone 6 Plus',7790000,140,'IP6+.png',N'','AP01','DT01')
INSERT INTO SANPHAM VALUES('iPhone SE (2020) 64GB',11490000,200,'IPSE64.png',N'','AP01','DT01')

--LAPTOP
INSERT INTO SANPHAM VALUES(N'MacBook Pro 16" 2019 Touch Bar 2.3GHz Core i9 1TB',69990000,40,'PRO_16_2019.png',N'','AP01','LT01')
INSERT INTO SANPHAM VALUES(N'MacBook Pro 13" 2020 Touch Bar 2.0GHz Core i5 512GB',47990000,140,'PRO_16_2019.png',N'','AP01','LT01')
INSERT INTO SANPHAM VALUES(N'MacBook Air 2017 i5 1.8GHz/8GB/128GB',18900000,270,'AIR2017.jpg',N'','AP01','LT01')
INSERT INTO SANPHAM VALUES(N'MacBook Air 2020 i3 1.1GHz 8GB/256GB',28980000,45,'AIR2020.jpg',N'','AP01','LT01')
INSERT INTO SANPHAM VALUES(N'MacBook Air 13" 2017 1.8GHz Core i5 128GB',19900000,24,'AIR_13_2017.jpg',N'','AP01','LT01')
INSERT INTO SANPHAM VALUES(N'MacBook Air 13" 2020 1.1GHz Core i3 256GB',28990000,120,'AIR_13_2020.png',N'','AP01','LT01')
INSERT INTO SANPHAM VALUES(N'MacBook Pro 13" 2019 Touch Bar 2.4GHz Core i5 256GB',41000000,190,'PRO-13-2019.png',N'','AP01','LT01')

--PHỤ KIỆN
INSERT INTO SANPHAM VALUES(N'Tai nghe AirPods Pro',6990000,415,'AIRPODS-PRO.jpg',N'','AP01','PK01')
INSERT INTO SANPHAM VALUES(N'Tai nghe AirPods 2 hộp sạc dây',3990000,45,'AirPods2.jpg',N'','AP01','PK01')
INSERT INTO SANPHAM VALUES(N'Tai nghe Bluetooth Powerbeats S3 Black-Red',3990000,120,'Powerbeats-S3.jpg',N'','AP01','PK01')
INSERT INTO SANPHAM VALUES(N'Tai nghe bluetooth BeatsX Black',3390000,210,'BEATSX-BLACK.jpg',N'','AP01','PK01')
INSERT INTO SANPHAM VALUES(N'Tai nghe AirPods 2 hộp sạc không dây',5900000,150,'AirPods2_KODAY.jpg',N'','AP01','PK01')
INSERT INTO SANPHAM VALUES(N'Dây sạc Apple Watch Magnetic Charging Cable (1 m)',790000,240,'Apple-Watch-Magnetic-Charging-Cable.jpg',N'','AP01','PK01')
INSERT INTO SANPHAM VALUES(N'Hộp sạc không dây AirPods',1990000,251,'SAC_AIRPODS2.jpg',N'','AP01','PK01')
INSERT INTO SANPHAM VALUES(N'Sạc 18W USB-C Power Adapter',790000,62,'SAC-18W-Adapter.jpg',N'','AP01','PK01')
INSERT INTO SANPHAM VALUES(N'Sạc 87W USB-C Power Adapter',2490000,47,'SAC-87W-USB-C-Power-Adapter.jpg',N'','AP01','PK01')
INSERT INTO SANPHAM VALUES(N'Cáp chuyển đổi Lightning to 3.5mm',290000,300,'Apple-Watch-Magnetic-Charging-Cable.jpg',N'','AP01','PK01')

-- MÁY TÍNH BẢNG
INSERT INTO SANPHAM VALUES(N'iPad Pro 12.9 2020 WI-FI 4G',31990000,215,'ipad-pro-129-wf-4g.png',N'','AP01','TB01')
INSERT INTO SANPHAM VALUES(N'iPad Pro 12.9 2020 WI-FI',27990000,24,'ipad-pro-129-wf.png',N'','AP01','TB01')
INSERT INTO SANPHAM VALUES(N'iPad Pro 11 2020 WI-FI 4G',25900000,35,'ipad-pro-11-wf-4g',N'','AP01','TB01')
INSERT INTO SANPHAM VALUES(N'iPad Pro 11 WI-FI 512GB',31990000,225,'ipad-pro-11-wi-fi.png',N'','AP01','TB01')
INSERT INTO SANPHAM VALUES(N'iPad Mini 5 7.9 Wi-Fi 4G',18990000,34,'ipad-mini5-4g.png',N'','AP01','TB01')
INSERT INTO SANPHAM VALUES(N'iPad 2019 10.2 Wi-Fi + 4G',13990000,215,'ipad-wifi-4g-2019.png',N'','AP01','TB01')
INSERT INTO SANPHAM VALUES(N'iPad 2018 Wi-fi 4G',11490000,155,'ipad-2018-4G.jpg',N'','AP01','TB01')
INSERT INTO SANPHAM VALUES(N'iPad 10.2 2020 Wi-Fi',9990000,144,'ipad-2020-10-2-wi-fi.png',N'','AP01','TB01')
INSERT INTO SANPHAM VALUES(N'iPad Air 10.9 2020 Wi-Fi + Cellular',20990000,77,'ipad-air-10-9-2020.png',N'','AP01','TB01')


--OPPO-
--DIỆN THOẠI
INSERT INTO SANPHAM VALUES(N'Oppo A53 4GB-128GB',4090000,55,'oppo-a53.png',N'','OP01','DT01')
INSERT INTO SANPHAM VALUES(N'OPPO Reno4',8490000,78,'oppo-reno4.png',N'','OP01','DT01')
INSERT INTO SANPHAM VALUES(N'OPPO A93 8GB-128GB',7490000,78,'oppo-A93.png',N'','OP01','DT01')
INSERT INTO SANPHAM VALUES(N'Oppo A52 6GB-128GB',5690000,47,'oppo-a52.png',N'','OP01','DT01')
INSERT INTO SANPHAM VALUES(N'Oppo Reno4 Pro',11990000,125,'oppo-reno4-pro.png',N'','OP01','DT01')
INSERT INTO SANPHAM VALUES(N'OPPO A92',6490000,478,'oppo-a92.png',N'','OP01','DT01')
INSERT INTO SANPHAM VALUES(N'Oppo Reno3 8GB-128GB',6990000,55,'reno-3.png',N'','OP01','DT01')
INSERT INTO SANPHAM VALUES(N'Oppo A12 3GB-32GB',2990000,85,'oppo-a12.png',N'','OP01','DT01')
INSERT INTO SANPHAM VALUES(N'Oppo A31 4GB-128GB',4490000,95,'oppo-a31.png',N'','OP01','DT01')

-- LAPTOP

-- PHỤ KIỆN
INSERT INTO SANPHAM VALUES(N'Tai Nghe Bluetooth True Wireless Oppo Enco W31',1190000,47,'taingheOPPO.png',N'','OP01','PK01')
--MÁY TÍNH BẢNG

--ASUS--
-- ĐIỆN THOẠI
INSERT INTO SANPHAM VALUES(N'ASUS ROG Phone 3',22990000,5,'asus-rog-phone-3-1.png',N'','AS01','DT01')
INSERT INTO SANPHAM VALUES(N'Asus Zenfone 4 Max (2018)',1990000,50,'asus-zenfone-4-max-2018-1o.jpg',N'','AS01','DT01')
INSERT INTO SANPHAM VALUES(N'Asus Zenfone 5 (ZE620KL)',7990000,17,'asus-zenfone-5-den-1.png',N'','AS01','DT01')
INSERT INTO SANPHAM VALUES(N'Asus Zenfone Max Plus M1 2018',2699000,57,'asus-zenfone-max-plus-m1.png',N'','AS01','DT01')
--LAPTOP
INSERT INTO SANPHAM VALUES(N'Asus Vivobook X409JA-EK237T i3 1005G1/4GB/Win 10',10190000,38,'asus-vivobook-x409fa.png',N'','AS01','LT01')
INSERT INTO SANPHAM VALUES(N'Asus Vivobook A412DA EK347T R3 3200U/4GB/512GB/WIN10',11090000,54,'asus-vivobook-a412-1.png',N'','AS01','LT01')
INSERT INTO SANPHAM VALUES(N'Asus Vivobook D409DA EK110T R3 3200U/4GB/256GB SSD/WIN10',9490000,100,'asus-vivobook-d409.jpg',N'','AS01','LT01')
INSERT INTO SANPHAM VALUES(N'Asus Vivobook A412DA EK612T R3 3250U/4GB/512GB SSD/14.0',11290000,95,'asus-vivobook-a412da.png',N'','AS01','LT01')
INSERT INTO SANPHAM VALUES(N'Asus TUF FX505DT HN478T R7 3750H/8GB/512GB SSD/Win10',19490000,56,'asus-tuf-fx505dt-1.png',N'','AS01','LT01')
INSERT INTO SANPHAM VALUES(N'Asus Vivobook D509DA-EJ448T R3 3200U/4G/512GB SSD/Win 10',10290000,100,'asus-vivobook-d509.jpg',N'','AS01','LT01')
INSERT INTO SANPHAM VALUES(N'Asus Vivobook S531FA BQ104T i5 8265U/8GB/512GB SSD/WIN10',17290000,48,'asus-vivobook-s531.png',N'','AS01','LT01')
INSERT INTO SANPHAM VALUES(N'Asus TUF FA506II AL016T R7 4800H/8GB/512G /15.6 FHD/WIN10',23890000,348,'asus-tuf-fa506-144.png',N'','AS01','LT01')
INSERT INTO SANPHAM VALUES(N'ASUS Expertbook B9450FA BM0324T i5 10210U/8GB/512GB SSD/Win10',37900000,36,'asus-expertbook-b9450fa.jpg',N'','AS01','LT01')
INSERT INTO SANPHAM VALUES(N'ASUS Expertbook B9450FA BM0616R i7 10510U/16GB /1TB SSD/Win10',49990000,47,'asus-expertbook-b9450fa.png',N'','AS01','LT01')
INSERT INTO SANPHAM VALUES(N'Asus Strix G531GT HN553T i5 9300H/8GB/512G SSD/Win10',22890000,41,'asus-strix-g531gt.png',N'','AS01','LT01')
INSERT INTO SANPHAM VALUES(N'Asus Vivobook E210MA GJ083T/N4020/4GB/128GB eMMC/11.6''/Win10',5990000,471,'asus-vivobook-e210ma.jpg',N'','AS01','LT01')
INSERT INTO SANPHAM VALUES(N'Asus TUF FA506IH AL018T R5 4600H/8GB/512GB SSD/15.6" FHD 144Hz',20290000,65,'asus-tuf-fa506.png',N'','AS01','LT01')
INSERT INTO SANPHAM VALUES(N'Asus TUF FX505DT HN488T R5 3550H/8GB/512GB SSD/Nvidia GTX1650_4G/WIN10',18990000,47,'asus-tuf-fx505dt.png',N'','AS01','LT01')
INSERT INTO SANPHAM VALUES(N'Asus Zephyrus Duo GX550LWS-HF102T I7',79990000,8,'asus-zephyrus-duo-gx550-1.png',N'','AS01','LT01')
INSERT INTO SANPHAM VALUES(N'Asus ZenBook Duo UX481FL BM048T i5 10210U/8GB/512GB SSD/WIN10',30990000,14,'asus-zephyrus-duo-gx550-1.png',N'','AS01','LT01')
--PHỤ KIỆN
INSERT INTO SANPHAM VALUES(N'Chuột game Asus CERBERUS',455000,145,'asus-cerberus-mouse.jpg',N'','AS01','PK01')
INSERT INTO SANPHAM VALUES(N'Tai nghe choàng đầu Asus CERBERUS/BLK/ALW/AS',1470000,45,'TAINGHE_CERBERUS.jpg',N'','AS01','PK01')
INSERT INTO SANPHAM VALUES(N'Kính cường lực Asus Zen 4 Max Pro Black',50000,125,'KINHCUONGLUC.jpg',N'','AS01','PK01')

-- MÁY TÍNH BẢNG
INSERT INTO SANPHAM VALUES(N'Asus Memo Pad 8 ME581CL',5990000,145,'Memo-Pad-8-ME581CL.jpg',N'','AS01','TB01')
INSERT INTO SANPHAM VALUES(N'Asus Zenpad 8 Z380',5990000,100,'Asus-Zenpad-8-Z380.jpg',N'','AS01','TB01')
INSERT INTO SANPHAM VALUES(N'Asus ZenPad Z370CG',3990000,17,'asus-zenpad-7-z370c.jpg',N'','AS01','TB01')
INSERT INTO SANPHAM VALUES(N'ZenPad Z170CG 1A022A/1B014A',2790000,25,'zenpad-170cG.jpg',N'','AS01','TB01')


--ACER--
--ĐIỆN THOẠI

-- LAPTOP
INSERT INTO SANPHAM VALUES(N'Acer Aspire 3 A315 23 R0ML R3 3250U/4GB/512GB/15.6"FHD/Win 10',10140000,174,'acer-aspire-3-a315-23.png',N'','AC01','LT01')
INSERT INTO SANPHAM VALUES(N'Acer Aspire 3 A315 34 C38Y CDC N4020/4GB/256GB/15.6"HD/Win 10',6990000,74,'acer-aspire-3-a315-34.png',N'','AC01','LT01')
INSERT INTO SANPHAM VALUES(N'Acer Nitro 5 AN515 55-5304 i5 10300H/8GB/512GB/15.6FHD/Win 10',22290000,69,'acer-nitro-an515-55.png',N'','AC01','LT01')
INSERT INTO SANPHAM VALUES(N'Acer Aspire 3 A315 54K 36X5 i3 8130U/4GB/256GB/15.6"FHD/Win 10',10990000,65,'acer-aspire-a315-54.png',N'','AC01','LT01')
INSERT INTO SANPHAM VALUES(N'Aspire Gaming 7 A715-41G-R1AZ R7 3750H/8GB/512GB SSD/15.6FHD/GTX1650-4GB/W10',19990000,54,'acer-aspire-7-a715-41g.png',N'','AC01','LT01')
INSERT INTO SANPHAM VALUES(N'Acer Nitro Gaming 5 AN515 55 5923 i5 10300H/8GB/512GB SSD//Win 10',23790000,58,'acer-nitro-an515-55-I5.png',N'','AC01','LT01')
INSERT INTO SANPHAM VALUES(N'Acer Aspire 5 A514 53 50JA i5 1035G1/4GB/256GB/14.0"FHD/Win 10',15690000,78,'acer-aspire-5-a514.png',N'','AC01','LT01')
INSERT INTO SANPHAM VALUES(N'Acer Aspire 5 A515 54G 56JG i5 10210U/8GB/512GB/15.6"FHD/MX350 2GB/Win 10',18690000,89,'acer-aspire-5-a515.png',N'','AC01','LT01')
INSERT INTO SANPHAM VALUES(N'Acer Nitro 5 AN515 43 R9FD R5 3550H/8GB/512GB/15.6"FHD/Win 10',18990000,174,'acer-nitro-5-2019.png',N'','AC01','LT01')
INSERT INTO SANPHAM VALUES(N'Acer Aspire 3 A315 56 59XY i5 1035G1/4GB/256GB/15.6"FHD/Win 10',12690000,147,'acer-aspire-3-a315-56.png',N'','AC01','LT01')
INSERT INTO SANPHAM VALUES(N'Acer Asprire A515-53-50ZD/Core i5-8265U/4Gb/16Gb OT+1Tb/DVDRW/15.6"HD/Win 10/NX.H6DSV.001',12900000,45,'acer-aspire-a515-53png.png',N'','AC01','LT01')
INSERT INTO SANPHAM VALUES(N'Acer Swift 5 SF514 53T 58PN/Core i5 8265U/NX.H7HSV.001',21590000,78,'acer-swift-5-sf514-53t-58pn.png',N'','AC01','LT01')
INSERT INTO SANPHAM VALUES(N'Acer Swift 3 SF314 56G 78QS i7 8565U/8GB/512GB/14"FHD/GF MX250-2GB/Win 10',19790000,69,'acer-swift-sf314.png',N'','AC01','LT01')
INSERT INTO SANPHAM VALUES(N'Acer Nitro Gaming 5 AN515 55 5923 i5 10300H/8GB/512GB SSD//Win 10 PRO',23790000,61,'acer-nitro-5-2019.png',N'','AC01','LT01')

-- PHỤ KIỆN

INSERT INTO SANPHAM VALUES(N'Sạc Laptop Acer 19V–3.42A – 65W',89000,254,'DAYSACACER.png',N'','AC01','PK01')
-- MÁY TÍNH BẢNG
INSERT INTO SANPHAM VALUES(N'Acer Iconia Talk S A1-734',3490000,25,'acer-iconia.png',N'','AC01','TB01')
INSERT INTO SANPHAM VALUES(N'Acer B1-723',2090000,24,'ACER-B1-723.jpg',N'','AC01','TB01')




--HUAWEI--
-- ĐIỆN THOẠI
INSERT INTO SANPHAM VALUES(N'Huawei P30 Pro',12990000,25,'huawei-p30-pro.png',N'','HW01','DT01')
INSERT INTO SANPHAM VALUES(N'Huawei Nova 5T 8GB-128GB',8290000,287,'huawei-nova-5t.png',N'','HW01','DT01')
INSERT INTO SANPHAM VALUES(N'Huawei Nova 7i',5990000,225,'huawei-7i.jpg',N'','HW01','DT01')
INSERT INTO SANPHAM VALUES(N'Huawei Y9s',5490000,145,'huawei-y9s.jpg',N'','HW01','DT01')
INSERT INTO SANPHAM VALUES(N'Huawei Y6p',3349000,254,'huawei-y6p.png',N'','HW01','DT01')
INSERT INTO SANPHAM VALUES(N'Huawei Y7 Pro (2019)',3490000,69,'huawei-y7-pro.png',N'','HW01','DT01')
INSERT INTO SANPHAM VALUES(N'Huawei Y9s SS',5499000,45,'huawei-y9s.jpg',N'','HW01','DT01')
-- LAPTOP
INSERT INTO SANPHAM VALUES(N'Huawei MateBook 13 i5 10210U/16GB/512GB SSD/13'' 2K/Nvidia MX250_2GB/Win10',29990000,187,'huawei-matebook-13.png',N'','HW01','LT01')
INSERT INTO SANPHAM VALUES(N'Huawei MateBook D 15 R5 3500U 8GB/256GB+1TB/Win10',13490000,57,'huawei-matebook-d15.jpg',N'','HW01','LT01')
INSERT INTO SANPHAM VALUES(N'Huawei MateBook D 15 R5 3500U/8GB/512GB/Win10',16490000,78,'huawei-matebook-d15-r5-3500u.jpg',N'','HW01','LT01')

-- PHỤ KIỆN



-- MÁY TÍNH BẢNG
INSERT INTO SANPHAM VALUES(N'Huawei MediaPad T5 10',4990000,25,'huawei-mediapad-t510-0.png',N'','HW01','TB01')
INSERT INTO SANPHAM VALUES(N'Huawei MediaPad T3 10.0',3740000,26,'MediaPad-T3-10.0.jpg',N'','HW01','TB01')
INSERT INTO SANPHAM VALUES(N'Huawei MatePad 5G',7450000,17,'matepad-5g-1.png',N'','HW01','TB01')
INSERT INTO SANPHAM VALUES(N'Huawei Enjoy Tablet 2',5999000,25,'enjoy-tablet-2.png',N'','HW01','TB01')
INSERT INTO SANPHAM VALUES(N'Huawei MatePad T',3490000,28,'matepad-t.png',N'','HW01','TB01')
INSERT INTO SANPHAM VALUES(N'Huawei Mate Pad Pro',8990000,14,'mate-pad-pro.png',N'','HW01','TB01')


--XIAOMI--
-- ĐIỆN THOẠI
INSERT INTO SANPHAM VALUES(N'Xiaomi Mi 10T Pro 5G 8GB-256GB',12990000,114,'xiaomi-mi-10t-pro.png',N'','XM01','DT01')
INSERT INTO SANPHAM VALUES(N'Xiaomi Poco X3 NFC 6GB-128GB',6990000,247,'xiaomi-poco-x3.png',N'','XM01','DT01')
INSERT INTO SANPHAM VALUES(N'Xiaomi Redmi Note 9 Pro 6GB-128GB',6900000,69,'xiaomi-redmi-note-9-pro.png',N'','XM01','DT01')
INSERT INTO SANPHAM VALUES(N'Xiaomi Redmi Note 9 4GB-128GB',4790000,57,'xiaomi-redmi-note-9.png',N'','XM01','DT01')
INSERT INTO SANPHAM VALUES(N'Xiaomi Redmi Note 8 4GB-64GB',4990000,365,'xiaomi-redmi-note-8.png',N'','XM01','DT01')
INSERT INTO SANPHAM VALUES(N'Xiaomi Redmi 9C 3GB-64GB',2990000,35,'xiaomi-redmi-9c.png',N'','XM01','DT01')
INSERT INTO SANPHAM VALUES(N'Xiaomi Redmi 9A 2GB-32GB',1990000,145,'xiaomi-redmi-9a.png',N'','XM01','DT01')
INSERT INTO SANPHAM VALUES(N'Xiaomi Redmi Note 7 (4GB/64GB)',3990000,254,'xiaomi-redmi-note-7.png',N'','XM01','DT01')
INSERT INTO SANPHAM VALUES(N'Xiaomi POCO X3 NFC',6990000,68,'xiaomi-poco-x3-nfc.png',N'','XM01','DT01')
--LAPTOP


--PHỤ KIỆN
INSERT INTO SANPHAM VALUES(N'Ốp lưng Xiaomi Redmi Note 7',66000,68,'OPLUNG_NOTE7.jpg',N'','XM01','PK01')
INSERT INTO SANPHAM VALUES(N'Tai nghe không dây Xiaomi True Wireless Earbuds Basic',490000,17,'tai-nghe-XIAOMI_TRUE.jpg',N'','XM01','PK01')
INSERT INTO SANPHAM VALUES(N'Tai Nghe True Wireless Xiaomi Redmi Airdots Pro',790000,68,'AirdotsPro.png',N'','XM01','PK01')
INSERT INTO SANPHAM VALUES(N'Loa Xiaomi Compact Bluetooth Speaker 2',179000,21,'loa-xiaomi.jpg',N'','XM01','PK01')
INSERT INTO SANPHAM VALUES(N'Pin sạc dự phòng Polymer 20.000mAh Xiaomi Type C 3 Pro VXN4254GL',1490000,45,'pin-sac-du-phong-20000mah-xiaomi-type-c-3-pro.jpg',N'','XM01','PK01')
--MÁY TÍNH BẢNG



--HP--
-- ĐIỆN THOẠI

--LAPTOP
INSERT INTO SANPHAM VALUES(N'HP 15s fq1107TU i3 1005G1/4GB/256GB SSD/WIN10',10690000,48,'HP-15s-fq1116tu.jpg',N'','HP01','LT01')
INSERT INTO SANPHAM VALUES(N'HP 15s fq1116TU i3 1005G1/8GB/512GB SSD/WIN10',11790000,66,'hp-15s-fq.png',N'','HP01','LT01')
INSERT INTO SANPHAM VALUES(N'HP Pavilion x360 14 dw0061TU i3 1005G1/4GB/512GB SSD/14.0FHD Touch',14890000,24,'hp-pavilion-x360-14.png',N'','HP01','LT01')
INSERT INTO SANPHAM VALUES(N'HP ENVY 13 ba0046TU i5 1035G4/8GB/512GB SSD/WIN10',22890000,27,'hp-envy-13-ba0046tu.png',N'','HP01','LT01')
INSERT INTO SANPHAM VALUES(N'HP 14s cf2043TU Pentium N6405/4GB/256GB/14.0"HD/WIN10',7790000,12,'hp-14s-cf0096tu.png',N'','HP01','LT01')
INSERT INTO SANPHAM VALUES(N'HP Pavilion Gaming 15 ec1054AX R5 4600H/8GB/128GB+1TB/15.6"FHD/Win 10',19590000,54,'hp-pavilion-gaming-15-ec0050ax.png',N'','HP01','LT01')
INSERT INTO SANPHAM VALUES(N'HP Pavilion Gaming 15 dk1075TX i7 10750H/8GB/512GB/15.6FHD/15.6FHD/Win10',29490000,35,'hp-pavilion-gaming-15-dk.png',N'','HP01','LT01')
INSERT INTO SANPHAM VALUES(N'HP Envy x360 13 ay0067AU R5 4500U/8GB/256GB/Win 10',229980000,32,'hp-envy-x360-13-ay.png',N'','HP01','LT01')
INSERT INTO SANPHAM VALUES(N'HP Envy 13 ba0045TU i5 1035G4/8GB/256GB/13.3"FHD/FP/Win 10',21690000,34,'hp-envy-13-ba0046tu-I5.png',N'','HP01','LT01')
INSERT INTO SANPHAM VALUES(N'HP 348 G7 i3 8130U/4GB/256GB/14.0"HD/Intel HD/FP/Win 10',10690000,35,'hp-348-g7.png',N'','HP01','LT01')
INSERT INTO SANPHAM VALUES(N'HP Pavilion 15 cs0016TU',12490000,148,'hp-pavilion-13.jpg',N'','HP01','LT01')

--PHỤ KIỆN
INSERT INTO SANPHAM VALUES(N'Sạc Laptop HP 19V - 4.74A',125000,154,'SAC-HP-19V-4.74A.png',N'','HP01','PK01')
INSERT INTO SANPHAM VALUES(N'Loa HP Pavilion 14-Ce4Nl',490000,14,'LOAHP.png',N'','HP01','PK01')
INSERT INTO SANPHAM VALUES(N'Chuột USB HP Wireless Mouse 250 A/P_3FV67AA',249000,24,'CHUOT.png',N'','HP01','PK01')
INSERT INTO SANPHAM VALUES(N'Chuột Không Dây HP Z3700 Gold Wireless',250000,58,'CHUOTKODAY.png',N'','HP01','PK01')
INSERT INTO SANPHAM VALUES(N'Bàn phím có dây HP cổng USB',750000,12,'BANPHIMHP.png',N'','HP01','PK01')
--MÁY TÍNH BẢNG

--DELL--
--ĐIỆN THOẠI

--LAPTOP
INSERT INTO SANPHAM VALUES(N'Dell Inspiron N3593 i5 1035G1/4Gb/256Gb/Nvidia MX230 2Gb/Win 10',15890000,48,'dell-inspiron-n3593.png',N'','DL01','LT01')
INSERT INTO SANPHAM VALUES(N'Dell Inspiron N3593C i3 1005G1/4GB/256GB/15.6"FHD/Win10',11290000,24,'dell-inspiron-n3593c.png',N'','DL01','LT01')
INSERT INTO SANPHAM VALUES(N'Dell Inspiron N3493 i3 1005G1/4GB/256GB/14.0"FHD/Win 10',10900000,65,'dell-inspiron-n3493.png',N'','DL01','LT01')
INSERT INTO SANPHAM VALUES(N'Dell Inspiron N3593 i7 1065G7/8GB/512GB/15.6"FHD/Win 10',20990000,47,'dell-inspiron-n3593-1.png',N'','DL01','LT01')
INSERT INTO SANPHAM VALUES(N'Dell V3590 i5 10210U/8Gb/256Gb/15.6"FHD/AMD 610 2Gb/DVDSup/Win10',16290000,57,'dell-vostro-v3590.png',N'','DL01','LT01')
INSERT INTO SANPHAM VALUES(N'Dell Inspiron N5584/Core i5-8265U/4GB/N5I5384W',14390000,17,'dell-inspiron-5584-1.png',N'','DL01','LT01')
INSERT INTO SANPHAM VALUES(N'Dell Vostro V5581/Core i5-8265U/70175952',14390000,47,'dell-vostro-v5581-70175957-1.png',N'','DL01','LT01')
INSERT INTO SANPHAM VALUES(N'Dell Vostro V5481/Core i5-8265U/V4I5229W',14390000,87,'dell-vostro-5481-1.png',N'','DL01','LT01')
INSERT INTO SANPHAM VALUES(N'Dell Inspiron G7 N7591/Core i5 9300H/N5I5591W',24290000,77,'dell-inspiron-n7591.png',N'','DL01','LT01')
INSERT INTO SANPHAM VALUES(N'Dell Inspiron N5593 i5 1035G1/8Gb/512Gb/Nvidia MX230 2Gb/Win 10',19600000,14,'dell-n5593.png',N'','DL01','LT01')
INSERT INTO SANPHAM VALUES(N'Dell XPS 13 9300 i5 1035G1/8GB/512GB/13.4" FHD+/Finger/Win 10',39590000,47,'dell-xps-13-9300.png',N'','DL01','LT01')
INSERT INTO SANPHAM VALUES(N'Dell XPS 15 9500 i7 10750H/16GB/512GB/GTX 1650 Ti 4GB/Win 10',59990000,58,'dell-xps-15-9500-i7.png',N'','DL01','LT01')
INSERT INTO SANPHAM VALUES(N'Dell Inspiron N7490 i5 10210U/8GB/512GB/NVIDIA MX250 2GB/Win 10',28950000,42,'dell-inspiron-n7490.png',N'','DL01','LT01')

-- PHỤ KIỆN
INSERT INTO SANPHAM VALUES(N'Bộ chuyển đổi Dell DA200 - USB-C to HDMI/VGA/Ethernet/USB 3.0',1339000,58,'BOCHUYENDOI.png',N'','DL01','PK01')
--MÁY TÍNH BẢNG
INSERT INTO SANPHAM VALUES(N'DELL Venue 8 Full HD',3990000,14,'venue8-1o-2204.jpg',N'','DL01','TB01')
INSERT INTO SANPHAM VALUES(N'Dell Venue 7 374',1990000,15,'venue7-3740-1o.jpg',N'','DL01','TB01')
INSERT INTO SANPHAM VALUES(N'Dell Venue 8-3G',3990000,17,'venue8-1o-2204.jpg',N'','DL01','TB01')


--VSMART--
--ĐIỆN THOẠI
INSERT INTO SANPHAM VALUES(N'Vsmart Aris Pro 8GB-128GB',8900000,147,'vsmart-aris-pro.png',N'','VM01','DT01')
INSERT INTO SANPHAM VALUES(N'Vsmart Aris 8GB-128GB',7490000,254,'vsmart-aris.png',N'','VM01','DT01')
INSERT INTO SANPHAM VALUES(N'Vsmart Live 4 6GB-64GB',4790000,482,'vsmart-live-4.png',N'','VM01','DT01')
INSERT INTO SANPHAM VALUES(N'Vsmart Active 3 6GB-64GB',3390000,245,'Vsmart-active-3.png',N'','VM01','DT01')
INSERT INTO SANPHAM VALUES(N'Vsmart Joy 4 3GB-64GB',3290000,245,'vsmart-joy-4.png',N'','VM01','DT01')
INSERT INTO SANPHAM VALUES(N'Vsmart Joy 3 4GB-64GB',2990000,165,'Vsmart-joy-3.png',N'','VM01','DT01')
INSERT INTO SANPHAM VALUES(N'Vsmart Star 4 3GB-32GB',2490000,245,'vsmart-star-4.png',N'','VM01','DT01')
INSERT INTO SANPHAM VALUES(N'Vsmart Star 3 2GB-16GB',1990000,70,'vsmart-star-3.png',N'','VM01','DT01')

--LAPTOP

--PHỤ KIỆN

INSERT INTO SANPHAM VALUES(N'Sạc, Cáp , Tai nghe Vsmart Chính Hãng',160000,14,'CAPSAC.png',N'','VM01','PK01')

--MÁY TÍNH BẢNG

--SONY--
--ĐIỆN THOẠI
INSERT INTO SANPHAM VALUES(N'Sony Xperia 5 II',5200000,4,'sony-xperia-5.png',N'','SN01','DT01')
INSERT INTO SANPHAM VALUES(N'Sony S20A',4800000,5,'sony-s20a.png',N'','SN01','DT01')
INSERT INTO SANPHAM VALUES(N'Sony Xperia 10 II',4590000,3,'sony-xperia-10-II.png',N'','SN01','DT01')
INSERT INTO SANPHAM VALUES(N'Sony Xperia 5',2690000,7,'sony-xperia-5-1.png',N'','SN01','DT01')
INSERT INTO SANPHAM VALUES(N'Sony Xperia 10 Plus',7990000,4,'sony-xperia-10.png',N'','SN01','DT01')
INSERT INTO SANPHAM VALUES(N'Sony Xperia 10',3990000,2,'ssony-xperia-10-2.png',N'','SN01','DT01')
--LAPTOP
INSERT INTO SANPHAM VALUES(N'Sony Vaio SVF14N16CX/B/i7-4500/Win8',23990000,7,'SVF14N16CXB.jpg',N'','SN01','LT01')
INSERT INTO SANPHAM VALUES(N'Sony Vaio SVF1521BYG',10790000,4,'sony-vaio-fit.jpg',N'','SN01','LT01')
INSERT INTO SANPHAM VALUES(N'Sony Vaio SVF1521BYA',10790000,7,'Sony-Vaio.jpg',N'','SN01','LT01')



--PHỤ KIỆN
INSERT INTO SANPHAM VALUES(N'Pin sạc dự phòng Polymer 5.000 mAh Sony CP-V5B',472000,45,'sac-du-phong-polyme.jpg',N'','SN01','PK01')
INSERT INTO SANPHAM VALUES(N'Pin sạc dự phòng Polymer 10.000 mAh Sony CP-V10B-WC LA',712000,15,'sac-du-phong-polymer-10000mah.jpg',N'','SN01','PK01')
INSERT INTO SANPHAM VALUES(N'Tai nghe chụp tai Bluetooth Sony WH-1000XM4',8940000,45,'tai-nghe-chup-tai-bluetooth.jpg',N'','SN01','PK01')
INSERT INTO SANPHAM VALUES(N'Tai nghe EP Bluetooth Sony WI-1000XM2',6290000,17,'ep-bluetooth-sony-wi-1000xm2-ava.jpg',N'','SN01','PK01')
INSERT INTO SANPHAM VALUES(N'Loa bluetooth Sony Extra Bass SRS-XB33',3690000,25,'loa-bluetooth-sony-srs-xb33.jpg',N'','SN01','PK01')
INSERT INTO SANPHAM VALUES(N'Loa bluetooth Sony Extra Bass SRS-XB43',4990000,27,'loa-bluetooth-sony-srs-xb43-ava.jpg',N'','SN01','PK01')

--MÁY TÍNH BẢNG

--LENOVO--
--ĐIỆN THOẠI
INSERT INTO SANPHAM VALUES(N'Lenovo Legion Phone Dual',4990000,4,'lenovo-legion-phone-dual-3.png',N'','LN01','DT01')
INSERT INTO SANPHAM VALUES(N'Lenovo VIBE C',3990000,4,'lenovo-vibe-c.png',N'','LN01','DT01')
INSERT INTO SANPHAM VALUES(N'Lenovo Vibe S1 Lite',3990000,4,'s1-lite-b1.jpg',N'','LN01','DT01')
INSERT INTO SANPHAM VALUES(N'Lenovo A2010-A',1690000,7,'A2010-b1.jpg',N'','LN01','DT01')
INSERT INTO SANPHAM VALUES(N'Lenovo Vibe K5',3290000,8,'k5-1.jpg',N'','LN01','DT01')
INSERT INTO SANPHAM VALUES(N'Lenovo A6000 16GB',2790000,17,'a6000-hot.png',N'','LN01','DT01')
--LAPTOP
INSERT INTO SANPHAM VALUES(N'Lenovo Ideapad S145 14API R3 3200U/4GB/25GB SSD/WIN10',8830000,17,'ideapad-s145-14.png',N'','LN01','LT01')
INSERT INTO SANPHAM VALUES(N'Lenovo IdeaPad S145 15IIL i3 1005G1/4GB/256GB/15.6"FHD/Intel UHD/Win 10',10000000,47,'ideapad-s145-15iil.png',N'','LN01','LT01')
INSERT INTO SANPHAM VALUES(N'Lenovo ThinkBook 15 IIL i5 1035G1/8GB/512GB SSD/WIN10',17390000,24,'thinkbook-15-iil.png',N'','LN01','LT01')
INSERT INTO SANPHAM VALUES(N'Lenovo IdeaPad Flex 5 14ARE05 R7 4700U/8GB/512GB/Pen/Win 10',17990000,23,'ideapad-flex-5.png',N'','LN01','LT01')
INSERT INTO SANPHAM VALUES(N'Lenovo IdeaPad Gaming 3 15ARH05 R5 4600H/8GB/512GB/15.6"FHD/Win 10',17990000,17,'Ideapad-gaming-3.png',N'','LN01','LT01')
INSERT INTO SANPHAM VALUES(N'Lenovo IdeaPad Gaming 3 15IMH05 i5 10300H/8GB/512GB/GTX 1650 4GB/15.6FHD/Win 10',20990000,24,'ideapad-gaming-3-15imh.png',N'','LN01','LT01')
INSERT INTO SANPHAM VALUES(N'Lenovo ThinkPad X1 Carbon 8 i5 10210U/16GB/512GB/14”WQHD/Win 10 Pro',45990000,25,'thinkpad-x1-carbon.png',N'','LN01','LT01')
INSERT INTO SANPHAM VALUES(N'Lenovo Ideadpad S340-15IWL/Core I3 8145U/4GB/256G SSD/WIN10',9590000,15,'ideapad-s340-15iwl.png',N'','LN01','LT01')


--PHỤ KIỆN

INSERT INTO SANPHAM VALUES(N'Dán cường lực Lenovo K5 Play',120000,15,'dan-cuong-luc-lenovo-k5-play-logo.jpg',N'','LN01','PK01')
INSERT INTO SANPHAM VALUES(N'Dán cường lực Lenovo K5 Pro',120000,15,'dan-cuong-luc-lenovo-k5-pro-logo.jpg',N'','LN01','PK01')
INSERT INTO SANPHAM VALUES(N'Dán cường lực Lenovo S5 Pro',120000,15,'dan-cuong-luc-lenovo-s5-pro.jpg',N'','LN01','PK01')
INSERT INTO SANPHAM VALUES(N'Dán cường lực Lenovo K5',120000,15,'dan-cuong-luc-lenovo-k5-logo.jpg',N'','LN01','PK01')
INSERT INTO SANPHAM VALUES(N'Dán cường lực Lenovo Z5',120000,15,'dan-cuong-luc-lenovo-z5-logo.jpg',N'','LN01','PK01')
INSERT INTO SANPHAM VALUES(N'Dán cường lực Lenovo K3 Note',120000,15,'dan-cuong-luc-Lenovo-K3-Note.jpg',N'','LN01','PK01')
--MÁY TÍNH BẢNG
INSERT INTO SANPHAM VALUES(N'Lenovo TB-7104I',1990000,5,'tb-7104i.png',N'','LN01','TB01')
INSERT INTO SANPHAM VALUES(N'Lenovo Yoga Book White',9990000,12,'yoga-book-wwhite.png',N'','LN01','TB01')
INSERT INTO SANPHAM VALUES(N'Lenovo TB-7304X',2390000,5,'7304X.jpg',N'','LN01','TB01')
INSERT INTO SANPHAM VALUES(N'Lenovo Yoga Book Windows Black',9990000,4,'Yogabook Window.jpg',N'','LN01','TB01')
INSERT INTO SANPHAM VALUES(N'Lenovo Phab 2',2990000,9,'phab-2.png',N'','LN01','TB01')



--NOKIA DIENTHOAI
INSERT INTO SANPHAM VALUES('Nokia 8.3 ̀5GB',12990000,20,'nokia-8-3.jpg',N'','NK01','DT01')
INSERT INTO SANPHAM VALUES('Nokia 5.3 3GB - 64GB',2790000,20,'nokia-5-3.jpg',N'','NK01','DT01')
INSERT INTO SANPHAM VALUES('Nokia 3.2 3GB-32GB',2190000,15,'nokia-3-2-32gb.jpg',N'','NK01','DT01')
INSERT INTO SANPHAM VALUES('Nokia 230 (Không kèm thẻ nhớ)',1250000,10,'Nokia230.JPG',N'','NK01','DT01')
INSERT INTO SANPHAM VALUES('Nokia 2.4',2690000,20,'nokia-2-4.jpg',N'','NK01','DT01')

--NOKIA PHU KIEN
INSERT INTO SANPHAM VALUES(N'Ốp lưng silicon dẻo trong suốt Nokia 5.3',40000,15,'op-lung-trong-suot-nokia-5-3.jpg',N'','NK01','PK01')
INSERT INTO SANPHAM VALUES(N'Bao da dạng ví Nokia 5.3 Luxury Leather',150000,20,'bao-da-vi-nokia-5-3.jpg',N'','NK01','PK01')
INSERT INTO SANPHAM VALUES(N'Tấm dán kính cường lực Nokia 5.3 hiệu Glass Pro',40000,15,'kinh-cuong-luc-nokia-5-1-HIEU-GLASS.jpg',N'','NK01','PK01')
INSERT INTO SANPHAM VALUES(N'Dán kính cường lực full 5D tràn màn hình Nokia 5.3 phủ màu',80000,10,'kinh-cuong-luc-full-man-HINH-nokia-5-3.jpg',N'','NK01','PK01')
INSERT INTO SANPHAM VALUES(N'Ốp lưng Nokia 3.2 chính hãng Nillkin dạng sần',120000,15,'san-nillkin-noki-3-1.jpg',N'','NK01','PK01')
INSERT INTO SANPHAM VALUES(N'Tấm dán kính cường lực Nokia 3.2 chống vỡ, chống xước',40000,20,'Tamdankinhcuonglucchongvochongxuoc-3.2-1-1.jpg',N'','NK01','PK01')
INSERT INTO SANPHAM VALUES(N'Tấm dán kính cường lực full 9D Nokia 3.2 tràn màn hình',80000,15,'kinh-full-9D-3.2-1.jpg',N'','NK01','PK01')


--NOKIA LAPTOP
INSERT INTO SANPHAM VALUES('Nokia Booklet-2',2600000,5,'ban-laptop-cu-nokia-booklet-2-gia-re-tai-ha-noi.jpg',N'','NK01','LT01')


--MSI MAYTINHBANG
INSERT INTO SANPHAM VALUES(N'Máy tính bảng MSI Enjoy 71 8Gb / DDR3 1GB/7inch',2990000,20,'may-tinh-bang-msi-enjoy-71-8gb--ddr3-1gb7inch.jpg',N'','MS01','TB01')


--MSI PHU KIEN
INSERT INTO SANPHAM VALUES(N'Bo Mạch Chủ Mainboard MSI H310M GAMING PLUS Socket 1151', 1470000,15,'Mainboard MSI H310M GAMING PLUS Socket 1151.jpg',N'','MS01','PK01')
INSERT INTO SANPHAM VALUES(N'Bo Mạch Chủ Mainboard MSI X399 GAMING PRO CARBON AC Socket TR4 RGB', 12599000,15,'Mainboard MSI X399 GAMING PRO CARBON AC Socket TR4 RGB.jpg',N'','MS01','PK01')
INSERT INTO SANPHAM VALUES(N'Bo Mạch Chủ Mainboard MSI H310M PRO-VDH PLUS-Hàng Chính Hãng', 1377000,15,'Mainboard MSI H310M PRO-VDH PLUS (Intel H310, Socket 1151, m-ATX, 2 khe RAM DDR4).png',N'','MS01','PK01')
INSERT INTO SANPHAM VALUES(N'Bo mạch chủ Mainboard MSI H310M PRO-VH PLUS - Hàng Chính Hãng',1498000,10,'Mainboard MSI H310M PRO-VH PLUS.png',N'','MS01','PK01')
INSERT INTO SANPHAM VALUES(N'Bo Mạch Chủ Mainboard MSI B450M GAMING PLUS Socket AM4 - Hàng Chính Hãng',1880000,15,'Mainboard MSI B450M GAMING PLUS Socket AM4.jpg',N'','MS01','PK01')
INSERT INTO SANPHAM VALUES(N'Mainboard MSI MAG B460M MORTAR WIFI - Hàng Chính Hãng', 2990000,20,'Mainboard MSI MAG B460M MORTAR WIFI.png',N'','MS01','PK01')
INSERT INTO SANPHAM VALUES(N'Bo Mạch Chủ Mainboard MSI B365M Pro-VH - Hàng Chính Hãng', 1540000,15,'Bo Mạch Chủ Mainboard MSI B365M Pro-VH.jpg',N'','MS01','PK01')


--MSi LAPTOP
INSERT INTO SANPHAM VALUES('Laptop MSI GF63 Thin 9SCXR-075VN',17959000,15,'Laptop MSI GF63 Thin 9SCXR-075VN.jpg',N'','MS01','LT01')
INSERT INTO SANPHAM VALUES('Laptop MSI GL65 Leopard 10SDK-242VN (Core i7-10750H/ 16GB (8GBx2)',30879000,10,'Laptop MSI GL65 Leopard 10SDK-242VN.jpg',N'','MS01','LT01')
INSERT INTO SANPHAM VALUES('Laptop MSI Bravo 15 A4DCR-052VN',18999000,15,'Laptop MSI Bravo 15 A4DCR-052VN.jpg',N'','MS01','LT01')
INSERT INTO SANPHAM VALUES('Laptop MSI Modern 14 A10RAS-1041VN',23189000,15,'Laptop MSI Modern 14 A10RAS-1041VN.jpg',N'','MS01','LT01')
INSERT INTO SANPHAM VALUES('Laptop MSI GF65 Thin 10SDR-623VN',26079000,15,'Laptop MSI GF65 Thin 10SDR-623VN.jpg',N'','MS01','LT01')
INSERT INTO SANPHAM VALUES('Laptop MSI Modern 14 A10M-1071VN',19989000,15,'Laptop MSI Modern 14 A10M-1071VN.jpg',N'','MS01','LT01')
INSERT INTO SANPHAM VALUES('Laptop MSI GF65 Thin 10SER-622VN',30259000,15,'Laptop MSI GF65 Thin 10SER-622VN.jpg',N'','MS01','LT01')
INSERT INTO SANPHAM VALUES('Laptop MSI GF63 Thin 9SCSR-846VN',23049000,15,'Laptop MSI GF63 Thin 9SCSR-846VN.jpg',N'','MS01','LT01')
INSERT INTO SANPHAM VALUES('Laptop MSI GF75 Thin 9RCX-432VN',21900000,15,'Laptop MSI GF75 Thin 9RCX-432VN.jpg',N'','MS01','LT01')
INSERT INTO SANPHAM VALUES('Laptop MSI GS65 Stealth 9SD-1409VN Core i5-9300H',33789000,15,'Laptop MSI GS65 Stealth 9SD-1409VN Core i5-9300H.jpg',N'','MS01','LT01')












INSERT INTO THANHTOAN VALUES (0,N'THANH TOÁN TIỀN MẶT'),
								(1,N'THANH TOÁN QUA THẺ TÍN DỤNG')

INSERT INTO KHACHHANG VALUES (N'NGUYỄN VĂN TÈO',N'TP HCM','0969841264','19751206','NGUYENVANTEO123@GMAIL.COM',0)
INSERT INTO KHACHHANG VALUES (N'NGUYỄN VĂN NGHIỆN',N'TP HCM','0932384765','19760805','NGUYENVANNGHIEN123@GMAIL.COM',0)
INSERT INTO KHACHHANG VALUES (N'TRẦN THANH TÂM',N'TP HCM','0945275868','19930907','TRANTHANHTAM123@GMAIL.COM',1)
INSERT INTO KHACHHANG VALUES (N'HUỲNH THANH NGHIỆN',N'TP HCM','0935738409','19951206','HUYNHTHANHNGHIEN123@GMAIL.COM',0)
INSERT INTO KHACHHANG VALUES (N'TRẦN XUÂN ĐẠT',N'TP HCM','0909764856','19980204','TRANXUANDAT123@GMAIL.COM',0)
INSERT INTO KHACHHANG VALUES (N'NGUYỄN MINH VƯƠNG',N'TP HCM','098764962','20010315','NGUYENMINHVUONG123@GMAIL.COM',0)
INSERT INTO KHACHHANG VALUES (N'QUÁCH DIỄM PHƯỚC',N'TP HCM','0836251415','20010205','DIEMPHUOC@GMAIL.COM',1)
INSERT INTO KHACHHANG VALUES (N'TRẦN THỊ THẢO',N'TP HCM','0549858596','20000405','THITHAO001@GMAIL.COM',1)
INSERT INTO KHACHHANG VALUES (N'HÀ VĂN TÚ',N'TP HCM','0125495867','19961221','TUHAVANF9@GMAIL.COM',0)
INSERT INTO KHACHHANG VALUES (N'NGUYỄN DUY ANH',N'TP HCM','07899856547','20001129','DUYANH9A3@GMAIL.COM',0)
INSERT INTO KHACHHANG VALUES (N'BÙI THỊ XUÂN',N'TP HCM','0789565568','19991206','BUIXUAN1999@GMAIL.COM',1)
INSERT INTO KHACHHANG VALUES (N'HÀ ANH TUẤN',N'TP HCM','0989653225','20021015','HATUANANH@GMAIL.COM',0)
INSERT INTO KHACHHANG VALUES (N'LÊ THỊ HỒNG',N'TP HCM','0456989987','20010805','LEHONG2001@GMAIL.COM',1)
INSERT INTO KHACHHANG VALUES (N'NGÔ BÁ KHÁ',N'TP HCM','0356996865','19930506','KHABANGOOK@GMAIL.COM',0)
INSERT INTO KHACHHANG VALUES (N'QUÁCH THỊ PHƯỚC',N'TP HCM','0987659566','20031113','THIPHUOCNE@GMAIL.COM',1)
INSERT INTO KHACHHANG VALUES (N'LƯƠNG HOÀNG SƠN',N'TP HCM','0489565875','20000305','HOANGSON222@GMAIL.COM',0)
INSERT INTO KHACHHANG VALUES (N'NGUYỄN ĐÌNH VIỆT',N'TP HCM','0989865654','20200509','VIETNGUYEN112@GMAIL.COM',0)
INSERT INTO KHACHHANG VALUES (N'NGUYỄN THỊ ÁNH',N'TP HCM','0147852966','20020809','ANHTHI113@GMAIL.COM',1)

INSERT INTO DONHANG VALUES ('20201106',1,0,'PHUCVH')
INSERT INTO DONHANG VALUES ('20201112',2,1,'DATHX')
INSERT INTO DONHANG VALUES ('20201112',7,1,'PHUCVH')
INSERT INTO DONHANG VALUES ('20201112',4,0,'DATHX')
INSERT INTO DONHANG VALUES ('20201112',9,0,'PHUCVH')




INSERT INTO CHITIETDONHANG VALUES(1,1001,1,9000000)
INSERT INTO CHITIETDONHANG VALUES(1,1002,2,12000000)
INSERT INTO CHITIETDONHANG VALUES(3,1015,1,19990000)
INSERT INTO CHITIETDONHANG VALUES(4,1022,2,12890000)
INSERT INTO CHITIETDONHANG VALUES(2,1089,5,79900000)
INSERT INTO CHITIETDONHANG VALUES(2,1072,2,25000000)