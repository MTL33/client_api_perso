-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jul 07, 2022 at 02:38 PM
-- Server version: 5.7.23
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `ingrwf10_php`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `label` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `label`) VALUES
(1, 'fruits'),
(2, 'jouets'),
(3, 'outils'),
(4, 'véhicules'),
(6, 'new label');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `message`) VALUES
(1, 'test', 'test@ss.com', 'dsdsdsd'),
(2, 'inconnu', 'dsdsd@ddd.com', 'ssdsds'),
(3, 'inconnu', 'dsdsd@ddd.com', 'ssdsds'),
(4, 'inconnu', 'dsdsd@ddd.com', 'ssdsds'),
(5, 'inconnu', 'dsdsd@ddd.com', 'ssdsds'),
(6, 'inconnu', 'dsdsd@ddd.com', 'ssdsds'),
(7, 'inconnu', 'dsdsd@ddd.com', 'ssdsds'),
(8, 'pierre charlier', 'charlier.pierre@gmail.com', 'sdsdsdsd');

-- --------------------------------------------------------

--
-- Stand-in structure for view `marcel`
-- (See below for the actual view)
--
CREATE TABLE `marcel` (
`id_personnes` int(10) unsigned
,`nom` varchar(120)
,`prenom` varchar(120)
);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(10) UNSIGNED NOT NULL,
  `titre` varchar(200) NOT NULL,
  `contenu` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `titre`, `contenu`) VALUES
(1, 'nouveau titre', 'nouveau contenu'),
(2, 'ti tre d enews 2', 'lorem lorem news 2'),
(3, 'titre de la news 3', 'lorem lore lorem news 3'),
(5, 'essai Pierre', 'lorem ipsum Pierre'),
(6, 'essai Pierre', 'lorem ipsum Pierre'),
(7, 'essai Pierre', 'il s\'agit lorem ipsum Pierre');

-- --------------------------------------------------------

--
-- Table structure for table `personnes`
--

CREATE TABLE `personnes` (
  `id_personnes` int(10) UNSIGNED NOT NULL,
  `nom` varchar(120) DEFAULT NULL,
  `prenom` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `personnes`
--

INSERT INTO `personnes` (`id_personnes`, `nom`, `prenom`) VALUES
(2, 'Proust2', 'Marcel2'),
(6, 'charlier', 'benoit'),
(19, 'devos', 'françoise'),
(22, 'Proust', 'Marcel'),
(23, 'Proust2', 'Marcel2'),
(24, 'Proust2', 'Marcel2'),
(25, 'Proust2', 'Marcel2'),
(26, 'Proust2', 'Marcel2'),
(27, 'NULL', 'Bastien'),
(28, 'Henry', 'Philippe'),
(29, 'Henry2', 'Philippe2'),
(30, 'Henry2', 'Philippe2'),
(31, 'Dupnt', 'Henry'),
(32, 'dupont', 'marcel'),
(33, 'proust', 'Emmanuel'),
(34, 'charlier2', 'pierre2'),
(35, 'test', 'pitou'),
(36, 'charlier2', 'pierre2'),
(37, 'charlier2', 'pierre2'),
(38, 'charlier2', 'pierre2'),
(39, 'charlier2', 'pierre2');

-- --------------------------------------------------------

--
-- Table structure for table `produits`
--

CREATE TABLE `produits` (
  `id` int(10) UNSIGNED NOT NULL,
  `label` varchar(250) NOT NULL,
  `id_categories` int(11) DEFAULT NULL,
  `prix` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produits`
--

INSERT INTO `produits` (`id`, `label`, `id_categories`, `prix`) VALUES
(1, 'pommes', 1, NULL),
(3, 'new label', NULL, 45),
(4, 'poires', 1, NULL),
(5, 'voiture', 4, NULL),
(6, 'poupée', 2, NULL),
(7, 'new label2', NULL, 45.3),
(8, 'new label2', NULL, 45.3),
(9, 'new label2', NULL, 45.3),
(10, 'new label2', NULL, 45.3),
(11, 'new label2', NULL, 45.3);

-- --------------------------------------------------------

--
-- Stand-in structure for view `produits_categories`
-- (See below for the actual view)
--
CREATE TABLE `produits_categories` (
`id` int(10) unsigned
,`label` varchar(250)
,`id_categories` int(11)
,`prix` float
,`id_cat` int(11)
,`cat_label` varchar(250)
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_users` int(10) UNSIGNED NOT NULL,
  `login` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_users`, `login`, `password`) VALUES
(1, 'pierre', 'pass');

-- --------------------------------------------------------

--
-- Structure for view `marcel`
--
DROP TABLE IF EXISTS `marcel`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `marcel`  AS  select `personnes`.`id_personnes` AS `id_personnes`,`personnes`.`nom` AS `nom`,`personnes`.`prenom` AS `prenom` from `personnes` where (`personnes`.`prenom` like '%marcel%') ;

-- --------------------------------------------------------

--
-- Structure for view `produits_categories`
--
DROP TABLE IF EXISTS `produits_categories`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `produits_categories`  AS  select `produits`.`id` AS `id`,`produits`.`label` AS `label`,`produits`.`id_categories` AS `id_categories`,`produits`.`prix` AS `prix`,`categories`.`id` AS `id_cat`,`categories`.`label` AS `cat_label` from (`produits` left join `categories` on((`produits`.`id_categories` = `categories`.`id`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personnes`
--
ALTER TABLE `personnes`
  ADD PRIMARY KEY (`id_personnes`);

--
-- Indexes for table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categories` (`id_categories`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_users`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personnes`
--
ALTER TABLE `personnes`
  MODIFY `id_personnes` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `produits`
--
ALTER TABLE `produits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_users` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `produits`
--
ALTER TABLE `produits`
  ADD CONSTRAINT `produits_ibfk_1` FOREIGN KEY (`id_categories`) REFERENCES `categories` (`id`);
