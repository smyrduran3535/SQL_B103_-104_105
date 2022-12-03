DROP TABLE if exists musteriler-- her defasında tablo yazmazsın silip calistırısın
CREATE TABLE musteriler 
(
urun_id int, 
musteri_isim varchar(50), 
urun_isim varchar(50)
);
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (20, 'John', 'Apple');
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm');
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple');
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange');
INSERT INTO musteriler VALUES (40, 'John', 'Apricot');
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');
SELECT*FROM musteriler;
--Musteriler tablosundan urun ismi orange.apple veya apricat olan tum verileri sil
--1.yol 
SELECT*FROM musteriler WHERE urun_isim ='Orange' OR urun_isim ='Apple' OR urun_isim ='Apricot';
--2.yol daha guzel yol
SELECT*FROM musteriler WHERE urun_isim IN('Orange','Apple','Apricot');
--NOT IN : Yazdıgımız verilerin disindakini getirir
SELECT*FROM musteriler WHERE urun_isim NOT IN('Orange','Apple','Apricot');
-- 								 BETWEEN CONDITION
/*BETWEEN Condition iki mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla
yazabilme imkani verir. Yazdigimiz 2 sinirda araliga dahildir */

--musteriler tablosundan id'si 20 ile 40 arasında olan verileri listeleyiniz
SELECT*FROM musteriler WHERE urun_id>=20 and urun_id<=40 --1.yol
SELECT*FROM musteriler WHERE urun_id BETWEEN 20 and 40 --2.yol
--                           NOT BETWEEN
/*2 mantıksal ifadenin disinda olanlar */
SELECT*FROM musteriler WHERE urun_id NOT BETWEEN 20 and 40
--                            SUBQUERIES
--SUBQUERIES:SORGU DEMEK...2 TANE TABLODAN SRGU İCİNDE SORGU DEMEK
DROP TABLE if exists calisanlar2;
DROP TABLE if exists markalar;
CREATE TABLE calisanlar2 
(
id int, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
isyeri VARCHAR(20)
);
INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

CREATE TABLE markalar
(
marka_id int, 
marka_isim VARCHAR(20), 
calisan_sayisi int
);

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);
INSERT INTO markalar VALUES(104, 'Nike', 19000);


SELECT*FROM calisanlar2
SELECT*FROM markalar

--- Çalisan sayisi 15.000’den cok olan markalarin isimlerini ve
--bu markada calisanlarin isimlerini ve maaşlarini listeleyin.
SELECT isim,maas,isyeri FROM calisanlar2 WHERE isyeri IN (SELECT marka_isim FROM markalar WHERE calisan_sayisi>15000);
--daha sonradan nike 19000 u sonradan ekledik fakat tabloya eklemedi.baglantı olmadıgı icin

--soru:
--marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve şehirlerini listeleyiniz.
SELECT isim, maas, sehir from calisanlar2      --burası ana sorgum
where isyeri in (select marka_isim from markalar where marka_id > 101 );     --burası ara sorgum 

-- Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.

-- 							AGGREGATE METOT KULLANIMI
/*Aggregate Metotlari (SUM,COUNT, MIN, MAX, AVG) Subquery içinde
kullanilabilir.
Ancak, Sorgu tek bir değer döndürüyor olmalidir.
SYNTAX: sum() şeklinde olmalı sum ile () arasında boşluk olmamalı
*/

-- Calisanlar toplasundan maksimum maası listeleyelim
SELECT max(maas) FROM calisanlar2; --max yerine gecici olarak deger atayabiliriz.. SELECT max(maas)AS max_maas FROM calisanlar2;
SELECT max(maas)AS max_maas FROM calisanlar2;
/*
eger bir sytynu gecici olarakbir isim vermek istersek AS komutunu yazdıktan sonra vermek istedigimiz ismi yazarız */


-- Calisanlar toplasundan minimum maası listeleyelim
SELECT min(maas) FROM calisanlar2;
SELECT min(maas)AS min_maas FROM calisanlar2;
-- Calisanlar toplasundan  maasların topl. listeleyelim
select sum(maas) from calisanlar2;
-- Calisanlar toplasundan maasların ortalaması listeleyelim
SELECT avg(maas) FROM calisanlar2;
--virgulden sonrasını yuvarlar istersek ;raund kullancaz
select round(avg(maas)) from calisanlar2;
select round(avg(maas),2) from calisanlar2;--virgulden sonra 2 basamagı verir

--calisanlar tablosundaki maaslarin sayisini list.
SELECT count(maas) FROM calisanlar2;  --count(*): boyle yapsak da yınede bize toplam satır sayısını verir
--count(*);eger maas da null varsa saydırır hepsini
--count(maas); eger maas da null varsa null'ı almadan saydırır hepsini

--AGGREGATE METOT SUBQUERIES
-- Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz
SELECT marka_id,marka_isim,(SELECT  count(sehir) FROM calisanlar2 WHERE marka_isim=isyeri) FROM markalar;
SELECT marka_id,marka_isim,(SELECT  count(sehir) as sehir_sayisi FROM calisanlar2 WHERE marka_isim=isyeri) FROM markalar;--sehir sayisi yazdk kendmz

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz
SELECT marka_id,calisan_sayisi,(select sum(maas) from calisanlar2 WHERE isyeri=marka_isim)
FROM markalar 
SELECT marka_id,calisan_sayisi,(select sum(maas) from calisanlar2 WHERE isyeri=marka_isim) as toplam_maas
FROM markalar 

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.

SELECT marka_isim,calisan_sayisi,(select max(maas) from calisanlar2 WHERE isyeri=marka_isim),
(select min(maas) from calisanlar2 WHERE isyeri=marka_isim)  From markalar
--as kull.
SELECT marka_isim,calisan_sayisi,(select max(maas) from calisanlar2 WHERE isyeri=marka_isim) as enyuksekmaas,
(select min(maas) from calisanlar2 WHERE isyeri=marka_isim) as endusukmaas  From markalar
--view :bu sorguyu kendi hafızasına alır. sadece o view e verdigimiz isimle o sorguyu cagırabiliyoruz
/*
Yaptigimiz sorgulari hafizaya alir ve tekrar bizden istenen sorgulama yerine
view'e atadigimiz ismi SELECT komutuyla cagiririz
*/
CREATE VIEW maxminmaas
AS 
SELECT marka_isim,calisan_sayisi,(select max(maas) from calisanlar2 WHERE isyeri=marka_isim) as enyuksekmaas,
(select min(maas) from calisanlar2 WHERE isyeri=marka_isim) as endusukmaas  From markalar
SELECT*FROM maxminmaas; 
--                             EXISTS CONDITION
/*
EXISTS Condition subquery’ler ile kullanilir. IN ifadesinin kullanımına benzer
olarak, EXISTS ve NOT EXISTS ifadeleri de alt sorgudan getirilen değerlerin içerisinde
bir değerin olması veya olmaması durumunda işlem yapılmasını sağlar.....varsa sil yoksa silme,varsa getir yoksa getirme ggibi
*/
CREATE TABLE mart
(
urun_id int,
musteri_isim varchar(50), 
urun_isim varchar(50)
);
INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');

CREATE TABLE nisan 
(
urun_id int ,
musteri_isim varchar(50), 
urun_isim varchar(50)
);
INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');
select*from mart
select*from nisan
--MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
-- URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
-- MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız.
--kısaca soru:mart ve nisanda ayni id lere sahip urunleri bul. bu urunleri martta kim almis listele
select urun_id,musteri_isim from mart --sorgumuz marttan  
where exists (select urun_id from nisan where mart.urun_id=nisan.urun_id)
--Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri NİSAN ayında satın alan 
--MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
select urun_isim,musteri_isim from nisan
where exists (select urun_isim from mart where mart.urun_isim=nisan.urun_isim) 

--                 UPDATE
--UPDATE komutu aslında DML dir
delete from tedarikciler
delete from urunler
Drop table  if exists urunler;
Drop table  if exists tedarikciler;
CREATE TABLE tedarikciler -- parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);
INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');
CREATE TABLE urunler -- child
(
ted_vergino int, 
urun_id int, 
urun_isim VARCHAR(50), 
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) 
REFERENCES tedarikciler(vergi_no)
on delete cascade
); 
INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yılmaz');
select*from tedarikciler
select*from urunler

-- vergi_no’su 102 olan tedarikcinin firma ismini 'Vestel' olarak güncelleyeniz.
--guncelleme deniliyorsa UPDATE tablo_adi(tedarikciler gibi) yaz sonra SET sutun_ismi ile basla
/*
UPDATE tablo_adi
SET sutun_ismi='istenen veri' WHERE sutun_ismi='istenen veri'
*/
UPDATE tedarikciler
SET firma_ismi='Vestel' WHERE vergi_no=102;
-- vergi_no’su 101 olan tedarikçinin firma ismini 'casper' ve irtibat_ismi’ni 
--'Ali Veli' olarak güncelleyiniz
UPDATE tedarikciler
SET firma_ismi='casper' WHERE vergi_no=101;

UPDATE tedarikciler SET irtibat_ismi = 'Ali Veli' WHERE vergi_no=101;

-- urunler tablosundaki 'Phone' değerlerini 'Telefon' olarak güncelleyiniz.
UPDATE urunler
SET urun_isim='Telefon' WHERE urun_isim='Phone';
-- urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id’sini 1 arttırın.
UPDATE urunler
SET urun_id=urun_id+1 WHERE urun_id>1004;
-- urunler tablosundaki tüm ürünlerin urun_id değerini ted_vergino sutun değerleri ile toplayarak
-- güncelleyiniz.
UPDATE urunler
SET urun_id=ted_vergino + urun_id;

--* urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci tablosunda irtibat_ismi 
--'Adam Eve' olan firmanın ismi (firma_ismi) ile degistiriniz.
-- Bu update işlemini yapmadan önce, tabloları eski haline getirmeliyiz.
UPDATE urunler 
SET urun_isim='Apple' WHERE musteri_isim='Ali Bak';

UPDATE urunler
SET urun_isim=(Select firma_ismi FROM tedarikciler WHERE irtibat_ismi='Adem Eve');

--* Urunler tablosunda laptop satin alan musterilerin ismini, firma_ismi Apple’in irtibat_isim'i ile degistirin.
UPDATE urunler 
SET musteri_isim=(select irtibat_ismi from tedarikciler where firma_ismi='Apple')
WHERE urun_isim = 'Laptop';








