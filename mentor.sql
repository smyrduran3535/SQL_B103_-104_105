CREATE TABLE family_members(
	id int,
	name varchar(7),
	gender varchar(6),
	species varchar(5),
	num_books_read int
);
insert into family_members values(1,'Dave','male','human',200);
insert into family_members values(2,'Mary','female','human',180);
insert into family_members values(3,'Pickles','male','dog',0);
select*from family_members
--2-name and species  sütunlarını gösteren query yazın. 
select name,species from family_members
--3-dog a ait tüm satırları döndüren query yazın.
select*from family_members where species='dog' 
--4- num_books_read değeri 190'dan büyük olan aile üyelerine a ait tüm satırları döndüren query yazın. 
select*from family_members where num_books_read>190
 ----------------------
 drop table characters
 CREATE TABLE characters(
 id int,
 name varchar(20)
 );
 
insert into characters values(1,'Doogie Howser');
insert into characters values(2,'Barney Stinson');
insert into characters values(3,'Lily Aldrin');
insert into characters values(4,'Willow Rosenbarg');
select*from characters
	drop table character_tv_show
CREATE TABLE character_tv_show(
id int,
characters_id int,
tv_show_name varchar(50)
);
insert into character_tv_show values(1,4,'Buffy the Vampire');
insert into character_tv_show values(2,3,'How I met your mother');
	insert into character_tv_show values(3,2,'How I met your mother');
	insert into character_tv_show  values(4,1,'Doogie Howser,M.D');
	select*from character_tv_show
	drop table characters_actor
	CREATE TABLE characters_actor(
	id int,
	characters_id int,
	actor_name varchar(50)
	);
	insert into characters_actor values(1,4,'Alyson Hannigan');
	insert into characters_actor values(2,3,'Alyson Hannigan');
	insert into characters_actor values(3,2,'Neil Patrick Harris');
    insert into characters_actor values(4,1,'Neil Patrick Harris');
    select*from characters_actor

--5- Her character adını onları oynayan actor  eşleştirmek için inner join kullanarak query yazın. 
select name,actor_name from characters 
inner join 
characters_actor on characters.id=characters_actor.characters_id




