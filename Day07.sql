--Distinct kullanımı
--DISTINCT clause, çağrılan terimlerden tekrarlı olanların sadece birincisini alır.
--distinct komutu group by a benziyor
CREATE TABLE musteri_urun 
(
urun_id int, 
musteri_isim varchar(50),
urun_isim varchar(50) 
);
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (20, 'Veli', 'Elma'); 
INSERT INTO musteri_urun VALUES (30, 'Ayse', 'Armut'); 
INSERT INTO musteri_urun VALUES (20, 'Ali', 'Elma'); 
INSERT INTO musteri_urun VALUES (10, 'Adem', 'Portakal'); 
INSERT INTO musteri_urun VALUES (40, 'Veli', 'Kaysi'); 
INSERT INTO musteri_urun VALUES (20, 'Elif', 'Elma');
select*from musteri_urun
--musteri urun tablosundan urun isimlerini tekrarsız(grup) listeleyiniz
select distinct urun_isim from musteri_urun --tekrarlı olanlaarı bir daha almaz. bir kere alır
 select urun_isim from musteri_urun group by urun_isim --tekrarlı olanları 1 kere getirir
 --distincti tek grup listelenmek istendiginde kullanılır genelde.. gruop by ise karısık yapılarda
 
 --musteri isimlerini tekrarsız olarak listele
 select distinct musteri_isim from musteri_urun

--tabloda kac tane farklı meyve vardır
select count(distinct urun_isim) from musteri_urun
select count(distinct urun_isim) AS kac_cesit_meyve_var from musteri_urun

select urun_isim, count(urun_isim) AS kac_cesit_meyve_var from musteri_urun
group by urun_isim --urun isimleriyle birlikte gruplar

select urun_isim, count(distinct urun_isim) AS kac_cesit_meyve_var from musteri_urun group by urun_isim
--distinct kullandık;herbir meyveden 1 er adet sayı verdi...cunku tekrarlıları getirmedi
--group by kullandık; her bir meyveden kac tane oldugunu verdi

--      FETCH NEXT (SAYI) ROW ONLY- OFFSET
-- FETCH NEXT 3 ROW ONLY; yazınca tabloda ilk 3 kaydı getirir....FETCH: gidip getir demek

--musteri_urun tablosundan ilk 3 kaydı listele 
select*from musteri_urun fetch next 3 row only
--ama ilk uc kayıt dedigi icin liste karısık gelmesin diye ; order by kullanmak lazım
select*from musteri_urun order by urun_id fetch next 3 row only --id numarasina gore listelendigi icin ilk 3e ulasmanın en iyi yolu

--                                             LIMIT
--limit ile fetch next (sayı) row only aynıdır
select*from musteri_urun order by urun_id limit 3 --aynı donuc gelir

--musteri_urun tablosundan ilk kaydı listele
select*from musteri_urun order by urun_id limit 1 --limit 1 ilk kaydı getirir =fetch next 1 row only

--musteri_urun tablosundan son 3 kaydı listele
select*from musteri_urun order by  urun_id desc limit 3 

CREATE TABLE maas
(
urun_id int, 
musteri_isim varchar(50),
maas int 
);
INSERT INTO maas VALUES (10, 'Ali',5000 ); 
INSERT INTO maas VALUES (10, 'Ali',7500 ); 
INSERT INTO maas VALUES (20, 'Veli',10000); 
INSERT INTO maas VALUES (30, 'Ayse',9000); 
INSERT INTO maas VALUES (20, 'Ali',6500); 
INSERT INTO maas VALUES (10, 'Adem',8000); 
INSERT INTO maas VALUES (40, 'Veli',8500); 
INSERT INTO maas VALUES (20, 'Elif',5500);
select*from maas

--en yuksek maası alan musteriyi listeleyiniz
select*from maas order by maas desc limit 1 

--en yuksek 2. maası getir
select*from maas order by maas desc limit 1 offset 1 --1.den sonra gelen 2. olacaktır
--offset 'i; fetch next 3 row only kullandıgımızda offset i once kulalnıyoruz
--limit kullandıgımızda sonra kullanıyoruz 
/*
OFFSET --> Satır atlamak istediğimizde offset komutunu kullanırız
*/

select*from maas order by maas desc --maas tablosunu tersten sırala
offset 1 row --bir satır atla :row yazmak sart degil
fetch next 1 row only --ve 1 satırı getir

select*from maas order by maas desc offset 1 limit 1 -- getirir buda
 
-- Maas tablosundan en düşük dördüncü maası listeleyiniz
select*from maas order by maas offset 3 limit 1

--                      DDL--ALTER TABLE
drop table personel -- Tabloyu ortadan kaldırmak için kullanılır

CREATE TABLE personel  (
id int,
isim varchar(50),  sehir varchar(50),  maas int,  
sirket varchar(20),
CONSTRAINT personel_pk PRIMARY KEY (id)
);
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
SELECT * FROM personel

--                           1- ADD defoult deger ile tabloya veri ekleme

ALTER TABLE personel --yeni bir sutun eklemek istedigimizde alter table kull
ADD ulke_isim varchar(20) --sutun adını ADD ile veririz VE null deger atanır belirtmedigimiz icin

ALTER TABLE personel
ADD adres varchar(50) DEFAULT'Turkiye' --

ALTER TABLE personel 
add zipcode varchar(20) -- burda kucuk add i kabul ediyor

ALTER TABLE personel
add adres varchar(50) DEFAULT'Turkiye' --burda kucuk add i kabul etmiyor

--DEFAULT yazarsak olusturdugumuz sutuna belirttigimiz veriyi tum satırlara girer
--default yazmayınca null getirir yazınca yazdıgımız veriyi getirir

--                               2) Tabloya birden fazla field ekleme
ALTER TABLE personel
ADD cinsiyet varchar(20) , ADD yas int;

--sutunu silmek istersek eger;
ALTER TABLE personel
DROP COLUMN yas
 
 --birden fazla silmek istersek sutun;
ALTER TABLE personel
DROP COLUMN ulke_isim,drop column zipcode

--                               3-  RENAME COLUMN sutun adi degistirme

ALTER TABLE personel
RENAME COLUMN sehir TO il  --BU KALICI CUNKU SELECT İLE SORGULAMA YAPMADIK O ZAMAN GECİCİ OLURDU

--                               4- RENAME COLUMN TABLE adi degistirme

ALTER TABLE personel
RENAME TO isciler
select*from isciler

--                                5- TYPE/SET(modify) sutunlarin ozelliklerini degistirme

--Type :modify(myescuel ile oracle da kullanilir modify diye)
--type;data tipini degistirir
--set;constraint ekleyebiliyoruz

--
ALTER TABLE isciler
ALTER COLUMN il TYPE varchar(30), --ili 30 olarak degist.
ALTER COLUMN maas SET NOT NULL -- buraya da bir kısıtlama ekliyoruz (constraint) not null olarak

/*
Eğer numerik data türüne sahip bir sütunun data türüne string bir data türü atamak istersek
TYPE varchar(30) USING(maas::varchar(30)) bu formatı kullanırız
*/

ALTER TABLE isciler
ALTER COLUMN maas
TYPE varchar USING(maas::varchar(30)) --::casting yapar int ı stringe donusturur

-- TRANSACTION (BEGIN-SAVEPOINT-ROLLBACK-COMMIT)
--transaction veritabanı sistemlerinde bir islem basladıgında baslar ve islem bitince sona erer.
--bu islemler veri silme,veri guncelleme,veeriyi gerigetirme gibi islemler olabilir
/*
Transaction başlatmak için BEGIN komutu kullanmamız gerekir ve Transaction'ı sonlardık için
COMMIT komutunu çalıştırmalıyız
*/
--transactionda seril cok tavsiye edilmez.1,2,3,4,5,6 tane veri varsa  1,2 kalınca 2,3 silecek ve 5,6 dan baslayacak tavsiye edilmez
drop table ogrenciler2
CREATE TABLE ogrenciler2
(
id serial, -- Serial data türü otomatik olarak 1 den baslayarak sıralı olarak sayı ataması yapar
            -- INSERT INTO ile tabloya veri eklerken serial data türünü kullandığım veri değeri yerine DEFAULT yazarız
	
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu real       
);
BEGIN;
INSERT INTO ogrenciler2 VALUES(default, 'Ali Can', 'Hasan',75.5); -- serial degeri yerine default yazarız
INSERT INTO ogrenciler2 VALUES(default, 'Merve Gul', 'Ayse',85.3);
savepoint x;
INSERT INTO ogrenciler2 VALUES(default, 'Kemal Yasa', 'Hasan',85.6);
INSERT INTO ogrenciler2 VALUES(default, 'Nesibe Yilmaz', 'Ayse',95.3);
savepoint y;
INSERT INTO ogrenciler2 VALUES(default, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler2 VALUES(default, 'Can Bak', 'Ali', 67.5);
ROLLBACK to x;
COMMIT;
select*from ogrenciler2
 delete from ogrenciler2
 
 /*
 NOT :PostgreSQL de Transaction kullanımı için «Begin;» komutuyla başlarız sonrasında tekrar
yanlış bir veriyi düzelmek veya bizim için önemli olan verilerden 
sonra ekleme yapabilmek için "SAVEPOINT savepointismi" komutunu
kullanırız ve bu savepointe dönebilmek için "ROLLBACK TO savepointismi" komutunu 
kullanırız ve rollback çalıştırıldığında savepoint yazdığımız satırın üstündeki 
verileri tabloda bize verir ve son olarak Transaction'ı sonlandırmak için mutlaka 
"COMMIT" komutu kullanılır. 
 */














