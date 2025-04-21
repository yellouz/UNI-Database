-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 16 avr. 2025 à 10:04
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

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
CREATE DATABASE magasin;
USE magasin;
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

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id_comm` mediumint(8) UNSIGNED NOT NULL,
  `id_client` mediumint(8) UNSIGNED NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  MODIFY `id_client` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id_comm` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

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
ALTER TABLE ligne
  ADD CONSTRAINT fk_article1 FOREIGN KEY (id_article) REFERENCES article (id_article) ,
  ADD CONSTRAINT `fk_comm1` FOREIGN KEY (`id_comm`) REFERENCES `commande` (`id_comm`) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
