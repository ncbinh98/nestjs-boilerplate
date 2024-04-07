/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `timestamp` bigint NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` varchar(36) NOT NULL,
  `action` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `inverted` tinyint DEFAULT NULL,
  `conditions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `roleId` varchar(36) DEFAULT NULL,
  `fields` text,
  PRIMARY KEY (`id`),
  KEY `FK_cdb4db95384a1cf7a837c4c683e` (`roleId`),
  CONSTRAINT `FK_cdb4db95384a1cf7a837c4c683e` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `inheritanceId` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_d1bd5a9eee2138397ffcef66d5` (`inheritanceId`),
  UNIQUE KEY `REL_d1bd5a9eee2138397ffcef66d5` (`inheritanceId`),
  CONSTRAINT `FK_d1bd5a9eee2138397ffcef66d57` FOREIGN KEY (`inheritanceId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(36) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `age` int DEFAULT NULL,
  `roleId` varchar(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_78a916df40e02a9deb1c4b75ed` (`username`),
  KEY `FK_c28e52f758e7bbc53828db92194` (`roleId`),
  CONSTRAINT `FK_c28e52f758e7bbc53828db92194` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `permission` (`id`, `action`, `subject`, `inverted`, `conditions`, `reason`, `createdAt`, `updatedAt`, `deletedAt`, `roleId`, `fields`) VALUES
('44e40c1f-fbee-5622-89e9-eb8a58c818dc', 'read', 'Story', NULL, NULL, NULL, '2024-03-12 02:31:02.448146', '2024-03-12 02:31:02.448146', NULL, '0c9540b4-b39d-5ea5-8117-7fe785c01e85', NULL);
INSERT INTO `permission` (`id`, `action`, `subject`, `inverted`, `conditions`, `reason`, `createdAt`, `updatedAt`, `deletedAt`, `roleId`, `fields`) VALUES
('5a38d722-4cca-4f4a-af67-8706e8b74d16', 'update', 'User', NULL, '{\"id\":\"{{id}}\"}', NULL, '2024-03-13 03:41:08.906792', '2024-03-13 03:41:08.906792', NULL, 'e98f5002-9385-49e1-9dc8-ae4dfdb04006', 'username');
INSERT INTO `permission` (`id`, `action`, `subject`, `inverted`, `conditions`, `reason`, `createdAt`, `updatedAt`, `deletedAt`, `roleId`, `fields`) VALUES
('8a80d816-da30-5391-8042-085aba18190e', 'manage', 'Story', NULL, '{\"createdUserId\": \"{{id}}\" }', NULL, '2024-03-12 02:31:02.448146', '2024-03-12 03:47:56.962791', NULL, '0c9540b4-b39d-5ea5-8117-7fe785c01e85', NULL);
INSERT INTO `permission` (`id`, `action`, `subject`, `inverted`, `conditions`, `reason`, `createdAt`, `updatedAt`, `deletedAt`, `roleId`, `fields`) VALUES
('8f9e9564-76c4-4edd-9ee7-cbdae3f0a3fe', 'create', 'Permission', NULL, NULL, NULL, '2024-03-12 07:43:49.828888', '2024-03-12 07:43:49.828888', NULL, 'e98f5002-9385-49e1-9dc8-ae4dfdb04006', NULL),
('96e2fd58-5542-46c6-a892-b8b9870fc73e', 'update', 'User', NULL, '{\"id\":\"{{id}}\"}', NULL, '2024-03-13 03:47:27.941099', '2024-03-13 03:47:27.941099', NULL, '0c9540b4-b39d-5ea5-8117-7fe785c01e85', 'name,password,age'),
('d57007c6-3a26-541f-b311-29f63a20cebb', 'manage', 'all', NULL, NULL, NULL, '2024-03-12 02:31:02.448146', '2024-03-12 02:31:02.448146', NULL, '6d9b2e04-03e6-5359-912b-7d99e89678bb', NULL),
('de7be48f-febd-47ac-9909-69dde681501a', 'create', 'Role', NULL, NULL, NULL, '2024-03-12 07:09:15.662671', '2024-03-12 07:09:15.662671', NULL, 'e98f5002-9385-49e1-9dc8-ae4dfdb04006', NULL);

INSERT INTO `role` (`id`, `name`, `createdAt`, `updatedAt`, `deletedAt`, `inheritanceId`) VALUES
('01427985-c4b4-45d3-bfa0-029d67e25497', 'Gold Member', '2024-03-12 07:41:09.933900', '2024-03-12 07:41:09.933900', NULL, NULL);
INSERT INTO `role` (`id`, `name`, `createdAt`, `updatedAt`, `deletedAt`, `inheritanceId`) VALUES
('0c9540b4-b39d-5ea5-8117-7fe785c01e85', 'User', '2024-03-12 02:31:02.441081', '2024-03-12 02:31:02.441081', NULL, NULL);
INSERT INTO `role` (`id`, `name`, `createdAt`, `updatedAt`, `deletedAt`, `inheritanceId`) VALUES
('6d9b2e04-03e6-5359-912b-7d99e89678bb', 'Admin', '2024-03-12 02:31:02.441081', '2024-03-12 02:31:02.441081', NULL, NULL);
INSERT INTO `role` (`id`, `name`, `createdAt`, `updatedAt`, `deletedAt`, `inheritanceId`) VALUES
('e98f5002-9385-49e1-9dc8-ae4dfdb04006', 'Moderator', '2024-03-12 06:58:58.442626', '2024-03-13 03:20:38.199023', NULL, 'fdf882dd-9ba5-4225-806d-ad9c496bdb98'),
('fdf882dd-9ba5-4225-806d-ad9c496bdb98', 'Silver Member', '2024-03-12 07:35:29.304814', '2024-03-13 03:20:38.203179', NULL, '0c9540b4-b39d-5ea5-8117-7fe785c01e85');


INSERT INTO `user` (`id`, `username`, `password`, `age`, `roleId`, `name`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
('fa203c3f-ad92-58a5-93b2-0b5e49a0fe4b', 'admin01', '$2b$10$dXcxOz1cyqku.jey5FjMUOvSFU6Ck4QJ76L8se8ecFBRex1z5eU.C', NULL, '6d9b2e04-03e6-5359-912b-7d99e89678bb', NULL, '2024-03-12 07:22:11.807807', '2024-03-12 07:22:11.975713', NULL);


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;