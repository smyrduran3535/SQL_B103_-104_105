CREATE TABLE ogrenciler5(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real,--ondalıklı sayılar icin kullanılır(double gibi)
kayit_tarih date
);
--VAROLAN BİR TABLODAN YENİ BİR TABLO OLUSTURMA
CREATE TABLE NOTLAR
AS
SELECT isim,not_ort FROM ogrenciler5;
select* from notlar;
--TABLO İCİNE VERİ EKLEME--INSERT
INSERT INTO notlar VALUES ('Tuba',95.5);
INSERT INTO notlar VALUES ('Furkan',65.5);
INSERT INTO notlar VALUES ('Adem',55.5);

-- CONSTRAINT 
--UNIQE
--NOT NULL
CREATE TABLE ogrenciler7(
ogrenci_no char(7) unique,
isim varchar(20) not null,--isim sutununu bos gecmesin istiyorsak
soyisim varchar(25),
not_ort real,--ondalıklı sayılar icin kullanılır(double gibi)
kayit_tarih date
);
select* from ogrenciler7;
INSERT INTO ogrenciler7 VALUES ('1234567','Sumeyra','Duran',98.5,now());
INSERT INTO ogrenciler7 VALUES ('1234567','Sumeyra','Duran',98.5,now()); 
INSERT INTO ogrenciler7 (ogrenci_no,soyisim,not_ort) VALUES('1234567','Duran',85.5);--NOT NULL kısıtlaması old icin bu veri eklenemez

--PRIMARY KEY OLUSTURMA: 1.yol :direk atama
CREATE TABLE ogrenciler8(
ogrenci_no char(7) primary key,
isim varchar(20) ,--isim sutununu bos gecmesin istiyorsak
soyisim varchar(25),
not_ort real,--ondalıklı sayılar icin kullanılır(double gibi)
kayit_tarih date
);
--2.yol primary key ataması 
CREATE TABLE ogrenciler9(
ogrenci_no char(7),
isim varchar(20) ,--isim sutununu bos gecmesin istiyorsak
soyisim varchar(25),
not_ort real,--ondalıklı sayılar icin kullanılır(double gibi)
kayit_tarih date,
CONSTRAINT ogr PRIMARY KEY(ogrenci_no)--cont kull. kendimiz isim veriyoruz 
);
--3.yol:
CREATE TABLE ogrenciler10(
ogrenci_no char(7),
isim varchar(20) ,--isim sutununu bos gecmesin istiyorsak
soyisim varchar(25),
not_ort real,--ondalıklı sayılar icin kullanılır(double gibi)
kayit_tarih date,
PRIMARY KEY(ogrenci_no)
);
--Practice 4:
--“tedarikciler3” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”, 
--“iletisim_isim” field’lari olsun ve “tedarikci_id” yi Primary Key yapin.
--“urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun ve
--“tedarikci_id” yi Foreign Key yapin
CREATE TABLE tedarikciler3
(
	tedarikci_id varchar(10) PRIMARY KEY,
	tedarikci_ismi varchar(50), 
	iletisim_isim varchar(50)

);

CREATE TABLE urunler
(
tedarikci_id char(5),
urun_id char(5),
CONSTRAINT urn_fk FOREIGN KEY (tedarikci_id) REFERENCES tedarikciler3(tedarikci_id)
);
select*from tedarikciler3;
select*from urunler;

--Practice 5:
--“calisanlar” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”, “ise_baslama” field’lari 
--olsun. “id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın.“adresler” isminde baska 
--bir tablo olusturun.Icinde “adres_id”,“sokak”, “cadde” ve “sehir”
--fieldlari olsun. “adres_id” field‘i ile Foreign Key oluşturun
CREATE TABLE calisanlar
(
id varchar(15) PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int NOT NULL,
ise_baslama date
);
CREATE TABLE adresler
(
adres_id varchar(30),
sokak varchar(30),
cadde varchar(30),
sehir varchar(30),
FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
);

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');

INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');--not null cons. kabul etmez
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');--syntax hatası kabul etmez.int oldugu icin kabul etömez
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');--primary key ''kabul etti
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');--p.k 2. ' ' kabul etmez 
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');--calısanlar p key oldugu icin kabul etmiyor
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');--prmry key null deger kabul etmez

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');
-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');
SELECT*FROM calisanlar;
SELECT*FROM adresler;

CREATE TABLE calisanlar1
(
id varchar(15) PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int CHECK (maas>10000),
ise_baslama date
);
INSERT INTO calisanlar1 VALUES('10002', 'Mehmet Yılmaz', 19000, '2018-04-14');
SELECT*FROM calisanlar1;

--DQL-- WHERE KULLANIMI
SELECT*FROM calisanlar;
select isim from calisanlar;

--Calisanlar tablosundan maasi 50000 den byk olan isimleri listele
SELECT isim FROM calisanlar WHERE maas>5000;
SELECT isim,maas FROM calisanlar WHERE maas>5000;
--calisanlar tablosundan ismi veli han olan tum verileri listeleyin..(tum veri icin * kull)
SELECT*FROM calisanlar WHERE isim='Veli Han';
--Calisanlar tablosundan maasi 50000  olan tum verileri listele
SELECT*FROM calisanlar WHERE maas=5000;
--DML-- DELETE KOMUTU
DELETE FROM calisanlar;--eger parent table baska bir tablo ile iliskili ise once child table silinmeli
DELETE FROM adresler; --adresler tablosunun isindeki veriler silinir
--Adresler tablosundan sehri antep olan verileri silelim
DELETE FROM adresler WHERE sehir='Antep';

CREATE TABLE ogrenciler11
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int 
);
INSERT INTO ogrenciler11 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler11 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler11 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler11 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler11 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler11 VALUES(127, 'Mustafa Bak', 'Ali', 99);
SELECT*FROM ogrenciler11;
DELETE FROM ogrenciler11 WHERE isim='Nesibe Yilmaz';
-- id'si 124 olan ogrenciyi siliniz.
DELETE FROM ogrenciler11 WHERE id=124;
-- ismi Kemal Yasa olan satırını siliniz
DELETE FROM ogrenciler11 WHERE isim='Kemal Yasa';
-- İsmi Ali Can ve id'si 123 olan kaydı siliniz.
DELETE FROM ogrenciler11 WHERE isim='Ali Can' OR id=123;
-- id 'si 126'dan büyük olan kayıtları silelim.
DELETE FROM ogrenciler11 WHERE id>126;
-- id'si 123, 125 veya 126 olanları silelim.
DELETE FROM ogrenciler11 WHERE id=123 OR id=125 OR id=126;