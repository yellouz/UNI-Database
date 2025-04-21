-- 1.1)
insert into clientbis values
(1,"Marti","Jean",36,"5 av. Einstein","Orléans","mart@marti.com"),
(2, "Rapp" ,"Paul", 44,"32 av. Foch ","Paris"," rapp@libert.com"),
(3 ,"Devos" ,"Marie", 18,"75 bd Hochimin","Lille"," grav@waladoo.fr"),
(4 ,"Hochon"," Paul", 22 ,"33 rue Tsétsé","Chartres"," hoch@fiscali.fr"),
(5 ,"Grave","Nuyen", 18,"75 bd Hochimin"," Lille","grav@waladoo.fr"),
(6 ,"Hachette"," Jeanne", 45," 60 rue d’Amiens ","Versailles", NULL),
(7 ,"Marti", "Pierre", 25 ,"4 av. Henri"," Paris","martin7@fiscali.fr"),
(8 ,"Mac Neal" ,"John",52 ,"89 rue Diana"," Lyon","mac@freez.fr"),
(9 ,"Basile" ,"Did" ,37," 26 rue Gallas"," Nantes"," bas@walabi.com"),
(10, "Darc" ,"Jeanne", 19," 9 av. d’Orléans ","Paris", NULL),
(11 ,"Gaté" ,"Bill" ,45 ,"9 bd des Bugs ","Lyon"," bill@microhard.be");

-- 2.1)
UPDATE clientbis 
SET adresse='67 av.Med 5' 
WHERE id_client=1;

-- 2.2)
UPDATE clientbis 
SET nom='Sarih', prenom='Hassan' 
WHERE id_client=2;

-- 2.3)
UPDATE clientbis 
SET ville='moi@leposte.fr'
WHERE ville LIKE '';

-- 2.4)
UPDATE clientbis 
SET mail='casa'
WHERE age>=35;

-- 2.5)
UPDATE clientbis 
SET nom='KARAMI'
WHERE age IN (18, 22);

-- 2.6)
UPDATE clientbis 
SET mail='Agadir'
LIMIT 4;

-- 2.7)
UPDATE article
SET categorie='video'
WHERE Prix BETWEEN 250 AND 500;

-- 2.8)
UPDATE ligne
SET quantite=5
WHERE id_comm=6;

-- 2.9)
UPDATE commande
SET date=NULL
WHERE id_comm=2;

-- 2.10)
UPDATE clientbis
SET mail='Rabat';

-- 2.11)
ALTER TABLE clientbis AUTO_INCREMENT = 20;
insert into clientbis values
(NULL,"Ankour","Gad",18,"18,Hy Zaynton","Meknes","Ank@gmail.com"),
(NULL, "Lzrak" ,"Foad", 23,"23,Hy Elfath","Rabat","Lzrak@gmail.com"),
(NULL ,"Bahri" ,"Merem", 45,"Derb Sltan","Casa","Bahri@gmail.com");

-- 2.12)
REPLACE INTO clientbis VALUES
(20, 'nougeaine', 'Fahd', 25, '5 av. Einstein', 'barcelona', 'fah@yahoo.com'),
(21, 'Sabri', 'wissam', 22, '32 av. Foch', 'Weert', 'Sabri@libert.com'),
(22, 'Kablan', 'Katy', 30, '75 bd Hochimin', 'Poitier', 'katy@waladoo.fr');

-- 3.1)
ALTER TABLE commande DROP FOREIGN KEY fk_client;

-- 3.2)
DELETE FROM clientbis 
WHERE name_client='Nougeaine' AND prenom='Fahd';

-- 3.3)
DELETE FROM clientbis 
WHERE mail LIKE 'P%';

-- 3.4)
DELETE FROM clientbis
ORDER BY id_client
LIMIT 3;

-- 3.5)
DELETE FROM clientbis
WHERE age<30;

-- 3.6)
DROP TABLE clientbis;

CREATE TABLE `clientbis` (
  `id_client` mediumint(8) UNSIGNED NOT NULL,
  `name_client` char(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `age` tinyint(3) UNSIGNED DEFAULT NULL,
  `adresse` varchar(255) NOT NULL,
  `mail` varchar(100) DEFAULT NULL,
  `ville` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `clientbis`
  ADD PRIMARY KEY (`id_client`);

ALTER TABLE `clientbis`
  MODIFY `id_client` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

insert into clientbis values
(1,"Marti","Jean",36,"5 av. Einstein","Orléans","mart@marti.com"),
(2, "Rapp" ,"Paul", 44,"32 av. Foch ","Paris"," rapp@libert.com"),
(3 ,"Devos" ,"Marie", 18,"75 bd Hochimin","Lille"," grav@waladoo.fr"),
(4 ,"Hochon"," Paul", 22 ,"33 rue Tsétsé","Chartres"," hoch@fiscali.fr"),
(5 ,"Grave","Nuyen", 18,"75 bd Hochimin"," Lille","grav@waladoo.fr"),
(6 ,"Hachette"," Jeanne", 45," 60 rue d’Amiens ","Versailles", NULL),
(7 ,"Marti", "Pierre", 25 ,"4 av. Henri"," Paris","martin7@fiscali.fr"),
(8 ,"Mac Neal" ,"John",52 ,"89 rue Diana"," Lyon","mac@freez.fr"),
(9 ,"Basile" ,"Did" ,37," 26 rue Gallas"," Nantes"," bas@walabi.com"),
(10, "Darc" ,"Jeanne", 19," 9 av. d’Orléans ","Paris", NULL),
(11 ,"Gaté" ,"Bill" ,45 ,"9 bd des Bugs ","Lyon"," bill@microhard.be");

-- 3.7)
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_client` FOREIGN KEY (`id_client`) REFERENCES `clientbis` (`id_client`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 3.8)
DELETE FROM commande
WHERE id_client IN (1, 4);

-- 3.9)
-- j'obtiendrais une erreur, car ON DELETE NO ACTION empêche la 
-- suppression d'un client s'il a des commandes associées : il faut d'abord 
-- supprimer la relation ou modifier la contrainte

-- 3.10)
ALTER TABLE ligne DROP FOREIGN KEY fk_comm1;

ALTER TABLE ligne
  ADD CONSTRAINT `fk_comm1` FOREIGN KEY (`id_comm`) REFERENCES `commande` (`id_comm`) ON DELETE CASCADE ON UPDATE CASCADE;

-- 3.11)
-- L'utilisation d' ON DELETE CASCADE est utile pour maintenir l'intégrité 
-- des données, car il supprime automatiquement les relations associées sans 
-- générer d'erreurs
