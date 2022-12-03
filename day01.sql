--DATABASE(Veri Tabani) Olusturma
Create database evren;

create database erol;
--DDL - DATA DEFINATION LANGUAGE
--CREATE - TABLO OLUSTURMA
CREATE TABLE ogrenciler2(
ogrenci_no char(7),
	isim varchar(20),
	soyisim varchar(25),
	not_ort real,--ondalıklı sayılar icin kullanılır(double gibi)
	kayit_tarih date
);


--VAR OLAN TABLODAN YENI BIR TABLO OLUSTURMA
CREATE TABLE ogrenci_notlari
AS --benzer tablodaki baslıklarla ve data tipleriyle yeni bir tablo olusturmak icin 
--normal tablo olustururkenki parantezler yerine AS kull. Select komutuyla almak istedigimiz verileri aliriz
SELECT isim,soyisim,not_ort FROM ogrenciler2

--DML -DATA MANİPULATION LANG.
--INSERT(DATABASE E VERİ EKLEME)
INSERT INTO ogrenciler2 VALUES('1234567','Said','ILHAN',85,5,now());
INSERT INTO ogrenciler2 VALUES('1234567','Said','ILHAN',85,5,'2022-12-11');
--BIR TABLOYA PARCALI VERI EKLEMEK DERSEK
INSERT INTO ogrenciler2 (isim,soyisim) VALUES('Erol','Evren');

--DQL -DATA QUERY LANG.
--SELECT 
select*FROM ogrenciler2;





