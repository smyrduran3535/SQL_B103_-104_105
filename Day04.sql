--									ALIASES
-- Aliases kodu ile tablo yazdirilirken, field isimleri sadece o cikti icin degistirilebilir.
--2 tane veriyi concet yapar
select*from calisanlar3;
--isim ile sehri birlestirelim:
CREATE TABLE calisanlar3 (
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50)
);
INSERT INTO calisanlar3 VALUES(123456789, 'Ali Can', 'Istanbul'); 
INSERT INTO calisanlar3 VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO calisanlar3 VALUES(345678901, 'Mine Bulut', 'Izmir');
--eger iki sutunverilerini birlestirmek istersek concet sembolu || kullanırız 
SELECT calisan_id AS id, calisan_isim||' '||calisan_dogdugu_sehir AS calisan_bilgisi FROM calisanlar3
--2. YOl
SELECT calisan_id AS id, concat (calisan_isim,calisan_dogdugu_sehir) AS calisan_bilgisi FROM calisanlar3
--IS NULL CONDITIONAL
CREATE TABLE insanlar
(
ssn char(9),
name varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');  
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa'); 
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');
select*from insanlar;
--name sutunundaki null olan degerleri getirin
select*from insanlar where name is null;
--ınsanlar tablosunda sadece null olmayan degerleri listeleyiniz
select*from insanlar where name is NOT null;
--insanlar tablosunda null almıs verileri no name olarak degistiriniz
UPDATE insanlar
SET name='No Name'
WHERE name IS NULL
-- 								ORDER BY CLAUSE
/*
ORDER BY komutu belli bir field’a gore NATURAL ORDER olarak siralama
yapmak icin kullanilir
ORDER BY komutu sadece SELECT komutu Ile kullanilir
	
Tablolardaki verileri sıralamak için ORDER BY komutu kullanırız
Büyükten küçüğe yada küçükten büyüğe sıralama yapabiliriz
Default olarak küçükten büyüğe sıralama yapar
Eğer BÜYÜKTEN KÜÇÜĞE sıralmak istersek ORDER BY komutundan sonra DESC komutunu kullanırız

*/
Drop table if exists insanlar

CREATE TABLE insanlar
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar VALUES(234567890, 'Veli','Cem', 'Ankara');  
INSERT INTO insanlar VALUES(345678901, 'Mine','Bulut', 'Ankara');  
INSERT INTO insanlar VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar VALUES (344678901, 'Mine','Yasa', 'Ankara');  
INSERT INTO insanlar VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');
select*from insanlar;
select*from insanlar order by adres

select*from insanlar order by soyisim
--Insanlar tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin
select*from insanlar where isim='Mine' order by ssn 
--NOT : Order By komutundan sonra field ismi yerine field numarasi da kullanilabilir
--Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin

--soyismi bulut olanlara gore sırala
select*from insanlar where soyisim='Bulut'order by 2 --ssn basl.sayısı 2 ile baslayan gelsin dedik

--Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin
select*from insanlar order by ssn desc --desc e gore sıralama yaptık

-- Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin
select*from insanlar order by isim ASC, soyisim DESC; --natural sıralama :asc

--ORDER BY field_name DESC CLAUSE

--İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız
SELECT isim, soyisim FROM insanlar
ORDER BY LENGTH (soyisim);
/*
Eger sutun uzunluguna gore siralamak istersek LENGTH komutu kullaniriz
Ve yine uzunlugu buyukten kucuge siralamak istersek  sonuna DESC komutunu ekleriz
*/
--desc ile tersden sıralayalım
SELECT isim, soyisim FROM insanlar
ORDER BY LENGTH (soyisim) desc;

-- Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız
SELECT CONCAT (isim, ‘ ’ , soyisim) AS isim_soyisim
FROM insanlar
ORDER BY LENGTH(isim)+LENGTH(soyisim);
--2.YOL
select  isim||' '|| soyisim from insanlar
ORDER BY LENGTH (isim||soyisim);
--as ile isim verdik
select  isim||' '|| soyisim AS isim_soyisim from insanlar
ORDER BY LENGTH (isim||soyisim);
--3 YOL
select  isim||' '|| soyisim AS isim_soyisim from insanlar
ORDER BY LENGTH (isim)+LENGTH(soyisim);
--concat ile
select  CONCAT(isim,' ' ,soyisim) AS isim_soyisim from insanlar
ORDER BY LENGTH (isim)+LENGTH(soyisim);
--4.YOL:
select isim || ' ' || soyisim as isim_soyisim from insanlar order by length (concat(isim, soyisim));

--                           GROUP BY CLAUSE
--Group By komutu sonuçları bir veya daha fazla sütuna göre gruplamak için SELECT 
--komutuyla birlikte kullanılır


CREATE TABLE manav
(
isim varchar(50), 
Urun_adi varchar(50), 
Urun_miktar int
);
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

select*from manav
--1) Isme gore alinan toplam urunleri bulun ve listeleyiniz
select  sum(urun_miktar) from manav --burda tek sonuc gelir..biz bunu istemiyoruz.zaten calısmaz gruop by yap der

select  sum(Urun_miktar) from manav  GROUP BY isim;

--Isme gore alinan toplam urunleri bulun ve urunleri büyükten küçüğe listeleyiniz
SELECT isim,sum(urun_miktar) AS aldığı_toplam_urun FROM manav
GROUP BY isim
ORDER BY aldığı_toplam_urun DESC;

-- Urun ismine gore urunu alan toplam kisi sayisi
SELECT urun_adi,count(isim) FROM manav
GROUP BY urun_adi;

SELECT isim,count(urun_adi) AS aldigi_urun_cesidi FROM manav
GROUP BY isim;









