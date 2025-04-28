-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 22 avr. 2025 à 13:08
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `magasin`
--
CREATE DATABASE magasin_tp4;
use magasin_tp4;
-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id_article` char(5) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `Prix` decimal(8,2) DEFAULT NULL,
  `categorie` enum('tous','vidéo','photo','informatique','divers') NOT NULL DEFAULT 'tous'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id_article`, `designation`, `Prix`, `categorie`) VALUES
('CA300', 'Canon EOS 3000V zoom 28/80', 329.00, 'photo'),
('CAS07', 'Cassette DV60 par 5', 26.90, 'divers'),
('CP100', 'Caméscope Panasonic SV-AV100', 1490.00, 'vidéo'),
('CS330', 'Caméscope Sony DCR-PC330 ', 1629.00, 'vidéo'),
('DEL30', 'Portable Dell X300', 1715.00, 'informatique'),
('DVD75', 'DVD vierge par 3', 17.50, 'divers'),
('HP497', 'PC bureau HP497 écran TFT', 1500.00, 'informatique'),
('NIK55', 'Nikon F55+zoom 28/80', 269.00, 'photo'),
('NIK80', 'Nikon F80', 479.00, 'photo'),
('SAX15', 'Portable Samsung X15 XVM ', 1999.00, 'informatique'),
('SOXMP', 'PC portable Sony Z1-XMP', 2399.00, 'informatique');

-- --------------------------------------------------------

--
-- Structure de la table `clientbis`
--

CREATE TABLE `clientbis` (
  `id_client` mediumint(8) UNSIGNED NOT NULL,
  `name_client` char(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `age` tinyint(3) UNSIGNED DEFAULT NULL,
  `adresse` varchar(255) NOT NULL,
  `mail` varchar(100) DEFAULT NULL,
  `ville` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `clientbis`
--

INSERT INTO `clientbis` (`id_client`, `name_client`, `prenom`, `age`, `adresse`, `mail`, `ville`) VALUES
(1, 'Marti', 'Jean', 36, '5 av. Einstein ', 'mart@marti.com', ' Orl?ans'),
(2, 'Rapp', 'Paul', 44, '32 av. Foch', 'rapp@libert.com', ' Paris'),
(3, 'Devos', 'Marie', 18, '75 bd Hochimin', 'grav@waladoo.fr', '  Lille '),
(4, 'Hochon', 'Paul', 22, '33 rue Ts?ts? ', 'hoch@fiscali.fr', ' Chartres'),
(5, 'Grave', 'Nuyen', 18, '75 bd Hochimin', 'grav@waladoo.fr', ' Lille'),
(6, 'Hachette', 'Jeanne', 45, '60 rue d\'Amiens ', 'moi@leposte.fr ', 'Rabat'),
(7, 'Marti', 'Pierre', 25, '4 av. Henri', 'martin7@fiscali.fr', '  Paris'),
(8, 'Mac Neal', 'John', 52, '89 rue Diana', 'mac@freez.fr', 'Rabat'),
(9, 'Basile', 'Did', 37, '26 rue Gallas', 'bas@walabi.com', 'Rabat'),
(10, 'Darc', 'Jeanne', 19, '9 av. d\'Orl?ans', NULL, 'Paris'),
(11, 'Gat?', 'Bill', 45, '9 bd des Bugs', 'bill@microhard.be', 'Rabat');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id_comm` mediumint(8) UNSIGNED NOT NULL,
  `id_client` mediumint(8) UNSIGNED NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id_comm`, `id_client`, `date`) VALUES
(1, 5, '2025-03-03'),
(2, 9, '0000-00-00'),
(3, 1, '2025-04-08'),
(4, 3, '2025-03-17'),
(5, 9, '2025-03-18'),
(6, 10, '2025-03-27'),
(7, 2, '2025-03-28'),
(8, 7, '2025-03-30'),
(9, 11, '2025-04-08'),
(10, 11, '2025-04-16'),
(11, 8, '2025-04-11'),
(12, 5, '2025-04-12'),
(13, 9, '2025-04-14');

-- --------------------------------------------------------

--
-- Structure de la table `ligne`
--

CREATE TABLE `ligne` (
  `id_comm` mediumint(8) UNSIGNED NOT NULL,
  `id_article` char(5) NOT NULL,
  `quantite` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `ligne`
--

INSERT INTO `ligne` (`id_comm`, `id_article`, `quantite`) VALUES
(1, 'CS330', 1),
(1, 'CAS07', 3),
(2, 'HP497', 2),
(4, 'SOXMP', 3),
(4, 'DVD75', 2),
(5, 'CA300', 1),
(6, 'CAS07', 5),
(6, 'CP100', 5),
(7, 'SAX15', 5),
(8, 'SOXMP', 1),
(8, 'CP100', 1),
(9, 'NIK55', 1),
(11, 'DVD75', 10),
(12, 'CS330', 3),
(12, 'CAS07', 4),
(13, 'SAX15', 2),
(3, 'NIK80', 5),
(10, 'DEL30', 2),
(10, 'SAX15', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id_article`);

--
-- Index pour la table `clientbis`
--
ALTER TABLE `clientbis`
  ADD PRIMARY KEY (`id_client`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id_comm`),
  ADD KEY `id_client` (`id_client`);

--
-- Index pour la table `ligne`
--
ALTER TABLE `ligne`
  ADD KEY `fk_article1` (`id_article`),
  ADD KEY `fk_comm` (`id_comm`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `clientbis`
--
ALTER TABLE `clientbis`
  MODIFY `id_client` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id_comm` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_client` FOREIGN KEY (`id_client`) REFERENCES `clientbis` (`id_client`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `ligne`
--
ALTER TABLE `ligne`
  ADD CONSTRAINT `fk_article1` FOREIGN KEY (`id_article`) REFERENCES `article` (`id_article`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_comm1` FOREIGN KEY (`id_comm`) REFERENCES `commande` (`id_comm`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
