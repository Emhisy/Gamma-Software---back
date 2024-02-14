-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour app
DROP DATABASE IF EXISTS `app`;
CREATE DATABASE IF NOT EXISTS `app` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `app`;

-- Listage de la structure de table app. band
DROP TABLE IF EXISTS `band`;
CREATE TABLE IF NOT EXISTS `band` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `founder` varchar(255) DEFAULT NULL,
  `total_member` int DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `description` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table app.band : ~9 rows (environ)
INSERT INTO `band` (`id`, `name`, `origin`, `city`, `start_date`, `end_date`, `founder`, `total_member`, `genre`, `description`) VALUES
	(106, 'The Beatles', 'Royaume-Uni ', 'Liverpool', '1960-02-14', '1970-02-14', 'John Lennon', 4, NULL, 'The Beatles [ðə ˈbiːtəlz] est un quatuor musical britannique originaire de Liverpool, en Angleterre. Le noyau du groupe se forme avec les Quarrymen fondés ...'),
	(107, 'Indochine', 'France', 'paris', '1981-02-14', NULL, 'Nicola Sirkis et Dominique Nicolas', 5, 'pop rock', 'Indochine est un groupe de pop rock français originaire de Paris, formé par Nicola Sirkis et Dominique Nicolas en 1981. Le groupe est issu du courant new wave'),
	(108, 'Noir Désir', 'France', 'bordeaux', '1980-02-14', '2024-02-14', 'Bertrand Cantat', 4, 'rock', 'Noir Désir est un groupe de rock français, originaire de Bordeaux, en Gironde. Formé dans les années 1980, et dissout en 2010, il se compose de Bertrand Cantat, Denis Barthe, Serge Teyssot-Gay et Frédéric Vidalenc remplacé par Jean-Paul Roy à partir de 1996'),
	(109, 'Nirvana', 'Etats-unis', 'Aberdeen', '1987-02-14', '1994-02-14', 'Kurt Cobain', 3, 'grunge', 'Nirvana est un groupe de grunge américain, originaire d\'Aberdeen, dans l\'État de Washington, formé en 1987 par le chanteur-guitariste Kurt Cobain et le bassiste Krist Novoselic'),
	(110, 'Led Zeppelin', 'Royaume-Uni ', 'Londres', '1968-02-14', '1980-02-14', 'Jimmy Page', 0, 'rock', 'Led Zeppelin [lɛd ˈzɛpələn] est un groupe britannique de rock, originaire de Londres, en Angleterre. Il est fondé en 1968 par Jimmy Page, avec Robert Plant, John Paul Jones et John Bonham, et dissout à la suite de la mort de ce dernier, en 1980'),
	(111, 'Depeche Mode', 'Royaume-Uni ', 'Basildon', '1980-02-14', NULL, NULL, 3, 'rock', 'Depeche Mode est un groupe britannique de new wave et rock alternatif, originaire de Basildon, dans l\'Essex, en Angleterre. Formé en 1980, le groupe apparait au sein du courant de la synthpop et devient rapidement influent et populaire sur la scène internationale. Son nom provient d\'un magazine français, Dépêche Mode'),
	(112, 'Téléphone', 'France', 'Paris', '1976-02-14', '1986-02-14', NULL, 4, 'rock', 'Téléphone est un groupe de rock français. Il est formé le 12 novembre 1976 et séparé le 21 avril 1986. Composé de Jean-Louis Aubert, Louis Bertignac, Corine Marienneau et Richard Kolinka, il connaît un énorme succès dès ses débuts avec plusieurs tubes et des tournées très populaires'),
	(113, 'Massive Attack', 'Royaume-Uni ', 'bristol', '1987-02-14', NULL, NULL, 0, 'Trip hop', 'Massive Attack est un groupe musical britannique, originaire de Bristol, précurseur de la musique trip hop. Il se compose, à l\'origine, de Robert Del Naja, Grant Marshall et Andrew Vowles'),
	(114, 'Pink Floyd', 'Royaume-Uni ', 'Londres', '1964-02-14', '2024-02-14', 'Syd Barrett,', 3, 'rock', 'Pink Floyd [pɪŋk flɔɪd] est un groupe britannique de rock originaire de Londres. Le groupe débute avec un premier album de musique psychédélique pour ensuite bifurquer vers le rock progressif. Formé en 1965, il est considéré comme un pionnier et représentant majeur de ces styles musicaux.'),
	(115, 'Test Manuel', 'France', 'Annecy', '1993-10-19', NULL, 'Doom', 14, 'POP', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l\'imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n\'a pas fait que survivre cinq siècles, mais s\'est aussi adapté à la bureautique informatique, sans que son contenu n\'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.');

-- Listage de la structure de table app. messenger_messages
DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table app.messenger_messages : ~0 rows (environ)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
