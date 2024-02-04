create database guvizen;
use guvizen;
CREATE TABLE `batch` (
  `BatchId` varchar(5) NOT NULL,
  `Duration` int DEFAULT NULL,
  `StartDate` varchar(10) DEFAULT NULL,
  `EndDate` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`BatchId`)
) ;
INSERT INTO `batch` VALUES ('B50WD',3,'10-09-2021','12-12-2021'),
('B51WE',5,'12-09-2021','15-02-2022'),
('B52WD',3,'05-03-2022','08-06-2022'),
('B53WD',5,'15-05-2022','18-10-2022');

CREATE TABLE `mentor` (
  `MentorId` int NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Phone` int DEFAULT NULL,
  PRIMARY KEY (`MentorId`)
) ;

INSERT INTO `mentor` VALUES (1,'RUPAN','rupan@email.com',999),
(2,'nagarajan','naga@email.com',888),(3,'akbar','akbar@email.com',777),
(4,'swathy','swathy@email.com',666),(5,'arun','arun@email.com',555);

CREATE TABLE `students` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Phone` int DEFAULT NULL,
  `Mentor` int DEFAULT NULL,
  `Batch` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Mentor` (`Mentor`),
  KEY `Batch` (`Batch`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`Mentor`) REFERENCES `mentor` (`MentorId`),
  CONSTRAINT `students_ibfk_2` FOREIGN KEY (`Batch`) REFERENCES `batch` (`BatchId`)
) ;

INSERT INTO `students` VALUES (1,'AAA','aa@email.com',1111,2,'B30WE'),
(2,'BBB','bb@email.com',2222,4,'B31WE'),
(3,'CCC','cc@email.com',3333,1,'B31WD'),
(4,'DDD','dd@email.com',4444,3,'B30WD'),
(5,'EEE','ee@email.com',5555,5,'B30WD'),
(7,'FFF','ff@email.com',6666,1,'B30WE'),
(8,'GGG','gg@email.com',7777,3,'B31WE'),
(10,'HHH','hh@email.com',9999,3,'B30WD'),(11,'III','ii@email.com',0,5,'B30WE');

CREATE TABLE `task` (
  `TaskId` int DEFAULT NULL,
  `StudentId` int DEFAULT NULL,
  `Result` enum('Pending','Submitted') DEFAULT NULL,
  KEY `StudentId` (`StudentId`),
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`StudentId`) REFERENCES `students` (`Id`)
) ;

INSERT INTO `task` VALUES (1,1,'Submitted'),
(1,2,'Pending'),
(1,3,'Pending'),
(1,4,'Submitted'),
(1,5,'Submitted'),
(1,7,'Pending'),
(1,8,'Submitted'),
(1,10,'Submitted'),
(1,11,'Pending');
