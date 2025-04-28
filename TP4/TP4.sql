-- 1.1)
select * from clientbis;

-- 1.2)
select name_client, prenom, ville from clientbis;

-- 1.3)
select ville from clientbis;

-- 1.4)
select distinct ville from clientbis;

-- 1.5)
select distinct ville from clientbis order by ville;

-- 1.6)
select distinct ville from clientbis order by ville desc;

-- 1.7)
select id_client as code_client from clientbis;

-- 1.8)
select designation, Prix, Prix*2/3 as PrixPack from article;

-- 1.9)
select * from clientbis
order by id_client
limit 1, 2;

select * from clientbis
order by age desc
limit 2;

-- 2.1)
select * from clientbis 
where ville = 'Paris';

-- 2.2)
select * from clientbis
where age > 40;

-- 2.3)
select * from clientbis
where mail is NULL;

-- 2.4)
select * from clientbis
where name_client REGEXP '^[A-H]';

-- 2.5)
select * from article
where Prix between 1500 and 2000;

-- 2.6)
select * from clientbis
where age in (18, 19, 20);

-- 2.7)
select * from clientbis
where adresse like '%av%';

-- 2.8)
select * from article
where designation like '%Sony%';

-- 2.9)
select * from clientbis
where name_client like '_a%';

-- 2.10)
select * from clientbis
where age >= 30
and ville = ' Paris';

-- 2.11)
select * from clientbis
where ville='Lyon'
or name_client like 'H%';

-- 2.12)
select * from clientbis
where ville not in ('Lyon','Paris');

-- 2.13)
select id_comm, quantite, quantite*2 as Produit_QT from ligne;

-- 2.14)
select avg(age) as age_moyen from clientbis; 

-- 2.15)
select avg(Prix) as Prix_moyen from article;

-- 2.16)
select count(id_client) as nombre_clients from clientbis;

-- 2.17)
select count(distinct prenom) from clientbis;

-- 2.18)
select count(mail) from clientbis;

-- 2.19)
select count(distinct ville) from clientbis;

-- 2.20)
select max(Prix) from article;

-- 2.21)
select min(age) from clientbis;

-- 2.22)
select sum(quantite) from ligne;

-- 2.23)
select ville, min(age)
from clientbis
group by ville;

-- 2.24)
select ville, max(age)
from clientbis
group by ville;

-- 2.26)
select ville, min(age), max(age), avg(age)
from clientbis
group by ville;

-- 2.27)
select id_comm, sum(quantite) from ligne
group by id_comm;

-- 2.28)
select avg(age)
from clientbis
where ville like 'L%';

-- 2.29)
select categorie, sum(Prix)
from article
group by categorie
having sum(Prix) > 1500;

-- 2.30)
select categorie, sum(Prix)
from article
group by categorie;

-- 3.1)
select id_comm, name_client, prenom, ville
from clientbis, commande
where clientbis.id_client = commande.id_client;

-- 3.2)
select id_comm, name_client, prenom, ville
from clientbis, commande
where clientbis.id_client = commande.id_client
and clientbis.id_client = 5;

-- 3.3)
select ligne.id_article, designation, Prix, sum(quantite) as nombre_total_darticle
from ligne, article
where ligne.id_article = article.id_article
group by id_article
order by nombre_total_darticle desc;

-- 3.4)

SELECT cm.id_comm, cb.name_client, cb.prenom, cb.ville, SUM(l.quantite * a.Prix) AS montant_total
FROM commande cm 
JOIN clientbis cb ON cm.id_client = cb.id_client
JOIN ligne l ON cm.id_comm = l.id_comm
JOIN article a ON l.id_article = a.id_article
GROUP BY cm.id_comm, cb.name_client, cb.prenom, cb.ville;