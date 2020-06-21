-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 15 juin 2020 à 17:52
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion_conge`
--

-- --------------------------------------------------------

--
-- Structure de la table `auth`
--

CREATE TABLE `auth` (
  `id` int(11) NOT NULL,
  `login` varchar(45) DEFAULT NULL,
  `pwd` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `auth`
--

INSERT INTO `auth` (`id`, `login`, `pwd`) VALUES
(2, 'user', 'user'),
(6, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Structure de la table `demande_conge`
--

CREATE TABLE `demande_conge` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `date_demande` date DEFAULT NULL,
  `id_employe` int(11) DEFAULT NULL,
  `id_type` int(11) DEFAULT NULL,
  `decision` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `demande_conge`
--

INSERT INTO `demande_conge` (`id`, `nom`, `prenom`, `date_debut`, `date_fin`, `date_demande`, `id_employe`, `id_type`, `decision`) VALUES
(13, 'tijani', 'fatima', '2020-06-10', '2020-06-25', '2020-06-13', 2, 22, ''),
(19, 'harzafi', 'walid', '2020-06-02', '2020-06-25', '2020-06-15', 4, 22, '');

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

CREATE TABLE `employe` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `cin` varchar(45) DEFAULT NULL,
  `adress` varchar(255) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `situa_famil` char(200) DEFAULT NULL,
  `pays` char(200) DEFAULT NULL,
  `tel` int(11) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `grade` varchar(45) DEFAULT NULL,
  `id_login` int(11) DEFAULT NULL,
  `salaire` float DEFAULT NULL,
  `date_embauche` date DEFAULT NULL,
  `id_service` int(11) DEFAULT NULL,
  `sexe` char(1) DEFAULT NULL,
  `nbr_jour` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `employe`
--

INSERT INTO `employe` (`id`, `nom`, `prenom`, `cin`, `adress`, `date_naissance`, `situa_famil`, `pays`, `tel`, `email`, `grade`, `id_login`, `salaire`, `date_embauche`, `id_service`, `sexe`, `nbr_jour`) VALUES
(2, 'abdsamad', 'fatima', 'HJ456', ' canada', '1987-11-10', 'marie', 'canada', 690800032, 'massif@gmail.com', 'directeur ', 4, 40000, '2020-06-17', 3, 'M', '20'),
(6, 'achari', 'zakaria', 'HA321', 'qu heloba 43 somal ', '1994-06-09', 'marié', 'morocco', 600435243, 'echoufi@gmail.com', 'chef de projet', 6, 30000, '2020-06-08', 2, 'M', '10');

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

CREATE TABLE `paiement` (
  `id` int(11) NOT NULL,
  `mois` date DEFAULT NULL,
  `salaire_brut` float DEFAULT NULL,
  `heures_supl` int(11) DEFAULT NULL,
  `jour_absence` int(11) DEFAULT NULL,
  `id_employe` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `libelle` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `service`
--

INSERT INTO `service` (`id`, `libelle`) VALUES
(1, 'comptabilité'),
(2, 'RH'),
(3, 'devllopeur');

-- --------------------------------------------------------

--
-- Structure de la table `type_conge`
--

CREATE TABLE `type_conge` (
  `id` int(11) NOT NULL,
  `libelle` varchar(200) DEFAULT NULL,
  `duree` int(11) DEFAULT NULL,
  `solde_conge` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `type_conge`
--

INSERT INTO `type_conge` (`id`, `libelle`, `duree`, `solde_conge`) VALUES
(20, 'maladie', 10, NULL),
(21, 'marié', 7, NULL),
(22, 'formation', 10, NULL),
(23, 'examen', 3, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `auth`
--
ALTER TABLE `auth`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `demande_conge`
--
ALTER TABLE `demande_conge`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_employe` (`id_employe`),
  ADD KEY `id_type` (`id_type`);

--
-- Index pour la table `employe`
--
ALTER TABLE `employe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_login` (`id_login`),
  ADD KEY `id_service` (`id_service`);

--
-- Index pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_employe` (`id_employe`);

--
-- Index pour la table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `type_conge`
--
ALTER TABLE `type_conge`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `auth`
--
ALTER TABLE `auth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `demande_conge`
--
ALTER TABLE `demande_conge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `employe`
--
ALTER TABLE `employe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `paiement`
--
ALTER TABLE `paiement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `type_conge`
--
ALTER TABLE `type_conge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `demande_conge`
--
ALTER TABLE `demande_conge`
  ADD CONSTRAINT `demande_conge_ibfk_1` FOREIGN KEY (`id_employe`) REFERENCES `employe` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `demande_conge_ibfk_2` FOREIGN KEY (`id_type`) REFERENCES `type_conge` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `employe`
--
ALTER TABLE `employe`
  ADD CONSTRAINT `employe_ibfk_1` FOREIGN KEY (`id_login`) REFERENCES `auth` (`id`),
  ADD CONSTRAINT `employe_ibfk_2` FOREIGN KEY (`id_service`) REFERENCES `service` (`id`);

--
-- Contraintes pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD CONSTRAINT `paiement_ibfk_1` FOREIGN KEY (`id_employe`) REFERENCES `employe` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
