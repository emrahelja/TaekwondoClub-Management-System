
-- create database taekwondo_club_db;
-- use  taekwondo_club_db; ---
-- ovaj dio koristimo ukoliko zelimo
-- kreirati bazu u MySQL direktno --


SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;


-- ----------------------------
-- ADMIN
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
`username` varchar(20),
`pass_key` varchar(20),
`securekey` varchar(20),
`Full_name` varchar(50),
PRIMARY KEY (`username`)
)ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;


INSERT INTO `admin` VALUES ('admin1', 'admin1', 'admin1', 'Sports Club Manager');
INSERT INTO `admin` VALUES ('admin2', 'admin2', 'admin2', 'Deputy Manager');



-- ----------------------------
-- log_users
-- ----------------------------
DROP TABLE IF EXISTS `log_users`;
CREATE TABLE `log_users` (
  `id` int(11) AUTO_INCREMENT PRIMARY KEY,
  `users_userid` int(11) NOT NULL,
  `action` varchar(20) NOT NULL,
  `cdate` datetime NOT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;



-- ----------------------------
-- USERS
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`(
`userid` varchar(20),
`username` varchar(40),
`gender` varchar(8),
`mobile` varchar(20),
`email` varchar(20),
`dob` varchar(10),
`joining_date` varchar(10),
PRIMARY KEY (`userid`) USING BTREE,
UNIQUE INDEX `email`(`email`) USING BTREE,
INDEX `userid`(`userid`) USING BTREE
)ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;


INSERT INTO `users` VALUES ('1529336794', 'Emra Helja', 'Female', '060000000', 'emra@gmail.com', '2002-10-29', '2024-11-25');
INSERT INTO `users` VALUES ('1529336795', 'Adnan Haracic', 'Male', '062222222', 'adnan@gmail.com', '1998-12-12', '2023-06-10');




-- ----------------------------
-- PLAN
-- ----------------------------
DROP TABLE IF EXISTS `plan`;
CREATE TABLE `plan` (
`pid` varchar(8),
`planName` varchar(20),
`description` varchar(200),
`validity` varchar(20),
`amount` int(10) NOT NULL,
`active` varchar(255),
PRIMARY KEY (`pid`) USING BTREE,
INDEX `pid`(`pid`) USING BTREE
)ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;



INSERT INTO `plan` VALUES ('FOQKJF', 'GRUPA A', 'SRIJEDA 19:30 - 20:30', '1', 40, 'yes');
INSERT INTO `plan` VALUES ('COQKJC', 'GRUPA B', 'SRIJEDA 18:30 - 19:30', '1', 40, 'yes');
INSERT INTO `plan` VALUES ('BOQKJB', 'GRUPA C', 'CETVRTAK 17:45 - 18.45', '1', 40, 'yes');



-- ----------------------------
-- enrolls_to
-- ----------------------------
DROP TABLE IF EXISTS `enrolls_to`;
CREATE TABLE `enrolls_to` (
`et_id` int(5) NOT NULL AUTO_INCREMENT,
`pid` varchar(8) ,
`uid` varchar(20),
`paid_date` varchar(15),
`expire` varchar(15),
`renewal` varchar(15),
PRIMARY KEY (`et_id`) USING BTREE,
INDEX `user_ID`(`uid`) USING BTREE,
INDEX `plan_ID_idx`(`pid`) USING BTREE,
CONSTRAINT `plan_ID` FOREIGN KEY (`pid`) REFERENCES `plan` (`pid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
CONSTRAINT `user_ID` FOREIGN KEY (`uid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE NO ACTION
)ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;


INSERT INTO `enrolls_to` VALUES (1, 'FOQKJF', '1529336794', '2023-06-18', '2023-07-18', 'yes');






-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
`id` varchar(20),
`streetName` varchar(40),
`state` varchar(15),
`city` varchar(15),
`zipcode` varchar(20),
INDEX `userID`(`id`) USING BTREE,
CONSTRAINT `userID` FOREIGN KEY (`id`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE NO ACTION
)ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- address
-- ----------------------------
INSERT INTO `address` VALUES ('1529336794', '2069  KAKANJ', 'KA', 'KAKANJ', '27409');



-- ----------------------------
-- Structure for Triggers in user table
-- ----------------------------

-- Trigger for deletion
CREATE TRIGGER `deletelog` BEFORE DELETE ON `users`
FOR EACH ROW insert into log_users values(null,old.userid,'deleted',now());

-- Trigger for insertion
CREATE TRIGGER `insertlog` AFTER INSERT ON `users`
FOR EACH ROW INSERT INTO log_users VALUES(null,NEW.userid,'inserted',now());

-- Trigger for updation
CREATE TRIGGER `updatelog` AFTER UPDATE ON `users`
FOR EACH ROW insert INTO log_users values(null,new.userid,'updated',now());



-- ----------------------------
-- Structure for Stored Procedure in user table
-- ----------------------------

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `countGender`()
SELECT gender , COUNT(*) from users group by gender$$
DELIMITER ;

-- --------------------------------

SET FOREIGN_KEY_CHECKS = 1;
