-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 20 mai 2026 à 16:45
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
-- Base de données : `mediatheque`
--

-- --------------------------------------------------------

--
-- Structure de la table `abonne`
--

CREATE TABLE `abonne` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `date_inscription` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `abonne`
--

INSERT INTO `abonne` (`id`, `nom`, `prenom`, `email`, `date_inscription`) VALUES
(8, 'Dupont', 'Jean', 'jean.dupont@mail.com', '2026-05-20'),
(9, 'Martin', 'Marie', 'marie.martin@mail.com', '2026-05-20'),
(10, 'Bernard', 'Paul', 'paul.bernard@mail.com', '2026-05-20'),
(11, 'Durand', 'Sophie', 'sophie.durand@mail.com', '2026-05-20'),
(12, 'Leroy', 'Lucas', 'lucas.leroy@mail.com', '2026-05-20');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20260520080837', '2026-05-20 10:09:00', 220),
('DoctrineMigrations\\Version20260520101558', '2026-05-20 12:16:21', 64),
('DoctrineMigrations\\Version20260520134725', '2026-05-20 15:47:34', 71);

-- --------------------------------------------------------

--
-- Structure de la table `emprunt`
--

CREATE TABLE `emprunt` (
  `id` int(11) NOT NULL,
  `date_emprunt` date NOT NULL,
  `date_retour_prevue` date NOT NULL,
  `date_retour_effective` date DEFAULT NULL,
  `livre_id` int(11) NOT NULL,
  `abonne_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `emprunt`
--

INSERT INTO `emprunt` (`id`, `date_emprunt`, `date_retour_prevue`, `date_retour_effective`, `livre_id`, `abonne_id`) VALUES
(9, '2026-05-20', '2026-06-20', NULL, 16, 8),
(10, '2026-05-20', '2026-06-20', NULL, 17, 9),
(11, '2026-05-20', '2026-06-20', NULL, 18, 10);

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

CREATE TABLE `livre` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `isbn` varchar(255) NOT NULL,
  `auteur` varchar(255) NOT NULL,
  `date_publication` date NOT NULL,
  `disponible` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `livre`
--

INSERT INTO `livre` (`id`, `titre`, `isbn`, `auteur`, `date_publication`, `disponible`) VALUES
(16, 'Harry Potter', '9782070584628', 'J.K. Rowling', '2000-01-01', 0),
(17, 'Le Seigneur des Anneaux', '9782267011258', 'Tolkien', '2000-01-01', 0),
(18, 'Les Misérables', '9782253096344', 'Victor Hugo', '2000-01-01', 0),
(19, 'Le Petit Prince', '9782070408504', 'Saint-Exupéry', '2000-01-01', 1),
(20, 'Dune', '9782266320643', 'Frank Herbert', '2000-01-01', 1),
(21, '1984', '9782072763786', 'George Orwell', '2000-01-01', 1),
(22, 'Le Rouge et le Noir', '9782253004226', 'Stendhal', '2000-01-01', 1),
(23, 'Germinal', '9782253004226', 'Émile Zola', '2000-01-01', 1),
(24, 'L\'Étranger', '9782070360024', 'Albert Camus', '2000-01-01', 1),
(25, 'Madame Bovary', '9782253004392', 'Gustave Flaubert', '2000-01-01', 1);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`roles`)),
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`) VALUES
(1, 'admin@mediatheque.fr', '[\"ROLE_ADMIN\"]', '$2y$13$PKRSO19j0KJDmAZLeU.0GeW8og5P106RMxe0h0X9fiGfn3yDmPEBS'),
(2, 'biblio@mediatheque.fr', '[\"ROLE_BIBLIOTHECAIRE\"]', '$2y$13$XD6gY7ibnjlpAOeEIN1YjeQjO8Zl2H8JsW1payKW4fWj0Jag9WBGa');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `abonne`
--
ALTER TABLE `abonne`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `emprunt`
--
ALTER TABLE `emprunt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_364071D737D925CB` (`livre_id`),
  ADD KEY `IDX_364071D7C325A696` (`abonne_id`);

--
-- Index pour la table `livre`
--
ALTER TABLE `livre`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0E3BD61CE16BA31DBBF396750` (`queue_name`,`available_at`,`delivered_at`,`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `abonne`
--
ALTER TABLE `abonne`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `emprunt`
--
ALTER TABLE `emprunt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `livre`
--
ALTER TABLE `livre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `emprunt`
--
ALTER TABLE `emprunt`
  ADD CONSTRAINT `FK_364071D737D925CB` FOREIGN KEY (`livre_id`) REFERENCES `livre` (`id`),
  ADD CONSTRAINT `FK_364071D7C325A696` FOREIGN KEY (`abonne_id`) REFERENCES `abonne` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
