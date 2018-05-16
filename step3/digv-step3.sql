-- Data Definiton Queries for my final Project - CS340 Spr '18
-- By Dig Vargas

DROP TABLE IF EXISTS `nations`;

CREATE TABLE `nations` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(255) NOT NULL,
`element` varchar(255) DEFAULT NULL,\
PRIMARY KEY (`id`),
UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB;

LOCK TABLES `nations` WRITE;
/*!40000 ALTER TABLE `nations` DISABLE KEYS */;
INSERT INTO `nations` VALUES (1,'Fire Nation','fire'),
(2,'Water Tribe','water'),
(3,'Air Nomads','air'),
(4,'Earth Kingdom','earth');
/*!40000 ALTER TABLE `nations` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `places`;

CREATE TABLE `places` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(255) NOT NULL,
`nationID` int(11) DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `name` (`name`),
FOREIGN KEY (`nationID`) REFERENCES `nations`(`id`)
) ENGINE=InnoDB;

LOCK TABLES `places` WRITE;
/*!40000 ALTER TABLE `places` DISABLE KEYS */;
INSERT INTO `places` VALUES (1,'Kyoshi Island',4),
(2,'Crescent Island',1),
(3,'The Southern Air Temple',3),
(4,'South Pole',2);
/*!40000 ALTER TABLE `places` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `characters`;

CREATE TABLE `characters` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(255) NOT NULL,
`nationID` int(11) DEFAULT NULL,
`avatar` int(1) DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `name` (`name`),
FOREIGN KEY (`nationID`) REFERENCES `nations`(`id`)
) ENGINE=InnoDB;

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES (1,'Aang',3,1),
(2,'Sokka',2,0),
(3,'Katara',2,0),
(4,'Toph',4,0),
(5,'Zuko',1,0),
(6,'Roku',1,1),
(7,'Appa',3,0),
(8,'Momo',3,0);
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `bending`;

CREATE TABLE `bending` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(255) NOT NULL,
`element` varchar(255) DEFAULT NULL,
`description` varchar(255) DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB;

LOCK TABLES `bending` WRITE;
/*!40000 ALTER TABLE `bending` DISABLE KEYS */;
INSERT INTO `bending` VALUES (1,'Water Bending','water','basic water bending'),
(2,'Blood Bending','water','bending a living thing\'s blood through water bending'),
(3,'Healing Bending','water','healing through water bending'),
(4,'Fire Bending','fire','basic fire bending'),
(5,'Lightning Bending','fire','bending lightning/electricity'),
(6,'Earth Bending','earth','basic earth bending'),
(7,'Metal Bending','earth','bending control over metal'),
(8,'Air Bending','air','basic air bending'),
(9,'Spirit Bending','spirit','bending the spirit energy in another');
/*!40000 ALTER TABLE `bending` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `bending_skills`;

CREATE TABLE `bending_skills` (
`characterId` int(11) NOT NULL,
`bendingId` int(11) NOT NULL,
PRIMARY KEY (`characterId`, `bendingId`)
) ENGINE=InnoDB;

LOCK TABLES `bending_skills` WRITE;
/*!40000 ALTER TABLE `bending_skills` DISABLE KEYS */;
INSERT INTO `bending_skills` VALUES (1,8),(1,1),(1,6),(1,4),(1,9), -- Aang
(6,8),(6,1),(6,6),(6,4), -- Roku
(3,1),(3,2),(3,3), -- Katara
(4,6),(4,7), -- Toph
(5,4),(5,5), -- Zuko
(7,8); -- Appa
/*!40000 ALTER TABLE `bending_skills` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `visits`;

CREATE TABLE `visits` (
`characterId` int(11) NOT NULL,
`placeId` int(11) NOT NULL,
`episode` varchar(255) DEFAULT NULL,
PRIMARY KEY (`characterId`, `placeId`, `episode`)
) ENGINE=InnoDB;

LOCK TABLES `visits` WRITE;
/*!40000 ALTER TABLE `visits` DISABLE KEYS */;
INSERT INTO `visits` VALUES (1,2,'s01e08'),(1,4,'s01e02'),(1,3,'s01e03'),
(1,1,'s01e04'),(3,1,'s01e04'),(2,1,'s01e04'),
(5,2,'s01e08');
/*!40000 ALTER TABLE `visits` ENABLE KEYS */;
UNLOCK TABLES;

-- INSERT INTO `places` VALUES (1,'Kyoshi Island',4),
-- (2,'Crescent Island',1),
-- (3,'The Southern Air Temple',3),
-- (4,'South Pole',2);
