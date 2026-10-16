-- Capital Gains AAST College Project
-- Public schema only. Original sample people, accounts and credentials are omitted.
CREATE DATABASE IF NOT EXISTS `bank` CHARACTER SET utf8mb4;
USE `bank`;

CREATE TABLE `account` (
  `acnumber` varchar(16) NOT NULL,
  `custssn` varchar(14) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `balance` decimal(13,2) UNSIGNED DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `bid` int(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `branch` (
  `bid` int(11) NOT NULL,
  `baddress` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `customer` (
  `custssn` varchar(14) NOT NULL,
  `fname` varchar(30) DEFAULT NULL,
  `lname` varchar(30) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `dob` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `customer_phone_numbers` (
  `custssn` varchar(14) DEFAULT NULL,
  `number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `employee` (
  `empssn` varchar(14) NOT NULL,
  `fname` varchar(30) DEFAULT NULL,
  `ltname` varchar(30) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `salary` float(7,2) DEFAULT NULL,
  `speciality` varchar(20) DEFAULT NULL,
  `supervisorssn` varchar(14) DEFAULT NULL,
  `bid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `loan` (
  `custssn` varchar(14) NOT NULL,
  `bid` int(11) NOT NULL,
  `loan_amount` decimal(13,2) DEFAULT NULL,
  `loan_type` varchar(30) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `interest` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `account`
  ADD PRIMARY KEY (`acnumber`),
  ADD KEY `account_bid_fk` (`bid`),
  ADD KEY `account_custssn_fk` (`custssn`);

ALTER TABLE `branch`
  ADD PRIMARY KEY (`bid`);

ALTER TABLE `customer`
  ADD PRIMARY KEY (`custssn`);

ALTER TABLE `customer_phone_numbers`
  ADD KEY `phone_custssn_fk` (`custssn`);

ALTER TABLE `employee`
  ADD PRIMARY KEY (`empssn`),
  ADD KEY `emp_bid_fk` (`bid`),
  ADD KEY `supervisor_selfkey` (`supervisorssn`);

ALTER TABLE `loan`
  ADD KEY `loan_bid_fk` (`bid`),
  ADD KEY `custssn` (`custssn`);

ALTER TABLE `account`
  ADD CONSTRAINT `account_bid_fk` FOREIGN KEY (`bid`) REFERENCES `branch` (`bid`),
  ADD CONSTRAINT `account_custssn_fk` FOREIGN KEY (`custssn`) REFERENCES `customer` (`custssn`);

ALTER TABLE `customer_phone_numbers`
  ADD CONSTRAINT `phone_custssn_fk` FOREIGN KEY (`custssn`) REFERENCES `customer` (`custssn`);

ALTER TABLE `employee`
  ADD CONSTRAINT `emp_bid_fk` FOREIGN KEY (`bid`) REFERENCES `branch` (`bid`),
  ADD CONSTRAINT `supervisor_selfkey` FOREIGN KEY (`supervisorssn`) REFERENCES `employee` (`empssn`);

ALTER TABLE `loan`
  ADD CONSTRAINT `loan_bid_fk` FOREIGN KEY (`bid`) REFERENCES `branch` (`bid`),
  ADD CONSTRAINT `loan_custssn_fk` FOREIGN KEY (`custssn`) REFERENCES `customer` (`custssn`),
  ADD CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`custssn`) REFERENCES `customer` (`custssn`);

INSERT INTO `branch` (`bid`, `baddress`) VALUES (1, 'Alexandria'), (2, 'Cairo');
