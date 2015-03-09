CREATE DATABASE IF NOT EXISTS stockdb;
use stockdb;

CREATE TABLE `department` (
   `departmentId` int(11) not null auto_increment,
   `departmentName` varchar(45) not null,
   `createdBy` varchar(100),
   PRIMARY KEY (`departmentId`),
   UNIQUE KEY (`departmentName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=6;

INSERT INTO `department` (`departmentId`, `departmentName`, `createdBy`) VALUES 
('1', 'Administration', ''),
('2', 'Technical', ''),
('3', 'Engineering', ''),
('4', 'Mechanical', ''),
('5', 'Management', '');

CREATE TABLE `functionality` (
   `functionalityId` int(11) not null auto_increment,
   `functionalityName` varchar(255) not null,
   `functionalityNameAlias` varchar(255) not null,
   PRIMARY KEY (`functionalityId`),
   UNIQUE KEY (`functionalityName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=30;

INSERT INTO `functionality` (`functionalityId`, `functionalityName`, `functionalityNameAlias`) VALUES 
('6', 'HOME', 'View Home Page'),
('7', 'STOCK IN LIST', 'View List of Incoming Stocks'),
('8', 'STOCK IN VIEW', 'View Details of Incoming Stock'),
('9', 'STOCK IN EDIT', 'Edit Incoming Stock'),
('10', 'STOCK IN DELETE', 'Delete Incoming Stock'),
('11', 'STOCK IN CREATE', 'Record Incoming Stock'),
('12', 'STOCK OUT LIST', 'View List of Outgoing Stocks'),
('13', 'STOCK OUT VIEW', 'View Details of Outgoing Stock'),
('14', 'STOCK OUT EDIT', 'Edit Outgoing Stock'),
('15', 'STOCK OUT DELETE', 'Delete Outgoing Stock'),
('16', 'STOCK OUT CREATE', 'Record Outgoing Stock'),
('18', 'MENU-STOCK BALANCE', 'Access Stock Balance Menu'),
('19', 'MENU-INCOMING STOCK', 'Access Incoming Stock Menu'),
('20', 'MENU-OUTGOING STOCK', 'Access Outgoing Stock Menu'),
('21', 'MENU-SETUP-STOCK ITEMS', 'Access Menu for configuring Stock Items'),
('22', 'MENU-SETUP-SITES', 'Access Menu to Add/Edit/Delete Sites'),
('23', 'MENU-SETUP-SECURITY', 'Access menu for configuring Security'),
('24', 'MENU-SETUP-VAMBECO', 'Vambeco Menu'),
('25', 'MENU-SETUP-SECURITY-ADD/EDIT/DELETE USERS', 'View Menu to Add/Edit/Delete Users'),
('26', 'MENU-SETUP-SECURITY-DEFINE SYSTEM ACCESS', 'View menu to setup System Access based on Jobtitles'),
('27', 'MENU-SETUP-SECURITY-USER ROLES', 'Access setup menu to add/edit/delete user roles'),
('28', 'MENU-SETUP-SECURITY-SYSTEM FUNCTIONALITY', 'Access setup menu to add/edit/delete system functionality'),
('29', 'MENU-SETUP', 'View Setup Menu');

CREATE TABLE `item` (
   `itemId` int(11) not null auto_increment,
   `itemName` varchar(100) not null,
   `autostamp` timestamp default CURRENT_TIMESTAMP,
   `createdBy` varchar(100),
   `itemcategoryId` int(11),
   PRIMARY KEY (`itemId`),
   UNIQUE KEY (`itemName`),
   KEY `fk_item_itemcategory1_idx` (`itemcategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=57;

INSERT INTO `item` (`itemId`, `itemName`, `autostamp`, `createdBy`, `itemcategoryId`) VALUES 
('28', 'FLANGED GATE VALVES', '', '', '3'),
('29', 'PUSH IN GATE VALVE', '', '', '3'),
('30', 'LSTAR KENT', '', '', '3'),
('31', 'FLANGED ADAPTER', '', '', '3'),
('55', 'Gilbert Material', '', '', '1'),
('56', 'Equipment', '', '', '2');

CREATE TABLE `itemcategory` (
   `itemcategoryId` int(11) not null auto_increment,
   `categoryName` varchar(45),
   `autostamp` timestamp default CURRENT_TIMESTAMP,
   `createdBy` varchar(100),
   PRIMARY KEY (`itemcategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=4;

INSERT INTO `itemcategory` (`itemcategoryId`, `categoryName`, `autostamp`, `createdBy`) VALUES 
('1', 'Material', '2015-02-23 23:52:55', ''),
('2', 'Equipment', '2015-02-23 23:52:55', ''),
('3', 'Fitting', '2015-02-23 23:52:55', '');

CREATE TABLE `itemdescription` (
   `itemdescriptionId` int(11) not null auto_increment,
   `itemId` int(11) not null,
   `itemSize` varchar(45) not null,
   `detailedDescription` varchar(255),
   `remarks` varchar(255),
   `balance` int(11),
   `autostamp` timestamp default CURRENT_TIMESTAMP,
   `createdBy` varchar(100),
   PRIMARY KEY (`itemdescriptionId`),
   UNIQUE KEY (`itemId`,`itemSize`),
   KEY `fk_itemDescription_item1_idx` (`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=35;

INSERT INTO `itemdescription` (`itemdescriptionId`, `itemId`, `itemSize`, `detailedDescription`, `remarks`, `balance`, `autostamp`, `createdBy`) VALUES 
('13', '28', 'DN 500', 'Detailed Description for DN 500', '', '56', '', ''),
('14', '28', 'DN 400', '', '', '3', '', ''),
('15', '28', 'DN 300', '', '', '10', '2015-02-11 17:43:00', ''),
('16', '28', 'DN 250', '', '', '5', '', ''),
('17', '28', 'DN 200', '', '', '10', '', ''),
('18', '28', 'DN 150', '', '', '0', '', ''),
('19', '28', 'DN 125', '', '', '0', '', ''),
('20', '28', 'DN 80', '', '', '0', '', ''),
('21', '28', 'DN 75', '', '', '0', '', ''),
('22', '28', 'DN 65', '', '', '0', '', ''),
('23', '28', 'DN 50', '', '', '0', '', ''),
('24', '28', 'DN 32', '', '', '0', '', ''),
('29', '29', 'DN 150', '', '', '45', '', ''),
('30', '30', 'LK 500', 'Detailed Description for LK 500', '', '0', '', ''),
('32', '55', 'G 890', 'Detailed for  G80', '', '0', '', ''),
('33', '56', 'Equip 5600', 'Detail', '', '6', '', ''),
('34', '29', 'Gillz', 'df', '', '0', '', '');

CREATE TABLE `jobtitle` (
   `jobtitleId` int(11) not null auto_increment,
   `jobtitleName` varchar(45) not null,
   `createdBy` varchar(100),
   PRIMARY KEY (`jobtitleId`),
   UNIQUE KEY (`jobtitleName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=6;

INSERT INTO `jobtitle` (`jobtitleId`, `jobtitleName`, `createdBy`) VALUES 
('1', 'Store Manager', ''),
('2', 'Technical Director', ''),
('3', 'Managing Director', ''),
('4', 'Procurement Officer', ''),
('5', 'System Administrator', '');

CREATE TABLE `jobtitlefunctionality` (
   `jobtitlefunctionalityId` int(11) not null auto_increment,
   `jobtitleId` int(11) not null,
   `functionalityId` int(11) not null,
   PRIMARY KEY (`jobtitlefunctionalityId`),
   UNIQUE KEY (`jobtitleId`,`functionalityId`),
   KEY `fk_jobtitlefunctionality_jobtitle1_idx` (`jobtitleId`),
   KEY `fk_jobtitlefunctionality_functionality1_idx` (`functionalityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=102;

INSERT INTO `jobtitlefunctionality` (`jobtitlefunctionalityId`, `jobtitleId`, `functionalityId`) VALUES 
('24', '1', '6'),
('25', '1', '8'),
('33', '3', '8'),
('17', '4', '6'),
('15', '4', '7'),
('16', '4', '9'),
('101', '5', '6'),
('79', '5', '7'),
('80', '5', '8'),
('81', '5', '9'),
('82', '5', '10'),
('83', '5', '11'),
('84', '5', '12'),
('85', '5', '13'),
('86', '5', '14'),
('87', '5', '15'),
('88', '5', '16'),
('89', '5', '18'),
('90', '5', '19'),
('91', '5', '20'),
('92', '5', '21'),
('93', '5', '22'),
('94', '5', '23'),
('95', '5', '24'),
('96', '5', '25'),
('97', '5', '26'),
('98', '5', '27'),
('99', '5', '28'),
('100', '5', '29');

CREATE TABLE `role` (
   `roleId` int(11) not null auto_increment,
   `rolename` varchar(45) not null,
   `createdBy` varchar(100),
   PRIMARY KEY (`roleId`),
   UNIQUE KEY (`rolename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=6;

INSERT INTO `role` (`roleId`, `rolename`, `createdBy`) VALUES 
('1', 'Administrator', ''),
('2', 'Manager', ''),
('5', 'User', '');

CREATE TABLE `site` (
   `siteId` int(11) not null auto_increment,
   `siteName` varchar(100) not null,
   `address` varchar(255),
   `otherInfo` varchar(255),
   `autostamp` timestamp default CURRENT_TIMESTAMP,
   `createdBy` varchar(100),
   PRIMARY KEY (`siteId`),
   UNIQUE KEY (`siteName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=4;

INSERT INTO `site` (`siteId`, `siteName`, `address`, `otherInfo`, `autostamp`, `createdBy`) VALUES 
('1', 'JINJA', 'Njinja District', '', '2015-01-23 01:06:00', ''),
('2', 'NYARWONDO', 'NEBBI District', '', '', ''),
('3', 'LIRIMA', 'TORORO District', '', '', '');

CREATE TABLE `stockin` (
   `stockInId` int(11) not null auto_increment,
   `itemdescriptionId` int(11) not null,
   `quantity` int(11),
   `remarks` varchar(255),
   `deliveredby_userId` int(11) not null,
   `receivedby_userId` int(11) not null,
   `autostamp` timestamp default CURRENT_TIMESTAMP,
   `goodsReceivedNoteNumber` varchar(45),
   `createdBy` varchar(100),
   PRIMARY KEY (`stockInId`),
   KEY `fk_stockIn_itemDescription1_idx` (`itemdescriptionId`),
   KEY `fk_stockIn_user1_idx` (`deliveredby_userId`),
   KEY `fk_stockIn_user2_idx` (`receivedby_userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=35;

INSERT INTO `stockin` (`stockInId`, `itemdescriptionId`, `quantity`, `remarks`, `deliveredby_userId`, `receivedby_userId`, `autostamp`, `goodsReceivedNoteNumber`, `createdBy`) VALUES 
('22', '16', '15', '', '14', '1', '2015-02-06 20:06:52', '73273', ''),
('34', '33', '2', '', '14', '1', '2015-03-03 17:08:24', '', '');

CREATE TABLE `stockout` (
   `stockOutId` int(11) not null auto_increment,
   `itemdescriptionId` int(11) not null,
   `quantity` int(10) unsigned,
   `issuedby_userId` int(11) not null,
   `despatchedby_userId` int(11) not null,
   `takento_siteId` int(11) not null,
   `vehicleNumber` varchar(20),
   `remarks` varchar(255),
   `deliveryNoteNumber` varchar(45),
   `autostamp` timestamp default CURRENT_TIMESTAMP,
   `createdBy` varchar(100),
   PRIMARY KEY (`stockOutId`),
   KEY `fk_stockOut_itemDescription1_idx` (`itemdescriptionId`),
   KEY `fk_stockOut_user1_idx` (`despatchedby_userId`),
   KEY `fk_stockOut_site1_idx` (`takento_siteId`),
   KEY `fk_stockOut_user2_idx` (`issuedby_userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=8;

INSERT INTO `stockout` (`stockOutId`, `itemdescriptionId`, `quantity`, `issuedby_userId`, `despatchedby_userId`, `takento_siteId`, `vehicleNumber`, `remarks`, `deliveryNoteNumber`, `autostamp`, `createdBy`) VALUES 
('5', '16', '5', '1', '14', '3', 'UAB 783G', '', '', '2015-02-06 20:07:34', ''),
('6', '13', '3', '1', '14', '1', '784 UAB', 'Good state', '73838', '2015-03-09 00:19:09', ''),
('7', '13', '2', '1', '15', '2', 'UAB 678F', 'OK', '7747', '2015-03-09 00:21:20', '');

CREATE TABLE `user` (
   `userId` int(11) not null auto_increment,
   `firstName` varchar(45) not null,
   `lastName` varchar(45) not null,
   `phone1` varchar(45) not null,
   `phone2` varchar(45),
   `email` varchar(100),
   `jobtitleId` int(11) not null,
   `departmentId` int(11) not null,
   `username` varchar(45),
   `password` varchar(255),
   `createdBy` varchar(100),
   PRIMARY KEY (`userId`),
   UNIQUE KEY (`email`),
   UNIQUE KEY (`username`),
   KEY `fk_user_jobtitle_idx` (`jobtitleId`),
   KEY `fk_user_department1_idx` (`departmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=19;

INSERT INTO `user` (`userId`, `firstName`, `lastName`, `phone1`, `phone2`, `email`, `jobtitleId`, `departmentId`, `username`, `password`, `createdBy`) VALUES 
('1', 'OSINDE', 'FRANCIS', '0779561782', '', 'osinde.francis@gmail.com', '1', '5', 'osinde', '', ''),
('12', 'Super', 'Admin', '0702016262', '0777184383', 'gilbert.gillz@gmail.com', '3', '1', 'superadmin', '186cf774c97b60a1c106ef718d10970a6a06e06bef89553d9ae65d938a886eae', ''),
('14', 'victor', 'varathan', '0776551212', '', 'varathanvictor@gmail.com', '1', '5', 'victor', '99bde068af2d49ed7fc8b8fa79abe13a6059e0db320bb73459fd96624bb4b33f', ''),
('15', 'Arinaitwe', 'Richard', '0783428342', '', 'richard@yahoo.co.uk', '5', '1', 'richard', '61bffea9215f65164ad18b45aff1436c0c165d0d5dd2087ef61b4232ba6d2c1a', ''),
('16', 'Byekwaso', 'Habert', '0783245231', '', 'habert@gmail.com', '4', '5', 'habert', '66a907e4fc7370ed88ca31b91bd7999f0389458f0b95964f53f741afd4e22f7d', ''),
('17', 'Tumwine', 'Joseph', '0732423141', '', 'joseph@gmail.com', '4', '1', 'joseph', '7ee8118150e0ce023742beba6f10bf23aabbf0bc2c182f36fd1a6753cd21b4c6', ''),
('18', 'Bagambe', 'Frank', '0783383756', '', 'gumafrank@gmail.com', '5', '1', 'frank', '77646f5a4f3166637627abe998e7a1470fe72d8b430f067dafa86263f1f23f94', '');

CREATE TABLE `user_has_role` (
   `userId` int(11) not null,
   `roleId` int(11) not null,
   PRIMARY KEY (`userId`,`roleId`),
   KEY `fk_user_has_role_role1_idx` (`roleId`),
   KEY `fk_user_has_role_user1_idx` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `user_has_role` (`userId`, `roleId`) VALUES 
('12', '1'),
('15', '1'),
('18', '1'),
('1', '2'),
('14', '2'),
('17', '5');

CREATE TABLE `viewuserrole` (
   `username` varchar(45) CHARSET utf8,
   `password` varchar(255) CHARSET utf8,
   `rolename` varchar(45) CHARSET utf8 not null
);

INSERT INTO `viewuserrole` (`username`, `password`, `rolename`) VALUES 
('superadmin', '186cf774c97b60a1c106ef718d10970a6a06e06bef89553d9ae65d938a886eae', 'Administrator'),
('richard', '61bffea9215f65164ad18b45aff1436c0c165d0d5dd2087ef61b4232ba6d2c1a', 'Administrator'),
('frank', '77646f5a4f3166637627abe998e7a1470fe72d8b430f067dafa86263f1f23f94', 'Administrator'),
('osinde', '', 'Manager'),
('victor', '99bde068af2d49ed7fc8b8fa79abe13a6059e0db320bb73459fd96624bb4b33f', 'Manager'),
('joseph', '7ee8118150e0ce023742beba6f10bf23aabbf0bc2c182f36fd1a6753cd21b4c6', 'User');