CREATE DATABASE IF NOT EXISTS dvsdb;
use dvsdb;

CREATE TABLE `bond` (
   `id` int(11) not null auto_increment,
   `issuerCode` varchar(30) not null,
   `ISIN` varchar(45) not null,
   `shortName` varchar(30) not null,
   `COUNTRY_OF_INITIAL_ISSUE` int(11) not null,
   `parValue` float not null,
   `quantityIssued` float not null,
   `CURRENCY_TYPE` int(11) not null,
   `dateIssued` date not null,
   `dateExpire` date not null,
   `couponRate` float not null,
   `dateFirstCoupon` date not null,
   `dateFinalCoupon` date not null,
   `term` int(11) not null,
   `BOND_TYPE` int(11) not null,
   `autoTimestamp` timestamp default CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),
   UNIQUE KEY (`ISIN`),
   UNIQUE KEY (`shortName`),
   KEY `fk_BOND_COUNTRY1_idx` (`COUNTRY_OF_INITIAL_ISSUE`),
   KEY `fk_BOND_CURRENCY_TYPE1_idx` (`CURRENCY_TYPE`),
   KEY `fk_BOND_BOND_TYPE1_idx` (`BOND_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=2;

INSERT INTO `bond` (`id`, `issuerCode`, `ISIN`, `shortName`, `COUNTRY_OF_INITIAL_ISSUE`, `parValue`, `quantityIssued`, `CURRENCY_TYPE`, `dateIssued`, `dateExpire`, `couponRate`, `dateFirstCoupon`, `dateFinalCoupon`, `term`, `BOND_TYPE`, `autoTimestamp`) VALUES ('1', 'GOU', '94345345', 'GOU', '5', '342', '2342', '3', '2014-08-17', '2015-11-13', '42', '2014-08-17', '2015-04-08', '1', '3', '');

CREATE TABLE `bond_daily_price` (
   `id` int(11) not null auto_increment,
   `BOND` int(11) not null,
   `tradedYield` float,
   `dirtyPrice` float,
   `cleanPrice` float,
   `autoTimestamp` timestamp default CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),
   KEY `fk_BOND_DAILY_PRICE_BOND1_idx` (`BOND`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=15;

INSERT INTO `bond_daily_price` (`id`, `BOND`, `tradedYield`, `dirtyPrice`, `cleanPrice`, `autoTimestamp`) VALUES ('1', '1', '52300', '450000', '540000', '');
INSERT INTO `bond_daily_price` (`id`, `BOND`, `tradedYield`, `dirtyPrice`, `cleanPrice`, `autoTimestamp`) VALUES ('6', '1', '5345', '5345600', '6700', '');
INSERT INTO `bond_daily_price` (`id`, `BOND`, `tradedYield`, `dirtyPrice`, `cleanPrice`, `autoTimestamp`) VALUES ('7', '1', '63466', '345345', '63454', '');
INSERT INTO `bond_daily_price` (`id`, `BOND`, `tradedYield`, `dirtyPrice`, `cleanPrice`, `autoTimestamp`) VALUES ('14', '1', '5345', '5345600', '6700', '');

CREATE TABLE `bond_type` (
   `id` int(11) not null auto_increment,
   `bondType` varchar(45) not null,
   `autoTimestamp` timestamp default CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),
   UNIQUE KEY (`bondType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=5;

INSERT INTO `bond_type` (`id`, `bondType`, `autoTimestamp`) VALUES ('3', 'Government Bond', '');
INSERT INTO `bond_type` (`id`, `bondType`, `autoTimestamp`) VALUES ('4', 'Corporate Bond', '');

CREATE TABLE `country` (
   `id` int(11) not null auto_increment,
   `countryName` varchar(45) not null,
   `countryShortName` varchar(10),
   `autoTimestamp` timestamp default CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),
   UNIQUE KEY (`countryName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=8;

INSERT INTO `country` (`id`, `countryName`, `countryShortName`, `autoTimestamp`) VALUES ('5', 'Uganda', 'UG', '2014-08-13 01:48:13');
INSERT INTO `country` (`id`, `countryName`, `countryShortName`, `autoTimestamp`) VALUES ('6', 'Kenya', 'KE', '2014-08-13 01:48:13');
INSERT INTO `country` (`id`, `countryName`, `countryShortName`, `autoTimestamp`) VALUES ('7', 'Tanzania', 'TZ', '2014-08-13 01:48:13');

CREATE TABLE `currency_type` (
   `id` int(11) not null auto_increment,
   `currencyTypeShortName` varchar(10) not null,
   `currencyTypeLongName` varchar(45),
   `autoTimestamp` timestamp default CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),
   UNIQUE KEY (`currencyTypeShortName`),
   UNIQUE KEY (`currencyTypeLongName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=5;

INSERT INTO `currency_type` (`id`, `currencyTypeShortName`, `currencyTypeLongName`, `autoTimestamp`) VALUES ('3', 'UGX', 'Uganda Shillings', '');
INSERT INTO `currency_type` (`id`, `currencyTypeShortName`, `currencyTypeLongName`, `autoTimestamp`) VALUES ('4', 'USD', 'United States Dollar', '');

CREATE TABLE `data_duration_category` (
   `id` int(11) not null auto_increment,
   `dataDurationCategory` varchar(45) not null,
   `autoTimestamp` timestamp default CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),
   UNIQUE KEY (`dataDurationCategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=5;

INSERT INTO `data_duration_category` (`id`, `dataDurationCategory`, `autoTimestamp`) VALUES ('3', 'Current Data', '');
INSERT INTO `data_duration_category` (`id`, `dataDurationCategory`, `autoTimestamp`) VALUES ('4', 'Historical Data', '');

CREATE TABLE `employee` (
   `personId` int(11) not null,
   `employeeNumber` varchar(25) not null,
   `JOBTITLE` int(11) not null,
   `autoTimestamp` timestamp default CURRENT_TIMESTAMP,
   PRIMARY KEY (`personId`),
   UNIQUE KEY (`employeeNumber`),
   KEY `fk_EMPLOYEE_JOBTITLE1_idx` (`JOBTITLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `employee` (`personId`, `employeeNumber`, `JOBTITLE`, `autoTimestamp`) VALUES ('14', 'USE014', '3', '2014-08-17 23:21:11');
INSERT INTO `employee` (`personId`, `employeeNumber`, `JOBTITLE`, `autoTimestamp`) VALUES ('15', '4', '2', '2014-08-18 00:25:06');

CREATE TABLE `employee_has_instrument` (
   `personId` int(11) not null,
   `INSTRUMENT` int(11) not null,
   PRIMARY KEY (`personId`,`INSTRUMENT`),
   KEY `fk_EMPLOYEE_has_INSTRUMENT_INSTRUMENT1_idx` (`INSTRUMENT`),
   KEY `fk_EMPLOYEE_has_INSTRUMENT_EMPLOYEE1_idx` (`personId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `employee_has_instrument` (`personId`, `INSTRUMENT`) VALUES ('14', '4');

CREATE TABLE `employee_is_assigned_to_instrument` (
   `INSTRUMENT` int(11) not null,
   `EMPLOYEE` int(11) not null,
   PRIMARY KEY (`INSTRUMENT`,`EMPLOYEE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- [Table `employee_is_assigned_to_instrument` is empty]

CREATE TABLE `equity` (
   `id` int(11) not null auto_increment,
   `nameOfSecurity` varchar(100) not null,
   `shortName` varchar(10) not null,
   `ISIN` varchar(25) not null,
   `issuerCode` varchar(10) not null,
   `FHLimit` float not null,
   `COUNTRY_OF_INITIAL_ISSUE` int(11),
   `referencePrice` float not null,
   `quantityIssued` float not null,
   `dateAdded` date not null,
   `autoTimestamp` timestamp default CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),
   UNIQUE KEY (`nameOfSecurity`),
   UNIQUE KEY (`shortName`),
   UNIQUE KEY (`ISIN`),
   KEY `fk_SECURITY_COUNTRY1_idx` (`COUNTRY_OF_INITIAL_ISSUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=2;

INSERT INTO `equity` (`id`, `nameOfSecurity`, `shortName`, `ISIN`, `issuerCode`, `FHLimit`, `COUNTRY_OF_INITIAL_ISSUE`, `referencePrice`, `quantityIssued`, `dateAdded`, `autoTimestamp`) VALUES ('1', 'BRITISH AMERICAN TOBACCO UGANDA', 'BATU', 'UG0000000022', 'BATU', '0', '5', '0', '0', '0007-10-08', '');

CREATE TABLE `equity_daily_price` (
   `id` int(11) not null auto_increment,
   `EQUITY` int(11) not null,
   `EQUITY_MARKET_DAY` int(11) not null,
   `sharesTraded` int(11) not null,
   `turnOver` int(11) not null,
   `VWAP` int(11) not null,
   `low` int(11) not null,
   `high` int(11) not null,
   `outstandingBid` int(11) not null,
   `outstandingOffer` int(11) not null,
   `PERatio` float not null,
   `marketCap` float not null,
   `autoTimestamp` timestamp default CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),
   KEY `fk_EQUITY_DAILY_MARKET_SECURITY1_idx` (`EQUITY`),
   KEY `fk_EQUITY_DAILY_MARKET_EQUITY_MARKET_DAY1_idx` (`EQUITY_MARKET_DAY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=2;

INSERT INTO `equity_daily_price` (`id`, `EQUITY`, `EQUITY_MARKET_DAY`, `sharesTraded`, `turnOver`, `VWAP`, `low`, `high`, `outstandingBid`, `outstandingOffer`, `PERatio`, `marketCap`, `autoTimestamp`) VALUES ('1', '1', '2', '13900', '120', '120', '50', '70', '450', '450', '450', '30', '');

CREATE TABLE `equity_market_day` (
   `id` int(11) not null auto_increment,
   `dateOfMarket` date not null,
   `ALSICurrent` float not null,
   `LSICurrent` float not null,
   `autoTimestamp` timestamp default CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=4;

INSERT INTO `equity_market_day` (`id`, `dateOfMarket`, `ALSICurrent`, `LSICurrent`, `autoTimestamp`) VALUES ('1', '0014-08-08', '1755', '276', '');
INSERT INTO `equity_market_day` (`id`, `dateOfMarket`, `ALSICurrent`, `LSICurrent`, `autoTimestamp`) VALUES ('2', '0014-09-08', '1778', '289', '');
INSERT INTO `equity_market_day` (`id`, `dateOfMarket`, `ALSICurrent`, `LSICurrent`, `autoTimestamp`) VALUES ('3', '2014-08-25', '1540', '569', '');

CREATE TABLE `gender` (
   `id` int(11) not null auto_increment,
   `gender` varchar(10) not null,
   PRIMARY KEY (`id`),
   UNIQUE KEY (`gender`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=5;

INSERT INTO `gender` (`id`, `gender`) VALUES ('4', 'Female');
INSERT INTO `gender` (`id`, `gender`) VALUES ('3', 'Male');

CREATE TABLE `instrument` (
   `id` int(11) not null auto_increment,
   `instrumentName` varchar(45) not null,
   PRIMARY KEY (`id`),
   UNIQUE KEY (`instrumentName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=5;

INSERT INTO `instrument` (`id`, `instrumentName`) VALUES ('3', 'Bond');
INSERT INTO `instrument` (`id`, `instrumentName`) VALUES ('4', 'Equity');

CREATE TABLE `investor` (
   `personId` int(11) not null,
   `address` varchar(100) not null,
   `INVESTOR_TYPE` int(11) not null,
   `autoTimestamp` timestamp default CURRENT_TIMESTAMP,
   PRIMARY KEY (`personId`),
   KEY `fk_INVESTOR_INVESTOR_TYPE1_idx` (`INVESTOR_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `investor` (`personId`, `address`, `INVESTOR_TYPE`, `autoTimestamp`) VALUES ('12', 'Bukoto Street Plot 67', '3', '2014-08-13 01:52:51');
INSERT INTO `investor` (`personId`, `address`, `INVESTOR_TYPE`, `autoTimestamp`) VALUES ('13', 'Kawempe Ttula', '3', '2014-08-14 01:39:42');
INSERT INTO `investor` (`personId`, `address`, `INVESTOR_TYPE`, `autoTimestamp`) VALUES ('16', 'Kampala', '4', '2015-01-21 11:26:52');

CREATE TABLE `investor_data_payment_detail` (
   `id` int(11) not null auto_increment,
   `INVESTOR_GENERAL_DATA_REQUEST` int(11) not null,
   `dateOfPayment` date not null,
   `amountPaid` float not null,
   `paymentSlipNumber` varchar(45) not null,
   `paymentSlipAttachment` longblob,
   `bank` varchar(100),
   `bankBranch` varchar(100),
   `BRANCH_COUNTRY` int(11) not null,
   `autoTimestamp` timestamp default CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),
   KEY `fk_INVESTOR_DATA_PAYMENT_DETAIL_INVESTOR_GENERAL_DATA_REQUE_idx` (`INVESTOR_GENERAL_DATA_REQUEST`),
   KEY `fk_INVESTOR_DATA_PAYMENT_DETAIL_COUNTRY1_idx` (`BRANCH_COUNTRY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

-- [Table `investor_data_payment_detail` is empty]

CREATE TABLE `investor_general_data_request` (
   `id` int(11) not null auto_increment,
   `personId` int(11) not null,
   `requestDate` date not null,
   `amount` float not null,
   `activeStatus` tinyint(1) default '0',
   `autoTimestamp` timestamp default CURRENT_TIMESTAMP,
   `paymentStatus` tinyint(1) default '0',
   PRIMARY KEY (`id`),
   KEY `fk_INVESTOR_GENERAL_DATA_REQUEST_PERSON1_idx` (`personId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=6;

INSERT INTO `investor_general_data_request` (`id`, `personId`, `requestDate`, `amount`, `activeStatus`, `autoTimestamp`, `paymentStatus`) VALUES ('1', '12', '2014-08-14', '500000', '1', '2014-08-14 01:31:44', '1');
INSERT INTO `investor_general_data_request` (`id`, `personId`, `requestDate`, `amount`, `activeStatus`, `autoTimestamp`, `paymentStatus`) VALUES ('2', '13', '2014-08-14', '850000', '0', '2014-08-14 01:40:55', '0');
INSERT INTO `investor_general_data_request` (`id`, `personId`, `requestDate`, `amount`, `activeStatus`, `autoTimestamp`, `paymentStatus`) VALUES ('3', '14', '2014-09-04', '252453', '0', '', '');
INSERT INTO `investor_general_data_request` (`id`, `personId`, `requestDate`, `amount`, `activeStatus`, `autoTimestamp`, `paymentStatus`) VALUES ('4', '14', '2014-11-07', '252453', '0', '', '');
INSERT INTO `investor_general_data_request` (`id`, `personId`, `requestDate`, `amount`, `activeStatus`, `autoTimestamp`, `paymentStatus`) VALUES ('5', '14', '2015-01-14', '252453', '0', '', '');

CREATE TABLE `investor_requested_data` (
   `id` int(11) not null auto_increment,
   `INVESTOR_GENERAL_DATA_REQUEST` int(11) not null,
   `TYPE_OF_DATA_TO_SELL_has_DATA_DURATION_CATEGORY` int(11) not null,
   `activeStatus` tinyint(1) default '1',
   `requestDate` date not null,
   `autoTimestamp` timestamp default CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),
   KEY `fk_INVESTOR_REQUESTED_DATA_INVESTOR_GENERAL_DATA_REQUEST1_idx` (`INVESTOR_GENERAL_DATA_REQUEST`),
   KEY `fk_INVESTOR_REQUESTED_DATA_TYPE_OF_DATA_TO_SELL_has_DATA_DU_idx` (`TYPE_OF_DATA_TO_SELL_has_DATA_DURATION_CATEGORY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=2;

INSERT INTO `investor_requested_data` (`id`, `INVESTOR_GENERAL_DATA_REQUEST`, `TYPE_OF_DATA_TO_SELL_has_DATA_DURATION_CATEGORY`, `activeStatus`, `requestDate`, `autoTimestamp`) VALUES ('1', '1', '1', '1', '2014-08-13', '2014-08-14 01:34:41');

CREATE TABLE `investor_type` (
   `id` int(11) not null auto_increment,
   `personType` varchar(45) not null,
   `autoTimestamp` timestamp default CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),
   UNIQUE KEY (`personType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=5;

INSERT INTO `investor_type` (`id`, `personType`, `autoTimestamp`) VALUES ('3', 'Person', '2014-08-13 01:52:09');
INSERT INTO `investor_type` (`id`, `personType`, `autoTimestamp`) VALUES ('4', 'Company', '2014-08-13 01:52:09');

CREATE TABLE `jobtitle` (
   `id` int(11) not null auto_increment,
   `jobtitle` varchar(45) not null,
   `autoTimestamp` timestamp default CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),
   UNIQUE KEY (`jobtitle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=4;

INSERT INTO `jobtitle` (`id`, `jobtitle`, `autoTimestamp`) VALUES ('2', 'Administrator', '');
INSERT INTO `jobtitle` (`id`, `jobtitle`, `autoTimestamp`) VALUES ('3', 'Data Entrant', '');

CREATE TABLE `payment_upload` (
   `id` int(11) not null auto_increment,
   `paymentUploadName` varchar(100),
   `upload` longblob,
   `uploadPath` text,
   `INVESTOR_DATA_PAYMENT_DETAIL` int(11) not null,
   `autoTimestamp` timestamp default CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),
   KEY `fk_PAYMENT_UPLOADS_INVESTOR_DATA_PAYMENT_DETAIL1_idx` (`INVESTOR_DATA_PAYMENT_DETAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

-- [Table `payment_upload` is empty]

CREATE TABLE `person` (
   `personId` int(11) not null auto_increment,
   `surname` varchar(45) not null,
   `lastname` varchar(45) not null,
   `GENDER` int(11) not null,
   `phone` varchar(25) not null,
   `email` varchar(45) not null,
   `personTypeJPADescriminator` varchar(45),
   `COUNTRY` int(11) not null,
   PRIMARY KEY (`personId`),
   UNIQUE KEY (`phone`),
   UNIQUE KEY (`email`),
   KEY `fk_PERSON_GENDER1_idx` (`GENDER`),
   KEY `fk_PERSON_COUNTRY1_idx` (`COUNTRY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=17;

INSERT INTO `person` (`personId`, `surname`, `lastname`, `GENDER`, `phone`, `email`, `personTypeJPADescriminator`, `COUNTRY`) VALUES ('12', 'Twesigomwe', 'Gilbert', '4', '0777184393', 'gilbert.gillz@gmail.com', 'Investor', '5');
INSERT INTO `person` (`personId`, `surname`, `lastname`, `GENDER`, `phone`, `email`, `personTypeJPADescriminator`, `COUNTRY`) VALUES ('13', 'Tumwijukye', 'Ambrose', '4', '0789349382', 'tumwijukye.ambrose@gmail.com', 'Investor', '5');
INSERT INTO `person` (`personId`, `surname`, `lastname`, `GENDER`, `phone`, `email`, `personTypeJPADescriminator`, `COUNTRY`) VALUES ('14', 'Tumwekwase', 'Barnabas', '3', '0784939293', 'barna@gmail.com', 'Employee', '5');
INSERT INTO `person` (`personId`, `surname`, `lastname`, `GENDER`, `phone`, `email`, `personTypeJPADescriminator`, `COUNTRY`) VALUES ('15', 'Frank', 'Guma', '3', '5555', 'gumafrank@gmail.com', 'Employee', '5');
INSERT INTO `person` (`personId`, `surname`, `lastname`, `GENDER`, `phone`, `email`, `personTypeJPADescriminator`, `COUNTRY`) VALUES ('16', 'Turinawe', 'Derick', '3', '0783234234', 'turinawe.derick@gmail.com', 'Investor', '5');

CREATE TABLE `type_of_data_to_sell` (
   `id` int(11) not null auto_increment,
   `typeOfDataToSell` varchar(45) not null,
   `description` varchar(255),
   `INSTRUMENT` int(11) not null,
   `autoTimestamp` timestamp default CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),
   UNIQUE KEY (`typeOfDataToSell`),
   KEY `fk_TYPE_OF_DATA_INSTRUMENT1_idx` (`INSTRUMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=11;

INSERT INTO `type_of_data_to_sell` (`id`, `typeOfDataToSell`, `description`, `INSTRUMENT`, `autoTimestamp`) VALUES ('7', 'ALSI', '', '4', '');
INSERT INTO `type_of_data_to_sell` (`id`, `typeOfDataToSell`, `description`, `INSTRUMENT`, `autoTimestamp`) VALUES ('8', 'Market Reports', '', '4', '');
INSERT INTO `type_of_data_to_sell` (`id`, `typeOfDataToSell`, `description`, `INSTRUMENT`, `autoTimestamp`) VALUES ('9', 'LSI', '', '4', '');
INSERT INTO `type_of_data_to_sell` (`id`, `typeOfDataToSell`, `description`, `INSTRUMENT`, `autoTimestamp`) VALUES ('10', 'Publications', '', '4', '');

CREATE TABLE `type_of_data_to_sell_has_data_duration_category` (
   `id` int(11) not null auto_increment,
   `TYPE_OF_DATA_TO_SELL` int(11) not null,
   `DATA_DURATION_CATEGORY` int(11) not null,
   `price` float,
   `remarks` varchar(255),
   `autoTimestamp` timestamp default CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),
   UNIQUE KEY (`TYPE_OF_DATA_TO_SELL`,`DATA_DURATION_CATEGORY`),
   KEY `fk_TYPE_OF_DATA_TO_SELL_has_DATA_DURATION_CATEGORY_DATA_DUR_idx` (`DATA_DURATION_CATEGORY`),
   KEY `fk_TYPE_OF_DATA_TO_SELL_has_DATA_DURATION_CATEGORY_TYPE_OF__idx` (`TYPE_OF_DATA_TO_SELL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=8;

INSERT INTO `type_of_data_to_sell_has_data_duration_category` (`id`, `TYPE_OF_DATA_TO_SELL`, `DATA_DURATION_CATEGORY`, `price`, `remarks`, `autoTimestamp`) VALUES ('1', '8', '4', '52000', 'Market Reports', '');
INSERT INTO `type_of_data_to_sell_has_data_duration_category` (`id`, `TYPE_OF_DATA_TO_SELL`, `DATA_DURATION_CATEGORY`, `price`, `remarks`, `autoTimestamp`) VALUES ('2', '9', '4', '60000', 'LSI Data', '');
INSERT INTO `type_of_data_to_sell_has_data_duration_category` (`id`, `TYPE_OF_DATA_TO_SELL`, `DATA_DURATION_CATEGORY`, `price`, `remarks`, `autoTimestamp`) VALUES ('4', '10', '3', '76000', '12000', '');
INSERT INTO `type_of_data_to_sell_has_data_duration_category` (`id`, `TYPE_OF_DATA_TO_SELL`, `DATA_DURATION_CATEGORY`, `price`, `remarks`, `autoTimestamp`) VALUES ('5', '7', '4', '56000', '', '');
INSERT INTO `type_of_data_to_sell_has_data_duration_category` (`id`, `TYPE_OF_DATA_TO_SELL`, `DATA_DURATION_CATEGORY`, `price`, `remarks`, `autoTimestamp`) VALUES ('7', '7', '3', '8453', '', '');

CREATE TABLE `user` (
   `personId` int(11) not null,
   `username` varchar(45),
   `password` varchar(255),
   `autoTimestamp` timestamp default CURRENT_TIMESTAMP,
   `enabledOrDisabled` tinyint(1) default '1',
   PRIMARY KEY (`personId`),
   UNIQUE KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `user` (`personId`, `username`, `password`, `autoTimestamp`, `enabledOrDisabled`) VALUES ('12', 'gilbert', '49b191cf813fa62a2a280ca07b6812df23be3f3c2437604e7fcd2dee72f1f527', '', '');
INSERT INTO `user` (`personId`, `username`, `password`, `autoTimestamp`, `enabledOrDisabled`) VALUES ('13', 'ambrose', '8d6a0f2c415037eb8827b32135a9447fe91a66c1303fe86e6ebd3a637b9351d9', '', '');
INSERT INTO `user` (`personId`, `username`, `password`, `autoTimestamp`, `enabledOrDisabled`) VALUES ('14', 'barna', '', '', '1');
INSERT INTO `user` (`personId`, `username`, `password`, `autoTimestamp`, `enabledOrDisabled`) VALUES ('15', 'frank', '77646f5a4f3166637627abe998e7a1470fe72d8b430f067dafa86263f1f23f94', '', '0');
INSERT INTO `user` (`personId`, `username`, `password`, `autoTimestamp`, `enabledOrDisabled`) VALUES ('16', 'derick', '7bfc97cd629ce18317c78a3698d0fab4f69319ea97ceb46421beacdb3e298cdd', '', '');

CREATE TABLE `user_group` (
   `id` int(11) not null auto_increment,
   `groupname` varchar(45) not null,
   `autoTimestamp` timestamp default CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),
   UNIQUE KEY (`groupname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=7;

INSERT INTO `user_group` (`id`, `groupname`, `autoTimestamp`) VALUES ('4', 'Administrator', '2014-08-13 01:55:23');
INSERT INTO `user_group` (`id`, `groupname`, `autoTimestamp`) VALUES ('5', 'DataEntrant', '2014-08-13 01:55:23');
INSERT INTO `user_group` (`id`, `groupname`, `autoTimestamp`) VALUES ('6', 'Investor', '2014-08-13 01:55:23');

CREATE TABLE `user_has_user_group` (
   `personId` int(11) not null,
   `USER_GROUP_ID` int(11) not null,
   PRIMARY KEY (`personId`,`USER_GROUP_ID`),
   KEY `fk_USER_has_USER_GROUP_USER_GROUP1_idx` (`USER_GROUP_ID`),
   KEY `fk_USER_has_USER_GROUP_USER1_idx` (`personId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `user_has_user_group` (`personId`, `USER_GROUP_ID`) VALUES ('12', '4');
INSERT INTO `user_has_user_group` (`personId`, `USER_GROUP_ID`) VALUES ('14', '4');
INSERT INTO `user_has_user_group` (`personId`, `USER_GROUP_ID`) VALUES ('15', '4');
INSERT INTO `user_has_user_group` (`personId`, `USER_GROUP_ID`) VALUES ('14', '5');
INSERT INTO `user_has_user_group` (`personId`, `USER_GROUP_ID`) VALUES ('15', '5');
INSERT INTO `user_has_user_group` (`personId`, `USER_GROUP_ID`) VALUES ('13', '6');
INSERT INTO `user_has_user_group` (`personId`, `USER_GROUP_ID`) VALUES ('14', '6');
INSERT INTO `user_has_user_group` (`personId`, `USER_GROUP_ID`) VALUES ('15', '6');
INSERT INTO `user_has_user_group` (`personId`, `USER_GROUP_ID`) VALUES ('16', '6');

CREATE TABLE `viewusergroup` (
   `username` varchar(45) CHARSET utf8,
   `password` varchar(255) CHARSET utf8,
   `groupname` varchar(45) CHARSET utf8 not null
);

INSERT INTO `viewusergroup` (`username`, `password`, `groupname`) VALUES ('gilbert', '49b191cf813fa62a2a280ca07b6812df23be3f3c2437604e7fcd2dee72f1f527', 'Administrator');
INSERT INTO `viewusergroup` (`username`, `password`, `groupname`) VALUES ('ambrose', '8d6a0f2c415037eb8827b32135a9447fe91a66c1303fe86e6ebd3a637b9351d9', 'Investor');
INSERT INTO `viewusergroup` (`username`, `password`, `groupname`) VALUES ('barna', '', 'Administrator');
INSERT INTO `viewusergroup` (`username`, `password`, `groupname`) VALUES ('barna', '', 'DataEntrant');
INSERT INTO `viewusergroup` (`username`, `password`, `groupname`) VALUES ('barna', '', 'Investor');
INSERT INTO `viewusergroup` (`username`, `password`, `groupname`) VALUES ('frank', '77646f5a4f3166637627abe998e7a1470fe72d8b430f067dafa86263f1f23f94', 'Administrator');
INSERT INTO `viewusergroup` (`username`, `password`, `groupname`) VALUES ('frank', '77646f5a4f3166637627abe998e7a1470fe72d8b430f067dafa86263f1f23f94', 'DataEntrant');
INSERT INTO `viewusergroup` (`username`, `password`, `groupname`) VALUES ('frank', '77646f5a4f3166637627abe998e7a1470fe72d8b430f067dafa86263f1f23f94', 'Investor');
INSERT INTO `viewusergroup` (`username`, `password`, `groupname`) VALUES ('derick', '7bfc97cd629ce18317c78a3698d0fab4f69319ea97ceb46421beacdb3e298cdd', 'Investor');