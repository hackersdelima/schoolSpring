-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2018 at 05:12 PM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `aranikodb`
--

-- --------------------------------------------------------

--
-- Table structure for table `accountstbl`
--

CREATE TABLE IF NOT EXISTS `accountstbl` (
  `accountNumber` varchar(20) CHARACTER SET utf8 NOT NULL,
  `pid` varchar(20) DEFAULT NULL,
  `alternativeAccountId` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `categoryId` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `accountType` varchar(3) CHARACTER SET utf8 DEFAULT NULL,
  `accountName` varchar(35) CHARACTER SET utf8 DEFAULT NULL,
  `limitRef` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `postingRestriction` int(11) DEFAULT NULL,
  `interestLiqAccount` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `principalLiqAccount` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `accountOpeningDate` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `valueDate` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `openingBal` double(16,2) DEFAULT NULL,
  `debitMovement` double(16,2) DEFAULT NULL,
  `creditMovement` double(16,2) DEFAULT NULL,
  `clearedBal` double(16,2) DEFAULT NULL,
  `workingBal` double(16,2) DEFAULT NULL,
  `dateLastDr` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `amountLastDr` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  `trcodeLastDr` int(11) DEFAULT NULL,
  `dateLastCr` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `amountLastCr` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  `trcodeLastCr` int(11) DEFAULT NULL,
  `accountStatus` int(11) DEFAULT NULL,
  `curNumber` int(11) DEFAULT NULL,
  `recordStatus` varchar(4) CHARACTER SET utf8 DEFAULT NULL,
  `branchCode` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `inputter` varchar(150) CHARACTER SET utf8 DEFAULT NULL,
  `authorizer` varchar(150) CHARACTER SET utf8 DEFAULT NULL,
  `interestType` varchar(1) DEFAULT NULL,
  `interestRate` double(16,2) DEFAULT NULL,
  `principalAmount` double(16,2) DEFAULT NULL,
  `startDateNP` varchar(10) DEFAULT NULL,
  `startDateEn` date DEFAULT NULL,
  `maturityDateNP` varchar(10) DEFAULT NULL,
  `maturityDateEn` date DEFAULT NULL,
  `repaymentStartDateNp` varchar(10) DEFAULT NULL,
  `repaymentStartDateEn` date DEFAULT NULL,
  `repaymentFrequency` varchar(3) DEFAULT NULL,
  `loanDrawdownAc` varchar(20) DEFAULT NULL,
  `chargeDebitAc` varchar(20) DEFAULT NULL,
  `chargeAmount` double(16,2) DEFAULT NULL,
  `chargePaymentDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `accounttype`
--

CREATE TABLE IF NOT EXISTS `accounttype` (
  `accountType` varchar(3) CHARACTER SET utf8 NOT NULL,
  `accountTypeHead` varchar(35) CHARACTER SET utf8 DEFAULT NULL,
  `inputter` varchar(150) CHARACTER SET utf8 DEFAULT NULL,
  `authorizer` varchar(150) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounttype`
--

INSERT INTO `accounttype` (`accountType`, `accountTypeHead`, `inputter`, `authorizer`) VALUES
('FIN', 'Financial Account', 'admin', 'admin'),
('ACC', 'Customer Account', 'admin', 'admin'),
('PLA', ' Profit and Loss Account', 'admin', 'admin'),
('LNA', 'Loan Account', 'admin', 'admin'),
('OFF', 'Off-balance sheet account', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE IF NOT EXISTS `attendance` (
  `date` varchar(10) NOT NULL,
  `studentid` bigint(20) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `remarks` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `branchtbl`
--

CREATE TABLE IF NOT EXISTS `branchtbl` (
  `companyId` varchar(4) CHARACTER SET utf8 DEFAULT NULL,
  `branchId` varchar(4) CHARACTER SET utf8 NOT NULL,
  `branchName` varchar(35) CHARACTER SET utf8 DEFAULT NULL,
  `branchAddress` varchar(35) CHARACTER SET utf8 DEFAULT NULL,
  `branchPhone` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  `branchFax` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  `branchemail` varchar(70) CHARACTER SET utf8 DEFAULT NULL,
  `reserve1` varchar(70) CHARACTER SET utf8 DEFAULT NULL,
  `reserve2` varchar(70) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branchtbl`
--

INSERT INTO `branchtbl` (`companyId`, `branchId`, `branchName`, `branchAddress`, `branchPhone`, `branchFax`, `branchemail`, `reserve1`, `reserve2`) VALUES
('01', '001', 'Kalimati', '12', '12', '12', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `castetbl`
--

CREATE TABLE IF NOT EXISTS `castetbl` (
  `casteid` int(11) NOT NULL,
  `castename` varchar(25) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `castetbl`
--

INSERT INTO `castetbl` (`casteid`, `castename`) VALUES
(5, '123');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `categoryId` varchar(5) CHARACTER SET utf8 NOT NULL,
  `categoryHead` varchar(35) CHARACTER SET utf8 DEFAULT NULL,
  `accountType` varchar(3) CHARACTER SET utf8 DEFAULT NULL,
  `inputter` varchar(150) CHARACTER SET utf8 DEFAULT NULL,
  `authorizer` varchar(150) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categoryId`, `categoryHead`, `accountType`, `inputter`, `authorizer`) VALUES
('10000', 'Liabilities', '', 'admin', 'admin'),
('11000', 'Deposits', '', 'admin', 'admin'),
('11100', 'Current Deposit', '', 'admin', 'admin'),
('11200', 'Saving Deposit', '', 'admin', 'admin'),
('11204', 'Shramjyoti Super Saving A/c', 'ACC', 'admin', 'admin'),
('11300', 'Time Deposits', '', 'admin', 'admin'),
('11301', '1 Year Periodic Deposit', 'ACC', 'admin', 'admin'),
('11302', '2 Year Periodic Deposit', 'ACC', 'admin', 'admin'),
('11303', '3 Year Periodic Deposit', 'ACC', 'admin', 'admin'),
('11304', '6 Months Periodic Deposit', 'ACC', 'admin', 'admin'),
('11305', 'Periodic Deposit', 'ACC', 'admin', 'admin'),
('11306', 'Periodic Deposit', 'ACC', 'admin', 'admin'),
('11307', 'Periodic Deposit', 'ACC', 'admin', 'admin'),
('12000', 'Payables Account', '', 'admin', 'admin'),
('12100', 'Sundry Payables', '', 'admin', 'admin'),
('12101', 'Sundry Creditors', 'FIN', 'admin', 'admin'),
('12103', 'Deposits', 'FIN', 'admin', 'admin'),
('12104', 'Audit fee', 'FIN', 'admin', 'admin'),
('12105', 'Udharo Kharid Khata', 'FIN', 'admin', 'admin'),
('12106', 'Peshki Prapti Hisab', 'FIN', 'admin', 'admin'),
('12107', 'Karmachari Hitkosh Khata', 'FIN', 'admin', 'admin'),
('12108', 'Sapati Hisab Khata', 'FIN', 'admin', 'admin'),
('12109', 'Anya Bhuktani Dinuparne Khata', 'FIN', 'admin', 'admin'),
('12200', 'Tax Payables', '', 'admin', 'admin'),
('12201', 'Tax payable for share holder saving', 'ACC', 'admin', 'admin'),
('12202', 'Tax payable for monthly saving int', 'ACC', 'admin', 'admin'),
('12203', 'tax payable renumeration', 'ACC', 'admin', 'admin'),
('12204', 'Tax on Saving Interest', 'ACC', 'admin', 'admin'),
('13000', 'Suspense Accounts', '', 'admin', 'admin'),
('13101', 'Suspense Liability Ac', 'FIN', 'admin', 'admin'),
('14000', 'Capital Account', '', 'admin', 'admin'),
('14100', 'Share Capital', '', 'admin', 'admin'),
('14101', 'Share Capital', 'ACC', 'admin', 'admin'),
('14200', 'Misc Kosh', '', 'admin', 'admin'),
('14201', 'Jageda Kosh', 'FIN', 'admin', 'admin'),
('14202', 'Anya Kosh', 'FIN', 'admin', 'admin'),
('14203', 'Ghata Purti fund', 'FIN', 'admin', 'admin'),
('14204', 'sanstha social devlopment fund', 'FIN', 'admin', 'admin'),
('14205', 'Dubante loan fund', 'FIN', 'admin', 'admin'),
('18000', 'Provision', '', 'admin', 'admin'),
('18100', 'Provisions for Staff', '', 'admin', 'admin'),
('18101', 'Provision for Gratuity', 'FIN', 'admin', 'admin'),
('18102', 'Provision For Bonus', 'FIN', 'admin', 'admin'),
('18103', 'Doubtful debt provision fund', 'FIN', 'admin', 'admin'),
('18200', 'Provision For dividend', 'FIN', 'admin', 'admin'),
('18300', 'Loan Loss provision', 'FIN', 'admin', 'admin'),
('19000', 'Profit Account', 'FIN', 'admin', 'admin'),
('19101', 'Profit', 'FIN', 'admin', 'admin'),
('20000', 'Assets', 'FIN', 'admin', 'admin'),
('21000', 'Cash And Bank accounts', '', 'admin', 'admin'),
('21100', 'Cash', '', 'admin', 'admin'),
('21101', 'Vault', 'FIN', 'admin', 'admin'),
('21102', 'Cash', 'FIN', 'admin', 'admin'),
('21103', 'Petty Cash', 'FIN', 'admin', 'admin'),
('21104', 'Teller Cash', 'FIN', 'admin', 'admin'),
('21200', 'Bank Accounts', '', 'admin', 'admin'),
('21201', 'Bank ....', 'FIN', 'admin', 'admin'),
('21203', 'Agricultural Dev Bank Ltd', 'FIN', 'admin', 'admin'),
('22000', 'Advance/ Receivables', '', 'admin', 'admin'),
('22100', 'Staff and Member Advance', 'FIN', 'admin', 'admin'),
('22101', 'Udharo Bikri Tatha Asuli Hisab', 'FIN', 'admin', 'admin'),
('22102', 'Advance', 'FIN', 'admin', 'admin'),
('22103', 'Beruju Hisab', 'FIN', 'admin', 'admin'),
('22104', 'Dharauti Hisab', 'FIN', 'admin', 'admin'),
('22105', 'Anibarya Bachat Hisab', 'FIN', 'admin', 'admin'),
('22106', 'Anya Paunu parne Rakam', 'FIN', 'admin', 'admin'),
('22901', 'Interest Receivable contra', 'FIN', 'admin', 'admin'),
('23000', 'Fixed assets', '', 'admin', 'admin'),
('23101', 'Land and Building', 'FIN', 'admin', 'admin'),
('23102', 'Furniture', 'FIN', 'admin', 'admin'),
('23103', 'Office Equipments', 'FIN', 'admin', 'admin'),
('23104', 'Veichle', 'FIN', 'admin', 'admin'),
('23109', 'misc assets', 'FIN', 'admin', 'admin'),
('25000', 'Loan Accounts', '', 'admin', 'admin'),
('25100', 'Working Capital', '', 'admin', 'admin'),
('25101', 'Loan Ac', 'LNA', 'admin', 'admin'),
('25500', 'Term loan', '', 'admin', 'admin'),
('25501', '.... Loan', 'LNA', 'admin', 'admin'),
('26000', 'Misc Assets', '', 'admin', 'admin'),
('26101', 'Dhito patra kharid Khata', 'FIN', 'admin', 'admin'),
('26102', 'Muddati Khata in Bank', 'FIN', 'admin', 'admin'),
('26103', 'Bachat Khata in bank', 'FIN', 'admin', 'admin'),
('26104', 'Share Kharid Khata in bank', 'FIN', 'admin', 'admin'),
('29000', 'Loss Accounts', '', 'admin', 'admin'),
('29101', 'Loss', 'ACC', 'admin', 'admin'),
('30000', 'Expenses', '', 'admin', 'admin'),
('31000', 'Staff Expenses', '', 'admin', 'admin'),
('31101', 'Salary', 'PLA', 'admin', 'admin'),
('31102', 'Regular Allowances', 'PLA', 'admin', 'admin'),
('31103', 'Misc Allowances', 'PLA', 'admin', 'admin'),
('31104', 'Overtime', 'PLA', 'admin', 'admin'),
('31105', 'Bonus Exp', 'PLA', 'admin', 'admin'),
('31106', 'Staff Dress exp', 'PLA', 'admin', 'admin'),
('31107', 'dashain exp', 'PLA', 'admin', 'admin'),
('32000', 'Office Expenses', '', 'admin', 'admin'),
('32101', 'House Rent', 'PLA', 'admin', 'admin'),
('32102', 'Electricity', 'PLA', 'admin', 'admin'),
('32103', 'Telephone/Postage', 'PLA', 'admin', 'admin'),
('32104', 'Stationary/Printing', 'PLA', 'admin', 'admin'),
('32105', 'Mentainance', 'PLA', 'admin', 'admin'),
('32106', 'Meeting Expenses', 'PLA', 'admin', 'admin'),
('32107', 'Travelling', 'PLA', 'admin', 'admin'),
('32108', 'Business Promotion', 'PLA', 'admin', 'admin'),
('32109', 'Staff Welfare and Training', 'PLA', 'admin', 'admin'),
('32110', 'Entertainment', 'PLA', 'admin', 'admin'),
('32111', 'Misc.Office Expenses', 'PLA', 'admin', 'admin'),
('32112', 'Transportation expenses', 'PLA', 'admin', 'admin'),
('32113', 'Newspaper', 'PLA', 'admin', 'admin'),
('32114', 'Computer Expenses', 'PLA', 'admin', 'admin'),
('32115', 'Printing', 'PLA', 'admin', 'admin'),
('32116', 'Email and fax+Gift Exp', 'PLA', 'admin', 'admin'),
('32117', 'Guest Welcome(Food/Tea)', 'PLA', 'admin', 'admin'),
('32118', 'Other expenses', 'PLA', 'admin', 'admin'),
('32119', 'Tax expenses', 'PLA', 'admin', 'admin'),
('32120', 'Advertisement', 'PLA', 'admin', 'admin'),
('32121', 'Annual General Meeting', 'PLA', 'admin', 'admin'),
('32122', 'Vharman and Gosti', 'PLA', 'admin', 'admin'),
('32123', 'Field Tour Exp', 'PLA', 'admin', 'admin'),
('32124', 'Electricity Charge exp', 'PLA', 'admin', 'admin'),
('32125', 'software udate expenses', 'PLA', 'admin', 'admin'),
('32127', 'social community expenses', 'PLA', 'admin', 'admin'),
('33000', 'Interest Expenses', '', 'admin', 'admin'),
('33101', 'Interest Exp', 'PLA', 'admin', 'admin'),
('33102', 'Interest On Savings', 'PLA', 'admin', 'admin'),
('34000', 'Other Expenses', '', 'admin', 'admin'),
('34101', 'Audit Expenses', 'PLA', 'admin', 'admin'),
('34102', 'Misc.Fees', 'PLA', 'admin', 'admin'),
('34103', 'audit and fees', 'PLA', 'admin', 'admin'),
('34201', 'Donations', 'PLA', 'admin', 'admin'),
('35000', 'Rebate Exp', 'PLA', 'admin', 'admin'),
('35101', 'Interest Rebate', 'PLA', 'admin', 'admin'),
('36000', 'Commissions', '', 'admin', 'admin'),
('36101', 'Insurance', 'PLA', 'admin', 'admin'),
('36102', 'Commissions', 'PLA', 'admin', 'admin'),
('36103', 'Renuwals', 'PLA', 'admin', 'admin'),
('37000', 'Depreciation expenses', '', 'admin', 'admin'),
('37101', 'Depreciation Expenses', 'PLA', 'admin', 'admin'),
('37102', 'Fixed assets Deprication', 'PLA', 'admin', 'admin'),
('38000', 'WOF Expenses', '', 'admin', 'admin'),
('38101', 'Write off Expenses-Principle', 'PLA', 'admin', 'admin'),
('38102', 'Write off Expenses - Interest', 'PLA', 'admin', 'admin'),
('38103', 'Write off expenses for fixed asset', 'PLA', 'admin', 'admin'),
('38104', 'other woff expenses', 'PLA', 'admin', 'admin'),
('39000', 'Provision Expenses', 'PLA', 'admin', 'admin'),
('39100', 'Loan Loss provision', '', 'admin', 'admin'),
('39101', 'Prov. exp for good loan', 'PLA', 'admin', 'admin'),
('39102', 'Prov. exp for bad loan', 'PLA', 'admin', 'admin'),
('40000', 'Incomes', '', 'admin', 'admin'),
('41000', 'Interest Income from Loan', '', 'admin', 'admin'),
('41100', 'Interest Income from Loan', 'PLA', 'admin', 'admin'),
('41101', 'Interest Income', 'PLA', 'admin', 'admin'),
('42000', 'Misc Income', '', 'admin', 'admin'),
('42101', 'Lagani Bata Prapta Byaj', 'PLA', 'admin', 'admin'),
('42102', 'Bank Interest Income', 'PLA', 'admin', 'admin'),
('42103', 'Late Fee', 'PLA', 'admin', 'admin'),
('42104', 'Passbook Fee', 'PLA', 'admin', 'admin'),
('42105', 'Admission Fee', 'PLA', 'admin', 'admin'),
('42106', 'Membership Fee', 'PLA', 'admin', 'admin'),
('42107', 'Form Sale Income', 'PLA', 'admin', 'admin'),
('42108', 'Service Charge', 'PLA', 'admin', 'admin'),
('42109', 'Other income', 'PLA', 'admin', 'admin'),
('43000', 'Write off incomes', '', 'admin', 'admin'),
('43101', 'Write off income-Principle', 'PLA', 'admin', 'admin'),
('43102', 'Write off income- Interest', 'PLA', 'admin', 'admin'),
('43103', 'Write off income for fixed asset', 'PLA', 'admin', 'admin'),
('43104', 'other woff income', 'PLA', 'admin', 'admin'),
('70000', 'Mig Account', 'MIG', 'admin', 'admin'),
('80000', 'Off Balance Assets', '', 'admin', 'admin'),
('81101', 'wof Assets', 'OFF', 'admin', 'admin'),
('90000', 'Off Balance Liabilities', '', 'admin', 'admin'),
('91101', 'WOF Liabilities', 'OFF', 'admin', 'admin'),
('1231', 'Shishir', 'ACC', 'admin', NULL),
('123', '123', 'ACC', 'admin', NULL),
('123', '213', 'FIN', NULL, NULL),
('123', '1231', 'FIN', NULL, NULL),
('jkjl', 'jkjl', 'FIN', NULL, NULL),
('jlkj', 'jklj', 'FIN', NULL, NULL),
('kjlk', 'jlkj', 'FIN', NULL, NULL),
('1231', '123', 'FIN', NULL, NULL),
('123', '123', 'FIN', 'admin', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `claim_bill_content`
--

CREATE TABLE IF NOT EXISTS `claim_bill_content` (
  `claim_bill_content_id` bigint(20) NOT NULL,
  `categoryId` varchar(5) NOT NULL,
  `nontaxableamount` double(3,2) NOT NULL DEFAULT '0.00',
  `taxableamount` double(3,2) NOT NULL DEFAULT '0.00',
  `totalamount` double(3,2) NOT NULL,
  `claim_bill_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `claim_bill_tbl`
--

CREATE TABLE IF NOT EXISTS `claim_bill_tbl` (
  `claim_bill_id` bigint(20) NOT NULL,
  `fromDateEn` varchar(10) NOT NULL,
  `fromDateNep` varchar(10) NOT NULL,
  `toDateEn` varchar(10) NOT NULL,
  `toDateNep` varchar(10) NOT NULL,
  `invoiceNo` varchar(50) NOT NULL,
  `invoiceDateEn` varchar(10) NOT NULL,
  `invoiceDateNep` varchar(10) NOT NULL,
  `receivedby` varchar(50) NOT NULL,
  `nontaxable_totalfees` double(3,2) NOT NULL DEFAULT '0.00',
  `taxable_totalfees` double(3,2) NOT NULL DEFAULT '0.00',
  `totalfees` double(3,2) NOT NULL,
  `nontaxable_discount` double(3,2) NOT NULL DEFAULT '0.00',
  `taxable_discount` double(3,2) NOT NULL DEFAULT '0.00',
  `totaldiscount` double(3,2) NOT NULL DEFAULT '0.00',
  `nontaxable_total` double(3,2) NOT NULL,
  `taxable_total` double(3,2) NOT NULL,
  `total` double(3,2) NOT NULL,
  `tax_percentage` double(3,2) NOT NULL DEFAULT '0.00',
  `tax_amount` double(3,2) NOT NULL DEFAULT '0.00',
  `grand_total` double(3,2) NOT NULL,
  `drcr_previous_balance` double(3,2) NOT NULL DEFAULT '0.00',
  `total_receivable` double(3,2) NOT NULL,
  `resv1` varchar(50) DEFAULT NULL,
  `resv2` varchar(50) DEFAULT NULL,
  `resv3` varchar(50) DEFAULT NULL,
  `resv4` varchar(50) DEFAULT NULL,
  `resv5` varchar(50) DEFAULT NULL,
  `studentid` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `classadmission`
--

CREATE TABLE IF NOT EXISTS `classadmission` (
  `studentid` bigint(20) NOT NULL,
  `sclass` int(11) NOT NULL,
  `studenroll` int(11) NOT NULL,
  `ssection` varchar(1) DEFAULT NULL,
  `trdistance` varchar(5) DEFAULT NULL,
  `inputter` varchar(30) DEFAULT NULL,
  `entrydate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `classlist`
--

CREATE TABLE IF NOT EXISTS `classlist` (
  `classid` bigint(20) NOT NULL,
  `classname` varchar(15) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `classlist`
--

INSERT INTO `classlist` (`classid`, `classname`) VALUES
(6, '1324');

-- --------------------------------------------------------

--
-- Table structure for table `classroom`
--

CREATE TABLE IF NOT EXISTS `classroom` (
  `classroomid` bigint(20) NOT NULL,
  `year` int(4) NOT NULL,
  `classid` bigint(20) DEFAULT NULL,
  `sectionid` int(11) DEFAULT NULL,
  `remarks` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `classroom_student`
--

CREATE TABLE IF NOT EXISTS `classroom_student` (
  `classroomid` bigint(20) DEFAULT NULL,
  `studentid` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `courseid` bigint(20) NOT NULL,
  `subjectid` bigint(20) NOT NULL,
  `studentid` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `coursetbl`
--

CREATE TABLE IF NOT EXISTS `coursetbl` (
  `coursetblid` bigint(20) NOT NULL,
  `subjectid` bigint(20) DEFAULT NULL,
  `gradeid` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `disabledtype`
--

CREATE TABLE IF NOT EXISTS `disabledtype` (
  `id` varchar(3) NOT NULL,
  `typehead` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `disabledtype`
--

INSERT INTO `disabledtype` (`id`, `typehead`) VALUES
('01', 'Disability Information'),
('02', 'Cognitive'),
('03', 'Hearing Loss and Deafness'),
('04', 'Invisible Disabilities'),
('05', 'Mobility Impairments'),
('06', 'Psychological Disorders'),
('07', 'Spinal Cord Injury'),
('08', 'Vision Disability');

-- --------------------------------------------------------

--
-- Table structure for table `districtcodes`
--

CREATE TABLE IF NOT EXISTS `districtcodes` (
  `DistrictCode` int(11) NOT NULL DEFAULT '0',
  `DistrictName` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `districtcodes`
--

INSERT INTO `districtcodes` (`DistrictCode`, `DistrictName`) VALUES
(1, 'Taplejung'),
(2, 'Panchthar'),
(3, 'Ilam'),
(4, 'Jhapa'),
(5, 'Sankhuwasabha'),
(6, 'Terhathum'),
(7, 'Bhojpur'),
(8, 'Dhankuta'),
(9, 'Morang'),
(10, 'Sunsari'),
(11, 'Solukhumbu'),
(12, 'Khotang'),
(13, 'Okhaldhunga'),
(14, 'Udayapur'),
(15, 'Saptari'),
(16, 'Siraha'),
(17, 'Dolakha'),
(18, 'Ramechhap'),
(19, 'Sindhuli'),
(20, 'Dhanusha'),
(21, 'Mahottari'),
(22, 'Sarlahi'),
(23, 'Rasuwa'),
(24, 'Dhading'),
(25, 'Nuwakot'),
(26, 'Kathmandu'),
(27, 'Bhaktapur'),
(28, 'Lalitpur'),
(29, 'Kavrepalanchowk'),
(30, 'Sindhupalchowk'),
(31, 'Makwanpur'),
(32, 'Rautahat'),
(33, 'Bara'),
(34, 'Parsa'),
(35, 'Chitwan'),
(36, 'Gorkha'),
(37, 'Manang'),
(38, 'Lamjung'),
(39, 'Kaski'),
(40, 'Tanahun'),
(41, 'Syangja'),
(42, 'Gulmi'),
(43, 'Palpa'),
(44, 'Arghakhanchi'),
(45, 'Nawalparasi'),
(46, 'Rupandehi'),
(47, 'Kapilvastu'),
(48, 'Mustang'),
(49, 'Myagdi'),
(50, 'Baglung'),
(51, 'Parbat'),
(52, 'Rukum'),
(53, 'Rolpa'),
(54, 'Pyuthan'),
(55, 'Salyan'),
(56, 'Dang'),
(57, 'Dolpa'),
(58, 'Mugu'),
(59, 'Jumla'),
(60, 'Kalikot'),
(61, 'Humla'),
(62, 'Jajarkot'),
(63, 'Dailekh'),
(64, 'Surkhet'),
(65, 'Banke'),
(66, 'Bardiya'),
(67, 'Bajura'),
(68, 'Achham'),
(69, 'Bajhang'),
(70, 'Doti'),
(71, 'Kailali'),
(72, 'Darchula'),
(73, 'Baitadi'),
(74, 'Dadeldhura'),
(75, 'Kanchanpur');

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE IF NOT EXISTS `exam` (
  `examid` bigint(20) NOT NULL,
  `examcode` varchar(50) DEFAULT '0',
  `examtypeid` bigint(20) DEFAULT NULL,
  `examname` varchar(20) NOT NULL,
  `startdate` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exam_marks_tbl`
--

CREATE TABLE IF NOT EXISTS `exam_marks_tbl` (
  `exammarksid` bigint(20) NOT NULL,
  `studentid` bigint(20) DEFAULT NULL,
  `examid` bigint(20) DEFAULT NULL,
  `subjectid` bigint(20) DEFAULT NULL,
  `prmarks` double(5,2) DEFAULT '0.00',
  `thmarks` double(5,2) DEFAULT '0.00',
  `totalmarks` double(5,2) DEFAULT '0.00',
  `totalgrade` varchar(10) NOT NULL DEFAULT '0',
  `remarks` varchar(100) DEFAULT 'No Remarks.',
  `inputDate` varchar(50) DEFAULT NULL,
  `fullmarks` double(5,2) DEFAULT '0.00',
  `passmarks` double(5,2) DEFAULT '0.00',
  `fullmarks_pr` double(5,2) NOT NULL DEFAULT '0.00',
  `passmarks_pr` double(5,2) NOT NULL DEFAULT '0.00',
  `inputter` varchar(50) DEFAULT NULL,
  `input_datetime` varchar(50) DEFAULT NULL,
  `reserved1` varchar(50) DEFAULT NULL,
  `reserved2` varchar(50) DEFAULT NULL,
  `reserved3` varchar(50) DEFAULT NULL,
  `reserved4` varchar(50) DEFAULT NULL,
  `reserved5` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `exam_result`
--

CREATE TABLE IF NOT EXISTS `exam_result` (
  `examid` bigint(20) DEFAULT NULL,
  `studentid` bigint(20) DEFAULT NULL,
  `courseid` bigint(20) DEFAULT NULL,
  `marks` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `exam_summary`
--
CREATE TABLE IF NOT EXISTS `exam_summary` (
`studentid` bigint(20)
,`examid` bigint(20)
,`sum(totalmarks)` double(19,2)
,`sum(fullmarks)` double(19,2)
,`percentage` double(23,6)
,`examname` varchar(20)
,`startdate` varchar(10)
,`examtypename` varchar(20)
,`curdate` date
);

-- --------------------------------------------------------

--
-- Table structure for table `exam_type`
--

CREATE TABLE IF NOT EXISTS `exam_type` (
  `examtypeid` bigint(20) NOT NULL,
  `examtypename` varchar(20) NOT NULL,
  `description` varchar(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exam_type`
--

INSERT INTO `exam_type` (`examtypeid`, `examtypename`, `description`) VALUES
(5, '1324', '');

-- --------------------------------------------------------

--
-- Table structure for table `feerate`
--

CREATE TABLE IF NOT EXISTS `feerate` (
  `feecode` varchar(5) NOT NULL,
  `sclass` int(11) NOT NULL,
  `frate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `feetype`
--

CREATE TABLE IF NOT EXISTS `feetype` (
  `feecode` varchar(5) NOT NULL,
  `feehead` varchar(35) NOT NULL,
  `freequency` varchar(10) NOT NULL,
  `tracc` varchar(5) DEFAULT NULL,
  `incomeacc` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fee_invoice_content`
--

CREATE TABLE IF NOT EXISTS `fee_invoice_content` (
  `fee_invoice_contentid` bigint(20) NOT NULL,
  `categoryId` varchar(5) NOT NULL,
  `fee_amount` varchar(6) NOT NULL,
  `discount_amount` varchar(6) NOT NULL,
  `balance_amount` varchar(6) NOT NULL,
  `resv1` varchar(50) DEFAULT NULL,
  `resv2` varchar(50) DEFAULT NULL,
  `fee_invoice_id` bigint(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fee_invoice_tbl`
--

CREATE TABLE IF NOT EXISTS `fee_invoice_tbl` (
  `studentid` bigint(20) NOT NULL,
  `fromDateEn` varchar(10) NOT NULL,
  `fromDateNep` varchar(10) NOT NULL,
  `toDateEn` varchar(10) NOT NULL,
  `toDateNep` varchar(10) NOT NULL,
  `invoiceNo` varchar(50) NOT NULL,
  `invoiceDateEn` varchar(10) NOT NULL,
  `invoiceDateNep` varchar(10) NOT NULL,
  `subTotal` double(50,2) NOT NULL,
  `discountPercentage` varchar(6) NOT NULL,
  `discountAmount` double(50,2) NOT NULL,
  `total` double(50,2) NOT NULL,
  `taxPercentage` varchar(6) NOT NULL,
  `taxAmount` double(50,2) NOT NULL,
  `grandTotal` double(50,2) NOT NULL,
  `amountPaid` double(50,2) NOT NULL,
  `balanceDue` double(50,2) NOT NULL,
  `inwords` varchar(100) NOT NULL,
  `remarks` varchar(100) DEFAULT 'No Remarks',
  `receivedby` varchar(100) NOT NULL,
  `resv1` varchar(100) DEFAULT NULL,
  `resv2` varchar(100) DEFAULT NULL,
  `resv3` varchar(100) DEFAULT NULL,
  `resv4` varchar(100) DEFAULT NULL,
  `fee_invoice_id` bigint(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `generalsettings`
--

CREATE TABLE IF NOT EXISTS `generalsettings` (
  `settings_id` int(11) NOT NULL,
  `type` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `generalsettings`
--

INSERT INTO `generalsettings` (`settings_id`, `type`, `description`) VALUES
(1, 'system_name', 'Araniko Schoo'),
(2, 'system_title', 'Araniko School'),
(3, 'address', 'Thapathali, Kathmandu'),
(4, 'phone', '9845811251'),
(5, 'email', 'araniko@araniko.com'),
(6, 'session', '2074');

-- --------------------------------------------------------

--
-- Table structure for table `housegrouptbl`
--

CREATE TABLE IF NOT EXISTS `housegrouptbl` (
  `housegroupid` int(11) NOT NULL,
  `housegroupname` varchar(25) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `housegrouptbl`
--

INSERT INTO `housegrouptbl` (`housegroupid`, `housegroupname`) VALUES
(7, '12');

-- --------------------------------------------------------

--
-- Table structure for table `languagetbl`
--

CREATE TABLE IF NOT EXISTS `languagetbl` (
  `languageid` int(11) NOT NULL,
  `languagename` varchar(25) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `languagetbl`
--

INSERT INTO `languagetbl` (`languageid`, `languagename`) VALUES
(29, 'abck');

-- --------------------------------------------------------

--
-- Table structure for table `multipletransactiontbl`
--

CREATE TABLE IF NOT EXISTS `multipletransactiontbl` (
  `id` int(11) NOT NULL DEFAULT '0',
  `transactionId` varchar(12) CHARACTER SET utf8 DEFAULT NULL,
  `transactionNo` varchar(15) CHARACTER SET utf8 DEFAULT NULL,
  `bookingDate` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `valueDate` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `processingDate` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `accountNumber` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `drcr` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `amount` double(16,2) DEFAULT NULL,
  `narrative` varchar(35) CHARACTER SET utf8 DEFAULT NULL,
  `cheqNumber` varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  `transactionCode` int(11) DEFAULT NULL,
  `branchId` varchar(4) CHARACTER SET utf8 DEFAULT NULL,
  `inputter` varchar(35) CHARACTER SET utf8 DEFAULT NULL,
  `authorizer` varchar(35) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `roleindex`
--

CREATE TABLE IF NOT EXISTS `roleindex` (
  `roles` varchar(500) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roleindex`
--

INSERT INTO `roleindex` (`roles`, `name`) VALUES
('#retailoperation', 'account'),
('#member,#retailoperation,#shareholder,#generaltransaction,#loanmodule,#nonfundbusiness,#otherutilities,#reports,#adminsettings', 'admin'),
('#loanmodule, #nonfundbusiness', 'relation officer'),
('#member, #loanmodule', 'staff');

-- --------------------------------------------------------

--
-- Table structure for table `saddresstbl`
--

CREATE TABLE IF NOT EXISTS `saddresstbl` (
  `saddressid` bigint(20) NOT NULL,
  `studentid` bigint(20) DEFAULT NULL,
  `District` varchar(30) DEFAULT NULL,
  `VdcMun` varchar(30) DEFAULT NULL,
  `WardNo` int(2) DEFAULT NULL,
  `tole` varchar(30) DEFAULT NULL,
  `tempaddress` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sbirthcertificatetbl`
--

CREATE TABLE IF NOT EXISTS `sbirthcertificatetbl` (
  `sbirthcertificateid` bigint(20) NOT NULL,
  `studentid` bigint(20) DEFAULT NULL,
  `sbirthcertificateno` varchar(20) DEFAULT NULL,
  `sbirthcertificateissuedby` varchar(50) DEFAULT NULL,
  `sbirthcertificateissueddate` varchar(10) DEFAULT NULL,
  `sbirthcertificateissueddateen` varchar(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sbirthcertificatetbl`
--

INSERT INTO `sbirthcertificatetbl` (`sbirthcertificateid`, `studentid`, `sbirthcertificateno`, `sbirthcertificateissuedby`, `sbirthcertificateissueddate`, `sbirthcertificateissueddateen`) VALUES
(61, 61, '123456', '123', '2051-05-05', '2051-05-05');

-- --------------------------------------------------------

--
-- Table structure for table `sectiontbl`
--

CREATE TABLE IF NOT EXISTS `sectiontbl` (
  `sectionid` int(11) NOT NULL,
  `sectionname` varchar(25) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sectiontbl`
--

INSERT INTO `sectiontbl` (`sectionid`, `sectionname`) VALUES
(10, '123');

-- --------------------------------------------------------

--
-- Table structure for table `setstudentfee`
--

CREATE TABLE IF NOT EXISTS `setstudentfee` (
  `studentid` bigint(20) NOT NULL,
  `feecode` varchar(5) NOT NULL,
  `feeamt` double NOT NULL DEFAULT '0',
  `dicountrate` double NOT NULL DEFAULT '0',
  `discountamt` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sfatherdetailtbl`
--

CREATE TABLE IF NOT EXISTS `sfatherdetailtbl` (
  `sfatherdetailid` bigint(20) NOT NULL,
  `studentid` bigint(20) DEFAULT NULL,
  `fathername` varchar(30) DEFAULT NULL,
  `faddress` varchar(30) DEFAULT NULL,
  `foffice` varchar(30) DEFAULT NULL,
  `fposition` varchar(30) DEFAULT NULL,
  `fincome` double DEFAULT NULL,
  `fmobile` int(11) DEFAULT NULL,
  `ftelephone` int(11) DEFAULT NULL,
  `femail` varchar(20) DEFAULT NULL,
  `fephone` int(11) DEFAULT NULL,
  `fcitizenshipno` varchar(20) DEFAULT NULL,
  `fcitizenshipissuedby` varchar(50) DEFAULT NULL,
  `fcitizenshipissueddate` varchar(10) DEFAULT NULL,
  `fcitizenshipissueddateen` varchar(10) DEFAULT NULL,
  `flicenseno` varchar(20) DEFAULT NULL,
  `flicenseissuedby` varchar(50) DEFAULT NULL,
  `flicenseissueddate` varchar(10) DEFAULT NULL,
  `flicenseissueddateen` varchar(10) DEFAULT NULL,
  `fofficialidno` varchar(30) DEFAULT NULL,
  `fofficialidissuedby` varchar(50) DEFAULT NULL,
  `fofficialidissueddate` varchar(10) DEFAULT NULL,
  `fofficialidissueddateen` varchar(10) DEFAULT NULL,
  `fvoteridno` varchar(20) DEFAULT NULL,
  `fvoteridissuedby` varchar(50) DEFAULT NULL,
  `fvoteridissueddate` varchar(10) DEFAULT NULL,
  `fvoteridissueddateen` varchar(10) DEFAULT NULL,
  `fpassportno` varchar(20) DEFAULT NULL,
  `fpassportissuedby` varchar(50) DEFAULT NULL,
  `fpassportissueddate` varchar(10) DEFAULT NULL,
  `fpassportissueddateen` varchar(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sfatherdetailtbl`
--

INSERT INTO `sfatherdetailtbl` (`sfatherdetailid`, `studentid`, `fathername`, `faddress`, `foffice`, `fposition`, `fincome`, `fmobile`, `ftelephone`, `femail`, `fephone`, `fcitizenshipno`, `fcitizenshipissuedby`, `fcitizenshipissueddate`, `fcitizenshipissueddateen`, `flicenseno`, `flicenseissuedby`, `flicenseissueddate`, `flicenseissueddateen`, `fofficialidno`, `fofficialidissuedby`, `fofficialidissueddate`, `fofficialidissueddateen`, `fvoteridno`, `fvoteridissuedby`, `fvoteridissueddate`, `fvoteridissueddateen`, `fpassportno`, `fpassportissuedby`, `fpassportissueddate`, `fpassportissueddateen`) VALUES
(9, 61, '1', '1', '1', '1', 1, 1, 1, 'hkjh@kjl.com', 1, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `slocalguardiantbl`
--

CREATE TABLE IF NOT EXISTS `slocalguardiantbl` (
  `slocalguardianid` bigint(20) NOT NULL,
  `studentid` bigint(20) DEFAULT NULL,
  `localguardianname` varchar(50) DEFAULT NULL,
  `localadd` varchar(50) DEFAULT NULL,
  `relationtype` varchar(20) DEFAULT NULL,
  `localmob` int(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slocalguardiantbl`
--

INSERT INTO `slocalguardiantbl` (`slocalguardianid`, `studentid`, `localguardianname`, `localadd`, `relationtype`, `localmob`) VALUES
(99, 61, '123', '123', 'null', 132),
(100, 61, '123', '132', 'Grand Father', 132);

-- --------------------------------------------------------

--
-- Table structure for table `smotherdetailtbl`
--

CREATE TABLE IF NOT EXISTS `smotherdetailtbl` (
  `smotherdetailid` bigint(20) NOT NULL,
  `studentid` bigint(20) DEFAULT NULL,
  `mothername` varchar(30) DEFAULT NULL,
  `maddress` varchar(30) DEFAULT NULL,
  `moffice` varchar(30) DEFAULT NULL,
  `mposition` varchar(30) DEFAULT NULL,
  `mincome` double DEFAULT NULL,
  `mmobile` int(11) DEFAULT NULL,
  `mtelephone` int(11) DEFAULT NULL,
  `memail` varchar(20) DEFAULT NULL,
  `mephone` int(11) DEFAULT NULL,
  `mcitizenshipno` varchar(20) DEFAULT NULL,
  `mcitizenshipissuedby` varchar(50) DEFAULT NULL,
  `mcitizenshipissueddate` varchar(10) DEFAULT NULL,
  `mcitizenshipissueddateen` varchar(10) DEFAULT NULL,
  `mlicenseno` varchar(20) DEFAULT NULL,
  `mlicenseissuedby` varchar(50) DEFAULT NULL,
  `mlicenseissueddate` varchar(10) DEFAULT NULL,
  `mlicenseissueddateen` varchar(10) DEFAULT NULL,
  `mofficialidno` varchar(30) DEFAULT NULL,
  `mofficialidissuedby` varchar(50) DEFAULT NULL,
  `mofficialidissueddate` varchar(10) DEFAULT NULL,
  `mofficialidissueddateen` varchar(10) DEFAULT NULL,
  `mvoteridno` varchar(20) DEFAULT NULL,
  `mvoteridissuedby` varchar(50) DEFAULT NULL,
  `mvoteridissueddate` varchar(10) DEFAULT NULL,
  `mvoteridissueddateen` varchar(10) DEFAULT NULL,
  `mpassportno` varchar(20) DEFAULT NULL,
  `mpassportissuedby` varchar(50) DEFAULT NULL,
  `mpassportissueddate` varchar(10) DEFAULT NULL,
  `mpassportissueddateen` varchar(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `smotherdetailtbl`
--

INSERT INTO `smotherdetailtbl` (`smotherdetailid`, `studentid`, `mothername`, `maddress`, `moffice`, `mposition`, `mincome`, `mmobile`, `mtelephone`, `memail`, `mephone`, `mcitizenshipno`, `mcitizenshipissuedby`, `mcitizenshipissueddate`, `mcitizenshipissueddateen`, `mlicenseno`, `mlicenseissuedby`, `mlicenseissueddate`, `mlicenseissueddateen`, `mofficialidno`, `mofficialidissuedby`, `mofficialidissueddate`, `mofficialidissueddateen`, `mvoteridno`, `mvoteridissuedby`, `mvoteridissueddate`, `mvoteridissueddateen`, `mpassportno`, `mpassportissuedby`, `mpassportissueddate`, `mpassportissueddateen`) VALUES
(50, 61, '1', '1', '1', '1', 1, 1, 1, 'kjf@jlk.com', 1, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `specialinteresttbl`
--

CREATE TABLE IF NOT EXISTS `specialinteresttbl` (
  `specialinterestid` int(11) NOT NULL,
  `specialinterestname` varchar(25) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `specialinteresttbl`
--

INSERT INTO `specialinteresttbl` (`specialinterestid`, `specialinterestname`) VALUES
(5, '123');

-- --------------------------------------------------------

--
-- Stand-in structure for view `studentdetail`
--
CREATE TABLE IF NOT EXISTS `studentdetail` (
`studentid` bigint(20)
,`LegacyId` varchar(15)
,`studentname` varchar(35)
,`sex` varchar(1)
,`smotherlanguage` varchar(10)
,`sethinicgroup` varchar(20)
,`sreligion` varchar(20)
,`dob` varchar(10)
,`doben` varchar(10)
,`differentlyabledYN` varchar(1)
,`differentlyabledtype` varchar(2)
,`admissionclass` varchar(15)
,`section` varchar(25)
,`rollno` varchar(10)
,`housegroup` varchar(25)
,`oldschool` varchar(35)
,`reasonleav` varchar(35)
,`hobby` varchar(35)
,`specialinterest` varchar(35)
,`inputter` varchar(30)
,`entrydate` datetime
,`admissiondate` varchar(10)
,`admissiondateen` varchar(10)
);

-- --------------------------------------------------------

--
-- Table structure for table `studentinfo`
--

CREATE TABLE IF NOT EXISTS `studentinfo` (
  `studentid` bigint(20) NOT NULL,
  `LegacyId` varchar(15) DEFAULT NULL,
  `studentname` varchar(35) NOT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `smotherlanguage` varchar(10) DEFAULT NULL,
  `sethinicgroup` varchar(20) DEFAULT NULL,
  `sreligion` varchar(20) DEFAULT NULL,
  `dob` varchar(10) DEFAULT NULL,
  `doben` varchar(10) DEFAULT NULL,
  `differentlyabledYN` varchar(1) DEFAULT NULL,
  `differentlyabledtype` varchar(2) DEFAULT NULL,
  `admissionclass` varchar(15) NOT NULL,
  `section` varchar(25) DEFAULT NULL,
  `rollno` varchar(10) DEFAULT NULL,
  `housegroup` varchar(25) DEFAULT NULL,
  `oldschool` varchar(35) DEFAULT NULL,
  `reasonleav` varchar(35) DEFAULT NULL,
  `hobby` varchar(35) DEFAULT NULL,
  `specialinterest` varchar(35) DEFAULT NULL,
  `inputter` varchar(30) DEFAULT NULL,
  `entrydate` datetime DEFAULT NULL,
  `admissiondate` varchar(10) DEFAULT NULL,
  `admissiondateen` varchar(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `studentinfo`
--

INSERT INTO `studentinfo` (`studentid`, `LegacyId`, `studentname`, `sex`, `smotherlanguage`, `sethinicgroup`, `sreligion`, `dob`, `doben`, `differentlyabledYN`, `differentlyabledtype`, `admissionclass`, `section`, `rollno`, `housegroup`, `oldschool`, `reasonleav`, `hobby`, `specialinterest`, `inputter`, `entrydate`, `admissiondate`, `admissiondateen`) VALUES
(61, '123', 'test', 'm', 'null', 'null', 'Hindu', '2051-05-05', '2051-05-05', 'y', '01', '6', '123', '2', '7', '1231', '123', '12', '5', 'inputter', '2018-05-05 00:00:00', '2051-05-05', '2051-05-05');

-- --------------------------------------------------------

--
-- Table structure for table `subjectlist`
--

CREATE TABLE IF NOT EXISTS `subjectlist` (
  `subjectid` bigint(20) NOT NULL,
  `subjectname` varchar(20) NOT NULL,
  `subjecttype` varchar(20) NOT NULL,
  `subjectCode` varchar(30) NOT NULL,
  `fullmarks` double(5,2) NOT NULL DEFAULT '0.00',
  `passmarks` double(5,2) NOT NULL DEFAULT '0.00',
  `fullmarks_pr` double(5,2) NOT NULL DEFAULT '0.00',
  `passmarks_pr` double(5,2) NOT NULL DEFAULT '0.00',
  `reserved3` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbldateconv`
--

CREATE TABLE IF NOT EXISTS `tbldateconv` (
  `NYr` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `EDate` date DEFAULT NULL,
  `M1` int(11) DEFAULT NULL,
  `M2` int(11) DEFAULT NULL,
  `M3` int(11) DEFAULT NULL,
  `M4` int(11) DEFAULT NULL,
  `M5` int(11) DEFAULT NULL,
  `M6` int(11) DEFAULT NULL,
  `M7` int(11) DEFAULT NULL,
  `M8` int(11) DEFAULT NULL,
  `M9` int(11) DEFAULT NULL,
  `M10` int(11) DEFAULT NULL,
  `M11` int(11) DEFAULT NULL,
  `M12` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbldateconv`
--

INSERT INTO `tbldateconv` (`NYr`, `EDate`, `M1`, `M2`, `M3`, `M4`, `M5`, `M6`, `M7`, `M8`, `M9`, `M10`, `M11`, `M12`) VALUES
('2010', '1953-04-13', 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30),
('2011', '1954-04-13', 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31),
('2012', '1955-04-14', 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30),
('2013', '1956-04-13', 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30),
('2014', '1957-04-13', 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30),
('2015', '1958-04-13', 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31),
('2016', '1959-04-14', 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30),
('2017', '1960-04-13', 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30),
('2018', '1961-04-13', 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30),
('2019', '1962-04-13', 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31),
('2020', '1963-04-14', 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30),
('2021', '1964-04-13', 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30),
('2022', '1965-04-13', 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30),
('2023', '1966-04-13', 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31),
('2024', '1968-04-14', 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30),
('2025', '1968-04-13', 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30),
('2026', '1969-04-13', 31, 32, 31, 31, 31, 30, 30, 30, 29, 29, 30, 31),
('2027', '1970-04-14', 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31),
('2028', '1971-04-14', 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30),
('2029', '1972-04-13', 31, 31, 32, 31, 32, 30, 30, 29, 30, 29, 30, 30),
('2030', '1973-04-13', 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31),
('2031', '1974-04-14', 30, 32, 31, 32, 30, 30, 30, 30, 29, 30, 29, 31),
('2032', '1975-04-14', 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30),
('2033', '1976-04-13', 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 29),
('2034', '1977-04-13', 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31),
('2035', '1978-04-14', 30, 32, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31),
('2036', '1979-04-14', 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30),
('2037', '1980-04-13', 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30),
('2038', '1981-04-13', 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31),
('2039', '1982-04-14', 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30),
('2040', '1983-04-14', 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30),
('2041', '1984-04-13', 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30),
('2042', '1985-04-13', 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31),
('2043', '1986-04-14', 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30),
('2044', '1987-04-14', 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30),
('2045', '1988-04-13', 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30),
('2046', '1989-04-13', 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31),
('2047', '1990-04-14', 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30),
('2048', '1991-04-14', 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30),
('2049', '1992-04-13', 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30),
('2050', '1993-04-13', 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31),
('2051', '1994-04-14', 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30),
('2052', '1995-04-14', 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30),
('2053', '1996-04-13', 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30),
('2054', '1997-04-13', 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31),
('2055', '1998-04-14', 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30),
('2056', '1999-04-14', 31, 31, 32, 31, 32, 30, 30, 29, 30, 29, 30, 30),
('2057', '2000-04-13', 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31),
('2058', '2001-04-14', 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31),
('2059', '2002-04-14', 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30),
('2060', '2003-04-14', 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30),
('2061', '2004-04-13', 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31),
('2062', '2005-04-14', 31, 31, 31, 32, 31, 31, 29, 30, 29, 30, 29, 31),
('2063', '2006-04-14', 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30),
('2064', '2007-04-14', 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30),
('2065', '2008-04-13', 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31),
('2066', '2009-04-14', 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31),
('2067', '2010-04-14', 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30),
('2068', '2011-04-14', 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30),
('2069', '2012-04-13', 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31),
('2070', '2013-04-14', 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30),
('2071', '2014-04-14', 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30),
('2072', '2015-04-14', 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30),
('2073', '2016-04-13', 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31),
('2074', '2017-04-14', 31, 31, 31, 32, 31, 31, 29, 30, 29, 29, 30, 30),
('2075', '2018-04-14', 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30),
('2076', '2019-04-14', 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30),
('2077', '2020-04-13', 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31),
('2078', '2021-04-14', 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30),
('2079', '2022-04-14', 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30),
('2080', '2023-04-14', 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30),
('2081', '2024-04-13', 31, 31, 32, 32, 31, 30, 30, 30, 29, 30, 30, 30),
('2082', '2025-04-14', 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 30),
('2083', '2026-04-14', 31, 31, 32, 31, 31, 30, 30, 30, 29, 30, 30, 30),
('2084', '2027-04-14', 31, 31, 32, 31, 31, 30, 30, 30, 29, 30, 30, 30),
('2085', '2028-04-13', 31, 32, 31, 32, 30, 31, 30, 30, 29, 30, 30, 30),
('2086', '2029-04-14', 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 30),
('2087', '2030-04-14', 31, 31, 32, 31, 31, 31, 30, 30, 29, 30, 30, 30),
('2088', '2031-04-15', 30, 31, 32, 32, 30, 31, 30, 30, 29, 30, 30, 30),
('2089', '2032-04-14', 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 30),
('2090', '2033-04-14', 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 30),
('2091', '2034-04-14', 31, 31, 32, 31, 31, 31, 30, 30, 29, 30, 30, 30),
('2092', '2035-04-15', 30, 31, 32, 32, 31, 30, 30, 30, 29, 30, 30, 30),
('2093', '2036-04-14', 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 30),
('2094', '2037-04-14', 31, 31, 32, 31, 31, 30, 30, 30, 29, 30, 30, 30),
('2095', '2038-04-14', 31, 31, 32, 31, 31, 31, 30, 29, 30, 30, 30, 30),
('2096', '2039-04-15', 30, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30),
('2097', '2040-04-13', 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 30),
('2098', '2041-04-14', 31, 31, 32, 31, 31, 31, 29, 30, 29, 30, 29, 31),
('2099', '2042-04-14', 31, 31, 32, 31, 31, 31, 30, 29, 29, 30, 30, 30);

-- --------------------------------------------------------

--
-- Table structure for table `tblextuser`
--

CREATE TABLE IF NOT EXISTS `tblextuser` (
  `user_id` int(11) NOT NULL,
  `logon_name` varchar(25) NOT NULL,
  `user_pass` varchar(100) NOT NULL,
  `user_name` varchar(35) NOT NULL,
  `staff_code` varchar(6) NOT NULL,
  `company_id` varchar(4) NOT NULL DEFAULT '0001',
  `group_policy` varchar(15) NOT NULL DEFAULT 'admin',
  `start_date` date NOT NULL DEFAULT '2017-01-01',
  `end_date` date NOT NULL DEFAULT '2020-01-25',
  `status` enum('CUR','HIS') DEFAULT 'CUR',
  `input_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `inputter` varchar(25) NOT NULL DEFAULT 'admin',
  `authorizer` varchar(25) NOT NULL DEFAULT 'admin'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblextuser`
--

INSERT INTO `tblextuser` (`user_id`, `logon_name`, `user_pass`, `user_name`, `staff_code`, `company_id`, `group_policy`, `start_date`, `end_date`, `status`, `input_date`, `inputter`, `authorizer`) VALUES
(695, '0695', 'e10adc3949ba59abbe56e057f20f883e', 'RAMESH K. BASNET', '695', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(974, '0974', 'e10adc3949ba59abbe56e057f20f883e', 'MAHENDRA P. YADAV', '974', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(2794, '2794', 'e10adc3949ba59abbe56e057f20f883e', 'HIM P. BHATTARAI', '2794', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(2866, '2866', 'e10adc3949ba59abbe56e057f20f883e', 'RAM GULAM SHAH', '2866', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3097, '3097', 'e10adc3949ba59abbe56e057f20f883e', 'BISHNU P. SHARMA', '3097', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3126, '3126', 'e10adc3949ba59abbe56e057f20f883e', 'KARNA J. MALLA', '3126', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3136, '3136', 'e10adc3949ba59abbe56e057f20f883e', 'BHARAT B. BANIYA', '3136', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3152, '3152', 'e10adc3949ba59abbe56e057f20f883e', 'PRADIP K. POKHREL', '3152', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3170, '3170', 'e10adc3949ba59abbe56e057f20f883e', 'SHATRUGHNA P. SHAH', '3170', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3191, '3191', 'e10adc3949ba59abbe56e057f20f883e', 'SUMAN K. SHRESTHA', '3191', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3196, '3196', 'e10adc3949ba59abbe56e057f20f883e', 'DURGA DEVI CHUDAL', '3196', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3205, '3205', 'e10adc3949ba59abbe56e057f20f883e', 'ARJUN B. DEVKOTA', '3205', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3252, '3252', 'e10adc3949ba59abbe56e057f20f883e', 'SHAKTI B. SHRESTHA', '3252', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3334, '3334', 'e10adc3949ba59abbe56e057f20f883e', 'HARISCHANDRA NEUPANE', '3334', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3342, '3342', 'e10adc3949ba59abbe56e057f20f883e', 'SUBAS RAJ PANDE', '3342', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3407, '3407', 'e10adc3949ba59abbe56e057f20f883e', 'ISWHORI P. KHAREL', '3407', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3475, '3475', 'e10adc3949ba59abbe56e057f20f883e', 'SURYA B. LAWOTI', '3475', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3488, '3488', 'e10adc3949ba59abbe56e057f20f883e', 'RAJ K.SHAH', '3488', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3499, '3499', 'e10adc3949ba59abbe56e057f20f883e', 'RUDRA P. UPADHYAY', '3499', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3507, '3507', 'e10adc3949ba59abbe56e057f20f883e', 'KUMAR B. KATUWAL', '3507', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3523, '3523', 'e10adc3949ba59abbe56e057f20f883e', 'LAXMI N. SINGH', '3523', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3525, '3525', 'e10adc3949ba59abbe56e057f20f883e', 'AYODHYA P. YADAV', '3525', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3531, '3531', 'e10adc3949ba59abbe56e057f20f883e', 'TAPESHWAR CHAUDHARY', '3531', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3536, '3536', 'e10adc3949ba59abbe56e057f20f883e', 'DARSANANANDA UPADHAY', '3536', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3537, '3537', 'e10adc3949ba59abbe56e057f20f883e', 'GANESH P. TIMILSINA', '3537', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3541, '3541', 'e10adc3949ba59abbe56e057f20f883e', 'BADRI R. SUBEDI', '3541', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3544, '3544', 'e10adc3949ba59abbe56e057f20f883e', 'RESHAM R. BISTA', '3544', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3545, '3545', 'e10adc3949ba59abbe56e057f20f883e', 'BHARAT P. SHAH', '3545', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3550, '3550', 'e10adc3949ba59abbe56e057f20f883e', 'TAPESWOR SHAH', '3550', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3572, '3572', 'e10adc3949ba59abbe56e057f20f883e', 'RAM KRISHNA THAKURI', '3572', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3589, '3589', 'e10adc3949ba59abbe56e057f20f883e', 'HARI P. BHATTARAI', '3589', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3590, '3590', 'e10adc3949ba59abbe56e057f20f883e', 'YAM P.FUYAL', '3590', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3592, '3592', 'e10adc3949ba59abbe56e057f20f883e', 'GOVIND ARYAL', '3592', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3594, '3594', 'e10adc3949ba59abbe56e057f20f883e', 'PRAKASH K. SHRESTHA', '3594', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3595, '3595', 'e10adc3949ba59abbe56e057f20f883e', 'PRITAM K.C.', '3595', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3599, '3599', 'e10adc3949ba59abbe56e057f20f883e', 'SHIBA RAM PANDIT', '3599', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3600, '3600', 'e10adc3949ba59abbe56e057f20f883e', 'KARNA B. CHANDA', '3600', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3601, '3601', 'e10adc3949ba59abbe56e057f20f883e', 'RAJIB P. SINGH', '3601', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3603, '3603', 'e10adc3949ba59abbe56e057f20f883e', 'LILA DHAR THARU', '3603', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3604, '3604', 'e10adc3949ba59abbe56e057f20f883e', 'DIP B. TANDAN', '3604', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3605, '3605', 'e10adc3949ba59abbe56e057f20f883e', 'GITA GAUTAM (THAPA)', '3605', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3607, '3607', 'e10adc3949ba59abbe56e057f20f883e', 'KANDHAI L. GODIYA', '3607', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3608, '3608', 'e10adc3949ba59abbe56e057f20f883e', 'AMAR B. BANIYA', '3608', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3609, '3609', 'e10adc3949ba59abbe56e057f20f883e', 'JOKHAN SHAH', '3609', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3610, '3610', 'e10adc3949ba59abbe56e057f20f883e', 'DARSHAN K. SHRESTHA', '3610', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3615, '3615', 'e10adc3949ba59abbe56e057f20f883e', 'MITHILA K. ACHARYA', '3615', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3618, '3618', 'e10adc3949ba59abbe56e057f20f883e', 'ARJUN K. MAHARJAN', '3618', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3626, '3626', 'e10adc3949ba59abbe56e057f20f883e', 'SAROJA BHATTARAI', '3626', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3628, '3628', 'e10adc3949ba59abbe56e057f20f883e', 'USHA BHATTARAI', '3628', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3630, '3630', 'e10adc3949ba59abbe56e057f20f883e', 'SARASWOTI POKHAREL', '3630', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3631, '3631', 'e10adc3949ba59abbe56e057f20f883e', 'NRIP MANI GHIMIRE', '3631', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3633, '3633', 'e10adc3949ba59abbe56e057f20f883e', 'SANUBAHI PANDE', '3633', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3634, '3634', 'e10adc3949ba59abbe56e057f20f883e', 'HARISCHANDRA JHA', '3634', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3635, '3635', 'e10adc3949ba59abbe56e057f20f883e', 'LILA B. RAI', '3635', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3636, '3636', 'e10adc3949ba59abbe56e057f20f883e', 'GYAN R. SHARMA', '3636', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3639, '3639', 'e10adc3949ba59abbe56e057f20f883e', 'SHRMOD DAS SHRESTHA', '3639', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3646, '3646', 'e10adc3949ba59abbe56e057f20f883e', 'DEBRAM KHANAL', '3646', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3647, '3647', 'e10adc3949ba59abbe56e057f20f883e', 'CHHEDAR BHOTE', '3647', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3659, '3659', 'e10adc3949ba59abbe56e057f20f883e', 'RAM CHANDRA GHIMIRE', '3659', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3662, '3662', 'e10adc3949ba59abbe56e057f20f883e', 'ROHIT K. BHATTARAI', '3662', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3672, '3672', 'e10adc3949ba59abbe56e057f20f883e', 'GANGA RAM HADA', '3672', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3678, '3678', 'e10adc3949ba59abbe56e057f20f883e', 'MATRIKA P. POKHAREL', '3678', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3682, '3682', 'e10adc3949ba59abbe56e057f20f883e', 'PURANA SHAHI', '3682', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3685, '3685', 'e10adc3949ba59abbe56e057f20f883e', 'LAXMI DATTA BHATTA', '3685', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3686, '3686', 'e10adc3949ba59abbe56e057f20f883e', 'MAKAN B. GURUNG', '3686', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3687, '3687', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA LAMA', '3687', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3690, '3690', 'e10adc3949ba59abbe56e057f20f883e', 'BINDU BHANDARI', '3690', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3691, '3691', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA B. MAHARJAN', '3691', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3694, '3694', 'e10adc3949ba59abbe56e057f20f883e', 'SHAMBHU P. YADAV', '3694', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3695, '3695', 'e10adc3949ba59abbe56e057f20f883e', 'CHANDREWOR MAHATO', '3695', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3696, '3696', 'e10adc3949ba59abbe56e057f20f883e', 'BISHNU R. THAPA', '3696', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3700, '3700', 'e10adc3949ba59abbe56e057f20f883e', 'TIL B. GHARTI', '3700', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3703, '3703', 'e10adc3949ba59abbe56e057f20f883e', 'SHASHI SAPKOTA', '3703', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3704, '3704', 'e10adc3949ba59abbe56e057f20f883e', 'DAYARAM KHANAL', '3704', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3706, '3706', 'e10adc3949ba59abbe56e057f20f883e', 'BHOLA N. KONDEL', '3706', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3707, '3707', 'e10adc3949ba59abbe56e057f20f883e', 'PHATTA B. G.T.', '3707', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3708, '3708', 'e10adc3949ba59abbe56e057f20f883e', 'SHIBA B. KHATRI', '3708', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3710, '3710', 'e10adc3949ba59abbe56e057f20f883e', 'BISWO R. REGMI', '3710', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3712, '3712', 'e10adc3949ba59abbe56e057f20f883e', 'SHASHI PANTA', '3712', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3713, '3713', 'e10adc3949ba59abbe56e057f20f883e', 'SITA DEVI KAFLE', '3713', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3714, '3714', 'e10adc3949ba59abbe56e057f20f883e', 'SURENDRA K. HAMAL', '3714', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3717, '3717', 'e10adc3949ba59abbe56e057f20f883e', 'BHAGAWAN L.SRIBASTAB', '3717', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3718, '3718', 'e10adc3949ba59abbe56e057f20f883e', 'RABI MAYA AALE', '3718', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3720, '3720', 'e10adc3949ba59abbe56e057f20f883e', 'BHAGAWOTI ADHIKARI', '3720', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3723, '3723', 'e10adc3949ba59abbe56e057f20f883e', 'DURGA B. BANIYA', '3723', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3726, '3726', 'e10adc3949ba59abbe56e057f20f883e', 'BHAKTA B. BHANDARI', '3726', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3734, '3734', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA B. KUNWAR', '3734', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3736, '3736', 'e10adc3949ba59abbe56e057f20f883e', 'BHAGAWOTI KATEL', '3736', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3738, '3738', 'e10adc3949ba59abbe56e057f20f883e', 'GOSMAN SHRESTHA', '3738', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3745, '3745', 'e10adc3949ba59abbe56e057f20f883e', 'BASIULLA MUSALMAN', '3745', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3747, '3747', 'e10adc3949ba59abbe56e057f20f883e', 'RAJENDRA P. PANTA', '3747', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3748, '3748', 'e10adc3949ba59abbe56e057f20f883e', 'BASUDEV PAUDEL', '3748', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3749, '3749', 'e10adc3949ba59abbe56e057f20f883e', 'PREMRAJ GHIMIRE', '3749', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3751, '3751', 'e10adc3949ba59abbe56e057f20f883e', 'DUDHNATH BHANDARI', '3751', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3752, '3752', 'e10adc3949ba59abbe56e057f20f883e', 'GIRIRAJ NEPAL', '3752', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3753, '3753', 'e10adc3949ba59abbe56e057f20f883e', 'MOHAMAD ISLAM', '3753', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3756, '3756', 'e10adc3949ba59abbe56e057f20f883e', 'BABU R. POKHAREL', '3756', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3757, '3757', 'e10adc3949ba59abbe56e057f20f883e', 'PREM BILASH DEVKOTA', '3757', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3759, '3759', 'e10adc3949ba59abbe56e057f20f883e', 'KUL B. THAPA', '3759', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3760, '3760', 'e10adc3949ba59abbe56e057f20f883e', 'CHUDAMANI UPADHYAY', '3760', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3762, '3762', 'e10adc3949ba59abbe56e057f20f883e', 'ISWHOR GIRI', '3762', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3763, '3763', 'e10adc3949ba59abbe56e057f20f883e', 'AMBE K. SHAH', '3763', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3764, '3764', 'e10adc3949ba59abbe56e057f20f883e', 'MURALI P. CHAUDHARI', '3764', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3765, '3765', 'e10adc3949ba59abbe56e057f20f883e', 'JAGESHWAR P CHAUDHAR', '3765', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3766, '3766', 'e10adc3949ba59abbe56e057f20f883e', 'NARENDRA P.BISWAKARM', '3766', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3767, '3767', 'e10adc3949ba59abbe56e057f20f883e', 'PRASHANT B.SHRESTHA', '3767', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3768, '3768', 'e10adc3949ba59abbe56e057f20f883e', 'MUNDRIKA YADAV', '3768', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3769, '3769', 'e10adc3949ba59abbe56e057f20f883e', 'BISHWO R. SUBEDI', '3769', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3770, '3770', 'e10adc3949ba59abbe56e057f20f883e', 'THANESWOR PANTHI', '3770', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3771, '3771', 'e10adc3949ba59abbe56e057f20f883e', 'OM P. CHOUDHARI', '3771', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3772, '3772', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA P. KHANAL', '3772', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3773, '3773', 'e10adc3949ba59abbe56e057f20f883e', 'JEEVACHH JHA', '3773', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3774, '3774', 'e10adc3949ba59abbe56e057f20f883e', 'PANKAJ K.SRIBASTAV', '3774', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3775, '3775', 'e10adc3949ba59abbe56e057f20f883e', 'MOHAN L.P. PANJIYAR', '3775', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3776, '3776', 'e10adc3949ba59abbe56e057f20f883e', 'SALIL REGMI', '3776', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3778, '3778', 'e10adc3949ba59abbe56e057f20f883e', 'PURUSHOTAM KHADKA', '3778', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3779, '3779', 'e10adc3949ba59abbe56e057f20f883e', 'TAPESWORI PATHAK', '3779', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3780, '3780', 'e10adc3949ba59abbe56e057f20f883e', 'SURENDRA R. BANJADE', '3780', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3781, '3781', 'e10adc3949ba59abbe56e057f20f883e', 'DEVENDRANATH SHUKLA', '3781', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3782, '3782', 'e10adc3949ba59abbe56e057f20f883e', 'SHIBA C.L. KARNA', '3782', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3783, '3783', 'e10adc3949ba59abbe56e057f20f883e', 'RAM KHATIWADA', '3783', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3787, '3787', 'e10adc3949ba59abbe56e057f20f883e', 'PALAT ROY', '3787', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3788, '3788', 'e10adc3949ba59abbe56e057f20f883e', 'GHANSHYAM YADAV', '3788', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3789, '3789', 'e10adc3949ba59abbe56e057f20f883e', 'DIVESWOR M.SHRESTHA', '3789', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3790, '3790', 'e10adc3949ba59abbe56e057f20f883e', 'ANANDA K. TAMRAKAR', '3790', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3796, '3796', 'e10adc3949ba59abbe56e057f20f883e', 'DHANIKALA MITHUN', '3796', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3798, '3798', 'e10adc3949ba59abbe56e057f20f883e', 'REK B. ROKA', '3798', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3803, '3803', 'e10adc3949ba59abbe56e057f20f883e', 'HOM B. PUN', '3803', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3804, '3804', 'e10adc3949ba59abbe56e057f20f883e', 'TANKA B. ADHIKARI', '3804', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3810, '3810', 'e10adc3949ba59abbe56e057f20f883e', 'TARA P. UPADHYAY', '3810', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3811, '3811', 'e10adc3949ba59abbe56e057f20f883e', 'MAGANI K. CHAUDHARI', '3811', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3812, '3812', 'e10adc3949ba59abbe56e057f20f883e', 'SHANTA B. THAPA', '3812', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3813, '3813', 'e10adc3949ba59abbe56e057f20f883e', 'GOVIND P. SHARMA', '3813', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3815, '3815', 'e10adc3949ba59abbe56e057f20f883e', 'CHHABILAL BHATTARAI', '3815', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3816, '3816', 'e10adc3949ba59abbe56e057f20f883e', 'JEEVNATH DHAKAL', '3816', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3818, '3818', 'e10adc3949ba59abbe56e057f20f883e', 'GOPAL GIRI', '3818', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3819, '3819', 'e10adc3949ba59abbe56e057f20f883e', 'NUTAN RAJ RAI', '3819', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3820, '3820', 'e10adc3949ba59abbe56e057f20f883e', 'MADHAB R. GHIMIRE', '3820', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3821, '3821', 'e10adc3949ba59abbe56e057f20f883e', 'PUSHPARAJ SUBEDI', '3821', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3822, '3822', 'e10adc3949ba59abbe56e057f20f883e', 'ARUN K. SHAH', '3822', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3823, '3823', 'e10adc3949ba59abbe56e057f20f883e', 'PARAMANAND MISHRA', '3823', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3825, '3825', 'e10adc3949ba59abbe56e057f20f883e', 'GOVIND PAUDEL', '3825', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3826, '3826', 'e10adc3949ba59abbe56e057f20f883e', 'LELINDRA JUNG K.C.', '3826', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3828, '3828', 'e10adc3949ba59abbe56e057f20f883e', 'ARUN PANTHI', '3828', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3829, '3829', 'e10adc3949ba59abbe56e057f20f883e', 'ACHUT RAJ GNYAWALI', '3829', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3830, '3830', 'e10adc3949ba59abbe56e057f20f883e', 'KESHAB R. GHIMIRE', '3830', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3831, '3831', 'e10adc3949ba59abbe56e057f20f883e', 'NAGENDRA PARASAD', '3831', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3832, '3832', 'e10adc3949ba59abbe56e057f20f883e', 'TEK NARAYAN ACHARYA', '3832', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3833, '3833', 'e10adc3949ba59abbe56e057f20f883e', 'BINOD J. RANA', '3833', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3834, '3834', 'e10adc3949ba59abbe56e057f20f883e', 'PREM CHANDRA BARMA', '3834', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3836, '3836', 'e10adc3949ba59abbe56e057f20f883e', 'RAMJI P. DEVKOTA', '3836', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3837, '3837', 'e10adc3949ba59abbe56e057f20f883e', 'KHUSAL R. SUBEDI', '3837', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3838, '3838', 'e10adc3949ba59abbe56e057f20f883e', 'KULKESHAR ADHIKARI', '3838', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3839, '3839', 'e10adc3949ba59abbe56e057f20f883e', 'MANOHARI ACHARYA', '3839', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3840, '3840', 'e10adc3949ba59abbe56e057f20f883e', 'LABA K. SHARMA', '3840', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3841, '3841', 'e10adc3949ba59abbe56e057f20f883e', 'PHUL P. KAUDAL', '3841', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3842, '3842', 'e10adc3949ba59abbe56e057f20f883e', 'TAHIR ALI', '3842', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3844, '3844', 'e10adc3949ba59abbe56e057f20f883e', 'JAL KUMAR THAPA', '3844', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3845, '3845', 'e10adc3949ba59abbe56e057f20f883e', 'NAND GOPAL PANDEY', '3845', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3846, '3846', 'e10adc3949ba59abbe56e057f20f883e', 'MAHABUB ALI', '3846', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3847, '3847', 'c33e08960ce9b48254be80c5fe6a5bad', 'MUKUNDA K. BARMA', '3847', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3848, '3848', 'e10adc3949ba59abbe56e057f20f883e', 'MILAN REGMI', '3848', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3849, '3849', 'e10adc3949ba59abbe56e057f20f883e', 'BIDUR GHIMIRE', '3849', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3850, '3850', 'e10adc3949ba59abbe56e057f20f883e', 'RAJARAM YADAV', '3850', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3851, '3851', 'e10adc3949ba59abbe56e057f20f883e', 'PADAM P. GAUTAM', '3851', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3852, '3852', 'e10adc3949ba59abbe56e057f20f883e', 'BINDESOR YADAV', '3852', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3853, '3853', 'e10adc3949ba59abbe56e057f20f883e', 'BISHNU P. PANDE', '3853', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3854, '3854', 'e10adc3949ba59abbe56e057f20f883e', 'TIKARAM PANTA', '3854', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3855, '3855', 'e10adc3949ba59abbe56e057f20f883e', 'NETA BHUSAL', '3855', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3856, '3856', 'e10adc3949ba59abbe56e057f20f883e', 'BIMAL P. ADHIKARI', '3856', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3858, '3858', 'e10adc3949ba59abbe56e057f20f883e', 'BUDDI S. PANDE', '3858', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3860, '3860', 'e10adc3949ba59abbe56e057f20f883e', 'UMA SHANKAR P. GUPTA', '3860', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3861, '3861', 'e10adc3949ba59abbe56e057f20f883e', 'DHAN B. BUDHATHOKI', '3861', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3862, '3862', 'e10adc3949ba59abbe56e057f20f883e', 'KESHAB R. BARAL', '3862', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3863, '3863', 'e10adc3949ba59abbe56e057f20f883e', 'SHUBHA RAJ PAUDEL', '3863', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3865, '3865', 'e10adc3949ba59abbe56e057f20f883e', 'GOPAL P. GAIRE', '3865', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3866, '3866', 'e10adc3949ba59abbe56e057f20f883e', 'ABDUL B. MUSALMAN', '3866', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3867, '3867', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA K. CHAUHAN', '3867', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3869, '3869', 'e10adc3949ba59abbe56e057f20f883e', 'LAL B. CHAUDHARI', '3869', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3870, '3870', 'e10adc3949ba59abbe56e057f20f883e', 'TEKRAJ BHANDARI', '3870', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3871, '3871', 'e10adc3949ba59abbe56e057f20f883e', 'RAM DULAR YADAV', '3871', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3872, '3872', 'e10adc3949ba59abbe56e057f20f883e', 'HARISHCHANDRA BHATTA', '3872', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3874, '3874', 'e10adc3949ba59abbe56e057f20f883e', 'BISHNU H. RIMAL', '3874', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3879, '3879', 'e10adc3949ba59abbe56e057f20f883e', 'NARAYAN K. REGMI', '3879', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3880, '3880', 'e10adc3949ba59abbe56e057f20f883e', 'UTTAM KHANAL', '3880', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3882, '3882', 'e10adc3949ba59abbe56e057f20f883e', 'ARUN K. BHATTARAI', '3882', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3884, '3884', 'e10adc3949ba59abbe56e057f20f883e', 'SHAILAJA BASNET(K.C)', '3884', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3885, '3885', 'e10adc3949ba59abbe56e057f20f883e', 'JANARDAN POKHREL', '3885', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3887, '3887', 'e10adc3949ba59abbe56e057f20f883e', 'SHESH RAMAN ACHARYA', '3887', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3888, '3888', 'e10adc3949ba59abbe56e057f20f883e', 'DHARNIDHAR ADHIKARI', '3888', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3890, '3890', 'e10adc3949ba59abbe56e057f20f883e', 'DEVI B. KATUWAL', '3890', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3891, '3891', 'e10adc3949ba59abbe56e057f20f883e', 'DAMODAR P. DAHAL', '3891', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3892, '3892', 'e10adc3949ba59abbe56e057f20f883e', 'POSHRAJ BHATTARAI', '3892', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3893, '3893', 'e10adc3949ba59abbe56e057f20f883e', 'PITAMBAR BHANDARI', '3893', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3894, '3894', 'e10adc3949ba59abbe56e057f20f883e', 'NARAYAN SUNDAR SAKH', '3894', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3896, '3896', 'e10adc3949ba59abbe56e057f20f883e', 'BHUSHAN SHAKYA', '3896', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3900, '3900', 'e10adc3949ba59abbe56e057f20f883e', 'KABI P. PATHAK', '3900', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3903, '3903', 'e10adc3949ba59abbe56e057f20f883e', 'PURNA P. ACHARYA', '3903', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3904, '3904', 'e10adc3949ba59abbe56e057f20f883e', 'JAY BAHADUR CHHETRI', '3904', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3905, '3905', 'e10adc3949ba59abbe56e057f20f883e', 'PURUSHOTAM P.PAUDEL', '3905', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3906, '3906', 'e10adc3949ba59abbe56e057f20f883e', 'BHARAT R. GHIMIRE', '3906', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3907, '3907', 'e10adc3949ba59abbe56e057f20f883e', 'MADAN K. SHRESTHA', '3907', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3910, '3910', 'e10adc3949ba59abbe56e057f20f883e', 'DHRUBRAJ KHANAL', '3910', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3911, '3911', 'e10adc3949ba59abbe56e057f20f883e', 'SUSIL RIJAL', '3911', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3912, '3912', 'e10adc3949ba59abbe56e057f20f883e', 'JANARDAN MALLA', '3912', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3919, '3919', 'e10adc3949ba59abbe56e057f20f883e', 'MADHAB ADHIKARI', '3919', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3920, '3920', 'e10adc3949ba59abbe56e057f20f883e', 'NARESH K. ROKA', '3920', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3921, '3921', 'e10adc3949ba59abbe56e057f20f883e', 'BHUPENDRA N. SHARMA', '3921', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3922, '3922', 'e10adc3949ba59abbe56e057f20f883e', 'RAM JATAN MAHATO', '3922', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3925, '3925', 'e10adc3949ba59abbe56e057f20f883e', 'MOHAN P. OLI', '3925', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3926, '3926', 'e10adc3949ba59abbe56e057f20f883e', 'DILIP SINGH THAPA', '3926', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3928, '3928', 'e10adc3949ba59abbe56e057f20f883e', 'SHAMBHU B.  G.C.', '3928', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3929, '3929', 'e10adc3949ba59abbe56e057f20f883e', 'GANESH RAJ PANT', '3929', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3930, '3930', 'e10adc3949ba59abbe56e057f20f883e', 'PARASHMANI DHAKAL', '3930', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3931, '3931', 'e10adc3949ba59abbe56e057f20f883e', 'GURU P. LAMICHHANE', '3931', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3932, '3932', 'e10adc3949ba59abbe56e057f20f883e', 'SOM BILASH DEVKOTA', '3932', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3934, '3934', 'e10adc3949ba59abbe56e057f20f883e', 'GOVIND LAL KARNA', '3934', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3936, '3936', 'e10adc3949ba59abbe56e057f20f883e', 'SITAL C. PAUDEL', '3936', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3941, '3941', 'e10adc3949ba59abbe56e057f20f883e', 'GOVIND SHRESTHA', '3941', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3946, '3946', 'e10adc3949ba59abbe56e057f20f883e', 'KHILA N.DAHAL', '3946', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3948, '3948', 'e10adc3949ba59abbe56e057f20f883e', 'DAYARAM YADAV', '3948', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3949, '3949', 'e10adc3949ba59abbe56e057f20f883e', 'BHARAT K. PAUDEL', '3949', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3950, '3950', 'e10adc3949ba59abbe56e057f20f883e', 'DHRUBA YOGI', '3950', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3951, '3951', 'e10adc3949ba59abbe56e057f20f883e', 'BHAGAWAN BHATTARAI', '3951', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3952, '3952', 'e10adc3949ba59abbe56e057f20f883e', 'RAMESH P. NEUPANE', '3952', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3953, '3953', 'e10adc3949ba59abbe56e057f20f883e', 'BHAKTA B. GAIRHE', '3953', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3954, '3954', 'e10adc3949ba59abbe56e057f20f883e', 'CHANDRA N.SHRESTHA', '3954', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3955, '3955', 'e10adc3949ba59abbe56e057f20f883e', 'KAMAL T. SHAKYA', '3955', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3957, '3957', 'e10adc3949ba59abbe56e057f20f883e', 'DHRUBA B. KARKI', '3957', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3958, '3958', 'e10adc3949ba59abbe56e057f20f883e', 'INDRA P. PATHAK', '3958', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3960, '3960', 'e10adc3949ba59abbe56e057f20f883e', 'RAJ K. BANIYA', '3960', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3961, '3961', 'e10adc3949ba59abbe56e057f20f883e', 'JHHUMA DEVI ACHARYA', '3961', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3962, '3962', 'e10adc3949ba59abbe56e057f20f883e', 'YAM N. DHITAL', '3962', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3963, '3963', 'e10adc3949ba59abbe56e057f20f883e', 'GANESH B. K.C.', '3963', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3964, '3964', 'e10adc3949ba59abbe56e057f20f883e', 'ROBAR BDR.BUDHATHOKI', '3964', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3965, '3965', 'e10adc3949ba59abbe56e057f20f883e', 'AMAR K. SHRESTHA', '3965', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3966, '3966', 'e10adc3949ba59abbe56e057f20f883e', 'RAM CHANDRA BOGATI', '3966', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3970, '3970', 'e10adc3949ba59abbe56e057f20f883e', 'GANESH P. PANDEY', '3970', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3971, '3971', 'e10adc3949ba59abbe56e057f20f883e', 'RAJENDRA K. SHARMA', '3971', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3972, '3972', 'e10adc3949ba59abbe56e057f20f883e', 'DHRUB K. SHRESTHA', '3972', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3974, '3974', 'e10adc3949ba59abbe56e057f20f883e', 'ARJUN BUDHATHOKI', '3974', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3975, '3975', 'e10adc3949ba59abbe56e057f20f883e', 'UDAY RAM S. POUDEL', '3975', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3978, '3978', 'e10adc3949ba59abbe56e057f20f883e', 'DRON P. NEUPANE', '3978', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3979, '3979', 'e10adc3949ba59abbe56e057f20f883e', 'RATNA MANI PAUDEL', '3979', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3980, '3980', 'e10adc3949ba59abbe56e057f20f883e', 'MADAN P. SIGDEL', '3980', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3982, '3982', 'e10adc3949ba59abbe56e057f20f883e', 'KHEM R. BARAL', '3982', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3985, '3985', 'e10adc3949ba59abbe56e057f20f883e', 'PRABIN R. SATYAL', '3985', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3986, '3986', 'e10adc3949ba59abbe56e057f20f883e', 'MATRIKA P. ACHARYA', '3986', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3989, '3989', 'e10adc3949ba59abbe56e057f20f883e', 'MIN B. SAUD', '3989', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3991, '3991', 'e10adc3949ba59abbe56e057f20f883e', 'RAM P. POKHAREL', '3991', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3996, '3996', 'e10adc3949ba59abbe56e057f20f883e', 'MAHAMAD M. HUDIN', '3996', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(3998, '3998', 'e10adc3949ba59abbe56e057f20f883e', 'HARI MAN SHRESTHA', '3998', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4002, '4002', 'e10adc3949ba59abbe56e057f20f883e', 'YADAB P. POKHAREL', '4002', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4003, '4003', 'e10adc3949ba59abbe56e057f20f883e', 'RAJ DEV MAHATO SUDI', '4003', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4004, '4004', 'e10adc3949ba59abbe56e057f20f883e', 'PESHAL K. POKHREL', '4004', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4007, '4007', 'e10adc3949ba59abbe56e057f20f883e', 'PRITAM S. BHANDARI', '4007', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4008, '4008', 'e10adc3949ba59abbe56e057f20f883e', 'SUDHA SHARMA', '4008', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4009, '4009', 'e10adc3949ba59abbe56e057f20f883e', 'DIL RAJ JOSHI', '4009', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4010, '4010', 'e10adc3949ba59abbe56e057f20f883e', 'GANESH CHANDA', '4010', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4012, '4012', 'e10adc3949ba59abbe56e057f20f883e', 'KHADGA B. CHAND', '4012', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4013, '4013', 'e10adc3949ba59abbe56e057f20f883e', 'HARI DATTA PANTA', '4013', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4014, '4014', 'e10adc3949ba59abbe56e057f20f883e', 'LAXMAN ARYAL', '4014', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4015, '4015', 'e10adc3949ba59abbe56e057f20f883e', 'BHOJRAJ ARYAL', '4015', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4016, '4016', 'e10adc3949ba59abbe56e057f20f883e', 'KAMAL S. MAHAR', '4016', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4017, '4017', 'e10adc3949ba59abbe56e057f20f883e', 'SOHAN B. THAPA', '4017', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4018, '4018', 'e10adc3949ba59abbe56e057f20f883e', 'PURNAND  JOSHI', '4018', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4021, '4021', 'e10adc3949ba59abbe56e057f20f883e', 'HARKA B. DHAMI', '4021', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4022, '4022', 'e10adc3949ba59abbe56e057f20f883e', 'MUKUNDA R. PANTA', '4022', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4023, '4023', 'e10adc3949ba59abbe56e057f20f883e', 'KISAN S. DHAMI', '4023', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4024, '4024', 'e10adc3949ba59abbe56e057f20f883e', 'SURENDRA B. SINGH', '4024', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4025, '4025', 'e10adc3949ba59abbe56e057f20f883e', 'TEJ BAHADUR BHAT', '4025', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4026, '4026', 'e10adc3949ba59abbe56e057f20f883e', 'LALIT S. DHAMI', '4026', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4028, '4028', 'e10adc3949ba59abbe56e057f20f883e', 'GANESH PD. BHATTARAI', '4028', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4031, '4031', 'e10adc3949ba59abbe56e057f20f883e', 'BADRI BHANDARI', '4031', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4033, '4033', 'e10adc3949ba59abbe56e057f20f883e', 'DHANMAYA SWORNAKAR', '4033', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4035, '4035', 'e10adc3949ba59abbe56e057f20f883e', 'SATYA B. DASAUDI', '4035', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4037, '4037', 'e10adc3949ba59abbe56e057f20f883e', 'KAMAL P. BHATTRAI', '4037', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4038, '4038', 'e10adc3949ba59abbe56e057f20f883e', 'INDRA P. K.C.', '4038', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4039, '4039', 'e10adc3949ba59abbe56e057f20f883e', 'MAHESH D. LEKHAK', '4039', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4041, '4041', 'e10adc3949ba59abbe56e057f20f883e', 'AMBIKA P. DHAKAL', '4041', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4042, '4042', 'e10adc3949ba59abbe56e057f20f883e', 'SURYA B. KARKI', '4042', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4043, '4043', 'e10adc3949ba59abbe56e057f20f883e', 'BINOD K. PAUDEL', '4043', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4045, '4045', 'e10adc3949ba59abbe56e057f20f883e', 'BHIM P. OJHA', '4045', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4048, '4048', 'e10adc3949ba59abbe56e057f20f883e', 'BINOD K. RAUT', '4048', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4049, '4049', 'e10adc3949ba59abbe56e057f20f883e', 'KHUMLAL S. GHIMIRE', '4049', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4050, '4050', 'e10adc3949ba59abbe56e057f20f883e', 'MITRA LAL GAIHRE', '4050', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4051, '4051', 'e10adc3949ba59abbe56e057f20f883e', 'GANESH GIRI', '4051', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4052, '4052', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA P. POUDEL', '4052', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4054, '4054', 'e10adc3949ba59abbe56e057f20f883e', 'GOVIND RAJ PANTA', '4054', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4057, '4057', 'e10adc3949ba59abbe56e057f20f883e', 'BHOJENDRA PAUDEL', '4057', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4059, '4059', 'e10adc3949ba59abbe56e057f20f883e', 'DEVENDRA RAJ PANTA', '4059', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin');
INSERT INTO `tblextuser` (`user_id`, `logon_name`, `user_pass`, `user_name`, `staff_code`, `company_id`, `group_policy`, `start_date`, `end_date`, `status`, `input_date`, `inputter`, `authorizer`) VALUES
(4060, '4060', 'e10adc3949ba59abbe56e057f20f883e', 'MEGHA R. GYANWALI', '4060', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4062, '4062', 'e10adc3949ba59abbe56e057f20f883e', 'JUGRAM CHAUDHARAI', '4062', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4065, '4065', 'e10adc3949ba59abbe56e057f20f883e', 'RAJ K. POKHAREL', '4065', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4066, '4066', 'e10adc3949ba59abbe56e057f20f883e', 'RAM B.THADA MAGAR', '4066', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4067, '4067', 'e10adc3949ba59abbe56e057f20f883e', 'SAKAS NAYAK', '4067', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4068, '4068', 'e10adc3949ba59abbe56e057f20f883e', 'MINA GURUNG', '4068', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4069, '4069', 'e10adc3949ba59abbe56e057f20f883e', 'SUNIL K. KARKI', '4069', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4071, '4071', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA D. NEUPANE', '4071', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4072, '4072', 'e10adc3949ba59abbe56e057f20f883e', 'KIRAN B. PRADHANANGA', '4072', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4073, '4073', 'e10adc3949ba59abbe56e057f20f883e', 'DHAN BIR BUDHA', '4073', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4077, '4077', 'e10adc3949ba59abbe56e057f20f883e', 'NETRA B. KHTRI', '4077', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4079, '4079', 'e10adc3949ba59abbe56e057f20f883e', 'DIVYARAJ GYAWALI', '4079', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4080, '4080', 'e10adc3949ba59abbe56e057f20f883e', 'UMANANDA NEUPANE', '4080', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4081, '4081', 'e10adc3949ba59abbe56e057f20f883e', 'DHAN RAJ SHAHI', '4081', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4083, '4083', 'e10adc3949ba59abbe56e057f20f883e', 'HOM NATH SUBEDI', '4083', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4084, '4084', 'e10adc3949ba59abbe56e057f20f883e', 'RAM CHANDRA GYANWALI', '4084', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4085, '4085', 'e10adc3949ba59abbe56e057f20f883e', 'BRISH B. ROUT', '4085', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4086, '4086', 'e10adc3949ba59abbe56e057f20f883e', 'TARAKHAR ADHIKARI', '4086', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4088, '4088', 'e10adc3949ba59abbe56e057f20f883e', 'UJELI DEVI SHAHI', '4088', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4093, '4093', 'e10adc3949ba59abbe56e057f20f883e', 'GANESH P. KHATIWADA', '4093', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4095, '4095', 'e10adc3949ba59abbe56e057f20f883e', 'NANDRAJ KOIRALA', '4095', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4096, '4096', 'e10adc3949ba59abbe56e057f20f883e', 'EKA RAJ AHCARYA', '4096', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4097, '4097', 'e10adc3949ba59abbe56e057f20f883e', 'NARAYAN B. CHAND', '4097', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4099, '4099', 'e10adc3949ba59abbe56e057f20f883e', 'BISHNU P. GAUTAM', '4099', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4101, '4101', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA B. BASNET', '4101', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4103, '4103', 'e10adc3949ba59abbe56e057f20f883e', 'HOT RAJ TRIPATHI', '4103', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4105, '4105', 'e10adc3949ba59abbe56e057f20f883e', 'SANJIB K.SHRESTHA', '4105', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4106, '4106', 'e10adc3949ba59abbe56e057f20f883e', 'PRAMOD SINGH PAHARI', '4106', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4107, '4107', 'e10adc3949ba59abbe56e057f20f883e', 'BISHNU B.DAHI(SHRES)', '4107', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4112, '4112', 'e10adc3949ba59abbe56e057f20f883e', 'PADAM B. RANA BHAT', '4112', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4114, '4114', 'e10adc3949ba59abbe56e057f20f883e', 'MAHADEV BHAGAT', '4114', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4115, '4115', 'e10adc3949ba59abbe56e057f20f883e', 'MADHAB P. DAHAL', '4115', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4117, '4117', 'e10adc3949ba59abbe56e057f20f883e', 'ANANTA P. SHAH', '4117', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4119, '4119', 'e10adc3949ba59abbe56e057f20f883e', 'KEDAR N. ARJEL', '4119', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4121, '4121', 'e10adc3949ba59abbe56e057f20f883e', 'SHALIGRAM S.MARASINI', '4121', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4122, '4122', 'e10adc3949ba59abbe56e057f20f883e', 'CHET N. KHANAL', '4122', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4123, '4123', 'e10adc3949ba59abbe56e057f20f883e', 'KESHAB R. PANTA', '4123', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4125, '4125', 'e10adc3949ba59abbe56e057f20f883e', 'GOPAL REGMI', '4125', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4126, '4126', 'e10adc3949ba59abbe56e057f20f883e', 'SANAT K. POKHAREL', '4126', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4127, '4127', 'e10adc3949ba59abbe56e057f20f883e', 'RAJENDRA B. BAM', '4127', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4129, '4129', 'e10adc3949ba59abbe56e057f20f883e', 'RAMCHANDRA PATHAK', '4129', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4130, '4130', 'e10adc3949ba59abbe56e057f20f883e', 'KASHI RAJ ACHARYA', '4130', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4132, '4132', 'e10adc3949ba59abbe56e057f20f883e', 'MINA KOIRALA', '4132', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4134, '4134', 'e10adc3949ba59abbe56e057f20f883e', 'OM PRASAD GAUDEL', '4134', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4139, '4139', 'e10adc3949ba59abbe56e057f20f883e', 'BANSI RAJ JOSHI', '4139', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4140, '4140', 'e10adc3949ba59abbe56e057f20f883e', 'DEV DATTA OJHA', '4140', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4141, '4141', 'e10adc3949ba59abbe56e057f20f883e', 'CHANCHAL RAJBHANDARI', '4141', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4142, '4142', 'e10adc3949ba59abbe56e057f20f883e', 'PRAKASH MALLA', '4142', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4143, '4143', 'e10adc3949ba59abbe56e057f20f883e', 'BISWO NATH PAUDEL', '4143', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4147, '4147', 'e10adc3949ba59abbe56e057f20f883e', 'DINESH K. THAPA', '4147', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4148, '4148', 'e10adc3949ba59abbe56e057f20f883e', 'JAMUNA BELBASE', '4148', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4150, '4150', 'e10adc3949ba59abbe56e057f20f883e', 'MAN B. NEPALI', '4150', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4152, '4152', 'e10adc3949ba59abbe56e057f20f883e', 'BHAICHA MAHARJAN', '4152', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4155, '4155', 'e10adc3949ba59abbe56e057f20f883e', 'DAMBBAR D. JOSHI', '4155', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4156, '4156', 'e10adc3949ba59abbe56e057f20f883e', 'TIKA S. BISTA', '4156', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4162, '4162', 'e10adc3949ba59abbe56e057f20f883e', 'NAR B. RAI', '4162', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4164, '4164', 'e10adc3949ba59abbe56e057f20f883e', 'NARAYAN P. CHAULAGAI', '4164', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4167, '4167', 'e10adc3949ba59abbe56e057f20f883e', 'TARA CHANDRA PAUDEL', '4167', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4168, '4168', 'e10adc3949ba59abbe56e057f20f883e', 'BHIM B.KHATRI K.C.', '4168', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4169, '4169', 'e10adc3949ba59abbe56e057f20f883e', 'PHURNAM GAL SHERPA', '4169', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4170, '4170', 'e10adc3949ba59abbe56e057f20f883e', 'CHANDRA K. MAHATO', '4170', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4171, '4171', 'e10adc3949ba59abbe56e057f20f883e', 'KANTA B. BANIYA', '4171', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4172, '4172', 'e10adc3949ba59abbe56e057f20f883e', 'SHRAWAN KUMAR SINGH', '4172', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4173, '4173', 'e10adc3949ba59abbe56e057f20f883e', 'BISWO N. SHAH', '4173', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4174, '4174', 'e10adc3949ba59abbe56e057f20f883e', 'INDRA N. YADAV', '4174', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4175, '4175', 'e10adc3949ba59abbe56e057f20f883e', 'RAM AUTAR YADAV', '4175', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4176, '4176', 'e10adc3949ba59abbe56e057f20f883e', 'RAM B. BHATTARAI', '4176', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4177, '4177', 'e10adc3949ba59abbe56e057f20f883e', 'RATNA B. OJHA', '4177', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4178, '4178', 'e10adc3949ba59abbe56e057f20f883e', 'AMBA RAJ MISHRA', '4178', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4179, '4179', 'e10adc3949ba59abbe56e057f20f883e', 'EKA LAL ROKKA', '4179', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4181, '4181', 'e10adc3949ba59abbe56e057f20f883e', 'SHRIDHAR UPADHAYA', '4181', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4184, '4184', 'e10adc3949ba59abbe56e057f20f883e', 'AJUDDA B. ADHIKARI', '4184', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4186, '4186', 'e10adc3949ba59abbe56e057f20f883e', 'RAM BRIKSH MANDAL', '4186', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4187, '4187', 'e10adc3949ba59abbe56e057f20f883e', 'RAJ K. YADAV', '4187', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4188, '4188', 'e10adc3949ba59abbe56e057f20f883e', 'GOKUL RAJ GIRI', '4188', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4189, '4189', 'e10adc3949ba59abbe56e057f20f883e', 'SHREE KANT L.SHAH', '4189', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4190, '4190', 'e10adc3949ba59abbe56e057f20f883e', 'BHARAT R. ACHARYA', '4190', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4191, '4191', 'e10adc3949ba59abbe56e057f20f883e', 'PANKHA B. SHAHI', '4191', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4192, '4192', 'e10adc3949ba59abbe56e057f20f883e', 'HIRA B. BUDHA', '4192', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4193, '4193', 'e10adc3949ba59abbe56e057f20f883e', 'BED P. ACHARYA', '4193', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4194, '4194', 'e10adc3949ba59abbe56e057f20f883e', 'SHAMBHU P. YADAV', '4194', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4195, '4195', 'e10adc3949ba59abbe56e057f20f883e', 'GAGAN B. BUDA', '4195', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4196, '4196', 'e10adc3949ba59abbe56e057f20f883e', 'DIL B. SHAHI', '4196', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4197, '4197', 'e10adc3949ba59abbe56e057f20f883e', 'BHAKTA B. RAWAL', '4197', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4198, '4198', 'e10adc3949ba59abbe56e057f20f883e', 'SHAILENDRA P.GHIMIRE', '4198', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4199, '4199', 'e10adc3949ba59abbe56e057f20f883e', 'JAYA BIR SHAHI', '4199', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4200, '4200', 'e10adc3949ba59abbe56e057f20f883e', 'MANRUP  SHAHI', '4200', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4201, '4201', 'e10adc3949ba59abbe56e057f20f883e', 'DAHAN LAL CHAUDHARI', '4201', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4202, '4202', 'e10adc3949ba59abbe56e057f20f883e', 'GOPI YADAV', '4202', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4203, '4203', 'e10adc3949ba59abbe56e057f20f883e', 'BHUPDHOJ KARKI', '4203', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4204, '4204', 'e10adc3949ba59abbe56e057f20f883e', 'RABILAL KHATRI', '4204', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4205, '4205', 'e10adc3949ba59abbe56e057f20f883e', 'JAGAT B. ROKAYA', '4205', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4206, '4206', 'e10adc3949ba59abbe56e057f20f883e', 'GANESH B. TAMANG', '4206', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4211, '4211', 'e10adc3949ba59abbe56e057f20f883e', 'BINOD K. SHRESTHA', '4211', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4212, '4212', 'e10adc3949ba59abbe56e057f20f883e', 'PRASHIDDA K.S.SUWAL', '4212', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4216, '4216', 'e10adc3949ba59abbe56e057f20f883e', 'SHANTA K. ARYAL', '4216', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4217, '4217', 'e10adc3949ba59abbe56e057f20f883e', 'SABITA MALLA', '4217', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4219, '4219', 'e10adc3949ba59abbe56e057f20f883e', 'KHUMA BHANDARI', '4219', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4220, '4220', 'e10adc3949ba59abbe56e057f20f883e', 'SUNITA SHRESTHA', '4220', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4222, '4222', 'e10adc3949ba59abbe56e057f20f883e', 'UDDHAV P. SHARMA', '4222', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4223, '4223', 'e10adc3949ba59abbe56e057f20f883e', 'BHAIKAJI TRIPATHI', '4223', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4224, '4224', 'e10adc3949ba59abbe56e057f20f883e', 'BHARAT B. BASNET', '4224', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4226, '4226', 'e10adc3949ba59abbe56e057f20f883e', 'RAJENDRA THAKUR', '4226', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4228, '4228', 'e10adc3949ba59abbe56e057f20f883e', 'RAM B. PAUDEL', '4228', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4229, '4229', 'e10adc3949ba59abbe56e057f20f883e', 'CHANDRADEV KARKI', '4229', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4230, '4230', 'e10adc3949ba59abbe56e057f20f883e', 'HARI B. PAUDYAL', '4230', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4231, '4231', 'e10adc3949ba59abbe56e057f20f883e', 'SAN DIPAN BISTA', '4231', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4233, '4233', 'e10adc3949ba59abbe56e057f20f883e', 'DUK NARAYAN POKHREL', '4233', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4234, '4234', 'e10adc3949ba59abbe56e057f20f883e', 'BHESH R. KHANAL', '4234', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4235, '4235', 'e10adc3949ba59abbe56e057f20f883e', 'ARJUN P. BURLAKOTI', '4235', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4237, '4237', 'e10adc3949ba59abbe56e057f20f883e', 'DESH BANDHU GHIMIRE', '4237', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4238, '4238', 'e10adc3949ba59abbe56e057f20f883e', 'MOHAMAD NASARUL', '4238', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4241, '4241', 'e10adc3949ba59abbe56e057f20f883e', 'LAL P. BHUSHAL', '4241', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4242, '4242', 'e10adc3949ba59abbe56e057f20f883e', 'HARI P. PANDIT', '4242', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4244, '4244', 'e10adc3949ba59abbe56e057f20f883e', 'MAKHAN L. SHRESTHA', '4244', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4245, '4245', 'e10adc3949ba59abbe56e057f20f883e', 'RAJENDRA PAUDEL', '4245', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4247, '4247', 'e10adc3949ba59abbe56e057f20f883e', 'DALU GIRI SANYASI', '4247', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4248, '4248', 'e10adc3949ba59abbe56e057f20f883e', 'DEV RAJ CHAULAGAI', '4248', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4250, '4250', 'e10adc3949ba59abbe56e057f20f883e', 'BABU R. TIWARI', '4250', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4251, '4251', 'e10adc3949ba59abbe56e057f20f883e', 'SANJIB PAUDEL', '4251', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4252, '4252', 'e10adc3949ba59abbe56e057f20f883e', 'PRAKASH C. DEVKOTA', '4252', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4253, '4253', 'e10adc3949ba59abbe56e057f20f883e', 'SUBODH JHA', '4253', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4254, '4254', 'e10adc3949ba59abbe56e057f20f883e', 'BINOD C. MARAHATTHA', '4254', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4255, '4255', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA P. SHARMA', '4255', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4256, '4256', 'e10adc3949ba59abbe56e057f20f883e', 'BABU R. BHANDARI', '4256', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4258, '4258', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA H. PAPANE', '4258', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4259, '4259', 'e10adc3949ba59abbe56e057f20f883e', 'UPENDRA SHAH', '4259', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4264, '4264', 'e10adc3949ba59abbe56e057f20f883e', 'RAJAN P. SHRESTHA', '4264', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4266, '4266', 'e10adc3949ba59abbe56e057f20f883e', 'SUBODH P. GAUTAM', '4266', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4270, '4270', 'e10adc3949ba59abbe56e057f20f883e', 'BABU R. POUDEL', '4270', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4272, '4272', 'e10adc3949ba59abbe56e057f20f883e', 'HIM P. BANJARA', '4272', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4274, '4274', 'e10adc3949ba59abbe56e057f20f883e', 'KISHORI YADAV', '4274', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4275, '4275', 'e10adc3949ba59abbe56e057f20f883e', 'MOHDATTA S. PAUDEL', '4275', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4276, '4276', 'e10adc3949ba59abbe56e057f20f883e', 'BHIM P. POKHREL', '4276', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4277, '4277', 'e10adc3949ba59abbe56e057f20f883e', 'DURGA P. ACHARYA', '4277', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4278, '4278', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA B. BOGATI', '4278', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4281, '4281', 'e10adc3949ba59abbe56e057f20f883e', 'CHIJ K.MITRA JOSHI', '4281', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4282, '4282', 'e10adc3949ba59abbe56e057f20f883e', 'CHOB NATH SUBEDI', '4282', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4283, '4283', 'e10adc3949ba59abbe56e057f20f883e', 'GOVIND B. BANIYA', '4283', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4286, '4286', 'e10adc3949ba59abbe56e057f20f883e', 'SURENDRA K. ARYAL', '4286', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4289, '4289', 'e10adc3949ba59abbe56e057f20f883e', 'KHADGA K. GIRI', '4289', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4290, '4290', 'e10adc3949ba59abbe56e057f20f883e', 'PRABHAT K. ACHARYA', '4290', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4291, '4291', 'e10adc3949ba59abbe56e057f20f883e', 'RAMESH C. DEVKOTA', '4291', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4292, '4292', 'e10adc3949ba59abbe56e057f20f883e', 'NARAYAN P. SHARMA', '4292', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4293, '4293', 'e10adc3949ba59abbe56e057f20f883e', 'DEL N. POUDEL', '4293', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4294, '4294', 'e10adc3949ba59abbe56e057f20f883e', 'JAGAT B. KHADAKA', '4294', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4295, '4295', 'e10adc3949ba59abbe56e057f20f883e', 'KAMAL K. SHAH', '4295', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4296, '4296', 'e10adc3949ba59abbe56e057f20f883e', 'DILLI P. DHUNGEL', '4296', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4297, '4297', 'e10adc3949ba59abbe56e057f20f883e', 'DEEPAK B. NEPAL', '4297', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4298, '4298', 'e10adc3949ba59abbe56e057f20f883e', 'SAGAR NATH KHAREL', '4298', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4299, '4299', 'e10adc3949ba59abbe56e057f20f883e', 'KUL P. SHARMA', '4299', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4300, '4300', 'e10adc3949ba59abbe56e057f20f883e', 'ACHUT P. DHUNGANA', '4300', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4301, '4301', 'e10adc3949ba59abbe56e057f20f883e', 'BINOD REGMI', '4301', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4302, '4302', 'e10adc3949ba59abbe56e057f20f883e', 'CHHABI R. NIROULA', '4302', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4303, '4303', 'e10adc3949ba59abbe56e057f20f883e', 'GOVINDA P. ACHARYA', '4303', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4304, '4304', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA B.LAMICHHANE', '4304', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4305, '4305', 'e10adc3949ba59abbe56e057f20f883e', 'HIRAMANI ACHARYA', '4305', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4306, '4306', 'e10adc3949ba59abbe56e057f20f883e', 'BIRENDRA P. GOURO', '4306', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4307, '4307', 'e10adc3949ba59abbe56e057f20f883e', 'GANESH M. KOJU', '4307', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4308, '4308', 'e10adc3949ba59abbe56e057f20f883e', 'HARIRAM REGMI', '4308', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4309, '4309', 'e10adc3949ba59abbe56e057f20f883e', 'CHETNATH  KHATIWADA', '4309', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4310, '4310', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA L. BHANDARI', '4310', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4311, '4311', 'e10adc3949ba59abbe56e057f20f883e', 'YOGENDRA P. SHAH', '4311', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4312, '4312', 'e10adc3949ba59abbe56e057f20f883e', 'PADMABATI PAUDEL', '4312', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4313, '4313', 'e10adc3949ba59abbe56e057f20f883e', 'NARENDRA BISTA', '4313', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4314, '4314', 'e10adc3949ba59abbe56e057f20f883e', 'AMAR B. SHRESTHA', '4314', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4316, '4316', 'e10adc3949ba59abbe56e057f20f883e', 'PURUSHOTAM DEUJA', '4316', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4318, '4318', 'e10adc3949ba59abbe56e057f20f883e', 'GANGA R. SAPKOTA', '4318', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4319, '4319', 'e10adc3949ba59abbe56e057f20f883e', 'PRATAP KUMAR MALLA', '4319', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4320, '4320', 'e10adc3949ba59abbe56e057f20f883e', 'CHANDESHOR P. PATEL', '4320', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4321, '4321', 'e10adc3949ba59abbe56e057f20f883e', 'KESHAB C. ARYAL', '4321', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4323, '4323', 'e10adc3949ba59abbe56e057f20f883e', 'BIBEKA N. PRATIHASTA', '4323', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4325, '4325', 'e10adc3949ba59abbe56e057f20f883e', 'SHREE DHAR DUWADI', '4325', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4326, '4326', 'e10adc3949ba59abbe56e057f20f883e', 'LOK NATH PAUDEL', '4326', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4327, '4327', 'e10adc3949ba59abbe56e057f20f883e', 'CHAKRA P. SHARMA', '4327', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4328, '4328', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA P. PANDIT', '4328', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4329, '4329', 'e10adc3949ba59abbe56e057f20f883e', 'SHREE DHAR MISHRA', '4329', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4331, '4331', 'e10adc3949ba59abbe56e057f20f883e', 'SARALA U. NEPAL', '4331', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4332, '4332', 'e10adc3949ba59abbe56e057f20f883e', 'RAMESWOR PARAJULI', '4332', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4333, '4333', 'e10adc3949ba59abbe56e057f20f883e', 'SURESH RATNA STHAPIT', '4333', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4334, '4334', 'e10adc3949ba59abbe56e057f20f883e', 'NARAYAN P. BHANDARI', '4334', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4335, '4335', 'e10adc3949ba59abbe56e057f20f883e', 'KEDAR N. BARAL', '4335', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4337, '4337', 'e10adc3949ba59abbe56e057f20f883e', 'CHHABI L. PATHAK', '4337', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4338, '4338', 'e10adc3949ba59abbe56e057f20f883e', 'BINOD DHUNGANA', '4338', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4339, '4339', 'e10adc3949ba59abbe56e057f20f883e', 'MOHAN P. SUBEDI', '4339', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4341, '4341', 'e10adc3949ba59abbe56e057f20f883e', 'MIN P. GYANWALI', '4341', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4343, '4343', 'e10adc3949ba59abbe56e057f20f883e', 'TULSI R. BASYAL', '4343', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4344, '4344', 'e10adc3949ba59abbe56e057f20f883e', 'DUKUL R. GHIMIRE', '4344', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4345, '4345', 'e10adc3949ba59abbe56e057f20f883e', 'YUBARAJ KAFLE', '4345', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4346, '4346', 'e10adc3949ba59abbe56e057f20f883e', 'KARNA B. A.C.', '4346', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4347, '4347', 'e10adc3949ba59abbe56e057f20f883e', 'MUKUNDA H. GYANWALI', '4347', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4348, '4348', 'e10adc3949ba59abbe56e057f20f883e', 'ISHORI GHIMIRE', '4348', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4349, '4349', 'e10adc3949ba59abbe56e057f20f883e', 'RAJENDRA P. GAUTAM', '4349', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4350, '4350', 'e10adc3949ba59abbe56e057f20f883e', 'RAM B. GURUNG', '4350', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4353, '4353', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA P. ACHARYA', '4353', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4355, '4355', 'e10adc3949ba59abbe56e057f20f883e', 'PADAM NATH SHARMA', '4355', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4356, '4356', 'e10adc3949ba59abbe56e057f20f883e', 'BUDDHASAGAR NAPIT', '4356', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4357, '4357', 'e10adc3949ba59abbe56e057f20f883e', 'BISHNU P. PANTA', '4357', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4358, '4358', 'e10adc3949ba59abbe56e057f20f883e', 'TEK N. SHRESTHA', '4358', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4365, '4365', 'e10adc3949ba59abbe56e057f20f883e', 'EKA B. BASNET', '4365', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4368, '4368', 'e10adc3949ba59abbe56e057f20f883e', 'CHHEDI CHAUDHARI', '4368', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4369, '4369', 'e10adc3949ba59abbe56e057f20f883e', 'LOK B. BANIYA', '4369', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4371, '4371', 'e10adc3949ba59abbe56e057f20f883e', 'TARA P. BHANDARI', '4371', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4372, '4372', 'e10adc3949ba59abbe56e057f20f883e', 'PADMA RAJ SILWAL', '4372', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4373, '4373', 'e10adc3949ba59abbe56e057f20f883e', 'KAMAL NEUPANE', '4373', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4376, '4376', 'e10adc3949ba59abbe56e057f20f883e', 'GHANASHYAM RIMAL', '4376', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4377, '4377', 'e10adc3949ba59abbe56e057f20f883e', 'DOLINDRA B. KUNWAR', '4377', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4378, '4378', 'e10adc3949ba59abbe56e057f20f883e', 'TIKARAM GAUTAM', '4378', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4379, '4379', 'e10adc3949ba59abbe56e057f20f883e', 'SARASWOTI BHANDARI', '4379', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4380, '4380', 'e10adc3949ba59abbe56e057f20f883e', 'KHIB LAL ADHIKARI', '4380', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4381, '4381', 'e10adc3949ba59abbe56e057f20f883e', 'CHHATRA RAI', '4381', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4382, '4382', 'e10adc3949ba59abbe56e057f20f883e', 'RAJAN P. BADAL', '4382', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4383, '4383', 'e10adc3949ba59abbe56e057f20f883e', 'BISHNU P. GHIMIRE', '4383', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4384, '4384', 'e10adc3949ba59abbe56e057f20f883e', 'LEKH N. KAFLE', '4384', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4385, '4385', 'e10adc3949ba59abbe56e057f20f883e', 'CHUDAMANI SUBEDI', '4385', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4386, '4386', 'e10adc3949ba59abbe56e057f20f883e', 'SITA K. DAHAL', '4386', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4387, '4387', 'e10adc3949ba59abbe56e057f20f883e', 'SHYAM K. BHANDARI', '4387', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4388, '4388', 'e10adc3949ba59abbe56e057f20f883e', 'JEEVRAJ NEPAL', '4388', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4389, '4389', 'e10adc3949ba59abbe56e057f20f883e', 'LEKH N. BHATTARAI', '4389', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4390, '4390', 'e10adc3949ba59abbe56e057f20f883e', 'MOHAN P. SHRESTHA', '4390', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4391, '4391', 'e10adc3949ba59abbe56e057f20f883e', 'TEJ P. ACHARYA', '4391', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4392, '4392', 'e10adc3949ba59abbe56e057f20f883e', 'MITRA B. BISTA', '4392', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4393, '4393', 'e10adc3949ba59abbe56e057f20f883e', 'PADAM B. THAPA', '4393', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4394, '4394', 'e10adc3949ba59abbe56e057f20f883e', 'KATAK B. KHADKA', '4394', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4396, '4396', 'e10adc3949ba59abbe56e057f20f883e', 'PURUSHOTAM P.ACHARYA', '4396', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4397, '4397', 'e10adc3949ba59abbe56e057f20f883e', 'KUMAR P. KHATIWADA', '4397', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4398, '4398', 'e10adc3949ba59abbe56e057f20f883e', 'PREMHARI DHUNGEL', '4398', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4399, '4399', 'e10adc3949ba59abbe56e057f20f883e', 'TEJRAJ KATUWAL', '4399', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4400, '4400', 'e10adc3949ba59abbe56e057f20f883e', 'MOHAN K. KHATIWODA', '4400', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4401, '4401', 'e10adc3949ba59abbe56e057f20f883e', 'MANOJ K. BHATTARAI', '4401', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4402, '4402', 'e10adc3949ba59abbe56e057f20f883e', 'SUNIL K. PAUDEL', '4402', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4403, '4403', 'e10adc3949ba59abbe56e057f20f883e', 'BALKRISHNA RUPAKHETI', '4403', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4404, '4404', 'e10adc3949ba59abbe56e057f20f883e', 'GHANASHYAM SHARMA', '4404', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4405, '4405', 'e10adc3949ba59abbe56e057f20f883e', 'SHANKAR TIMILSINA', '4405', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4406, '4406', 'e10adc3949ba59abbe56e057f20f883e', 'MOHAN P. BHANDARI', '4406', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4407, '4407', 'e10adc3949ba59abbe56e057f20f883e', 'MEGHA R. GAUTAM', '4407', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4411, '4411', 'e10adc3949ba59abbe56e057f20f883e', 'SANTA B. SHRESTHA', '4411', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4413, '4413', 'e10adc3949ba59abbe56e057f20f883e', 'PRAMOD BABU TIWARI', '4413', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4414, '4414', 'e10adc3949ba59abbe56e057f20f883e', 'AVI RULHA KHAN', '4414', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4415, '4415', 'e10adc3949ba59abbe56e057f20f883e', 'BHIM B. SUNUWAR', '4415', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4418, '4418', 'e10adc3949ba59abbe56e057f20f883e', 'DEEPENDRA K. AIER', '4418', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4419, '4419', 'e10adc3949ba59abbe56e057f20f883e', 'BHARAT P. KAFLE', '4419', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4420, '4420', 'e10adc3949ba59abbe56e057f20f883e', 'RITA K.KOIRALA', '4420', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4423, '4423', 'e10adc3949ba59abbe56e057f20f883e', 'PURUSHOTAM P. REGMI', '4423', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4427, '4427', 'e10adc3949ba59abbe56e057f20f883e', 'SATYA N. PRAJAPATI', '4427', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4428, '4428', 'e10adc3949ba59abbe56e057f20f883e', 'TIRTHA RAJ NEPAL', '4428', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4429, '4429', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA P. PRASAIN', '4429', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4432, '4432', 'e10adc3949ba59abbe56e057f20f883e', 'LOK NATH MUDABARI', '4432', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4433, '4433', 'e10adc3949ba59abbe56e057f20f883e', 'ANABIR THAPA(SOME)', '4433', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4434, '4434', 'e10adc3949ba59abbe56e057f20f883e', 'PHURINMA SHERPA', '4434', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4435, '4435', 'e10adc3949ba59abbe56e057f20f883e', 'HARKA B. L. KHADKA', '4435', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4436, '4436', 'e10adc3949ba59abbe56e057f20f883e', 'ARJUN KHADAKA', '4436', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4437, '4437', 'e10adc3949ba59abbe56e057f20f883e', 'NABARAJ KARKI', '4437', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4440, '4440', 'e10adc3949ba59abbe56e057f20f883e', 'AMRIT RAI', '4440', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4441, '4441', 'e10adc3949ba59abbe56e057f20f883e', 'NAGESHWOR CHAUDHARI', '4441', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4442, '4442', 'e10adc3949ba59abbe56e057f20f883e', 'BHAKTA B. DANUWAR', '4442', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4443, '4443', 'e10adc3949ba59abbe56e057f20f883e', 'SURENDRA K.CHAUDHARI', '4443', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4444, '4444', 'e10adc3949ba59abbe56e057f20f883e', 'DILLI P. CHAUDHARY', '4444', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4445, '4445', 'e10adc3949ba59abbe56e057f20f883e', 'GOPI N. ACHARYA', '4445', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4446, '4446', 'e10adc3949ba59abbe56e057f20f883e', 'GAUTAM B. NAGARKOTI', '4446', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4449, '4449', 'e10adc3949ba59abbe56e057f20f883e', 'SHARADA KHATI', '4449', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4450, '4450', 'e10adc3949ba59abbe56e057f20f883e', 'ACHUT P. ADHIKARI', '4450', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4451, '4451', 'e10adc3949ba59abbe56e057f20f883e', 'SHARAN B. K.C.', '4451', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4452, '4452', 'e10adc3949ba59abbe56e057f20f883e', 'AMBAR B. PUDASAINE', '4452', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4453, '4453', 'e10adc3949ba59abbe56e057f20f883e', 'NARAYAN P. DHAKAL', '4453', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4454, '4454', 'e10adc3949ba59abbe56e057f20f883e', 'DHALENDRA B. KUNWAR', '4454', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4455, '4455', 'e10adc3949ba59abbe56e057f20f883e', 'SHIBA P. UPRETI', '4455', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4457, '4457', 'e10adc3949ba59abbe56e057f20f883e', 'KAMAL P. POUDEL', '4457', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4458, '4458', 'e10adc3949ba59abbe56e057f20f883e', 'BISHNU P. KOIRALA', '4458', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4459, '4459', 'e10adc3949ba59abbe56e057f20f883e', 'GANESH K. SHRESTHA', '4459', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4460, '4460', 'e10adc3949ba59abbe56e057f20f883e', 'DURGA BHAKTA DHAKAL', '4460', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4465, '4465', 'e10adc3949ba59abbe56e057f20f883e', 'DHANUSHDHARI MAHATO', '4465', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4468, '4468', 'e10adc3949ba59abbe56e057f20f883e', 'SHYAM DEV AHIR', '4468', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4469, '4469', 'e10adc3949ba59abbe56e057f20f883e', 'PREM B. BASNET', '4469', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4471, '4471', 'e10adc3949ba59abbe56e057f20f883e', 'DHAKA R. KHANAL', '4471', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4472, '4472', 'e10adc3949ba59abbe56e057f20f883e', 'NATHU THARU', '4472', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4473, '4473', 'e10adc3949ba59abbe56e057f20f883e', 'DASHRATHA KAHAR', '4473', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4474, '4474', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA P. ARYAL', '4474', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4475, '4475', 'e10adc3949ba59abbe56e057f20f883e', 'KESHAV P. BADAL', '4475', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4476, '4476', 'e10adc3949ba59abbe56e057f20f883e', 'LILA B. ADHIKARI', '4476', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4477, '4477', 'e10adc3949ba59abbe56e057f20f883e', 'SANTOSH K. MISHRA', '4477', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4478, '4478', 'e10adc3949ba59abbe56e057f20f883e', 'OM P. BHATTARAI', '4478', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4479, '4479', 'e10adc3949ba59abbe56e057f20f883e', 'JAY N. SHRESTHA', '4479', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4483, '4483', 'e10adc3949ba59abbe56e057f20f883e', 'RAJENDRA K. K.C.', '4483', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4484, '4484', 'e10adc3949ba59abbe56e057f20f883e', 'SHASHI ADHIKARI', '4484', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4485, '4485', 'e10adc3949ba59abbe56e057f20f883e', 'ARJUN BHATTARAI', '4485', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4487, '4487', 'e10adc3949ba59abbe56e057f20f883e', 'JOHN BAHADUR BASNET', '4487', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4488, '4488', 'e10adc3949ba59abbe56e057f20f883e', 'BIMAL K. BHATTARAI', '4488', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4491, '4491', 'e10adc3949ba59abbe56e057f20f883e', 'MITHILA DHUNGANA', '4491', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4494, '4494', 'e10adc3949ba59abbe56e057f20f883e', 'RAJANI SHRESTHA', '4494', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4498, '4498', 'e10adc3949ba59abbe56e057f20f883e', 'MANJU SUBEDI SHARMA', '4498', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin');
INSERT INTO `tblextuser` (`user_id`, `logon_name`, `user_pass`, `user_name`, `staff_code`, `company_id`, `group_policy`, `start_date`, `end_date`, `status`, `input_date`, `inputter`, `authorizer`) VALUES
(4501, '4501', 'e10adc3949ba59abbe56e057f20f883e', 'ROM NATH NIRAULA', '4501', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4502, '4502', 'e10adc3949ba59abbe56e057f20f883e', 'KUMAR S. ACHARYA', '4502', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4503, '4503', 'e10adc3949ba59abbe56e057f20f883e', 'BASHU D. PANTA', '4503', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4505, '4505', 'e10adc3949ba59abbe56e057f20f883e', 'RAM CHANDRA ACHARYA', '4505', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4506, '4506', 'e10adc3949ba59abbe56e057f20f883e', 'DILIP K. SHRESTHA', '4506', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4508, '4508', 'e10adc3949ba59abbe56e057f20f883e', 'ARUN K. DHUNGANA', '4508', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4509, '4509', 'e10adc3949ba59abbe56e057f20f883e', 'JAGDISH KAFLE', '4509', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4510, '4510', 'e10adc3949ba59abbe56e057f20f883e', 'GOPAL REGMI', '4510', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4512, '4512', 'e10adc3949ba59abbe56e057f20f883e', 'JHABNATH DHAKAL', '4512', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4513, '4513', 'e10adc3949ba59abbe56e057f20f883e', 'DURGA CHUDAL', '4513', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4514, '4514', 'e10adc3949ba59abbe56e057f20f883e', 'EKA P. UPADHYAY', '4514', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4516, '4516', 'e10adc3949ba59abbe56e057f20f883e', 'GAGAN MAN SHRESTHA', '4516', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4517, '4517', 'e10adc3949ba59abbe56e057f20f883e', 'DEVRAJ DAHAL', '4517', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4518, '4518', 'e10adc3949ba59abbe56e057f20f883e', 'TULSHI KARKI', '4518', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4519, '4519', 'e10adc3949ba59abbe56e057f20f883e', 'PADMA RAJ LAMICHHANE', '4519', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4520, '4520', 'e10adc3949ba59abbe56e057f20f883e', 'RAJU DULAL', '4520', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4521, '4521', 'e10adc3949ba59abbe56e057f20f883e', 'RAM SHARAN SATYAL', '4521', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4524, '4524', 'e10adc3949ba59abbe56e057f20f883e', 'RAMESH R. REGMI', '4524', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4525, '4525', 'e10adc3949ba59abbe56e057f20f883e', 'DAMBAR SINGH GURU', '4525', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4526, '4526', 'e10adc3949ba59abbe56e057f20f883e', 'UTTAM K. BAJRACHARYA', '4526', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4528, '4528', 'e10adc3949ba59abbe56e057f20f883e', 'CHUDAMANI TIMILSINA', '4528', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4529, '4529', 'e10adc3949ba59abbe56e057f20f883e', 'GYAN P. ARYAL', '4529', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4531, '4531', 'e10adc3949ba59abbe56e057f20f883e', 'BABLI PAUDEL', '4531', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4533, '4533', 'e10adc3949ba59abbe56e057f20f883e', 'ARJUN SHING GHARTI', '4533', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4536, '4536', 'e10adc3949ba59abbe56e057f20f883e', 'TULASI RAM KATTEL', '4536', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4538, '4538', 'e10adc3949ba59abbe56e057f20f883e', 'TANKA P. GHIMIRE', '4538', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4540, '4540', 'e10adc3949ba59abbe56e057f20f883e', 'RUDRA K. SHRESTHA', '4540', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4542, '4542', 'e10adc3949ba59abbe56e057f20f883e', 'GHANSHYAM SHARMA ACH', '4542', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4543, '4543', 'e10adc3949ba59abbe56e057f20f883e', 'CHUDAMANI ADHIKARI', '4543', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4544, '4544', 'e10adc3949ba59abbe56e057f20f883e', 'RAM C. ADHIKARI', '4544', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4545, '4545', 'e10adc3949ba59abbe56e057f20f883e', 'RAJ B. AALE', '4545', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4548, '4548', 'e10adc3949ba59abbe56e057f20f883e', 'LOK B. KHATRI', '4548', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4549, '4549', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA B. LAMA', '4549', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4550, '4550', 'e10adc3949ba59abbe56e057f20f883e', 'DHRUBA K. BHUJEL', '4550', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4551, '4551', 'e10adc3949ba59abbe56e057f20f883e', 'SADANANDA NEUPANE', '4551', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4554, '4554', 'e10adc3949ba59abbe56e057f20f883e', 'LALIT K. RAI', '4554', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4555, '4555', 'e10adc3949ba59abbe56e057f20f883e', 'DHRUB K. GHIMIRE', '4555', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4557, '4557', 'e10adc3949ba59abbe56e057f20f883e', 'PITAMBAR R.UPADHYA', '4557', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4558, '4558', 'e10adc3949ba59abbe56e057f20f883e', 'PUSTAK RAJ TIWARI', '4558', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4559, '4559', 'e10adc3949ba59abbe56e057f20f883e', 'MOHAN P. ACHARYA', '4559', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4560, '4560', 'e10adc3949ba59abbe56e057f20f883e', 'RAM P. HUMAGAIN', '4560', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4561, '4561', 'e10adc3949ba59abbe56e057f20f883e', 'ANIL K. THAPA', '4561', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4562, '4562', 'e10adc3949ba59abbe56e057f20f883e', 'DEVI B. DHAKAL', '4562', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4563, '4563', 'e10adc3949ba59abbe56e057f20f883e', 'JAGADISH P. DHUNGANA', '4563', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4564, '4564', 'e10adc3949ba59abbe56e057f20f883e', 'TULSI SUBEDI', '4564', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4565, '4565', 'e10adc3949ba59abbe56e057f20f883e', 'MINA DAHAL', '4565', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4567, '4567', 'e10adc3949ba59abbe56e057f20f883e', 'DURGA GAUTAM', '4567', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4569, '4569', 'e10adc3949ba59abbe56e057f20f883e', 'NARENDRA K. GURUNG', '4569', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4571, '4571', 'e10adc3949ba59abbe56e057f20f883e', 'MAHANANDA BASTOLA', '4571', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4572, '4572', 'e10adc3949ba59abbe56e057f20f883e', 'MADHUKAR KAFLE', '4572', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4575, '4575', 'e10adc3949ba59abbe56e057f20f883e', 'MITRA N. PRADHAN', '4575', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4580, '4580', 'e10adc3949ba59abbe56e057f20f883e', 'TEK R. TIMILSINA', '4580', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4581, '4581', 'e10adc3949ba59abbe56e057f20f883e', 'UMESH K. MASKEY', '4581', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4582, '4582', 'e10adc3949ba59abbe56e057f20f883e', 'NARA B. BASNET', '4582', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4584, '4584', 'e10adc3949ba59abbe56e057f20f883e', 'PURNA B. JOGI', '4584', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4586, '4586', 'e10adc3949ba59abbe56e057f20f883e', 'HUMLAL JAISHI', '4586', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4588, '4588', 'e10adc3949ba59abbe56e057f20f883e', 'RAM B. BUDHATHOKI', '4588', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4590, '4590', 'e10adc3949ba59abbe56e057f20f883e', 'SHALIKRAM JAISI(NUPN', '4590', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4595, '4595', 'e10adc3949ba59abbe56e057f20f883e', 'BISHNU P. PANDIT', '4595', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4596, '4596', 'e10adc3949ba59abbe56e057f20f883e', 'LAL BABU SHAH', '4596', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4599, '4599', 'e10adc3949ba59abbe56e057f20f883e', 'RAM SINGH DHAMI', '4599', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4601, '4601', 'e10adc3949ba59abbe56e057f20f883e', 'BHIM B. MADAI', '4601', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4604, '4604', 'e10adc3949ba59abbe56e057f20f883e', 'BAHADUR S. DHAMI', '4604', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4605, '4605', 'e10adc3949ba59abbe56e057f20f883e', 'BIJAYA R. POKHAREL', '4605', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4607, '4607', 'e10adc3949ba59abbe56e057f20f883e', 'RISHI RAM SHRESTHA', '4607', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4609, '4609', 'e10adc3949ba59abbe56e057f20f883e', 'RISHI R. ARYAL', '4609', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4614, '4614', 'e10adc3949ba59abbe56e057f20f883e', 'LAL B. KOIRALA', '4614', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4620, '4620', 'e10adc3949ba59abbe56e057f20f883e', 'SHYAM B. THAPA', '4620', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4621, '4621', 'e10adc3949ba59abbe56e057f20f883e', 'CHHATRA B. KARKI', '4621', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4622, '4622', 'e10adc3949ba59abbe56e057f20f883e', 'RAMESH TAMANG', '4622', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4623, '4623', 'e10adc3949ba59abbe56e057f20f883e', 'RATNA P.KHATIWODA', '4623', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4624, '4624', 'e10adc3949ba59abbe56e057f20f883e', 'TEK B. SHRESTHA', '4624', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4626, '4626', 'e10adc3949ba59abbe56e057f20f883e', 'BHUMI R.PEHIM(LIMBU)', '4626', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4627, '4627', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA B. LIMBU', '4627', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4628, '4628', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA P. SUBEDI', '4628', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4629, '4629', 'e10adc3949ba59abbe56e057f20f883e', 'KHADGA B. BISWOKARMA', '4629', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4630, '4630', 'e10adc3949ba59abbe56e057f20f883e', 'MANOJ SHRESTHA', '4630', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4631, '4631', 'e10adc3949ba59abbe56e057f20f883e', 'FULGEN NAYAK', '4631', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4633, '4633', 'e10adc3949ba59abbe56e057f20f883e', 'JIBACH P.YADAV', '4633', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4634, '4634', 'e10adc3949ba59abbe56e057f20f883e', 'MO BADARUDDIN ALI', '4634', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4636, '4636', 'e10adc3949ba59abbe56e057f20f883e', 'DHRUBA B. SUBEDI', '4636', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4637, '4637', 'e10adc3949ba59abbe56e057f20f883e', 'DAMBAR K. K.C.', '4637', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4638, '4638', 'e10adc3949ba59abbe56e057f20f883e', 'SHYAM B. BHUJEL', '4638', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4639, '4639', 'e10adc3949ba59abbe56e057f20f883e', 'RUDRA B. MAHAT', '4639', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4640, '4640', 'e10adc3949ba59abbe56e057f20f883e', 'AMBAR B. ROKAYA', '4640', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4643, '4643', 'e10adc3949ba59abbe56e057f20f883e', 'JANAK B. SHAHI', '4643', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4644, '4644', 'e10adc3949ba59abbe56e057f20f883e', 'LAIN B. PAUDYAL', '4644', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4645, '4645', 'e10adc3949ba59abbe56e057f20f883e', 'INDRA N. SHAHANI', '4645', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4646, '4646', 'e10adc3949ba59abbe56e057f20f883e', 'LOCHAN PANDIT', '4646', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4648, '4648', 'e10adc3949ba59abbe56e057f20f883e', 'SHANKHA B. BUDHA', '4648', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4649, '4649', 'e10adc3949ba59abbe56e057f20f883e', 'JANGA B. ROKAYA', '4649', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4650, '4650', 'e10adc3949ba59abbe56e057f20f883e', 'MAHANANDA CHAULAGAIN', '4650', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4651, '4651', 'e10adc3949ba59abbe56e057f20f883e', 'BHAGI M. MAGAR', '4651', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4652, '4652', 'e10adc3949ba59abbe56e057f20f883e', 'KHADGA RAI', '4652', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4653, '4653', 'e10adc3949ba59abbe56e057f20f883e', 'PRAMOD K. SHAH SUDI', '4653', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4654, '4654', 'e10adc3949ba59abbe56e057f20f883e', 'UDHDAB K.C.', '4654', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4655, '4655', 'e10adc3949ba59abbe56e057f20f883e', 'GANESH K. PRADHAN', '4655', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4656, '4656', 'e10adc3949ba59abbe56e057f20f883e', 'BHOLA N. KHATIWODA', '4656', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4657, '4657', 'e10adc3949ba59abbe56e057f20f883e', 'SUR B. RAUT', '4657', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4658, '4658', 'e10adc3949ba59abbe56e057f20f883e', 'NARA B. PARIYAR', '4658', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4659, '4659', 'e10adc3949ba59abbe56e057f20f883e', 'MOHAN K. RAI', '4659', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4661, '4661', 'e10adc3949ba59abbe56e057f20f883e', 'AJA B. ROKAYA', '4661', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4662, '4662', 'e10adc3949ba59abbe56e057f20f883e', 'MAN B. ROKAYA', '4662', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4664, '4664', 'e10adc3949ba59abbe56e057f20f883e', 'DURGA B. RAI', '4664', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4665, '4665', 'e10adc3949ba59abbe56e057f20f883e', 'BISHNU P. ACHARYA', '4665', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4671, '4671', 'e10adc3949ba59abbe56e057f20f883e', 'SANJIB REGMI', '4671', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4672, '4672', 'e10adc3949ba59abbe56e057f20f883e', 'POM B. REGMI', '4672', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4673, '4673', 'e10adc3949ba59abbe56e057f20f883e', 'DEB HARI SUBEDI', '4673', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4674, '4674', 'e10adc3949ba59abbe56e057f20f883e', 'TARA DEVI BARAL', '4674', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4676, '4676', 'e10adc3949ba59abbe56e057f20f883e', 'BHIM B. RANABHAT', '4676', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4677, '4677', 'e10adc3949ba59abbe56e057f20f883e', 'RAJENDRA R. REGMI', '4677', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4678, '4678', 'e10adc3949ba59abbe56e057f20f883e', 'DILLI P. REGMI', '4678', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4679, '4679', 'e10adc3949ba59abbe56e057f20f883e', 'JANAK SHARMA', '4679', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4680, '4680', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA P. SAPKOTA', '4680', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4682, '4682', 'e10adc3949ba59abbe56e057f20f883e', 'SHRIKANTA POKHREL', '4682', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4683, '4683', 'e10adc3949ba59abbe56e057f20f883e', 'BISHNU B. PARAJULI', '4683', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4684, '4684', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA P.BHUSAL', '4684', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4685, '4685', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA P. SHARMA', '4685', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4686, '4686', 'e10adc3949ba59abbe56e057f20f883e', 'NARAYAN P. GYAWALI', '4686', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4687, '4687', 'e10adc3949ba59abbe56e057f20f883e', 'RAM K. SHRESTHA', '4687', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4690, '4690', 'e10adc3949ba59abbe56e057f20f883e', 'BISHOW R. MARASINI', '4690', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4691, '4691', 'e10adc3949ba59abbe56e057f20f883e', 'RAM B. BUDHA', '4691', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4692, '4692', 'e10adc3949ba59abbe56e057f20f883e', 'CHHIRING T. LAMA', '4692', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4693, '4693', 'e10adc3949ba59abbe56e057f20f883e', 'JAGGU PD. GODIYA', '4693', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4695, '4695', 'e10adc3949ba59abbe56e057f20f883e', 'BINOD K. POKHAREL', '4695', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4696, '4696', 'e10adc3949ba59abbe56e057f20f883e', 'PAHALMAN BHANDARI', '4696', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4698, '4698', 'e10adc3949ba59abbe56e057f20f883e', 'RATAN K. DAS', '4698', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4699, '4699', 'e10adc3949ba59abbe56e057f20f883e', 'RAJAN P.S. SANGRAULA', '4699', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4700, '4700', 'e10adc3949ba59abbe56e057f20f883e', 'BHESH RAJ GHIMIRE', '4700', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4701, '4701', 'e10adc3949ba59abbe56e057f20f883e', 'MADAN K. POKHAREL', '4701', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4702, '4702', 'e10adc3949ba59abbe56e057f20f883e', 'GYANENDRA P.ADHIKARI', '4702', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4703, '4703', 'e10adc3949ba59abbe56e057f20f883e', 'TEJ PRASAD GHIMIRE', '4703', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4704, '4704', 'e10adc3949ba59abbe56e057f20f883e', 'SHYAM RAJ SUBEDI', '4704', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4705, '4705', 'e10adc3949ba59abbe56e057f20f883e', 'BHUWAN ADHIKARI', '4705', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4706, '4706', 'e10adc3949ba59abbe56e057f20f883e', 'DIPAK K. POKHAREL', '4706', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4708, '4708', 'e10adc3949ba59abbe56e057f20f883e', 'SANTOSH K. DAS', '4708', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4709, '4709', 'e10adc3949ba59abbe56e057f20f883e', 'CHETAN D. TIMSINA', '4709', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4710, '4710', 'e10adc3949ba59abbe56e057f20f883e', 'RAJ K. SHRESTHA', '4710', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4711, '4711', 'e10adc3949ba59abbe56e057f20f883e', 'TEJ PRASAD DAHAL', '4711', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4712, '4712', 'e10adc3949ba59abbe56e057f20f883e', 'SITARAM NIRAULA', '4712', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4713, '4713', 'e10adc3949ba59abbe56e057f20f883e', 'KALPANA ACHARYA', '4713', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4714, '4714', 'e10adc3949ba59abbe56e057f20f883e', 'SHAMBHU P. RAUT', '4714', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4716, '4716', 'e10adc3949ba59abbe56e057f20f883e', 'GOBINDA GHIMIRE', '4716', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4717, '4717', 'e10adc3949ba59abbe56e057f20f883e', 'HARI P. POKHAREL', '4717', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4718, '4718', 'e10adc3949ba59abbe56e057f20f883e', 'ASHOK R. KHAREL', '4718', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4719, '4719', 'e10adc3949ba59abbe56e057f20f883e', 'TARANATH NEUPANE', '4719', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4720, '4720', 'e10adc3949ba59abbe56e057f20f883e', 'AHILYA AMATYA', '4720', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4721, '4721', 'e10adc3949ba59abbe56e057f20f883e', 'NARENDRA THAPA', '4721', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4722, '4722', 'e10adc3949ba59abbe56e057f20f883e', 'UPENDRA KARAK', '4722', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4723, '4723', 'e10adc3949ba59abbe56e057f20f883e', 'RENUKA KHANAL', '4723', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4724, '4724', 'e10adc3949ba59abbe56e057f20f883e', 'SHARAD C. JOSHI', '4724', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4725, '4725', 'e10adc3949ba59abbe56e057f20f883e', 'BALARAM PRASAIN', '4725', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4726, '4726', 'e10adc3949ba59abbe56e057f20f883e', 'GOVINDA.BHA.SHRESTHA', '4726', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4728, '4728', 'e10adc3949ba59abbe56e057f20f883e', 'BIDHYA K.POKHAREL', '4728', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4729, '4729', 'e10adc3949ba59abbe56e057f20f883e', 'PARASHU R.BUDHATHOKI', '4729', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4730, '4730', 'e10adc3949ba59abbe56e057f20f883e', 'SHYAMMANI KHATIWADA', '4730', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4731, '4731', 'e10adc3949ba59abbe56e057f20f883e', 'SURESH SHRESTHA', '4731', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4732, '4732', 'e10adc3949ba59abbe56e057f20f883e', 'NABIN DAHAL', '4732', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4733, '4733', 'e10adc3949ba59abbe56e057f20f883e', 'SHUSIL PARAJULY', '4733', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4734, '4734', 'e10adc3949ba59abbe56e057f20f883e', 'SHALIGRAM DHAKAL', '4734', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4735, '4735', 'e10adc3949ba59abbe56e057f20f883e', 'RAJU BHATTARAI', '4735', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4736, '4736', 'e10adc3949ba59abbe56e057f20f883e', 'RAMESH SHRESTHA', '4736', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4737, '4737', 'e10adc3949ba59abbe56e057f20f883e', 'TEK P.GURAGAIN', '4737', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4738, '4738', 'e10adc3949ba59abbe56e057f20f883e', 'CHANDRAMANI KAFLE', '4738', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4739, '4739', 'e10adc3949ba59abbe56e057f20f883e', 'CHIRANJIBI SUBEDI', '4739', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4740, '4740', 'e10adc3949ba59abbe56e057f20f883e', 'JHALAK M.ACHARYA', '4740', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4741, '4741', 'e10adc3949ba59abbe56e057f20f883e', 'KHADANANDA DHAKAL', '4741', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4742, '4742', 'e10adc3949ba59abbe56e057f20f883e', 'BIR B. KARKI', '4742', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4743, '4743', 'e10adc3949ba59abbe56e057f20f883e', 'TANKA N. PRADHAN', '4743', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4744, '4744', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA B. KATHAYAT', '4744', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4745, '4745', 'e10adc3949ba59abbe56e057f20f883e', 'SHASHIKALA JOSHI', '4745', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4746, '4746', 'e10adc3949ba59abbe56e057f20f883e', 'HEMU NEPAL', '4746', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4747, '4747', 'e10adc3949ba59abbe56e057f20f883e', 'HRIDAYA K. JHA', '4747', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4750, '4750', 'e10adc3949ba59abbe56e057f20f883e', 'DURGANANDA YADAV', '4750', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4751, '4751', 'e10adc3949ba59abbe56e057f20f883e', 'PARBATI K. SAPKOTA', '4751', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4752, '4752', 'e10adc3949ba59abbe56e057f20f883e', 'SHILA DHAKAL', '4752', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4753, '4753', 'e10adc3949ba59abbe56e057f20f883e', 'BINOD PRASAD PAUDEL', '4753', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4754, '4754', 'e10adc3949ba59abbe56e057f20f883e', 'FULGEN SHAHA', '4754', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4755, '4755', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA S. GHIMIRE', '4755', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4756, '4756', 'e10adc3949ba59abbe56e057f20f883e', 'GOBINDA MISHRA', '4756', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4757, '4757', 'e10adc3949ba59abbe56e057f20f883e', 'DHRUBA P. POUDEL', '4757', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4758, '4758', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA P. BHATTARAI', '4758', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4759, '4759', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA K. KATUWAL', '4759', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4760, '4760', 'e10adc3949ba59abbe56e057f20f883e', 'PARASHURAM JOSHI', '4760', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4761, '4761', 'e10adc3949ba59abbe56e057f20f883e', 'TARA P. KAFLE', '4761', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4762, '4762', 'e10adc3949ba59abbe56e057f20f883e', 'RAM DARESH PANDIT', '4762', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4763, '4763', 'e10adc3949ba59abbe56e057f20f883e', 'RAJENDRA P. MAHATO', '4763', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4764, '4764', 'e10adc3949ba59abbe56e057f20f883e', 'SHYAM SUNDAR SHAHA', '4764', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4765, '4765', 'e10adc3949ba59abbe56e057f20f883e', 'ASHISH K. KARNA', '4765', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4766, '4766', 'e10adc3949ba59abbe56e057f20f883e', 'PESHAL K. DAHAL', '4766', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4767, '4767', 'e10adc3949ba59abbe56e057f20f883e', 'JHANKA P. TIMILSINA', '4767', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4768, '4768', 'e10adc3949ba59abbe56e057f20f883e', 'KOSHIMAYA LAMICHHANE', '4768', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4770, '4770', 'e10adc3949ba59abbe56e057f20f883e', 'LOKENDRA ADHIKARI', '4770', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4771, '4771', 'e10adc3949ba59abbe56e057f20f883e', 'PADAM B. SHRESTHA', '4771', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4772, '4772', 'e10adc3949ba59abbe56e057f20f883e', 'BIKASH  SILAWAL', '4772', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4773, '4773', 'e10adc3949ba59abbe56e057f20f883e', 'KHETA R. DAHAL', '4773', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4774, '4774', 'e10adc3949ba59abbe56e057f20f883e', 'GHANASHYAM YOGI', '4774', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4775, '4775', 'e10adc3949ba59abbe56e057f20f883e', 'RAMADEBI BHATTARAI', '4775', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4776, '4776', 'e10adc3949ba59abbe56e057f20f883e', 'DAMODAR NEUPANE', '4776', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4777, '4777', 'e10adc3949ba59abbe56e057f20f883e', 'SHREERAM SITAULA', '4777', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4778, '4778', 'e10adc3949ba59abbe56e057f20f883e', 'KIRAN GAUTAM', '4778', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4779, '4779', 'e10adc3949ba59abbe56e057f20f883e', 'TEJ BIKRAM THAPA', '4779', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4780, '4780', 'e10adc3949ba59abbe56e057f20f883e', 'RAM B. LAMA', '4780', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4781, '4781', 'e10adc3949ba59abbe56e057f20f883e', 'SUBHADRA SHRESTHA', '4781', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4782, '4782', 'e10adc3949ba59abbe56e057f20f883e', 'DIBAKAR P. GAUTAM', '4782', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4783, '4783', 'e10adc3949ba59abbe56e057f20f883e', 'PRADIP BANSKOTA', '4783', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4784, '4784', 'e10adc3949ba59abbe56e057f20f883e', 'RAJENDRA PARAJULI', '4784', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4786, '4786', 'e10adc3949ba59abbe56e057f20f883e', 'YUBARAJ GHIMIRE', '4786', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4787, '4787', 'e10adc3949ba59abbe56e057f20f883e', 'YADAB P. BHAATTARAI', '4787', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4788, '4788', 'e10adc3949ba59abbe56e057f20f883e', 'SHRIKRISHNA PARAJULY', '4788', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4789, '4789', 'e10adc3949ba59abbe56e057f20f883e', 'SURESH K. CHAUDHARI', '4789', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4790, '4790', 'e10adc3949ba59abbe56e057f20f883e', 'RAGHUNATH ADHIKARI', '4790', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4792, '4792', 'e10adc3949ba59abbe56e057f20f883e', 'KUMAR UPRETI', '4792', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4793, '4793', 'e10adc3949ba59abbe56e057f20f883e', 'SUNIL K. SHRIBASTAB', '4793', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4794, '4794', 'e10adc3949ba59abbe56e057f20f883e', 'BIDHYA L.S.SHRESTHA', '4794', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4795, '4795', 'e10adc3949ba59abbe56e057f20f883e', 'BEDANANDA DAHAL', '4795', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4796, '4796', 'e10adc3949ba59abbe56e057f20f883e', 'RAJU DHAKAL', '4796', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4797, '4797', 'e10adc3949ba59abbe56e057f20f883e', 'KAMAL K. KHATTRI', '4797', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4799, '4799', 'e10adc3949ba59abbe56e057f20f883e', 'OM B. TANDAN', '4799', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4800, '4800', 'e10adc3949ba59abbe56e057f20f883e', 'BISHNU B. KUNWAR', '4800', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4801, '4801', 'e10adc3949ba59abbe56e057f20f883e', 'MADHAB TIWARI', '4801', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4802, '4802', 'e10adc3949ba59abbe56e057f20f883e', 'BUDDIRAJ PANDE', '4802', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4803, '4803', 'e10adc3949ba59abbe56e057f20f883e', 'BIYASI K. DANUWAR', '4803', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4804, '4804', 'e10adc3949ba59abbe56e057f20f883e', 'JAGANNATH ACHARYA', '4804', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4805, '4805', 'e10adc3949ba59abbe56e057f20f883e', 'MADAN RAYA', '4805', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4806, '4806', 'e10adc3949ba59abbe56e057f20f883e', 'SANTOSH K. BHATTARAI', '4806', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4807, '4807', 'e10adc3949ba59abbe56e057f20f883e', 'LOKNATH POUDEL', '4807', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4808, '4808', 'e10adc3949ba59abbe56e057f20f883e', 'MAHESH P. POUDEL', '4808', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4809, '4809', 'e10adc3949ba59abbe56e057f20f883e', 'DIPAK SUBEDI', '4809', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4811, '4811', 'e10adc3949ba59abbe56e057f20f883e', 'KAMAL R. REGMI', '4811', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4812, '4812', 'e10adc3949ba59abbe56e057f20f883e', 'TARA KUMARI ADHIKARI', '4812', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4813, '4813', 'e10adc3949ba59abbe56e057f20f883e', 'ARJUN P. BARAL', '4813', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4814, '4814', 'e10adc3949ba59abbe56e057f20f883e', 'RAM P. SAPKOTA', '4814', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4816, '4816', 'e10adc3949ba59abbe56e057f20f883e', 'MOTI P. POUDEL', '4816', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4817, '4817', 'e10adc3949ba59abbe56e057f20f883e', 'PURUSHOTTAM PARAJULY', '4817', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4818, '4818', 'e10adc3949ba59abbe56e057f20f883e', 'HARI P. KAFLE', '4818', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4819, '4819', 'e10adc3949ba59abbe56e057f20f883e', 'BASUDEB PAUDEL', '4819', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4822, '4822', 'e10adc3949ba59abbe56e057f20f883e', 'TULASI P. POUDEL', '4822', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4823, '4823', 'e10adc3949ba59abbe56e057f20f883e', 'GHANASHYAM BHANDARI', '4823', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4824, '4824', 'e10adc3949ba59abbe56e057f20f883e', 'BISHNU ACHARYA', '4824', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4825, '4825', 'e10adc3949ba59abbe56e057f20f883e', 'HEMENDRA ARYAL', '4825', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4826, '4826', 'e10adc3949ba59abbe56e057f20f883e', 'NARAYAN D.BARAL', '4826', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4829, '4829', 'e10adc3949ba59abbe56e057f20f883e', 'NAGENDRA B. SHAHA', '4829', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4830, '4830', 'e10adc3949ba59abbe56e057f20f883e', 'SANTOSH KUNWAR YOGI', '4830', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4831, '4831', 'e10adc3949ba59abbe56e057f20f883e', 'HARIHAR ACHARYA', '4831', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4832, '4832', 'e10adc3949ba59abbe56e057f20f883e', 'NARBADESOR CHAUDHARI', '4832', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4833, '4833', 'e10adc3949ba59abbe56e057f20f883e', 'SHANTA SUBEDI', '4833', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4834, '4834', 'e10adc3949ba59abbe56e057f20f883e', 'GHANASHYAM NEUPANE', '4834', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4836, '4836', 'e10adc3949ba59abbe56e057f20f883e', 'PRAKASH K. SHRESTHA', '4836', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4837, '4837', 'e10adc3949ba59abbe56e057f20f883e', 'KHIM B. ADHIKARI', '4837', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4838, '4838', 'e10adc3949ba59abbe56e057f20f883e', 'SHIV R. TIMILSINA', '4838', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4839, '4839', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA P. GYANWALI', '4839', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4840, '4840', 'e10adc3949ba59abbe56e057f20f883e', 'JANAK P. GYANWALI', '4840', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4841, '4841', 'e10adc3949ba59abbe56e057f20f883e', 'BUDDI P. BHANDARI', '4841', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4842, '4842', 'e10adc3949ba59abbe56e057f20f883e', 'HIRA B. AALE', '4842', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4843, '4843', 'e10adc3949ba59abbe56e057f20f883e', 'RAJENDRA P. JOSHI', '4843', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4844, '4844', 'e10adc3949ba59abbe56e057f20f883e', 'LOK R. OJHA', '4844', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4845, '4845', 'e10adc3949ba59abbe56e057f20f883e', 'PRADIP R. JOSHI', '4845', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4846, '4846', 'e10adc3949ba59abbe56e057f20f883e', 'RAGHUNATH JOSHI', '4846', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4848, '4848', 'e10adc3949ba59abbe56e057f20f883e', 'RUDRA B. K.C.', '4848', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4849, '4849', 'e10adc3949ba59abbe56e057f20f883e', 'DIRGHA B. SHAHA', '4849', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4850, '4850', 'e10adc3949ba59abbe56e057f20f883e', 'YOGENDRA B. SINGH', '4850', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4851, '4851', 'e10adc3949ba59abbe56e057f20f883e', 'BHOJRAJ BHANDARI', '4851', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4852, '4852', 'e10adc3949ba59abbe56e057f20f883e', 'SHURESH P. PANTA', '4852', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4854, '4854', 'e10adc3949ba59abbe56e057f20f883e', 'TARKA B. SWAR', '4854', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4855, '4855', 'e10adc3949ba59abbe56e057f20f883e', 'MADHAB P. KOIRALA', '4855', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4856, '4856', 'e10adc3949ba59abbe56e057f20f883e', 'ROSHAN K.C.', '4856', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4857, '4857', 'e10adc3949ba59abbe56e057f20f883e', 'BHARAT B. RAWAL', '4857', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4858, '4858', 'e10adc3949ba59abbe56e057f20f883e', 'CHAKRAPANI UPADHAYA', '4858', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4859, '4859', 'e10adc3949ba59abbe56e057f20f883e', 'HARI P. JAISHI', '4859', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4860, '4860', 'e10adc3949ba59abbe56e057f20f883e', 'RUKMANGAT PAUDEL', '4860', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4861, '4861', 'e10adc3949ba59abbe56e057f20f883e', 'PITAMBAR GAUTAM', '4861', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4862, '4862', 'e10adc3949ba59abbe56e057f20f883e', 'CHURNA B. PUN', '4862', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4863, '4863', 'e10adc3949ba59abbe56e057f20f883e', 'SHIBA P. BHUSHAL', '4863', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4864, '4864', 'e10adc3949ba59abbe56e057f20f883e', 'BISHU SHARMA', '4864', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4866, '4866', 'e10adc3949ba59abbe56e057f20f883e', 'SITA KHANAL', '4866', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4867, '4867', 'e10adc3949ba59abbe56e057f20f883e', 'PRADIB SUBEDI', '4867', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4868, '4868', 'e10adc3949ba59abbe56e057f20f883e', 'DAMBAR B. K.C.', '4868', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4869, '4869', 'e10adc3949ba59abbe56e057f20f883e', 'RAM NARESH SHAH', '4869', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4870, '4870', 'e10adc3949ba59abbe56e057f20f883e', 'SHAMBHU B. BANIYA', '4870', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4871, '4871', 'e10adc3949ba59abbe56e057f20f883e', 'RAJENDRA K.JIREL', '4871', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4872, '4872', 'e10adc3949ba59abbe56e057f20f883e', 'LALIT B. BISHOWKARMA', '4872', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4873, '4873', 'e10adc3949ba59abbe56e057f20f883e', 'SHER B. SHAUD', '4873', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4874, '4874', 'e10adc3949ba59abbe56e057f20f883e', 'MADHAB PD. UPRETI', '4874', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4875, '4875', 'e10adc3949ba59abbe56e057f20f883e', 'RAGHU N. MUKHIYA', '4875', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4876, '4876', 'e10adc3949ba59abbe56e057f20f883e', 'PUSKAR KOIRALA', '4876', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4877, '4877', 'e10adc3949ba59abbe56e057f20f883e', 'GORAKH B.BUDHA THAPA', '4877', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4878, '4878', 'e10adc3949ba59abbe56e057f20f883e', 'SATYA N. MANDAL', '4878', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4879, '4879', 'e10adc3949ba59abbe56e057f20f883e', 'ROSHAN LIMBU', '4879', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4880, '4880', 'e10adc3949ba59abbe56e057f20f883e', 'KHULARAM PAUDEL', '4880', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4881, '4881', 'e10adc3949ba59abbe56e057f20f883e', 'INDRA P. KOIRALA', '4881', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4882, '4882', 'e10adc3949ba59abbe56e057f20f883e', 'PUSHPA R. SHRESTHA', '4882', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin');
INSERT INTO `tblextuser` (`user_id`, `logon_name`, `user_pass`, `user_name`, `staff_code`, `company_id`, `group_policy`, `start_date`, `end_date`, `status`, `input_date`, `inputter`, `authorizer`) VALUES
(4883, '4883', 'e10adc3949ba59abbe56e057f20f883e', 'DURGA B. TAMANG', '4883', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4884, '4884', 'e10adc3949ba59abbe56e057f20f883e', 'SRIKRISHNA CHAUDHARI', '4884', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4885, '4885', 'e10adc3949ba59abbe56e057f20f883e', 'THANA P. DHAKAL', '4885', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4886, '4886', 'e10adc3949ba59abbe56e057f20f883e', 'JHAULAL NEUPANE', '4886', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4887, '4887', 'e10adc3949ba59abbe56e057f20f883e', 'TEJ KUMAR GURUNG', '4887', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4888, '4888', 'e10adc3949ba59abbe56e057f20f883e', 'RAMCHANDRA BHANDARI', '4888', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4889, '4889', 'e10adc3949ba59abbe56e057f20f883e', 'ARJUN SILUWAL', '4889', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4890, '4890', 'e10adc3949ba59abbe56e057f20f883e', 'DHARMA S. DHAKAL', '4890', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4891, '4891', 'e10adc3949ba59abbe56e057f20f883e', 'MADAN R. GIRI', '4891', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4892, '4892', 'e10adc3949ba59abbe56e057f20f883e', 'SHAILENDRA P.BAJAGAI', '4892', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4893, '4893', 'e10adc3949ba59abbe56e057f20f883e', 'JAGADISH P. PANTA', '4893', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4894, '4894', 'e10adc3949ba59abbe56e057f20f883e', 'BARSHA ADHAKARI', '4894', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4895, '4895', 'e10adc3949ba59abbe56e057f20f883e', 'RAM P. CHAUDHARY', '4895', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4896, '4896', 'e10adc3949ba59abbe56e057f20f883e', 'SRIJANA K.C.', '4896', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4897, '4897', 'e10adc3949ba59abbe56e057f20f883e', 'RADHA SHARMA ARAYAL', '4897', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4898, '4898', 'e10adc3949ba59abbe56e057f20f883e', 'SITA DAHAL', '4898', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4899, '4899', 'e10adc3949ba59abbe56e057f20f883e', 'ANJU DAHAL', '4899', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4900, '4900', 'e10adc3949ba59abbe56e057f20f883e', 'MINA K.LEKHAK BOHARA', '4900', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4902, '4902', 'e10adc3949ba59abbe56e057f20f883e', 'HIMA LAL PAUDYAL', '4902', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4903, '4903', 'e10adc3949ba59abbe56e057f20f883e', 'PHANINDRA P.BHATTA', '4903', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4904, '4904', 'e10adc3949ba59abbe56e057f20f883e', 'BINAYA KUMAR KARNA', '4904', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4905, '4905', 'e10adc3949ba59abbe56e057f20f883e', 'LILA S. THAKURI', '4905', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4906, '4906', 'e10adc3949ba59abbe56e057f20f883e', 'KISHOR K.ACHARYA', '4906', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4907, '4907', 'e10adc3949ba59abbe56e057f20f883e', 'SHALIKRAM DHANGI', '4907', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4908, '4908', 'e10adc3949ba59abbe56e057f20f883e', 'DHARMARAJ NAUPANE', '4908', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4909, '4909', 'e10adc3949ba59abbe56e057f20f883e', 'PURUSHOTAM R.PANTA', '4909', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4912, '4912', 'e10adc3949ba59abbe56e057f20f883e', 'SHIVA P.BASTOLA', '4912', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4913, '4913', 'e10adc3949ba59abbe56e057f20f883e', 'RAMSAGHAR MAHASETH', '4913', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4914, '4914', 'e10adc3949ba59abbe56e057f20f883e', 'PABHITRARAJ POUDHAL', '4914', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4916, '4916', 'e10adc3949ba59abbe56e057f20f883e', 'RISHIBABU PANTA', '4916', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4917, '4917', 'e10adc3949ba59abbe56e057f20f883e', 'RAM PADHARATH SHAH', '4917', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4918, '4918', 'e10adc3949ba59abbe56e057f20f883e', 'SINJIB K. SHARMA', '4918', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4919, '4919', 'e10adc3949ba59abbe56e057f20f883e', 'RAMCHANDRA YADAB', '4919', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4920, '4920', 'e10adc3949ba59abbe56e057f20f883e', 'HARICHANDRA JOSHI', '4920', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4921, '4921', 'e10adc3949ba59abbe56e057f20f883e', 'SANTOSH K. KARKI', '4921', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4922, '4922', 'e10adc3949ba59abbe56e057f20f883e', 'ARJUN THAPA', '4922', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4923, '4923', 'e10adc3949ba59abbe56e057f20f883e', 'SHANKAR LAL THARU', '4923', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4925, '4925', 'e10adc3949ba59abbe56e057f20f883e', 'RAMESH K. ARYAL', '4925', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4926, '4926', 'e10adc3949ba59abbe56e057f20f883e', 'MAN BD.SINGH', '4926', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4927, '4927', 'e10adc3949ba59abbe56e057f20f883e', 'BHOLA SAHA', '4927', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4928, '4928', 'e10adc3949ba59abbe56e057f20f883e', 'RAJU KARKI', '4928', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4929, '4929', 'e10adc3949ba59abbe56e057f20f883e', 'TIRTHA LAL SILWAL', '4929', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4930, '4930', 'e10adc3949ba59abbe56e057f20f883e', 'KHAGHRAJ JOSHI', '4930', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4931, '4931', 'e10adc3949ba59abbe56e057f20f883e', 'KAMALA RAWAL', '4931', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4932, '4932', 'e10adc3949ba59abbe56e057f20f883e', 'RAMSHARAN MAHATO', '4932', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4933, '4933', 'e10adc3949ba59abbe56e057f20f883e', 'NARESH SUBEDI', '4933', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4934, '4934', 'e10adc3949ba59abbe56e057f20f883e', 'BISHOWRAJ BASTOLA', '4934', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4935, '4935', 'e10adc3949ba59abbe56e057f20f883e', 'HARI KUMAR KOIRALA', '4935', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4936, '4936', 'e10adc3949ba59abbe56e057f20f883e', 'PURSHOTTM ADHAKARI', '4936', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4937, '4937', 'e10adc3949ba59abbe56e057f20f883e', 'DILLI BD. KARKI', '4937', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4938, '4938', 'e10adc3949ba59abbe56e057f20f883e', 'SHANKAR JAY MALLA', '4938', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4939, '4939', 'e10adc3949ba59abbe56e057f20f883e', 'BHARAT K. SHRESTHA', '4939', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4940, '4940', 'e10adc3949ba59abbe56e057f20f883e', 'HOM BD. RANAMAGAR', '4940', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4941, '4941', 'e10adc3949ba59abbe56e057f20f883e', 'LAXMAN KARKI', '4941', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4942, '4942', 'e10adc3949ba59abbe56e057f20f883e', 'ANILKUMAR PATHAK', '4942', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4943, '4943', 'e10adc3949ba59abbe56e057f20f883e', 'RAJARAM MALLHA', '4943', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4944, '4944', 'e10adc3949ba59abbe56e057f20f883e', 'RAJESH PD.PANDEY', '4944', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4945, '4945', 'e10adc3949ba59abbe56e057f20f883e', 'ISHORI PD. NEPAL', '4945', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4946, '4946', 'a1c94331fe8de56ca97ccb977ba80fc0', 'ABDUL M.MUSALMAN', '4946', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4947, '4947', 'e10adc3949ba59abbe56e057f20f883e', 'RAM BABU PANDEY', '4947', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4948, '4948', 'e10adc3949ba59abbe56e057f20f883e', 'ANUPAMA NEPAL', '4948', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4949, '4949', 'e10adc3949ba59abbe56e057f20f883e', 'HEMAL PANT', '4949', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4950, '4950', 'e10adc3949ba59abbe56e057f20f883e', 'LAYAKRAM CHOUDHARI', '4950', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4951, '4951', 'e10adc3949ba59abbe56e057f20f883e', 'REDDI THAKUR', '4951', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4952, '4952', 'e10adc3949ba59abbe56e057f20f883e', 'MANDIRA SUBDI', '4952', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4953, '4953', 'e10adc3949ba59abbe56e057f20f883e', 'SARITA KU.SHARMA', '4953', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4954, '4954', 'e10adc3949ba59abbe56e057f20f883e', 'RAM UDHAKAR BIRAJI', '4954', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4955, '4955', 'e10adc3949ba59abbe56e057f20f883e', 'BISHNU PD.LAMSAL', '4955', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4956, '4956', 'e10adc3949ba59abbe56e057f20f883e', 'PUSHPA ARYAL', '4956', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4957, '4957', 'e10adc3949ba59abbe56e057f20f883e', 'GOPI SHARMA LAMICHHA', '4957', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4958, '4958', 'e10adc3949ba59abbe56e057f20f883e', 'YUBRAJ D.C.', '4958', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4960, '4960', 'e10adc3949ba59abbe56e057f20f883e', 'LESH K.SHRESTHA', '4960', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4961, '4961', 'e10adc3949ba59abbe56e057f20f883e', 'PRAMOD KU.DHAKAL', '4961', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4962, '4962', 'e10adc3949ba59abbe56e057f20f883e', 'RAM PRABASH BICHA', '4962', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4963, '4963', 'e10adc3949ba59abbe56e057f20f883e', 'UPENDRA MAHASETH', '4963', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4964, '4964', 'e10adc3949ba59abbe56e057f20f883e', 'ANJU D.C.MAHAT', '4964', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4965, '4965', 'e10adc3949ba59abbe56e057f20f883e', 'RAMBHA ADHIKARI', '4965', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4966, '4966', 'e10adc3949ba59abbe56e057f20f883e', 'SHARDHA DEVI PANT', '4966', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4967, '4967', 'e10adc3949ba59abbe56e057f20f883e', 'ROSHAN SHRESTHA', '4967', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4968, '4968', 'e10adc3949ba59abbe56e057f20f883e', 'RAMKRISHNA NEUPANE', '4968', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4969, '4969', 'e10adc3949ba59abbe56e057f20f883e', 'GHANASHYAM SHRESTHA', '4969', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4971, '4971', 'e10adc3949ba59abbe56e057f20f883e', 'MILI SHRESTHA', '4971', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4972, '4972', 'e10adc3949ba59abbe56e057f20f883e', 'KALPANA K.C', '4972', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4973, '4973', 'e10adc3949ba59abbe56e057f20f883e', 'RAJ K.MAHATO', '4973', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4974, '4974', 'e10adc3949ba59abbe56e057f20f883e', 'RAM B. RAUTA', '4974', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4975, '4975', 'e10adc3949ba59abbe56e057f20f883e', 'PUNAMA K. SHARMA', '4975', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4976, '4976', 'e10adc3949ba59abbe56e057f20f883e', 'NAMARAJ THAPA', '4976', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4978, '4978', 'e10adc3949ba59abbe56e057f20f883e', 'SUNITA MALLA(SHAH)', '4978', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4979, '4979', 'e10adc3949ba59abbe56e057f20f883e', 'ABAHAD K. TIWARI', '4979', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4980, '4980', 'e10adc3949ba59abbe56e057f20f883e', 'LAL B. KATHAYAT', '4980', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4981, '4981', 'e10adc3949ba59abbe56e057f20f883e', 'RIMA K.GHIMIRE(ACHR)', '4981', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4982, '4982', 'e10adc3949ba59abbe56e057f20f883e', 'RAM P. GAJUREL', '4982', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4983, '4983', 'e10adc3949ba59abbe56e057f20f883e', 'PREM P. UPRETI', '4983', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4984, '4984', 'e10adc3949ba59abbe56e057f20f883e', 'SHATISH C. CHAUDHARI', '4984', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4985, '4985', 'e10adc3949ba59abbe56e057f20f883e', 'RAJ K. BASNET', '4985', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4987, '4987', 'e10adc3949ba59abbe56e057f20f883e', 'NARAHARI P. DULAL', '4987', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4988, '4988', 'e10adc3949ba59abbe56e057f20f883e', 'HARI GAWALI', '4988', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4990, '4990', 'e10adc3949ba59abbe56e057f20f883e', 'DILLI R.SUBEDI', '4990', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4991, '4991', 'e10adc3949ba59abbe56e057f20f883e', 'LOKESWORI DANGOL', '4991', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4993, '4993', 'e10adc3949ba59abbe56e057f20f883e', 'NIMA TAMANGA', '4993', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4994, '4994', 'e10adc3949ba59abbe56e057f20f883e', 'GANGA R. YADAB', '4994', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4995, '4995', 'e10adc3949ba59abbe56e057f20f883e', 'BIRENDRA K. SHRESTHA', '4995', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4996, '4996', 'e10adc3949ba59abbe56e057f20f883e', 'NUR P. GAUTAM', '4996', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4997, '4997', 'e10adc3949ba59abbe56e057f20f883e', 'SURESH P. YADAB', '4997', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4998, '4998', 'e10adc3949ba59abbe56e057f20f883e', 'HARIRAJ KHAREL', '4998', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(4999, '4999', 'e10adc3949ba59abbe56e057f20f883e', 'BISHNU KU.BHATTARAI', '4999', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5001, '5001', 'e10adc3949ba59abbe56e057f20f883e', 'SURENDRA ADHIKARI', '5001', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5002, '5002', 'e10adc3949ba59abbe56e057f20f883e', 'KHEM NATH DAHAL', '5002', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5003, '5003', 'e10adc3949ba59abbe56e057f20f883e', 'SHAILENDRA P.GHIMIRE', '5003', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5004, '5004', 'e10adc3949ba59abbe56e057f20f883e', 'MADHUSUDAN KHAKURAL', '5004', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5005, '5005', 'e10adc3949ba59abbe56e057f20f883e', 'SAROJ K.MANDAL', '5005', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5006, '5006', 'e10adc3949ba59abbe56e057f20f883e', 'YADAB P.PUDASAINI', '5006', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5007, '5007', 'e10adc3949ba59abbe56e057f20f883e', 'RITA REGMI', '5007', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5008, '5008', 'e10adc3949ba59abbe56e057f20f883e', 'PUSHPA GAUTAM', '5008', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5009, '5009', 'e10adc3949ba59abbe56e057f20f883e', 'BHAKTI K. GURUNAG', '5009', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5010, '5010', 'e10adc3949ba59abbe56e057f20f883e', 'SAMJHANA P(ADHIKARI', '5010', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5011, '5011', 'e10adc3949ba59abbe56e057f20f883e', 'GITA THAPA', '5011', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5012, '5012', 'e10adc3949ba59abbe56e057f20f883e', 'RENUKA HAMAL', '5012', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5013, '5013', 'e10adc3949ba59abbe56e057f20f883e', 'RAJKUMARI CHOUDHARI', '5013', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5014, '5014', 'e10adc3949ba59abbe56e057f20f883e', 'ANITA DAHAL', '5014', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5015, '5015', 'e10adc3949ba59abbe56e057f20f883e', 'BALMIKI BALI', '5015', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5017, '5017', 'e10adc3949ba59abbe56e057f20f883e', 'SHULOCHANA GIRI', '5017', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5019, '5019', 'e10adc3949ba59abbe56e057f20f883e', 'MAYA SHRESTHA JOSHI', '5019', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5020, '5020', 'e10adc3949ba59abbe56e057f20f883e', 'NIRMALA JAYSHWAL', '5020', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5021, '5021', 'e10adc3949ba59abbe56e057f20f883e', 'BHIM PD.BHATTARI', '5021', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5022, '5022', 'e10adc3949ba59abbe56e057f20f883e', 'GOPAL PD.KADHARI', '5022', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5023, '5023', 'e10adc3949ba59abbe56e057f20f883e', 'THIRTHARAJ DHANGAL', '5023', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5026, '5026', 'e10adc3949ba59abbe56e057f20f883e', 'GOPAL PD.LAMICHHANE', '5026', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5031, '5031', 'e10adc3949ba59abbe56e057f20f883e', 'MANDIP KOIRALA', '5031', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5032, '5032', 'e10adc3949ba59abbe56e057f20f883e', 'PUNYA PRASAD DAHAL', '5032', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5034, '5034', 'e10adc3949ba59abbe56e057f20f883e', 'GOKUL PD.SHAPKOTA', '5034', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5035, '5035', 'e10adc3949ba59abbe56e057f20f883e', 'SHANKAR K.ARAYAL', '5035', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5036, '5036', 'e10adc3949ba59abbe56e057f20f883e', 'ANITA THAPALIYA', '5036', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5037, '5037', 'e10adc3949ba59abbe56e057f20f883e', 'BIR B. BHORA', '5037', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5038, '5038', 'e10adc3949ba59abbe56e057f20f883e', 'BHUNASHOR KUWAR', '5038', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5039, '5039', 'e10adc3949ba59abbe56e057f20f883e', 'BINDURAM DHAGOURA', '5039', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5040, '5040', 'e10adc3949ba59abbe56e057f20f883e', 'PAN SINGH THUGANA', '5040', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5041, '5041', 'e10adc3949ba59abbe56e057f20f883e', 'BINOD JHHA', '5041', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5042, '5042', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA B. POUDHAL', '5042', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5043, '5043', 'e10adc3949ba59abbe56e057f20f883e', 'KHADHA B. SHRESTHA', '5043', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5044, '5044', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA DEV SHA', '5044', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5045, '5045', 'e10adc3949ba59abbe56e057f20f883e', 'AYODHI KAMAIT', '5045', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5046, '5046', 'e10adc3949ba59abbe56e057f20f883e', 'KARMA LAL CHOUDHARI', '5046', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5048, '5048', 'e10adc3949ba59abbe56e057f20f883e', 'PURNA B. G.C.', '5048', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5049, '5049', 'e10adc3949ba59abbe56e057f20f883e', 'SHOM B. KHATRI', '5049', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5050, '5050', 'e10adc3949ba59abbe56e057f20f883e', 'MEKHA B.MURI MAGAR', '5050', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5051, '5051', 'e10adc3949ba59abbe56e057f20f883e', 'EAK B. BHANIYA', '5051', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5052, '5052', 'e10adc3949ba59abbe56e057f20f883e', 'BIR B. GHATRI', '5052', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5053, '5053', 'e10adc3949ba59abbe56e057f20f883e', 'LAXMIPATI POUDHAL', '5053', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5054, '5054', 'e10adc3949ba59abbe56e057f20f883e', 'LAL B. BASHANT', '5054', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5055, '5055', 'e10adc3949ba59abbe56e057f20f883e', 'MAN B. CHOUDHARI', '5055', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5058, '5058', 'e10adc3949ba59abbe56e057f20f883e', 'DAV B. THAPA', '5058', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5059, '5059', 'e10adc3949ba59abbe56e057f20f883e', 'CHABI LAL BHANDRI', '5059', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5060, '5060', 'e10adc3949ba59abbe56e057f20f883e', 'BADRI P. SUBEDI', '5060', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5061, '5061', 'e10adc3949ba59abbe56e057f20f883e', 'DIL BAHADUR DANUWAR', '5061', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5062, '5062', 'e10adc3949ba59abbe56e057f20f883e', 'MADHAB BASNET', '5062', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5063, '5063', 'e10adc3949ba59abbe56e057f20f883e', 'DAMBAR P. RIJAL', '5063', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5064, '5064', 'e10adc3949ba59abbe56e057f20f883e', 'BALARAM PARAJULI', '5064', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5065, '5065', 'e10adc3949ba59abbe56e057f20f883e', 'RAMESWOR YADAB', '5065', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5067, '5067', 'e10adc3949ba59abbe56e057f20f883e', 'TULASHI R. GHIMARI', '5067', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5071, '5071', 'e10adc3949ba59abbe56e057f20f883e', 'MANIRAM MAHATO', '5071', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5072, '5072', 'e10adc3949ba59abbe56e057f20f883e', 'CHOTA LAL. SHA', '5072', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5073, '5073', 'e10adc3949ba59abbe56e057f20f883e', 'GOKUL B. KHATRI', '5073', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5074, '5074', 'e10adc3949ba59abbe56e057f20f883e', 'BHIMASHA P.PARAJULI', '5074', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5075, '5075', 'e10adc3949ba59abbe56e057f20f883e', 'KAPILMUNI POKHARAL', '5075', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5076, '5076', 'e10adc3949ba59abbe56e057f20f883e', 'NANDA B. KARKI', '5076', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5077, '5077', 'e10adc3949ba59abbe56e057f20f883e', 'ANANDA LAL ROUT KU.', '5077', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5078, '5078', 'e10adc3949ba59abbe56e057f20f883e', 'BISHNU P.GAWALI', '5078', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5081, '5081', 'e10adc3949ba59abbe56e057f20f883e', 'BALARAM KUTWAL', '5081', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5082, '5082', 'e10adc3949ba59abbe56e057f20f883e', 'HARIBHAKTA DHITAL', '5082', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5083, '5083', 'e10adc3949ba59abbe56e057f20f883e', 'MAG LAL GOTAMA', '5083', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5085, '5085', 'e10adc3949ba59abbe56e057f20f883e', 'MUKUNDA RAJ THKURI', '5085', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5086, '5086', 'e10adc3949ba59abbe56e057f20f883e', 'KAMILIKANTA SILWIL', '5086', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5087, '5087', 'e10adc3949ba59abbe56e057f20f883e', 'RAM KUMAR THAPA', '5087', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5089, '5089', 'e10adc3949ba59abbe56e057f20f883e', 'KUL BAHADUR SHRESTHA', '5089', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5090, '5090', 'e10adc3949ba59abbe56e057f20f883e', 'JANAK B. SHAHA', '5090', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5091, '5091', 'e10adc3949ba59abbe56e057f20f883e', 'UDDHAV PD.PANDEY', '5091', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5092, '5092', 'e10adc3949ba59abbe56e057f20f883e', 'ANIL KUMAR YADAV', '5092', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5093, '5093', 'e10adc3949ba59abbe56e057f20f883e', 'PRAKASH KANDEL', '5093', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5094, '5094', 'e10adc3949ba59abbe56e057f20f883e', 'KUMARI SHOVA', '5094', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5095, '5095', 'e10adc3949ba59abbe56e057f20f883e', 'BABURAM GYAWALI', '5095', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5096, '5096', 'e10adc3949ba59abbe56e057f20f883e', 'GHANENDRA ADHIKARI', '5096', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5097, '5097', 'e10adc3949ba59abbe56e057f20f883e', 'UDDHAB PD.KAFLE', '5097', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5098, '5098', 'e10adc3949ba59abbe56e057f20f883e', 'RAM SEBAK YADAV', '5098', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5099, '5099', 'e10adc3949ba59abbe56e057f20f883e', 'RAJENDRA PD.KHANAL', '5099', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5101, '5101', 'e10adc3949ba59abbe56e057f20f883e', 'GANESH RAJ GAULI', '5101', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5102, '5102', 'e10adc3949ba59abbe56e057f20f883e', 'RAGHU NATH NEUPANE', '5102', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5103, '5103', 'e10adc3949ba59abbe56e057f20f883e', 'JHABILAL BHATTARAI', '5103', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5104, '5104', 'e10adc3949ba59abbe56e057f20f883e', 'BHUBANESWOR DEVKOTA', '5104', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5105, '5105', 'e10adc3949ba59abbe56e057f20f883e', 'RAMESH K.BHATTARAI', '5105', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5106, '5106', 'e10adc3949ba59abbe56e057f20f883e', 'HIM LAL SUBEDI', '5106', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5107, '5107', 'e10adc3949ba59abbe56e057f20f883e', 'KULANANDA JHA', '5107', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5109, '5109', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA BAHADUR G.C.', '5109', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5110, '5110', 'e10adc3949ba59abbe56e057f20f883e', 'SHREEKANTA PANDIT', '5110', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5111, '5111', 'e10adc3949ba59abbe56e057f20f883e', 'SAGAM LAL RAYA', '5111', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5112, '5112', 'e10adc3949ba59abbe56e057f20f883e', 'PARAMESWOR CHAUDHARI', '5112', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5113, '5113', 'e10adc3949ba59abbe56e057f20f883e', 'RABINDRA K.PANDEY', '5113', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5114, '5114', 'e10adc3949ba59abbe56e057f20f883e', 'ANANTA PD.ACHARYA', '5114', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5115, '5115', '360b1f27907d20fd8d53f5c36788ab10', 'JAI NEPAL SHRESTHA', '5115', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5116, '5116', 'e10adc3949ba59abbe56e057f20f883e', 'MUKESH K.CHAUDHARI', '5116', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5117, '5117', 'e10adc3949ba59abbe56e057f20f883e', 'DINESH KOHAR', '5117', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5118, '5118', 'e10adc3949ba59abbe56e057f20f883e', 'LATU SAH HALUWAI', '5118', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5119, '5119', 'e10adc3949ba59abbe56e057f20f883e', 'BHUMINANDAN ADHIKARI', '5119', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5120, '5120', 'e10adc3949ba59abbe56e057f20f883e', 'TANK PD.BHATTARAI', '5120', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5121, '5121', 'e10adc3949ba59abbe56e057f20f883e', 'RAM BASNET', '5121', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5122, '5122', 'e10adc3949ba59abbe56e057f20f883e', 'KAMAL K.MISHRA(DHUNG', '5122', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5124, '5124', 'e10adc3949ba59abbe56e057f20f883e', 'SANGEETA SHRESTHA', '5124', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5125, '5125', 'e10adc3949ba59abbe56e057f20f883e', 'SARITA K.POKHAREL', '5125', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5126, '5126', 'e10adc3949ba59abbe56e057f20f883e', 'BHAWANI P.ACHARYA', '5126', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5127, '5127', 'e10adc3949ba59abbe56e057f20f883e', 'SHAILENDRA R.GIRI', '5127', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5128, '5128', 'e10adc3949ba59abbe56e057f20f883e', 'UDAYA KUMAR NEPAL', '5128', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5129, '5129', 'e10adc3949ba59abbe56e057f20f883e', 'SHANKAR BABU PANT', '5129', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5130, '5130', 'e10adc3949ba59abbe56e057f20f883e', 'DINESH BABU NEPAL', '5130', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5131, '5131', 'e10adc3949ba59abbe56e057f20f883e', 'MOHINI KHANAL', '5131', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5132, '5132', 'e10adc3949ba59abbe56e057f20f883e', 'DEVI PRASAD POKHAREL', '5132', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5133, '5133', 'e10adc3949ba59abbe56e057f20f883e', 'DIPAK K.KARKI', '5133', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5134, '5134', 'e10adc3949ba59abbe56e057f20f883e', 'BEGUM SHRESTHA', '5134', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5135, '5135', 'e10adc3949ba59abbe56e057f20f883e', 'DURGA PRASAD KHANAL', '5135', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5136, '5136', 'e10adc3949ba59abbe56e057f20f883e', 'ANIL KUMAR POKHAREL', '5136', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5137, '5137', 'e10adc3949ba59abbe56e057f20f883e', 'PAPPU BABU SHRESTHA', '5137', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5138, '5138', 'e10adc3949ba59abbe56e057f20f883e', 'HARI PRASAD ADHIKARI', '5138', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5139, '5139', 'e10adc3949ba59abbe56e057f20f883e', 'YADAV PD.POKHAREL', '5139', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5140, '5140', 'e10adc3949ba59abbe56e057f20f883e', 'TANKA P. POKHAREL', '5140', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5141, '5141', 'e10adc3949ba59abbe56e057f20f883e', 'HARISHCHANDRA YADAV', '5141', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5142, '5142', 'e10adc3949ba59abbe56e057f20f883e', 'KAJI RAM THAPA', '5142', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5144, '5144', 'e10adc3949ba59abbe56e057f20f883e', 'TARA NATH KANDEL', '5144', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5145, '5145', 'e10adc3949ba59abbe56e057f20f883e', 'JHANKA PD.ADHIKARI', '5145', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5146, '5146', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA PD.NEPAL', '5146', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5147, '5147', 'e10adc3949ba59abbe56e057f20f883e', 'SHASHIKALA DAHAL', '5147', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5148, '5148', 'e10adc3949ba59abbe56e057f20f883e', 'ATMA DEV BANSKOTA', '5148', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5150, '5150', 'e10adc3949ba59abbe56e057f20f883e', 'JANAK RAJ JOSHI', '5150', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5151, '5151', 'e10adc3949ba59abbe56e057f20f883e', 'BHOLA N. SHARMA', '5151', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5152, '5152', 'e10adc3949ba59abbe56e057f20f883e', 'BABU RAM DEVKOTA', '5152', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5153, '5153', 'e10adc3949ba59abbe56e057f20f883e', 'SANJAY RAJ SHRESTHA', '5153', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5154, '5154', 'e10adc3949ba59abbe56e057f20f883e', 'BHIM PRASAD SUBEDI', '5154', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5155, '5155', 'e10adc3949ba59abbe56e057f20f883e', 'GYANMANI DHAKAL', '5155', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5157, '5157', 'e10adc3949ba59abbe56e057f20f883e', 'PUNARAM KHASU', '5157', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5159, '5159', 'e10adc3949ba59abbe56e057f20f883e', 'MADAN RAJ CHAPAGAIN', '5159', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5160, '5160', 'e10adc3949ba59abbe56e057f20f883e', 'CHET NARAYAN SAPKOTA', '5160', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5161, '5161', 'e10adc3949ba59abbe56e057f20f883e', 'SANJEEV K. UPRETI', '5161', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5162, '5162', 'e10adc3949ba59abbe56e057f20f883e', 'BADRI P DULAL', '5162', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5163, '5163', 'e10adc3949ba59abbe56e057f20f883e', 'KEDAR N. DHITAL', '5163', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5164, '5164', 'e10adc3949ba59abbe56e057f20f883e', 'BABURAM KHATRI', '5164', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5165, '5165', 'e10adc3949ba59abbe56e057f20f883e', 'VIJAYA MAN SHRESTHA', '5165', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5166, '5166', 'e10adc3949ba59abbe56e057f20f883e', 'NARAYAN PD. NEPAL', '5166', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5167, '5167', 'e10adc3949ba59abbe56e057f20f883e', 'MOHAN KUMAR THAPA', '5167', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5168, '5168', 'e10adc3949ba59abbe56e057f20f883e', 'BHESH BAHADUR G.C', '5168', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5169, '5169', 'e10adc3949ba59abbe56e057f20f883e', 'UMESH BDR. RANA', '5169', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5170, '5170', 'e10adc3949ba59abbe56e057f20f883e', 'NIRMAL PD.UPADHYAYA', '5170', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5171, '5171', 'e10adc3949ba59abbe56e057f20f883e', 'NIRMAL RAJ KOIRALA', '5171', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5172, '5172', 'e10adc3949ba59abbe56e057f20f883e', 'TEJMAN S. BHANDARI', '5172', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5173, '5173', 'e10adc3949ba59abbe56e057f20f883e', 'OM PRASAD PANTHI', '5173', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5174, '5174', 'e10adc3949ba59abbe56e057f20f883e', 'CHIRANJIBI BASYAL', '5174', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5175, '5175', 'e10adc3949ba59abbe56e057f20f883e', 'DEVI BAHADUR THAPA', '5175', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5176, '5176', 'e10adc3949ba59abbe56e057f20f883e', 'GANESH MAHATO', '5176', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5178, '5178', 'e10adc3949ba59abbe56e057f20f883e', 'PRAMOD CHAUDHARY', '5178', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5182, '5182', 'e10adc3949ba59abbe56e057f20f883e', 'AGYA P. NEUPANE', '5182', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5183, '5183', 'e10adc3949ba59abbe56e057f20f883e', 'PREM K. SHRESTHA', '5183', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5184, '5184', 'e10adc3949ba59abbe56e057f20f883e', 'LATA ADHIKARI BARAL', '5184', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5185, '5185', 'e10adc3949ba59abbe56e057f20f883e', 'BHUMA S.P.G.MAGAR', '5185', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5186, '5186', 'e10adc3949ba59abbe56e057f20f883e', 'BHIMA PANDEY', '5186', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5187, '5187', 'e10adc3949ba59abbe56e057f20f883e', 'PUNNA SHARMA POKHREL', '5187', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5188, '5188', 'e10adc3949ba59abbe56e057f20f883e', 'SHANTA POKHAREL NEU.', '5188', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5189, '5189', 'e10adc3949ba59abbe56e057f20f883e', 'ARUNA MALLA', '5189', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5190, '5190', 'e10adc3949ba59abbe56e057f20f883e', 'TIKA KALA SHARMA', '5190', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5191, '5191', 'e10adc3949ba59abbe56e057f20f883e', 'RADHA B.BHATTARAI', '5191', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5192, '5192', 'e10adc3949ba59abbe56e057f20f883e', 'GITA KUMARI PANTHI', '5192', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5194, '5194', 'e10adc3949ba59abbe56e057f20f883e', 'BIMALA NEUPANE PYAK.', '5194', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5195, '5195', 'e10adc3949ba59abbe56e057f20f883e', 'MAMATA K.DUTTA', '5195', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5196, '5196', 'e10adc3949ba59abbe56e057f20f883e', 'DURGA DEVI SHARMA', '5196', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5197, '5197', 'e10adc3949ba59abbe56e057f20f883e', 'NIRMALA K.GAUTAM', '5197', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5198, '5198', 'e10adc3949ba59abbe56e057f20f883e', 'SITA CHAUDHARY', '5198', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5199, '5199', 'e10adc3949ba59abbe56e057f20f883e', 'TARA K.CHAUDHARY', '5199', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5200, '5200', 'e10adc3949ba59abbe56e057f20f883e', 'MINA KOIRALA', '5200', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5201, '5201', 'e10adc3949ba59abbe56e057f20f883e', 'MANJU SHAH', '5201', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5203, '5203', 'e10adc3949ba59abbe56e057f20f883e', 'LILADHAR BHATTA', '5203', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5204, '5204', 'e10adc3949ba59abbe56e057f20f883e', 'SHAMBHU HARI SHARMA', '5204', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5205, '5205', 'e10adc3949ba59abbe56e057f20f883e', 'GOPAL PD.PAUDEL', '5205', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5206, '5206', 'e10adc3949ba59abbe56e057f20f883e', 'KARUN C.GHIMIRE', '5206', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5207, '5207', 'e10adc3949ba59abbe56e057f20f883e', 'DIPAK BARAKOTI', '5207', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5208, '5208', 'e10adc3949ba59abbe56e057f20f883e', 'BACHCHU KHADKA', '5208', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5209, '5209', 'e10adc3949ba59abbe56e057f20f883e', 'PUSHPA SHARMA ARYAL', '5209', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5210, '5210', 'e10adc3949ba59abbe56e057f20f883e', 'PRAMOD THAPA', '5210', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5211, '5211', 'e10adc3949ba59abbe56e057f20f883e', 'RAM BD.KHADKA', '5211', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5212, '5212', 'e10adc3949ba59abbe56e057f20f883e', 'SHIVA PD.CHAUDHARY', '5212', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5214, '5214', 'e10adc3949ba59abbe56e057f20f883e', 'LILA DHWOJ BASNET', '5214', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5216, '5216', 'e10adc3949ba59abbe56e057f20f883e', 'TILAK N.KOIRALA', '5216', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5217, '5217', 'e10adc3949ba59abbe56e057f20f883e', 'SUDIL GHIMIRE', '5217', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5219, '5219', 'e10adc3949ba59abbe56e057f20f883e', 'DIRGA B. ARYAL', '5219', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5220, '5220', 'e10adc3949ba59abbe56e057f20f883e', 'BASU ADHIKARI', '5220', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5221, '5221', 'e10adc3949ba59abbe56e057f20f883e', 'MIN RAJ POKHAREL', '5221', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin');
INSERT INTO `tblextuser` (`user_id`, `logon_name`, `user_pass`, `user_name`, `staff_code`, `company_id`, `group_policy`, `start_date`, `end_date`, `status`, `input_date`, `inputter`, `authorizer`) VALUES
(5222, '5222', 'e10adc3949ba59abbe56e057f20f883e', 'SAI MUNAL POKHAREL', '5222', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5223, '5223', 'e10adc3949ba59abbe56e057f20f883e', 'GIRIDHARI PAUDEL', '5223', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5224, '5224', 'e10adc3949ba59abbe56e057f20f883e', 'RUKMINI BHATTA(UPAD)', '5224', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5226, '5226', 'e10adc3949ba59abbe56e057f20f883e', 'SUNDAR P. KHATIWADA', '5226', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5227, '5227', 'e10adc3949ba59abbe56e057f20f883e', 'GANESH BHADUR D.C.', '5227', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5228, '5228', 'e10adc3949ba59abbe56e057f20f883e', 'AJAYA K. RIMAL', '5228', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5229, '5229', 'e10adc3949ba59abbe56e057f20f883e', 'JIVAN ACHARYA', '5229', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5230, '5230', 'e10adc3949ba59abbe56e057f20f883e', 'CHANDRA M. PAUDEL', '5230', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5231, '5231', 'e10adc3949ba59abbe56e057f20f883e', 'SUNIL DHAKAL', '5231', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5232, '5232', 'e10adc3949ba59abbe56e057f20f883e', 'KUMAR RUPAKHETI', '5232', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5234, '5234', 'e10adc3949ba59abbe56e057f20f883e', 'JAYA DEV DHAKAL', '5234', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5235, '5235', 'e10adc3949ba59abbe56e057f20f883e', 'ASHOK K. BHAGAT', '5235', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5236, '5236', 'e10adc3949ba59abbe56e057f20f883e', 'JHARENDRA D POKHAREL', '5236', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5237, '5237', 'e10adc3949ba59abbe56e057f20f883e', 'AMOD LAL KARNA', '5237', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5240, '5240', 'e10adc3949ba59abbe56e057f20f883e', 'LAXMI N. MAJHI', '5240', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5241, '5241', 'e10adc3949ba59abbe56e057f20f883e', 'PANKAJ K. GAUTAM', '5241', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5243, '5243', 'e10adc3949ba59abbe56e057f20f883e', 'PRAKESH ARYAL', '5243', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5244, '5244', 'e10adc3949ba59abbe56e057f20f883e', 'DURGA P. DAHAL', '5244', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5245, '5245', 'e10adc3949ba59abbe56e057f20f883e', 'DHURBA PAUDEL', '5245', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5246, '5246', 'e10adc3949ba59abbe56e057f20f883e', 'SUDIP BHAKTA ACHARYA', '5246', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5247, '5247', 'e10adc3949ba59abbe56e057f20f883e', 'HARI P. ADHIKARI', '5247', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5248, '5248', 'e10adc3949ba59abbe56e057f20f883e', 'BED MAYA PATHAK(SKT)', '5248', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5249, '5249', 'e10adc3949ba59abbe56e057f20f883e', 'KEDAR ADHIKARI', '5249', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5250, '5250', 'e10adc3949ba59abbe56e057f20f883e', 'SUNIL P. UPADHAYA', '5250', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5253, '5253', 'e10adc3949ba59abbe56e057f20f883e', 'KALPANA NEPAL', '5253', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5254, '5254', 'e10adc3949ba59abbe56e057f20f883e', 'SURSHYAM MAJHI', '5254', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5255, '5255', 'e10adc3949ba59abbe56e057f20f883e', 'KAMAL OJHA', '5255', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5258, '5258', 'e10adc3949ba59abbe56e057f20f883e', 'DHURBA C. GAUTAM', '5258', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5259, '5259', 'e10adc3949ba59abbe56e057f20f883e', 'BABU KAJI THAPA', '5259', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5260, '5260', 'e10adc3949ba59abbe56e057f20f883e', 'NABIN K. PAKHRIN', '5260', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5261, '5261', 'e10adc3949ba59abbe56e057f20f883e', 'CHANDRA S.THAPAMAGAR', '5261', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5262, '5262', 'e10adc3949ba59abbe56e057f20f883e', 'RANJAN KHANAL', '5262', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5263, '5263', 'e10adc3949ba59abbe56e057f20f883e', 'ANUPA KC PRASAIN', '5263', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5264, '5264', 'e10adc3949ba59abbe56e057f20f883e', 'ANOJ BASNET', '5264', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5265, '5265', 'e10adc3949ba59abbe56e057f20f883e', 'SUDIP K. DAHAL', '5265', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5266, '5266', 'e10adc3949ba59abbe56e057f20f883e', 'YOGENDRA B. SINGH', '5266', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5268, '5268', 'e10adc3949ba59abbe56e057f20f883e', 'SIYA RAM CHAUDHARY', '5268', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5269, '5269', 'e10adc3949ba59abbe56e057f20f883e', 'BINA SHARMA', '5269', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5270, '5270', 'e10adc3949ba59abbe56e057f20f883e', 'MADHAV RIJAL', '5270', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5271, '5271', 'e10adc3949ba59abbe56e057f20f883e', 'SAROJ K. SHAH', '5271', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5272, '5272', 'e10adc3949ba59abbe56e057f20f883e', 'NIKU ACHARYA', '5272', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5273, '5273', 'e10adc3949ba59abbe56e057f20f883e', 'KASHI R. KANDEL', '5273', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5275, '5275', 'e10adc3949ba59abbe56e057f20f883e', 'KHURSED AHAMAD', '5275', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5276, '5276', 'e10adc3949ba59abbe56e057f20f883e', 'RAJESH K. SHRIBASTAB', '5276', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5277, '5277', 'e10adc3949ba59abbe56e057f20f883e', 'DEVENDRA YADAV', '5277', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5278, '5278', 'e10adc3949ba59abbe56e057f20f883e', 'HARKA M. CHAUHAN', '5278', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5279, '5279', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA K.R.PAUDEL', '5279', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5280, '5280', 'e10adc3949ba59abbe56e057f20f883e', 'SUSHILA SAPKOTA', '5280', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5281, '5281', 'e10adc3949ba59abbe56e057f20f883e', 'SABITA ADHIKARI', '5281', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5282, '5282', 'e10adc3949ba59abbe56e057f20f883e', 'GAYATRI SUBEDI', '5282', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5283, '5283', 'e10adc3949ba59abbe56e057f20f883e', 'MINA KUNWAR', '5283', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5284, '5284', 'e10adc3949ba59abbe56e057f20f883e', 'DIL KUMARI PARAJULI', '5284', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5285, '5285', 'e10adc3949ba59abbe56e057f20f883e', 'SUSAMA ACHARYA', '5285', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5286, '5286', 'e10adc3949ba59abbe56e057f20f883e', 'LILA G.C.', '5286', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5287, '5287', 'e10adc3949ba59abbe56e057f20f883e', 'USHA KUMARI RANA', '5287', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5288, '5288', 'e10adc3949ba59abbe56e057f20f883e', 'JANAKA DANGI', '5288', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5289, '5289', 'e10adc3949ba59abbe56e057f20f883e', 'BHAWANI GHIMIRE', '5289', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5290, '5290', 'e10adc3949ba59abbe56e057f20f883e', 'SUNITA KOIRALA', '5290', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5291, '5291', 'e10adc3949ba59abbe56e057f20f883e', 'PARBATI KHATIW RIMAL', '5291', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5292, '5292', 'e10adc3949ba59abbe56e057f20f883e', 'MANJULA KUMARI KARNA', '5292', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5293, '5293', 'e10adc3949ba59abbe56e057f20f883e', 'AMBIKA ADHIKARI', '5293', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5294, '5294', 'e10adc3949ba59abbe56e057f20f883e', 'GANGA ACHARYA NEPAL', '5294', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5296, '5296', 'e10adc3949ba59abbe56e057f20f883e', 'PREM K. RAI', '5296', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5298, '5298', 'e10adc3949ba59abbe56e057f20f883e', 'GYANU MAYA PATHAK', '5298', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5299, '5299', 'e10adc3949ba59abbe56e057f20f883e', 'SHARADA K. DHAKAL', '5299', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5301, '5301', 'e10adc3949ba59abbe56e057f20f883e', 'SARASWOTI SITAULA', '5301', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5302, '5302', 'e10adc3949ba59abbe56e057f20f883e', 'DEBAKI DANGOL', '5302', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5303, '5303', 'e10adc3949ba59abbe56e057f20f883e', 'CHANDRA K. BHANDARI', '5303', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5304, '5304', 'e10adc3949ba59abbe56e057f20f883e', 'BISHNU K. KARKI', '5304', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5305, '5305', 'e10adc3949ba59abbe56e057f20f883e', 'BIJULI MAYA SHRESTHA', '5305', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5306, '5306', 'e10adc3949ba59abbe56e057f20f883e', 'SAMITA DEVI SHRESTHA', '5306', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5307, '5307', 'e10adc3949ba59abbe56e057f20f883e', 'KAMALA SHRISH', '5307', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5308, '5308', 'e10adc3949ba59abbe56e057f20f883e', 'TIMALA BIDHAYA', '5308', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5309, '5309', 'e10adc3949ba59abbe56e057f20f883e', 'UMA DEVI SUBEDI', '5309', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5310, '5310', 'e10adc3949ba59abbe56e057f20f883e', 'PRATAP SUBEDI', '5310', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5311, '5311', 'e10adc3949ba59abbe56e057f20f883e', 'RAMESH GIRI', '5311', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5312, '5312', 'e10adc3949ba59abbe56e057f20f883e', 'SUSHIL HUMAGAIN', '5312', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5313, '5313', 'e10adc3949ba59abbe56e057f20f883e', 'TARA NATH PANDEY', '5313', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5314, '5314', 'e10adc3949ba59abbe56e057f20f883e', 'GOKUL P. PANERU', '5314', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5315, '5315', 'e10adc3949ba59abbe56e057f20f883e', 'RAJENDRA RANABHAT', '5315', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5316, '5316', 'e10adc3949ba59abbe56e057f20f883e', 'DALENDRA THAPA', '5316', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5317, '5317', 'e10adc3949ba59abbe56e057f20f883e', 'TILAK PRADHAN', '5317', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5318, '5318', 'e10adc3949ba59abbe56e057f20f883e', 'URMILA RAI', '5318', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5319, '5319', 'e10adc3949ba59abbe56e057f20f883e', 'SHANTI RAM BHATTRAI', '5319', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5320, '5320', 'e10adc3949ba59abbe56e057f20f883e', 'GITA D. SHRESTHA', '5320', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5321, '5321', 'e10adc3949ba59abbe56e057f20f883e', 'BIRENDRA S. MAHATA', '5321', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5322, '5322', 'e10adc3949ba59abbe56e057f20f883e', 'SURYA P. DAHAL', '5322', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5323, '5323', 'e10adc3949ba59abbe56e057f20f883e', 'KALPANA SHRESTHA', '5323', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5324, '5324', 'e10adc3949ba59abbe56e057f20f883e', 'NANI RAM DHUNGEL', '5324', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5325, '5325', 'e10adc3949ba59abbe56e057f20f883e', 'BHAKTA B. R. MAGAR', '5325', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5326, '5326', 'e10adc3949ba59abbe56e057f20f883e', 'PHARSU R. ACHARYA', '5326', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5327, '5327', 'e10adc3949ba59abbe56e057f20f883e', 'SHRIRAM K.C.', '5327', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5328, '5328', 'e10adc3949ba59abbe56e057f20f883e', 'EAK KRISHNA ADHIKARI', '5328', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5329, '5329', 'e10adc3949ba59abbe56e057f20f883e', 'UMESH P. SUBEDI', '5329', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5330, '5330', 'e10adc3949ba59abbe56e057f20f883e', 'RAM B. YADAB', '5330', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5331, '5331', 'e10adc3949ba59abbe56e057f20f883e', 'TARA RIJAL', '5331', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5332, '5332', 'e10adc3949ba59abbe56e057f20f883e', 'RAJENDRA SHAH', '5332', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5333, '5333', 'e10adc3949ba59abbe56e057f20f883e', 'BIR BHADUR G.C.', '5333', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5334, '5334', 'e10adc3949ba59abbe56e057f20f883e', 'MEKHA K. BASNET', '5334', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5335, '5335', 'e10adc3949ba59abbe56e057f20f883e', 'DASRATH MAHATO', '5335', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5336, '5336', 'e10adc3949ba59abbe56e057f20f883e', 'ARUN K. S. THAKURI', '5336', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5337, '5337', 'e10adc3949ba59abbe56e057f20f883e', 'HARISHARAN PANTA', '5337', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5338, '5338', 'e10adc3949ba59abbe56e057f20f883e', 'CHIRANJIBI MISHRA', '5338', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5340, '5340', 'e10adc3949ba59abbe56e057f20f883e', 'PUJARI JAISHWAL', '5340', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5342, '5342', 'e10adc3949ba59abbe56e057f20f883e', 'SHREERAM MAHASETH', '5342', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5345, '5345', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA NAKARMI', '5345', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5346, '5346', 'e10adc3949ba59abbe56e057f20f883e', 'JAGADISHWOR PANTHY', '5346', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5347, '5347', 'e10adc3949ba59abbe56e057f20f883e', 'ROHIT B. JIREL', '5347', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5348, '5348', 'e10adc3949ba59abbe56e057f20f883e', 'ASHOK LAMSAL', '5348', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5351, '5351', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA P. DHAKAL', '5351', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5352, '5352', 'e10adc3949ba59abbe56e057f20f883e', 'SURYA P. GAIRAI', '5352', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5353, '5353', 'e10adc3949ba59abbe56e057f20f883e', 'NAWA RAJ BARAL', '5353', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5355, '5355', 'e10adc3949ba59abbe56e057f20f883e', 'UPENDRA BHATTA', '5355', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5356, '5356', 'e10adc3949ba59abbe56e057f20f883e', 'SURYA B. BHANDARI', '5356', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5358, '5358', 'e10adc3949ba59abbe56e057f20f883e', 'KAUSILA BOGATI', '5358', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5359, '5359', 'e10adc3949ba59abbe56e057f20f883e', 'DIPAK P. LEKHAK', '5359', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5360, '5360', 'e10adc3949ba59abbe56e057f20f883e', 'SARMILA CHAUDHARI', '5360', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5361, '5361', 'e10adc3949ba59abbe56e057f20f883e', 'SURYA ADHIKARI', '5361', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5363, '5363', 'e10adc3949ba59abbe56e057f20f883e', 'KOMAL P. SITOULA', '5363', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5364, '5364', 'e10adc3949ba59abbe56e057f20f883e', 'DINESH P. SHAHA', '5364', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5365, '5365', 'e10adc3949ba59abbe56e057f20f883e', 'NARAYAN LAL SHRESTHA', '5365', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5366, '5366', 'e10adc3949ba59abbe56e057f20f883e', 'KHEM RAJ KAPHLE', '5366', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5368, '5368', 'e10adc3949ba59abbe56e057f20f883e', 'SUNIL K. SHAHA', '5368', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5369, '5369', 'e10adc3949ba59abbe56e057f20f883e', 'GOBINDA P. JOSHI', '5369', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5370, '5370', 'e10adc3949ba59abbe56e057f20f883e', 'SUDAN SILWAL', '5370', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5371, '5371', 'e10adc3949ba59abbe56e057f20f883e', 'TACHHYAK RAY', '5371', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5373, '5373', 'e10adc3949ba59abbe56e057f20f883e', 'UGRASEN KHAN', '5373', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5374, '5374', 'e10adc3949ba59abbe56e057f20f883e', 'SANTIRAM GHIMERE', '5374', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5376, '5376', 'e10adc3949ba59abbe56e057f20f883e', 'MOHAMAD AHASANULLAHA', '5376', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5377, '5377', 'e10adc3949ba59abbe56e057f20f883e', 'THAKUR P. OJHA', '5377', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5378, '5378', 'e10adc3949ba59abbe56e057f20f883e', 'HIM LAL SHRESTHA', '5378', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5379, '5379', 'e10adc3949ba59abbe56e057f20f883e', 'SURESH THAPA', '5379', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5380, '5380', 'e10adc3949ba59abbe56e057f20f883e', 'JAGDISH ARYAL', '5380', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5381, '5381', 'e10adc3949ba59abbe56e057f20f883e', 'SANDHYA SUBEDI(ACH.)', '5381', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5382, '5382', 'e10adc3949ba59abbe56e057f20f883e', 'SAMMRIDI KARKI', '5382', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5383, '5383', 'e10adc3949ba59abbe56e057f20f883e', 'DHARMANANDA AWASTHI', '5383', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5384, '5384', 'e10adc3949ba59abbe56e057f20f883e', 'PAWAN K. MAHAT', '5384', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5385, '5385', 'e10adc3949ba59abbe56e057f20f883e', 'CHIRANJIBI D.C.', '5385', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5387, '5387', 'e10adc3949ba59abbe56e057f20f883e', 'HARI P. PAUDEL', '5387', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5388, '5388', 'e10adc3949ba59abbe56e057f20f883e', 'PRABIN SUBEDI', '5388', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5389, '5389', 'e10adc3949ba59abbe56e057f20f883e', 'CHHABI L. DHAKAL', '5389', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5390, '5390', 'e10adc3949ba59abbe56e057f20f883e', 'ARJUN DULAL', '5390', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5391, '5391', 'e10adc3949ba59abbe56e057f20f883e', 'KESHAB RAJ WAGLEY', '5391', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5392, '5392', 'e10adc3949ba59abbe56e057f20f883e', 'SITARAM KHANAL', '5392', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5394, '5394', 'e10adc3949ba59abbe56e057f20f883e', 'PADAM LAL PURI', '5394', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5395, '5395', 'e10adc3949ba59abbe56e057f20f883e', 'GOBINDA P. SITAULA', '5395', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5396, '5396', 'e10adc3949ba59abbe56e057f20f883e', 'SURESH B. SIJAPATI', '5396', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5397, '5397', 'e10adc3949ba59abbe56e057f20f883e', 'MANOJ RAJ SHARMA', '5397', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5399, '5399', 'e10adc3949ba59abbe56e057f20f883e', 'RAMESH GAUTAM', '5399', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5401, '5401', 'e10adc3949ba59abbe56e057f20f883e', 'MENUKA ADHI POKHREL', '5401', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5402, '5402', 'e10adc3949ba59abbe56e057f20f883e', 'RAMESH P. MISHRA', '5402', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5403, '5403', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA P. PANTA', '5403', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5404, '5404', 'e10adc3949ba59abbe56e057f20f883e', 'GIRISH B. BAM', '5404', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5406, '5406', 'e10adc3949ba59abbe56e057f20f883e', 'HIMALAYA BISTA', '5406', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5407, '5407', 'e10adc3949ba59abbe56e057f20f883e', 'NARENDRA B. MALLA', '5407', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5408, '5408', 'e10adc3949ba59abbe56e057f20f883e', 'DHRUBA KUINKEL', '5408', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5409, '5409', 'e10adc3949ba59abbe56e057f20f883e', 'MAHESHWAR ACHARYA', '5409', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5410, '5410', 'e10adc3949ba59abbe56e057f20f883e', 'SURESH P. BHATTRAI', '5410', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5411, '5411', 'e10adc3949ba59abbe56e057f20f883e', 'SAROJ K. MAHARJAN', '5411', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5412, '5412', 'e10adc3949ba59abbe56e057f20f883e', 'SAROJ MAHAT', '5412', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5413, '5413', 'e10adc3949ba59abbe56e057f20f883e', 'MIN DATTA DHUNGANA', '5413', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5414, '5414', 'e10adc3949ba59abbe56e057f20f883e', 'NIRAJ NEUPANE', '5414', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5415, '5415', 'e10adc3949ba59abbe56e057f20f883e', 'SURAJ MAHAT', '5415', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5417, '5417', 'e10adc3949ba59abbe56e057f20f883e', 'MANOJ K. BHATTRAI', '5417', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5418, '5418', 'e10adc3949ba59abbe56e057f20f883e', 'YAM P. NIRAULA', '5418', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5419, '5419', 'e10adc3949ba59abbe56e057f20f883e', 'KAMAL P. RAJBANSI', '5419', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5420, '5420', 'e10adc3949ba59abbe56e057f20f883e', 'NITU DHUNGEL', '5420', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5421, '5421', 'e10adc3949ba59abbe56e057f20f883e', 'SIDDA RAJ PANDEY', '5421', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5422, '5422', 'e10adc3949ba59abbe56e057f20f883e', 'TIKA RAJ DULAL', '5422', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5423, '5423', 'e10adc3949ba59abbe56e057f20f883e', 'DINESH K. DHAMALA', '5423', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5424, '5424', 'e10adc3949ba59abbe56e057f20f883e', 'KAJAN KHANAL', '5424', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5427, '5427', 'e10adc3949ba59abbe56e057f20f883e', 'KAMAL P. REGMI', '5427', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5428, '5428', 'e10adc3949ba59abbe56e057f20f883e', 'SANJIB KOIRALA', '5428', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5429, '5429', 'e10adc3949ba59abbe56e057f20f883e', 'SURAJ K. POKHAREL', '5429', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5430, '5430', 'e10adc3949ba59abbe56e057f20f883e', 'SRIJANA SHARMA', '5430', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5431, '5431', 'e10adc3949ba59abbe56e057f20f883e', 'AMBER B. THAPA', '5431', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5432, '5432', 'e10adc3949ba59abbe56e057f20f883e', 'DURGA P. GHIMERE', '5432', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5433, '5433', 'e10adc3949ba59abbe56e057f20f883e', 'NIRMALA PAUDEL(RIS.)', '5433', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5438, '5438', 'e10adc3949ba59abbe56e057f20f883e', 'HARI P. MAINALI', '5438', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5439, '5439', 'e10adc3949ba59abbe56e057f20f883e', 'DEBENDRA ADHIKARI', '5439', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5440, '5440', 'e10adc3949ba59abbe56e057f20f883e', 'MANDAKINI ACHARYA', '5440', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5441, '5441', 'e10adc3949ba59abbe56e057f20f883e', 'DHARMA S. AIRI', '5441', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5442, '5442', 'e10adc3949ba59abbe56e057f20f883e', 'NARAYAN B. GURUNG', '5442', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5443, '5443', 'e10adc3949ba59abbe56e057f20f883e', 'AMOD P. SHAHA', '5443', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5444, '5444', 'e10adc3949ba59abbe56e057f20f883e', 'SHOVA BASNET', '5444', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5445, '5445', 'e10adc3949ba59abbe56e057f20f883e', 'DIL BAHADUR SHRESTHA', '5445', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5446, '5446', 'e10adc3949ba59abbe56e057f20f883e', 'DEB NARAYAN KHAREL', '5446', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5447, '5447', 'e10adc3949ba59abbe56e057f20f883e', 'RITI KARKI', '5447', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5448, '5448', 'e10adc3949ba59abbe56e057f20f883e', 'KALPANA K.C.', '5448', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5449, '5449', 'e10adc3949ba59abbe56e057f20f883e', 'NANDA RAM ADHIKARI', '5449', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5450, '5450', 'e10adc3949ba59abbe56e057f20f883e', 'RAMESH K. RAWAL', '5450', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5451, '5451', 'e10adc3949ba59abbe56e057f20f883e', 'SHYAM BISTA', '5451', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5453, '5453', 'e10adc3949ba59abbe56e057f20f883e', 'RAJ K. BISHOKARMA', '5453', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5454, '5454', 'e10adc3949ba59abbe56e057f20f883e', 'NAWA RAJ KHADKA', '5454', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5455, '5455', 'e10adc3949ba59abbe56e057f20f883e', 'REKHA KHADKA BASNET', '5455', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5456, '5456', 'e10adc3949ba59abbe56e057f20f883e', 'MEGHA SIGDEL', '5456', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5457, '5457', 'e10adc3949ba59abbe56e057f20f883e', 'SHYAM LAL SHRESTHA', '5457', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5458, '5458', 'e10adc3949ba59abbe56e057f20f883e', 'LAXMI DAHAL', '5458', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5459, '5459', 'e10adc3949ba59abbe56e057f20f883e', 'KARUNA HAMAL', '5459', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5460, '5460', 'e10adc3949ba59abbe56e057f20f883e', 'RAM B. RAWAL', '5460', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5461, '5461', 'e10adc3949ba59abbe56e057f20f883e', 'RAM RAJ SHRESTHA', '5461', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5462, '5462', 'e10adc3949ba59abbe56e057f20f883e', 'PRADIP MISHRA', '5462', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5463, '5463', 'e10adc3949ba59abbe56e057f20f883e', 'MANOJ K. KHAWAS', '5463', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5464, '5464', 'e10adc3949ba59abbe56e057f20f883e', 'BIJAYA LAXMI JOSHI', '5464', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5465, '5465', 'e10adc3949ba59abbe56e057f20f883e', 'BAL B. SAUD', '5465', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5466, '5466', 'e10adc3949ba59abbe56e057f20f883e', 'RAM CHANDRA BOHARA', '5466', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5467, '5467', 'e10adc3949ba59abbe56e057f20f883e', 'RAM B. KHATRI', '5467', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5469, '5469', 'e10adc3949ba59abbe56e057f20f883e', 'PRAKESH PANDEY', '5469', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5471, '5471', 'e10adc3949ba59abbe56e057f20f883e', 'NAWA RAJ SATYAL', '5471', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5472, '5472', 'e10adc3949ba59abbe56e057f20f883e', 'BINOD K.C.', '5472', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5473, '5473', 'e10adc3949ba59abbe56e057f20f883e', 'DHUNDI RAJ DAHAL', '5473', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5474, '5474', 'e10adc3949ba59abbe56e057f20f883e', 'MAHESHWAR MARAHATTA', '5474', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5475, '5475', 'e10adc3949ba59abbe56e057f20f883e', 'PAWAN K. RIJAL', '5475', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5476, '5476', 'e10adc3949ba59abbe56e057f20f883e', 'PADAM LAL PANDEY', '5476', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5477, '5477', 'e10adc3949ba59abbe56e057f20f883e', 'INDIRA K.C.', '5477', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5478, '5478', 'e10adc3949ba59abbe56e057f20f883e', 'GANESH S. SHRESTH', '5478', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5479, '5479', 'e10adc3949ba59abbe56e057f20f883e', 'BIKRAM SINGH', '5479', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5481, '5481', 'e10adc3949ba59abbe56e057f20f883e', 'NAWARAJ GAUTAM', '5481', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5482, '5482', 'e10adc3949ba59abbe56e057f20f883e', 'JAYARAM SHARMA', '5482', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5483, '5483', 'e10adc3949ba59abbe56e057f20f883e', 'PREM P. KHANAL', '5483', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5484, '5484', 'e10adc3949ba59abbe56e057f20f883e', 'BHARAT PARAJULI', '5484', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5485, '5485', 'e10adc3949ba59abbe56e057f20f883e', 'KAPIL GYAWALI', '5485', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5487, '5487', 'e10adc3949ba59abbe56e057f20f883e', 'DHARMA RAJ GUPTA', '5487', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5488, '5488', 'e10adc3949ba59abbe56e057f20f883e', 'BIJAYA B. SINGH', '5488', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5489, '5489', 'e10adc3949ba59abbe56e057f20f883e', 'LAXMI N. CHAUDHARI', '5489', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5490, '5490', 'e10adc3949ba59abbe56e057f20f883e', 'JAGDISH BARAI', '5490', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5491, '5491', 'e10adc3949ba59abbe56e057f20f883e', 'LAXMI P. YADAV', '5491', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5492, '5492', 'e10adc3949ba59abbe56e057f20f883e', 'MRITUNJAYA K.TRIPATH', '5492', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5493, '5493', 'e10adc3949ba59abbe56e057f20f883e', 'BINOD K. PANDEY', '5493', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5494, '5494', 'e10adc3949ba59abbe56e057f20f883e', 'DIPAK THAPA', '5494', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5495, '5495', 'e10adc3949ba59abbe56e057f20f883e', 'RAM NIWAS CHAUDHARI', '5495', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5496, '5496', 'e10adc3949ba59abbe56e057f20f883e', 'GOPAL BARAL', '5496', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5497, '5497', 'e10adc3949ba59abbe56e057f20f883e', 'SHRWAN K. PANDEY', '5497', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5498, '5498', 'e10adc3949ba59abbe56e057f20f883e', 'RUKMAGAT BHATTARI', '5498', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5499, '5499', 'e10adc3949ba59abbe56e057f20f883e', 'BISHNUPAL BOHARA', '5499', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5500, '5500', 'e10adc3949ba59abbe56e057f20f883e', 'SITA DEVI KAFLEY', '5500', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5501, '5501', 'e10adc3949ba59abbe56e057f20f883e', 'YAM P. ACHARYA', '5501', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5502, '5502', 'e10adc3949ba59abbe56e057f20f883e', 'BHUBANESWOR PANDEY', '5502', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5503, '5503', 'e10adc3949ba59abbe56e057f20f883e', 'RAMNATH P. GUPTA', '5503', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5504, '5504', 'e10adc3949ba59abbe56e057f20f883e', 'RAJ K. RAI', '5504', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5506, '5506', 'e10adc3949ba59abbe56e057f20f883e', 'RATNA B. CHHETRI', '5506', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5507, '5507', 'e10adc3949ba59abbe56e057f20f883e', 'SHIBENDRA JHA', '5507', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5508, '5508', 'e10adc3949ba59abbe56e057f20f883e', 'PRAMOD K. UPADHAYA', '5508', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5509, '5509', 'e10adc3949ba59abbe56e057f20f883e', 'DIRGAJUNG LIMBU', '5509', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5511, '5511', 'e10adc3949ba59abbe56e057f20f883e', 'SHOBIT SHAH', '5511', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5512, '5512', 'e10adc3949ba59abbe56e057f20f883e', 'MUKTI P. ACHARYA', '5512', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5513, '5513', 'e10adc3949ba59abbe56e057f20f883e', 'NARAYAN P. ACHARYA', '5513', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5514, '5514', 'e10adc3949ba59abbe56e057f20f883e', 'BIRENDRA SHAH', '5514', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5515, '5515', 'e10adc3949ba59abbe56e057f20f883e', 'SURESH RAUT', '5515', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5516, '5516', 'e10adc3949ba59abbe56e057f20f883e', 'RAMRAJ BADHAI', '5516', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5517, '5517', 'e10adc3949ba59abbe56e057f20f883e', 'VIDYA BHUSHAN DWIVEDI', '5517', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5519, '5519', 'e10adc3949ba59abbe56e057f20f883e', 'RAMPUKAR YADAV', '5519', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5521, '5521', 'e10adc3949ba59abbe56e057f20f883e', 'BISHNU B. BASNET', '5521', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5522, '5522', 'e10adc3949ba59abbe56e057f20f883e', 'DIPENDRA POKHAREL', '5522', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5523, '5523', 'e10adc3949ba59abbe56e057f20f883e', 'YAM B. SHRESTHA', '5523', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5525, '5525', 'e10adc3949ba59abbe56e057f20f883e', 'SHAMBHU P. SHAH', '5525', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5526, '5526', 'e10adc3949ba59abbe56e057f20f883e', 'RAJI NANDA P. YADAV', '5526', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5527, '5527', 'e10adc3949ba59abbe56e057f20f883e', 'JIBAN P. SHAH', '5527', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5528, '5528', 'e10adc3949ba59abbe56e057f20f883e', 'RAM LAKHAN MAHASETH', '5528', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5529, '5529', 'e10adc3949ba59abbe56e057f20f883e', 'BIRENDRA K. SHAH', '5529', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5530, '5530', 'e10adc3949ba59abbe56e057f20f883e', 'RAM KUMAR THAKUR', '5530', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5531, '5531', 'e10adc3949ba59abbe56e057f20f883e', 'DHIRENDRA N. MANDAL', '5531', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5532, '5532', 'e10adc3949ba59abbe56e057f20f883e', 'THAKUR B. MAGAR', '5532', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5533, '5533', 'e10adc3949ba59abbe56e057f20f883e', 'JIB LAL KHANAL', '5533', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5534, '5534', 'e10adc3949ba59abbe56e057f20f883e', 'MADHUSUDAN PARAJULY', '5534', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5539, '5539', 'e10adc3949ba59abbe56e057f20f883e', 'GIRI RAJ REGMI', '5539', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5540, '5540', 'e10adc3949ba59abbe56e057f20f883e', 'KALI DAS K.C.', '5540', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5541, '5541', 'e10adc3949ba59abbe56e057f20f883e', 'BALIRAM PURVEY', '5541', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5542, '5542', 'e10adc3949ba59abbe56e057f20f883e', 'PRADIP YADAB', '5542', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5543, '5543', 'e10adc3949ba59abbe56e057f20f883e', 'JIBACHHA K. SHAH', '5543', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5550, '5550', 'e10adc3949ba59abbe56e057f20f883e', 'MUKESH KUMAR SINGH', '5550', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5551, '5551', 'e10adc3949ba59abbe56e057f20f883e', 'GANESH ADHIKARI', '5551', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5552, '5552', 'e10adc3949ba59abbe56e057f20f883e', 'SHAMBHU PAUDEL', '5552', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5553, '5553', 'e10adc3949ba59abbe56e057f20f883e', 'NAWARAJ NEUPANE', '5553', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5554, '5554', 'e10adc3949ba59abbe56e057f20f883e', 'NIRANJAN PAUDEL', '5554', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5555, '5555', 'e10adc3949ba59abbe56e057f20f883e', 'MONOJ BHAKTA ACHARYA', '5555', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5556, '5556', 'e10adc3949ba59abbe56e057f20f883e', 'BINOD KOIRALA', '5556', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5557, '5557', 'e10adc3949ba59abbe56e057f20f883e', 'HIRENDRA DONGOL', '5557', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5558, '5558', 'e10adc3949ba59abbe56e057f20f883e', 'NABIN SRIBASTAB', '5558', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5559, '5559', 'e10adc3949ba59abbe56e057f20f883e', 'PRAJOL BHATTRAI', '5559', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5560, '5560', 'e10adc3949ba59abbe56e057f20f883e', 'NARAYAN P. BHANDARI', '5560', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5561, '5561', 'e10adc3949ba59abbe56e057f20f883e', 'KASHI NATH BHATTRAI', '5561', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5562, '5562', 'e10adc3949ba59abbe56e057f20f883e', 'GANGA PRASAD BAGALE', '5562', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5563, '5563', 'e10adc3949ba59abbe56e057f20f883e', 'AMOD KUMAR YADAV', '5563', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5564, '5564', 'e10adc3949ba59abbe56e057f20f883e', 'SUDARSHAN P. LEKHAK', '5564', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5566, '5566', 'e10adc3949ba59abbe56e057f20f883e', 'SATISH RAJ REGMI', '5566', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5568, '5568', 'e10adc3949ba59abbe56e057f20f883e', 'SUROJ TANDAN', '5568', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5570, '5570', 'e10adc3949ba59abbe56e057f20f883e', 'ARJUN PD.  DHUNGANA', '5570', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5571, '5571', 'e10adc3949ba59abbe56e057f20f883e', 'KAMALESH PANERU', '5571', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5572, '5572', 'e10adc3949ba59abbe56e057f20f883e', 'BHOLA NEPAL', '5572', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5573, '5573', 'e10adc3949ba59abbe56e057f20f883e', 'NARAYAN P. ACHARYA', '5573', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5574, '5574', 'e10adc3949ba59abbe56e057f20f883e', 'NIRDOSH SIJAPATI', '5574', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin');
INSERT INTO `tblextuser` (`user_id`, `logon_name`, `user_pass`, `user_name`, `staff_code`, `company_id`, `group_policy`, `start_date`, `end_date`, `status`, `input_date`, `inputter`, `authorizer`) VALUES
(5575, '5575', 'e10adc3949ba59abbe56e057f20f883e', 'RAJAN KHATRI', '5575', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5576, '5576', 'e10adc3949ba59abbe56e057f20f883e', 'UDDAB RAJ JOSHI', '5576', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5577, '5577', 'e10adc3949ba59abbe56e057f20f883e', 'SUNIL SHRESTHA', '5577', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5578, '5578', 'e10adc3949ba59abbe56e057f20f883e', 'JANARDAN NEUPANE', '5578', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5579, '5579', 'e10adc3949ba59abbe56e057f20f883e', 'RAMESH P. KALAUNI', '5579', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5580, '5580', 'e10adc3949ba59abbe56e057f20f883e', 'UMESH PANJIYAR', '5580', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5581, '5581', 'e10adc3949ba59abbe56e057f20f883e', 'KISHOR CHAUDHARI', '5581', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5582, '5582', 'e10adc3949ba59abbe56e057f20f883e', 'ANJU KOIRALA', '5582', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5584, '5584', 'e10adc3949ba59abbe56e057f20f883e', 'BHUMI RAJ NUEPANE', '5584', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5585, '5585', 'e10adc3949ba59abbe56e057f20f883e', 'PRADIP BHATTA', '5585', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5587, '5587', 'e10adc3949ba59abbe56e057f20f883e', 'BHESRAJ GHIMIRE', '5587', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5588, '5588', 'e10adc3949ba59abbe56e057f20f883e', 'KEDAR PD LAMICHHANE', '5588', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5589, '5589', 'e10adc3949ba59abbe56e057f20f883e', 'LAXMI G.C.(THAPA)', '5589', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5590, '5590', 'e10adc3949ba59abbe56e057f20f883e', 'LEKHRAJ GHIMIRE', '5590', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5591, '5591', 'e10adc3949ba59abbe56e057f20f883e', 'ANJANA RAJBHANDARI', '5591', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5592, '5592', 'e10adc3949ba59abbe56e057f20f883e', 'SUJATA POKHAREL', '5592', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5593, '5593', 'e10adc3949ba59abbe56e057f20f883e', 'DIPENDRA SHARMA GAUD', '5593', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5594, '5594', 'e10adc3949ba59abbe56e057f20f883e', 'KISHORI LAL BACHHAR', '5594', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5595, '5595', 'e10adc3949ba59abbe56e057f20f883e', 'SUDIP JUNG ADHIKARI', '5595', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5596, '5596', 'e10adc3949ba59abbe56e057f20f883e', 'BHAGAWATI POKHAREL', '5596', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5597, '5597', 'e10adc3949ba59abbe56e057f20f883e', 'GURU DEV UPADHAYA', '5597', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5598, '5598', 'e10adc3949ba59abbe56e057f20f883e', 'SHARMILA HAMAL', '5598', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5599, '5599', 'e10adc3949ba59abbe56e057f20f883e', 'GAYATRI ADHIKARI', '5599', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5600, '5600', 'e10adc3949ba59abbe56e057f20f883e', 'BABULAL SHRESTHA', '5600', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5601, '5601', 'e10adc3949ba59abbe56e057f20f883e', 'LUM NARAYAN CHAUDHAR', '5601', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5603, '5603', 'e10adc3949ba59abbe56e057f20f883e', 'HARISHCHANDRA S.THAR', '5603', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5604, '5604', 'e10adc3949ba59abbe56e057f20f883e', 'PARWATI KARKI', '5604', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5605, '5605', 'e10adc3949ba59abbe56e057f20f883e', 'SHASHI MAHAT(THAPA)', '5605', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5606, '5606', 'e10adc3949ba59abbe56e057f20f883e', 'MANOJ KUMAR RAY', '5606', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5607, '5607', 'e10adc3949ba59abbe56e057f20f883e', 'BAIDHYA NATH PATHAK', '5607', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5608, '5608', 'e10adc3949ba59abbe56e057f20f883e', 'HARI KRISHNA GYAWALI', '5608', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5609, '5609', 'e10adc3949ba59abbe56e057f20f883e', 'JAYANTI MISHRA(RIMAL', '5609', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5610, '5610', 'e10adc3949ba59abbe56e057f20f883e', 'CHANDRA S.BUDHATHOKI', '5610', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5611, '5611', 'e10adc3949ba59abbe56e057f20f883e', 'RISIRAM REGMI', '5611', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5612, '5612', 'e10adc3949ba59abbe56e057f20f883e', 'PRAMILA LEKHAK(KHANA', '5612', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5613, '5613', 'e10adc3949ba59abbe56e057f20f883e', 'BIMALA BURLAKOTI(RUW', '5613', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5614, '5614', 'e10adc3949ba59abbe56e057f20f883e', 'NIRMALA TRIPATHI', '5614', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5615, '5615', 'e10adc3949ba59abbe56e057f20f883e', 'SUKHARAM RANA', '5615', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5616, '5616', 'e10adc3949ba59abbe56e057f20f883e', 'DUKHIRAM RAY', '5616', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5617, '5617', 'e10adc3949ba59abbe56e057f20f883e', 'JANAK S.MAUNI', '5617', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5618, '5618', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA BDR DHAKAL', '5618', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5620, '5620', 'e10adc3949ba59abbe56e057f20f883e', 'ANIL KUMAR KARKI', '5620', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5621, '5621', 'e10adc3949ba59abbe56e057f20f883e', 'DEEPAK SHRESTHA', '5621', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5622, '5622', 'e10adc3949ba59abbe56e057f20f883e', 'GOBINDA R. ADHIKARI', '5622', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5623, '5623', 'e10adc3949ba59abbe56e057f20f883e', 'BASANTA THAPA', '5623', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5624, '5624', 'e10adc3949ba59abbe56e057f20f883e', 'BAKHAT BAHADUR LAMA', '5624', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5625, '5625', 'e10adc3949ba59abbe56e057f20f883e', 'JOG BAHADUR KHADKA', '5625', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5627, '5627', 'e10adc3949ba59abbe56e057f20f883e', 'AMAR BAHADUR CHHETRI', '5627', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5628, '5628', 'e10adc3949ba59abbe56e057f20f883e', 'HEM RAJ DHUNGANA', '5628', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5629, '5629', 'e10adc3949ba59abbe56e057f20f883e', 'PRALHAD PHUYAL', '5629', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5630, '5630', 'e10adc3949ba59abbe56e057f20f883e', 'DURGA ACHARYA', '5630', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5631, '5631', 'e10adc3949ba59abbe56e057f20f883e', 'NAWAL BAHADUR MALLA', '5631', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5632, '5632', 'e10adc3949ba59abbe56e057f20f883e', 'PUSPA RAJ BHARATI', '5632', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5633, '5633', 'e10adc3949ba59abbe56e057f20f883e', 'DIPAK THAPA', '5633', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5634, '5634', 'e10adc3949ba59abbe56e057f20f883e', 'BIMALA SHRESTHA', '5634', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5635, '5635', 'e10adc3949ba59abbe56e057f20f883e', 'KAMALA ADHIKARI', '5635', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5636, '5636', 'e10adc3949ba59abbe56e057f20f883e', 'SUBAS BHATTA', '5636', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5637, '5637', 'e10adc3949ba59abbe56e057f20f883e', 'BIDHYA NATH SUBEDI', '5637', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5638, '5638', 'e10adc3949ba59abbe56e057f20f883e', 'JANAK RAJ PANDE', '5638', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5639, '5639', 'e10adc3949ba59abbe56e057f20f883e', 'RAJENDRA BISTA', '5639', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5640, '5640', 'e10adc3949ba59abbe56e057f20f883e', 'SIDDILAL MAGIYAN', '5640', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5641, '5641', 'e10adc3949ba59abbe56e057f20f883e', 'ANJU THAPA(MISHRA)', '5641', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5642, '5642', 'e10adc3949ba59abbe56e057f20f883e', 'DEB PRASAD DHITAL', '5642', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5643, '5643', 'e10adc3949ba59abbe56e057f20f883e', 'DOLRAJ GAIRE', '5643', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5644, '5644', 'e10adc3949ba59abbe56e057f20f883e', 'KAMAL SHRESTHA', '5644', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5645, '5645', 'e10adc3949ba59abbe56e057f20f883e', 'SUSHILA MAHAT', '5645', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5646, '5646', 'e10adc3949ba59abbe56e057f20f883e', 'GOBINDA PD RIMAL', '5646', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5647, '5647', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA KUMAR MANDAL', '5647', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5648, '5648', 'e10adc3949ba59abbe56e057f20f883e', 'RAJU ARYAL', '5648', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5649, '5649', 'e10adc3949ba59abbe56e057f20f883e', 'RAMSHARAN KHATIWADA', '5649', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5650, '5650', 'e10adc3949ba59abbe56e057f20f883e', 'ACHUT PD ADHIKARI', '5650', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5651, '5651', 'e10adc3949ba59abbe56e057f20f883e', 'SURESH KUMAR SHAH', '5651', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5652, '5652', 'e10adc3949ba59abbe56e057f20f883e', 'HIRA GOPAL MAHARJAN', '5652', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5653, '5653', 'e10adc3949ba59abbe56e057f20f883e', 'GOKUL PD NEUPANE', '5653', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5654, '5654', 'e10adc3949ba59abbe56e057f20f883e', 'SUJIT BIKRAM SHAH', '5654', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5655, '5655', 'e10adc3949ba59abbe56e057f20f883e', 'BISHO BIKRAM THAPA', '5655', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5656, '5656', 'e10adc3949ba59abbe56e057f20f883e', 'BADRI PRASAD NEPAL', '5656', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5657, '5657', 'e10adc3949ba59abbe56e057f20f883e', 'RAM CHANDRA DHUNGANA', '5657', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5658, '5658', 'e10adc3949ba59abbe56e057f20f883e', 'BISHNU JUNG SHAH', '5658', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5659, '5659', 'e10adc3949ba59abbe56e057f20f883e', 'SATYA NARAYAN RAM', '5659', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5660, '5660', 'e10adc3949ba59abbe56e057f20f883e', 'DIL BAHADUR MAGAR', '5660', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5661, '5661', 'e10adc3949ba59abbe56e057f20f883e', 'NRIP BAHADUR KUNWAR', '5661', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5662, '5662', 'e10adc3949ba59abbe56e057f20f883e', 'RAM CHANDRA B.K.', '5662', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5663, '5663', 'e10adc3949ba59abbe56e057f20f883e', 'SHES NARAYAN CHAUDHA', '5663', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5664, '5664', 'e10adc3949ba59abbe56e057f20f883e', 'TEJ PRASAD TIMSINA', '5664', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5665, '5665', 'e10adc3949ba59abbe56e057f20f883e', 'MAHALAXMI BASNET(THA', '5665', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5666, '5666', 'e10adc3949ba59abbe56e057f20f883e', 'DIK BAHADUR PARIYAR', '5666', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5667, '5667', 'e10adc3949ba59abbe56e057f20f883e', 'JANARDAN DAHAL', '5667', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5668, '5668', 'e10adc3949ba59abbe56e057f20f883e', 'NITA DHUNGEL', '5668', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5669, '5669', 'e10adc3949ba59abbe56e057f20f883e', 'ROSHANI MAHAT', '5669', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5670, '5670', 'e10adc3949ba59abbe56e057f20f883e', 'SAROJ KUMAR GANDHRWA', '5670', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5671, '5671', 'e10adc3949ba59abbe56e057f20f883e', 'RITA GHIMIRE', '5671', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5672, '5672', 'e10adc3949ba59abbe56e057f20f883e', 'BHUWAN BIKRAM KUNWAR', '5672', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5673, '5673', 'e10adc3949ba59abbe56e057f20f883e', 'PRAMILA ADHIKARI', '5673', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5674, '5674', 'e10adc3949ba59abbe56e057f20f883e', 'CHANDRA PRSAD GAUTAM', '5674', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5675, '5675', 'e10adc3949ba59abbe56e057f20f883e', 'TEK RAJ PANDEYA', '5675', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5677, '5677', 'e10adc3949ba59abbe56e057f20f883e', 'SANJAYA KUMAR K.C.', '5677', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5678, '5678', 'e10adc3949ba59abbe56e057f20f883e', 'SHUBHADRA SHAH(MALLA', '5678', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5679, '5679', 'e10adc3949ba59abbe56e057f20f883e', 'SUBHADRA KHADKA', '5679', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5680, '5680', 'e10adc3949ba59abbe56e057f20f883e', 'CHAKRA BAHADUR DEUWA', '5680', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5681, '5681', 'e10adc3949ba59abbe56e057f20f883e', 'DASHAMI K. RAJBANSHI', '5681', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5682, '5682', 'e10adc3949ba59abbe56e057f20f883e', 'THAKUR PD SAPKOTA', '5682', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5683, '5683', 'e10adc3949ba59abbe56e057f20f883e', 'ANITA POKHREL(NEUPAN', '5683', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5684, '5684', 'e10adc3949ba59abbe56e057f20f883e', 'NIRJALA ARYAL(POKHRE', '5684', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5685, '5685', 'e10adc3949ba59abbe56e057f20f883e', 'PADAM PRKAS BIJUCHHE', '5685', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5686, '5686', 'e10adc3949ba59abbe56e057f20f883e', 'PREMA RIMAL', '5686', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5687, '5687', 'e10adc3949ba59abbe56e057f20f883e', 'PURUSOTTAM NEPAL', '5687', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5688, '5688', 'e10adc3949ba59abbe56e057f20f883e', 'KISHOR RAJ WANA', '5688', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5689, '5689', 'e10adc3949ba59abbe56e057f20f883e', 'PHUL KU. THAPAMAGAR', '5689', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5690, '5690', 'e10adc3949ba59abbe56e057f20f883e', 'SHOVA SINGH(MAHAT)', '5690', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5691, '5691', 'e10adc3949ba59abbe56e057f20f883e', 'SHIVA SHANKER GIRI', '5691', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5692, '5692', 'e10adc3949ba59abbe56e057f20f883e', 'BHIM BAHADUR KHADKA', '5692', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5693, '5693', 'e10adc3949ba59abbe56e057f20f883e', 'KESHAR BAHDUR GURUNG', '5693', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5694, '5694', 'e10adc3949ba59abbe56e057f20f883e', 'SHANTA THAPA', '5694', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5695, '5695', 'e10adc3949ba59abbe56e057f20f883e', 'BHARAT DHAKAL', '5695', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5696, '5696', 'e10adc3949ba59abbe56e057f20f883e', 'RENUKA BUDHATHOKI', '5696', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5697, '5697', 'e10adc3949ba59abbe56e057f20f883e', 'BIMALA THAPA', '5697', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5698, '5698', 'e10adc3949ba59abbe56e057f20f883e', 'ISHORI PYAKUREL(CHAL', '5698', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5699, '5699', 'e10adc3949ba59abbe56e057f20f883e', 'MAYAN KUMARI CHHETRI', '5699', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5700, '5700', 'e10adc3949ba59abbe56e057f20f883e', 'RADHIKA RAI', '5700', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5701, '5701', 'e10adc3949ba59abbe56e057f20f883e', 'GITA PANTA', '5701', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5702, '5702', 'e10adc3949ba59abbe56e057f20f883e', 'HEMANTA KUMARI THAPA', '5702', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5703, '5703', 'e10adc3949ba59abbe56e057f20f883e', 'TEK BAHADUR SUNUWAR', '5703', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5704, '5704', 'e10adc3949ba59abbe56e057f20f883e', 'RUPESH KUMAR CHATAUT', '5704', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5705, '5705', 'e10adc3949ba59abbe56e057f20f883e', 'SHARADA DEVI RIJAL(K', '5705', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5706, '5706', 'e10adc3949ba59abbe56e057f20f883e', 'RADHIKA ADHIKARI', '5706', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5707, '5707', 'e10adc3949ba59abbe56e057f20f883e', 'RAJAN KHANAL', '5707', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5708, '5708', 'e10adc3949ba59abbe56e057f20f883e', 'SHYAM NARAYAN SARDAR', '5708', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5709, '5709', 'e10adc3949ba59abbe56e057f20f883e', 'RAMA MAHAT', '5709', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5710, '5710', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA HARI THAPA', '5710', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5711, '5711', 'e10adc3949ba59abbe56e057f20f883e', 'LAXMI DEVI KHADKA', '5711', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5712, '5712', 'e10adc3949ba59abbe56e057f20f883e', 'SHYAM KAFLE', '5712', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5713, '5713', 'e10adc3949ba59abbe56e057f20f883e', 'BINDU MISHRA', '5713', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5714, '5714', 'e10adc3949ba59abbe56e057f20f883e', 'SUN MAYA SHRESTHA', '5714', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5715, '5715', 'e10adc3949ba59abbe56e057f20f883e', 'ALOK PRATAP SINGH', '5715', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5716, '5716', 'e10adc3949ba59abbe56e057f20f883e', 'PREM KRISHN SHRESTHA', '5716', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5717, '5717', 'e10adc3949ba59abbe56e057f20f883e', 'NARENDRA P CHAUDHARI', '5717', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5718, '5718', 'e10adc3949ba59abbe56e057f20f883e', 'SHANTI SINGH', '5718', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5719, '5719', 'e10adc3949ba59abbe56e057f20f883e', 'TULSI RAM OLI', '5719', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5720, '5720', 'e10adc3949ba59abbe56e057f20f883e', 'MINA LAMA', '5720', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5721, '5721', 'e10adc3949ba59abbe56e057f20f883e', 'SHOVA RANA', '5721', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5722, '5722', 'e10adc3949ba59abbe56e057f20f883e', 'NARENDRA BIKRM THAPA', '5722', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5723, '5723', 'e10adc3949ba59abbe56e057f20f883e', 'NAR MAYA PHUYAL', '5723', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5724, '5724', 'e10adc3949ba59abbe56e057f20f883e', 'KESHAB PRASD PRADHAN', '5724', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5725, '5725', 'e10adc3949ba59abbe56e057f20f883e', 'SRIJANA KHADKA', '5725', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5726, '5726', 'e10adc3949ba59abbe56e057f20f883e', 'SHOVA NEUPANE', '5726', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5728, '5728', 'e10adc3949ba59abbe56e057f20f883e', 'LAXMAN THARU KUMAL', '5728', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5729, '5729', 'e10adc3949ba59abbe56e057f20f883e', 'GANGA B.MALLATHAKURI', '5729', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5730, '5730', 'e10adc3949ba59abbe56e057f20f883e', 'DURGE DAMAI', '5730', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5731, '5731', 'e10adc3949ba59abbe56e057f20f883e', 'LAXMAN KOIRALA', '5731', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5732, '5732', 'e10adc3949ba59abbe56e057f20f883e', 'AJAYA LAMA', '5732', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5733, '5733', 'e10adc3949ba59abbe56e057f20f883e', 'INDU DAHAL', '5733', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5734, '5734', 'e10adc3949ba59abbe56e057f20f883e', 'BINOD GIMIRE', '5734', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5735, '5735', 'e10adc3949ba59abbe56e057f20f883e', 'ANJU GIRI', '5735', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5736, '5736', 'e10adc3949ba59abbe56e057f20f883e', 'NETRA B. BASNET', '5736', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5737, '5737', 'e10adc3949ba59abbe56e057f20f883e', 'RAMILA DHAKAL(GHIMIR', '5737', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5738, '5738', 'e10adc3949ba59abbe56e057f20f883e', 'BIKAS KUMAR DAS', '5738', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5739, '5739', 'e10adc3949ba59abbe56e057f20f883e', 'PANKAJMANI POUDEL', '5739', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5740, '5740', 'e10adc3949ba59abbe56e057f20f883e', 'ASHIS SHRESTHA', '5740', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5741, '5741', 'e10adc3949ba59abbe56e057f20f883e', 'BIRENDRA P. MEHTA', '5741', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5742, '5742', 'e10adc3949ba59abbe56e057f20f883e', 'JUNITA BHATTARAI', '5742', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5743, '5743', 'e10adc3949ba59abbe56e057f20f883e', 'ABHILASHA SHRESTHA', '5743', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5744, '5744', 'e10adc3949ba59abbe56e057f20f883e', 'GITA ARYAL(GYAWALI)', '5744', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5745, '5745', 'e10adc3949ba59abbe56e057f20f883e', 'SUMIN KUMARI SAH', '5745', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5746, '5746', 'e10adc3949ba59abbe56e057f20f883e', 'SHANTA DEVI BASNET', '5746', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5747, '5747', 'e10adc3949ba59abbe56e057f20f883e', 'KABITA NIRAULA', '5747', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5748, '5748', 'e10adc3949ba59abbe56e057f20f883e', 'HEM NARAYAN SAH', '5748', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5749, '5749', 'e10adc3949ba59abbe56e057f20f883e', 'BHAWANI PATHAK', '5749', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5750, '5750', 'e10adc3949ba59abbe56e057f20f883e', 'AMIT KATUWAL', '5750', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5751, '5751', 'e10adc3949ba59abbe56e057f20f883e', 'SATYA N. MANDAL', '5751', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5752, '5752', 'e10adc3949ba59abbe56e057f20f883e', 'DIPENDRA SAH', '5752', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5753, '5753', 'e10adc3949ba59abbe56e057f20f883e', 'BIRENDRA BHANDARI', '5753', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5754, '5754', 'e10adc3949ba59abbe56e057f20f883e', 'BINOD KUMAR SAHU', '5754', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5755, '5755', 'e10adc3949ba59abbe56e057f20f883e', 'SANTOSH YADAV', '5755', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5756, '5756', 'e10adc3949ba59abbe56e057f20f883e', 'MANOJ KUMAR YADAV', '5756', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5757, '5757', 'e10adc3949ba59abbe56e057f20f883e', 'JAYANTI SHAH', '5757', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5758, '5758', 'e10adc3949ba59abbe56e057f20f883e', 'KAMALESH KUMAR KARN', '5758', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5759, '5759', 'e10adc3949ba59abbe56e057f20f883e', 'SARITA K. CHAUDHARI', '5759', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5760, '5760', 'e10adc3949ba59abbe56e057f20f883e', 'KAMLESH K. CHAUDHARI', '5760', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5761, '5761', 'e10adc3949ba59abbe56e057f20f883e', 'PANKAJ KUMAR DAS', '5761', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5762, '5762', 'e10adc3949ba59abbe56e057f20f883e', 'REKHA KUMARI YADAV', '5762', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5763, '5763', 'e10adc3949ba59abbe56e057f20f883e', 'MAHESH K. CHAUDHARI', '5763', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5764, '5764', 'e10adc3949ba59abbe56e057f20f883e', 'AMIT KUMAR RAY', '5764', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5765, '5765', 'e10adc3949ba59abbe56e057f20f883e', 'SANJIV KUMAR YADAV', '5765', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5766, '5766', 'e10adc3949ba59abbe56e057f20f883e', 'KASHENDRA K.CHAUDHAR', '5766', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5767, '5767', 'e10adc3949ba59abbe56e057f20f883e', 'HARERAM CHAUDHARI', '5767', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5769, '5769', 'e10adc3949ba59abbe56e057f20f883e', 'YOGENDRA K. YADAV', '5769', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5770, '5770', 'e10adc3949ba59abbe56e057f20f883e', 'ANITA KUMARI KARN', '5770', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5772, '5772', 'e10adc3949ba59abbe56e057f20f883e', 'PITAMBER SAH', '5772', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5773, '5773', 'e10adc3949ba59abbe56e057f20f883e', 'SOMRAJ PANDE', '5773', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5774, '5774', 'e10adc3949ba59abbe56e057f20f883e', 'RAJU BHATTARAI', '5774', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5775, '5775', 'e10adc3949ba59abbe56e057f20f883e', 'SUMITRA POKHREL', '5775', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5776, '5776', 'e10adc3949ba59abbe56e057f20f883e', 'MINA CHAPAGAI', '5776', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5777, '5777', 'e10adc3949ba59abbe56e057f20f883e', 'RESHAM CHAUDHARI', '5777', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5778, '5778', 'e10adc3949ba59abbe56e057f20f883e', 'MANJU POUDEL', '5778', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5779, '5779', 'e10adc3949ba59abbe56e057f20f883e', 'SANTOSH PANDE', '5779', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5780, '5780', 'e10adc3949ba59abbe56e057f20f883e', 'BINOD K C', '5780', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5781, '5781', 'e10adc3949ba59abbe56e057f20f883e', 'SAPANA GHIMIRE', '5781', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5782, '5782', 'e10adc3949ba59abbe56e057f20f883e', 'INDRAMANI GHIMIRE', '5782', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5783, '5783', 'e10adc3949ba59abbe56e057f20f883e', 'ANIL D.C.', '5783', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5784, '5784', 'e10adc3949ba59abbe56e057f20f883e', 'BINOD DHAKAL', '5784', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5785, '5785', 'e10adc3949ba59abbe56e057f20f883e', 'RISIRAM ACHARYA', '5785', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5786, '5786', 'e10adc3949ba59abbe56e057f20f883e', 'RAJ KUMAR YADAV', '5786', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5787, '5787', 'e10adc3949ba59abbe56e057f20f883e', 'RAKESH YADAV', '5787', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5788, '5788', 'e10adc3949ba59abbe56e057f20f883e', 'SANOSH K. PANDEY', '5788', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5789, '5789', 'e10adc3949ba59abbe56e057f20f883e', 'SUBODH DEV PANTA', '5789', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5790, '5790', 'e10adc3949ba59abbe56e057f20f883e', 'BRIJRAJ PASI', '5790', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5791, '5791', 'e10adc3949ba59abbe56e057f20f883e', 'RAJENDRA P. UPADHYAY', '5791', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5792, '5792', 'e10adc3949ba59abbe56e057f20f883e', 'BISHNU P. ARYAL', '5792', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5793, '5793', 'e10adc3949ba59abbe56e057f20f883e', 'SUNITA SEDAI(TIWAEI)', '5793', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5794, '5794', 'e10adc3949ba59abbe56e057f20f883e', 'PABITRA KHADKA', '5794', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5795, '5795', 'e10adc3949ba59abbe56e057f20f883e', 'PRATIGYA NEUPANE', '5795', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5796, '5796', 'e10adc3949ba59abbe56e057f20f883e', 'TIKA KUMARI BASNET', '5796', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5797, '5797', 'e10adc3949ba59abbe56e057f20f883e', 'UMESH KUMAR POUDEL', '5797', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5798, '5798', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA P. SAPKOTA', '5798', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5799, '5799', 'e10adc3949ba59abbe56e057f20f883e', 'AKHILESH K. JHA', '5799', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5800, '5800', 'e10adc3949ba59abbe56e057f20f883e', 'AMODBABU BHATTARAI', '5800', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5801, '5801', 'e10adc3949ba59abbe56e057f20f883e', 'DEVI KALA SHARMA', '5801', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5802, '5802', 'e10adc3949ba59abbe56e057f20f883e', 'RAM BAHADUR AIR', '5802', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5803, '5803', 'e10adc3949ba59abbe56e057f20f883e', 'RAJENDRA P. ACHARYA', '5803', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5804, '5804', 'e10adc3949ba59abbe56e057f20f883e', 'TARA PANTA', '5804', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5805, '5805', 'e10adc3949ba59abbe56e057f20f883e', 'TEJ BAHADUR CHAUDHAR', '5805', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5806, '5806', 'e10adc3949ba59abbe56e057f20f883e', 'RAJKRISHNA BARMA', '5806', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5807, '5807', 'e10adc3949ba59abbe56e057f20f883e', 'RIMA POUDEL', '5807', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5808, '5808', 'e10adc3949ba59abbe56e057f20f883e', 'SHANTI BASNET', '5808', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5809, '5809', 'e10adc3949ba59abbe56e057f20f883e', 'ANJANA MALLA THAKURI', '5809', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5810, '5810', 'e10adc3949ba59abbe56e057f20f883e', 'JUNUTARA KSHETRI KHA', '5810', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5811, '5811', 'e10adc3949ba59abbe56e057f20f883e', 'BHUWAN TIMILSINA', '5811', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5812, '5812', 'e10adc3949ba59abbe56e057f20f883e', 'BIPLAV NEUPANE', '5812', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5813, '5813', 'e10adc3949ba59abbe56e057f20f883e', 'DIBYA K. CHADUREDI', '5813', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5814, '5814', 'e10adc3949ba59abbe56e057f20f883e', 'ROSHANI KHANAL', '5814', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5815, '5815', 'e10adc3949ba59abbe56e057f20f883e', 'MINA DEVI BHATTA', '5815', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5816, '5816', 'e10adc3949ba59abbe56e057f20f883e', 'NEHA BHANDARI', '5816', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5817, '5817', 'e10adc3949ba59abbe56e057f20f883e', 'LOK BAHADUR MALLA', '5817', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5818, '5818', 'e10adc3949ba59abbe56e057f20f883e', 'RUPA PANTA', '5818', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5819, '5819', 'e10adc3949ba59abbe56e057f20f883e', 'HARISHCHANDRA BHATTA', '5819', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5820, '5820', 'e10adc3949ba59abbe56e057f20f883e', 'ANIRUDRA K. TIWARI', '5820', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5821, '5821', 'e10adc3949ba59abbe56e057f20f883e', 'PRITAM K. GUPTA', '5821', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5822, '5822', 'e10adc3949ba59abbe56e057f20f883e', 'GYANI REGMI', '5822', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5823, '5823', 'e10adc3949ba59abbe56e057f20f883e', 'NAR BHUPAL THARU', '5823', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5824, '5824', 'e10adc3949ba59abbe56e057f20f883e', 'ANIL KUMAR SUBEDI', '5824', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5825, '5825', 'e10adc3949ba59abbe56e057f20f883e', 'SANGITA SHAH', '5825', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5826, '5826', 'e10adc3949ba59abbe56e057f20f883e', 'PRAKASH BHATTARAI', '5826', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5827, '5827', 'e10adc3949ba59abbe56e057f20f883e', 'BHARAT YADAV', '5827', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5828, '5828', 'e10adc3949ba59abbe56e057f20f883e', 'DIPENDRA K. CHAUDHAR', '5828', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5829, '5829', 'e10adc3949ba59abbe56e057f20f883e', 'LALIT K. PANDIT', '5829', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5830, '5830', 'e10adc3949ba59abbe56e057f20f883e', 'MANOJ KUMAR SAH', '5830', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5831, '5831', 'e10adc3949ba59abbe56e057f20f883e', 'LAXMI P. ACHARYA', '5831', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5833, '5833', 'e10adc3949ba59abbe56e057f20f883e', 'MADAN P. PHUYAL', '5833', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5834, '5834', 'e10adc3949ba59abbe56e057f20f883e', 'PAWAN KUMAR SHARMA', '5834', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5835, '5835', 'e10adc3949ba59abbe56e057f20f883e', 'PUNAM BASNET', '5835', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5836, '5836', 'e10adc3949ba59abbe56e057f20f883e', 'JALAL HUSEN', '5836', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5837, '5837', 'e10adc3949ba59abbe56e057f20f883e', 'MANISH NIDHI TIWARI', '5837', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5838, '5838', 'e10adc3949ba59abbe56e057f20f883e', 'KUMAR RAJ PURI', '5838', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5839, '5839', 'e10adc3949ba59abbe56e057f20f883e', 'SURENDRA B. SAPKOTA', '5839', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5840, '5840', 'e10adc3949ba59abbe56e057f20f883e', 'GANGADEVI KHAREL(PRA', '5840', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5841, '5841', 'e10adc3949ba59abbe56e057f20f883e', 'SOYANKA K. C.', '5841', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5842, '5842', 'e10adc3949ba59abbe56e057f20f883e', 'SANTOSH K. CHAUDHARI', '5842', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5843, '5843', 'e10adc3949ba59abbe56e057f20f883e', 'ASTHA BHANDARI', '5843', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5844, '5844', 'e10adc3949ba59abbe56e057f20f883e', 'MANOJ K. THAKUR', '5844', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5845, '5845', 'e10adc3949ba59abbe56e057f20f883e', 'HARISHANKER YADAV', '5845', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5846, '5846', 'e10adc3949ba59abbe56e057f20f883e', 'SANJIB SHAH', '5846', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5847, '5847', 'e10adc3949ba59abbe56e057f20f883e', 'BASUDEV KHANAL', '5847', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5848, '5848', 'e10adc3949ba59abbe56e057f20f883e', 'MINA SHARMA', '5848', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5849, '5849', 'e10adc3949ba59abbe56e057f20f883e', 'BHUWANESHARI SEDAI', '5849', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5850, '5850', 'e10adc3949ba59abbe56e057f20f883e', 'KIRAN PHYAL', '5850', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5851, '5851', 'e10adc3949ba59abbe56e057f20f883e', 'UMA THAPA MAGAR', '5851', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5852, '5852', 'e10adc3949ba59abbe56e057f20f883e', 'PARIKSHYA NEUPANE', '5852', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5853, '5853', 'e10adc3949ba59abbe56e057f20f883e', 'SUNITA BHATTARAI', '5853', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5854, '5854', 'e10adc3949ba59abbe56e057f20f883e', 'SAMJHANA SIMKHADA', '5854', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5855, '5855', 'e10adc3949ba59abbe56e057f20f883e', 'ILA UPADHYAY', '5855', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5856, '5856', 'e10adc3949ba59abbe56e057f20f883e', 'KISHOR NEUPANE', '5856', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5857, '5857', 'e10adc3949ba59abbe56e057f20f883e', 'SUSHILA PANDE', '5857', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5858, '5858', 'e10adc3949ba59abbe56e057f20f883e', 'UPENDRA MAHAT', '5858', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5859, '5859', 'e10adc3949ba59abbe56e057f20f883e', 'LAXMI GYAWALI', '5859', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5860, '5860', 'e10adc3949ba59abbe56e057f20f883e', 'JIWAN GHIMIRE', '5860', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5861, '5861', 'e10adc3949ba59abbe56e057f20f883e', 'THAKUR RAJ ACHARYA', '5861', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5862, '5862', 'e10adc3949ba59abbe56e057f20f883e', 'MANDIRA PANDE', '5862', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5863, '5863', 'e10adc3949ba59abbe56e057f20f883e', 'AMRIT KATTEL', '5863', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5864, '5864', 'e10adc3949ba59abbe56e057f20f883e', 'KESHAB POUDEL', '5864', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5865, '5865', 'e10adc3949ba59abbe56e057f20f883e', 'RAJENDRA KOIRALA', '5865', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5866, '5866', 'e10adc3949ba59abbe56e057f20f883e', 'RAMSEWAK SAH', '5866', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5867, '5867', 'e10adc3949ba59abbe56e057f20f883e', 'DINESH P. KUIKEL', '5867', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5868, '5868', 'e10adc3949ba59abbe56e057f20f883e', 'AMIT DHUNGANA', '5868', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5869, '5869', 'e10adc3949ba59abbe56e057f20f883e', 'JAMUNA KAFLE(POUDEL)', '5869', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5870, '5870', 'e10adc3949ba59abbe56e057f20f883e', 'SITA BASNET(PANTHI)', '5870', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5871, '5871', 'e10adc3949ba59abbe56e057f20f883e', 'NIRANJAN KATTEL', '5871', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5872, '5872', 'e10adc3949ba59abbe56e057f20f883e', 'SHIVA P. NEPAL', '5872', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5873, '5873', 'e10adc3949ba59abbe56e057f20f883e', 'KABITA ARYAL GHIMIRE', '5873', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5874, '5874', 'e10adc3949ba59abbe56e057f20f883e', 'TEJ KUMARI K. C.', '5874', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5875, '5875', 'e10adc3949ba59abbe56e057f20f883e', 'BINDU LEKHAK', '5875', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin');
INSERT INTO `tblextuser` (`user_id`, `logon_name`, `user_pass`, `user_name`, `staff_code`, `company_id`, `group_policy`, `start_date`, `end_date`, `status`, `input_date`, `inputter`, `authorizer`) VALUES
(5876, '5876', 'e10adc3949ba59abbe56e057f20f883e', 'RAM KUMAR BOHARA', '5876', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5877, '5877', 'e10adc3949ba59abbe56e057f20f883e', 'RITESH K. CHAUDHARI', '5877', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5878, '5878', 'e10adc3949ba59abbe56e057f20f883e', 'SANTOSH DHUNGANA', '5878', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5879, '5879', 'e10adc3949ba59abbe56e057f20f883e', 'SHERAJ AHAMAD', '5879', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5880, '5880', 'e10adc3949ba59abbe56e057f20f883e', 'KALPANA PANDE', '5880', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5881, '5881', 'e10adc3949ba59abbe56e057f20f883e', 'SHASHIKALA K. SAH', '5881', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5882, '5882', 'e10adc3949ba59abbe56e057f20f883e', 'MADAN NIRAULA', '5882', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5883, '5883', 'e10adc3949ba59abbe56e057f20f883e', 'SHALIK RAM POUDEL', '5883', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5884, '5884', 'e10adc3949ba59abbe56e057f20f883e', 'GOMA PATHAK', '5884', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5885, '5885', 'e10adc3949ba59abbe56e057f20f883e', 'AMRITA MAHAT ADHIKAR', '5885', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5886, '5886', 'e10adc3949ba59abbe56e057f20f883e', 'LAXMI ARYAL', '5886', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5887, '5887', 'e10adc3949ba59abbe56e057f20f883e', 'SUNITA GIRI', '5887', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5888, '5888', 'e10adc3949ba59abbe56e057f20f883e', 'JANUKA POUDEL', '5888', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5889, '5889', 'e10adc3949ba59abbe56e057f20f883e', 'BARMANKA ADHIKARI', '5889', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5890, '5890', 'e10adc3949ba59abbe56e057f20f883e', 'DIKSHYA OJHA', '5890', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5891, '5891', 'e10adc3949ba59abbe56e057f20f883e', 'RAJANI CHAUDHARI', '5891', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5892, '5892', 'e10adc3949ba59abbe56e057f20f883e', 'SAMJHANA MISHRA', '5892', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5894, '5894', 'e10adc3949ba59abbe56e057f20f883e', 'MANJU UPRETI', '5894', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5895, '5895', 'e10adc3949ba59abbe56e057f20f883e', 'SAJAN POKHREL', '5895', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5896, '5896', 'e10adc3949ba59abbe56e057f20f883e', 'PRAMILA K.C. KARKI', '5896', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5897, '5897', 'e10adc3949ba59abbe56e057f20f883e', 'INDIRA BANJADE', '5897', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5898, '5898', 'e10adc3949ba59abbe56e057f20f883e', 'ANJALI MAHAT KARKI', '5898', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5899, '5899', 'e10adc3949ba59abbe56e057f20f883e', 'ANJANA DANGOL', '5899', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5900, '5900', 'e10adc3949ba59abbe56e057f20f883e', 'SHOVA K. KOIRALA', '5900', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5901, '5901', 'e10adc3949ba59abbe56e057f20f883e', 'SHANTA KHANAL', '5901', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5902, '5902', 'e10adc3949ba59abbe56e057f20f883e', 'MANJU JOSHI', '5902', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5903, '5903', 'e10adc3949ba59abbe56e057f20f883e', 'SUSHILA SILWAL', '5903', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5904, '5904', 'e10adc3949ba59abbe56e057f20f883e', 'RUPA SHRESTHA', '5904', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5905, '5905', 'e10adc3949ba59abbe56e057f20f883e', 'PINKI SHAH', '5905', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5906, '5906', 'e10adc3949ba59abbe56e057f20f883e', 'GITA NEPAL SHARMA', '5906', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5907, '5907', 'e10adc3949ba59abbe56e057f20f883e', 'SABITA BASNET THAPAL', '5907', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5908, '5908', 'e10adc3949ba59abbe56e057f20f883e', 'TULAJA KUMARI DAHAL', '5908', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5909, '5909', 'e10adc3949ba59abbe56e057f20f883e', 'DURGA DHAKAL', '5909', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5910, '5910', 'e10adc3949ba59abbe56e057f20f883e', 'RAKSHITA PANTA', '5910', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5911, '5911', 'e10adc3949ba59abbe56e057f20f883e', 'LIJA POKHREL', '5911', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5912, '5912', 'e10adc3949ba59abbe56e057f20f883e', 'ANITA DEV', '5912', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5913, '5913', 'e10adc3949ba59abbe56e057f20f883e', 'SANJU BHANDARI', '5913', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5914, '5914', 'e10adc3949ba59abbe56e057f20f883e', 'KARUNA B. C.', '5914', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5915, '5915', 'e10adc3949ba59abbe56e057f20f883e', 'NAMRATA PANDE KANDEL', '5915', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5916, '5916', 'e10adc3949ba59abbe56e057f20f883e', 'BABITA GHALE', '5916', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5918, '5918', 'e10adc3949ba59abbe56e057f20f883e', 'SUJITA GURUNG', '5918', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5919, '5919', 'e10adc3949ba59abbe56e057f20f883e', 'LAXMIDEVI SIWAKOTI', '5919', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5920, '5920', 'e10adc3949ba59abbe56e057f20f883e', 'BINDA SUBEDI', '5920', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5921, '5921', 'e10adc3949ba59abbe56e057f20f883e', 'SARITA BANJARA(PHYAL', '5921', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5922, '5922', 'e10adc3949ba59abbe56e057f20f883e', 'PRAMILA KOIRALA', '5922', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5923, '5923', 'e10adc3949ba59abbe56e057f20f883e', 'SUSMA SEJUWAL', '5923', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5924, '5924', 'e10adc3949ba59abbe56e057f20f883e', 'NAMRATA TRIPATHI', '5924', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5925, '5925', 'e10adc3949ba59abbe56e057f20f883e', 'ARUNA K. CHAND', '5925', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5926, '5926', 'e10adc3949ba59abbe56e057f20f883e', 'PURNIMA JOSHI', '5926', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5927, '5927', 'e10adc3949ba59abbe56e057f20f883e', 'NITA PANTA', '5927', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5928, '5928', 'e10adc3949ba59abbe56e057f20f883e', 'RANJU ADHIKARI', '5928', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5929, '5929', 'e10adc3949ba59abbe56e057f20f883e', 'AMBIKA SILWAL', '5929', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5930, '5930', 'e10adc3949ba59abbe56e057f20f883e', 'URMILA NEUPANE', '5930', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5931, '5931', 'e10adc3949ba59abbe56e057f20f883e', 'PABITA PANTA', '5931', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5932, '5932', 'e10adc3949ba59abbe56e057f20f883e', 'KARUNA GAUTAM MARASI', '5932', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5933, '5933', 'e10adc3949ba59abbe56e057f20f883e', 'RANJU POUDEL(CHALISE', '5933', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5935, '5935', 'e10adc3949ba59abbe56e057f20f883e', 'BABITA ARYAL', '5935', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5936, '5936', 'e10adc3949ba59abbe56e057f20f883e', 'NANJITA PRADHAN', '5936', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5937, '5937', 'e10adc3949ba59abbe56e057f20f883e', 'RADHA KUMARI DHAKAL', '5937', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5938, '5938', 'e10adc3949ba59abbe56e057f20f883e', 'USHA BOHARA', '5938', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5939, '5939', 'e10adc3949ba59abbe56e057f20f883e', 'DIPIKA REGMI', '5939', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5940, '5940', 'e10adc3949ba59abbe56e057f20f883e', 'BINITA NEPAL', '5940', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5941, '5941', 'e10adc3949ba59abbe56e057f20f883e', 'BINA SUBEDI', '5941', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5942, '5942', 'e10adc3949ba59abbe56e057f20f883e', 'RITA ADHIKARI', '5942', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5943, '5943', 'e10adc3949ba59abbe56e057f20f883e', 'SHRUTI KOIRALA(ACHAR', '5943', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5944, '5944', 'e10adc3949ba59abbe56e057f20f883e', 'JHUMILA DEVI UPRETI', '5944', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5945, '5945', 'e10adc3949ba59abbe56e057f20f883e', 'SUJITA POKHREL', '5945', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5946, '5946', 'e10adc3949ba59abbe56e057f20f883e', 'DURGA KUMARI TAMANG', '5946', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5947, '5947', 'e10adc3949ba59abbe56e057f20f883e', 'SANJEEV KUMAR SAH', '5947', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5948, '5948', 'e10adc3949ba59abbe56e057f20f883e', 'RAJ KUMAR SAH', '5948', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5949, '5949', 'e10adc3949ba59abbe56e057f20f883e', 'DILLIRAM SUBEDI', '5949', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5950, '5950', 'e10adc3949ba59abbe56e057f20f883e', 'NARESH KUMAR SAH', '5950', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5951, '5951', 'e10adc3949ba59abbe56e057f20f883e', 'SURAJ KUMAR SAH', '5951', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5952, '5952', 'e10adc3949ba59abbe56e057f20f883e', 'NILU GURUNG(OLI)', '5952', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5953, '5953', 'e10adc3949ba59abbe56e057f20f883e', 'CHHAGENDRA ACHARYA', '5953', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5954, '5954', 'e10adc3949ba59abbe56e057f20f883e', 'MUKESH P. PANDE', '5954', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5955, '5955', 'e10adc3949ba59abbe56e057f20f883e', 'BHANUBHAKTA ACHARYA', '5955', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5956, '5956', 'e10adc3949ba59abbe56e057f20f883e', 'RAJU MIJAR', '5956', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5957, '5957', 'e10adc3949ba59abbe56e057f20f883e', 'RAMESH KUMAR YADAV', '5957', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5958, '5958', 'e10adc3949ba59abbe56e057f20f883e', 'RAMESH KATWAL', '5958', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5959, '5959', 'e10adc3949ba59abbe56e057f20f883e', 'RAMESH MISHRA', '5959', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5960, '5960', 'e10adc3949ba59abbe56e057f20f883e', 'SAPANA SHRESTHA', '5960', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5961, '5961', 'e10adc3949ba59abbe56e057f20f883e', 'SHUSHILA KHAREL', '5961', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5962, '5962', 'e10adc3949ba59abbe56e057f20f883e', 'MANJU BASKOTA', '5962', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5963, '5963', 'e10adc3949ba59abbe56e057f20f883e', 'ANJU GAUTAM', '5963', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5964, '5964', 'e10adc3949ba59abbe56e057f20f883e', 'TILOTTAMA KOIRALA', '5964', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5965, '5965', 'e10adc3949ba59abbe56e057f20f883e', 'RAM DINESH SAH', '5965', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5966, '5966', 'e10adc3949ba59abbe56e057f20f883e', 'NARENDRA SINGH SAMAN', '5966', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5967, '5967', 'e10adc3949ba59abbe56e057f20f883e', 'DEVRAJ UPRETI', '5967', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5968, '5968', 'e10adc3949ba59abbe56e057f20f883e', 'SUDHA KUMARI SAH', '5968', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5969, '5969', 'e10adc3949ba59abbe56e057f20f883e', 'SITA KUMARI SAH', '5969', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5970, '5970', 'e10adc3949ba59abbe56e057f20f883e', 'MALA NAYAK', '5970', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5972, '5972', 'e10adc3949ba59abbe56e057f20f883e', 'JYOTI JOSHI', '5972', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5973, '5973', 'e10adc3949ba59abbe56e057f20f883e', 'RUDRA BAHADUR THAPA', '5973', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5974, '5974', 'e10adc3949ba59abbe56e057f20f883e', 'RAMESH K. DAHAL', '5974', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5975, '5975', 'e10adc3949ba59abbe56e057f20f883e', 'INDIRA KARKI', '5975', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5976, '5976', 'e10adc3949ba59abbe56e057f20f883e', 'SHASHIKALA BASTOLA', '5976', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5977, '5977', 'e10adc3949ba59abbe56e057f20f883e', 'NUM B. RAYMAJHI', '5977', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5978, '5978', 'e10adc3949ba59abbe56e057f20f883e', 'MADAN B. ADHIKARI', '5978', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5979, '5979', 'e10adc3949ba59abbe56e057f20f883e', 'PREM KUMAR SHRESTHA', '5979', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5980, '5980', 'e10adc3949ba59abbe56e057f20f883e', 'SIDDHARTHA K. BARMA', '5980', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5981, '5981', 'e10adc3949ba59abbe56e057f20f883e', 'CHANDRA BHATTARAI', '5981', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5982, '5982', 'e10adc3949ba59abbe56e057f20f883e', 'MAHENDRA P. SHARMA', '5982', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5983, '5983', 'e10adc3949ba59abbe56e057f20f883e', 'BHUWANI P. SUBEDI', '5983', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5984, '5984', 'e10adc3949ba59abbe56e057f20f883e', 'RAM PRASAD JOSHI', '5984', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5985, '5985', 'e10adc3949ba59abbe56e057f20f883e', 'BHUGOL THAPA', '5985', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5986, '5986', 'e10adc3949ba59abbe56e057f20f883e', 'BIRENDRA B. BISTA', '5986', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5987, '5987', 'e10adc3949ba59abbe56e057f20f883e', 'NAR BAHADUR DEUWA', '5987', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5988, '5988', 'e10adc3949ba59abbe56e057f20f883e', 'SHER B. GHARTI KSHET', '5988', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5989, '5989', 'e10adc3949ba59abbe56e057f20f883e', 'MADHUSUDAN KHADKA', '5989', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5990, '5990', 'e10adc3949ba59abbe56e057f20f883e', 'BADRI N. POUDEL', '5990', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5991, '5991', 'e10adc3949ba59abbe56e057f20f883e', 'SITA KUMARI SHARMA', '5991', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5992, '5992', 'e10adc3949ba59abbe56e057f20f883e', 'JENU BASNET', '5992', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5993, '5993', 'e10adc3949ba59abbe56e057f20f883e', 'RUDRA PRASAD NIRAULA', '5993', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5994, '5994', 'e10adc3949ba59abbe56e057f20f883e', 'BISHOW NATH ADHIKARI', '5994', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5995, '5995', 'e10adc3949ba59abbe56e057f20f883e', 'GOBINDA BANDHU ARYAL', '5995', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5996, '5996', 'e10adc3949ba59abbe56e057f20f883e', 'SHYAM KUMAR POUDEL', '5996', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5997, '5997', 'e10adc3949ba59abbe56e057f20f883e', 'DAN BAHADUR CHAND', '5997', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5998, '5998', 'e10adc3949ba59abbe56e057f20f883e', 'DURG P. BHATTARAI', '5998', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(5999, '5999', 'e10adc3949ba59abbe56e057f20f883e', 'DEEPAK NEUPANE', '5999', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6000, '6000', 'e10adc3949ba59abbe56e057f20f883e', 'RABINDRA THAKUR', '6000', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6001, '6001', 'e10adc3949ba59abbe56e057f20f883e', 'GANGA ADHIKARI(BHUSA', '6001', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6002, '6002', 'e10adc3949ba59abbe56e057f20f883e', 'BAM BAHADUR MAAL', '6002', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6003, '6003', 'e10adc3949ba59abbe56e057f20f883e', 'BINA DAHAL(BHATTARAI', '6003', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6004, '6004', 'e10adc3949ba59abbe56e057f20f883e', 'KOMA RAWAT', '6004', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6005, '6005', 'e10adc3949ba59abbe56e057f20f883e', 'BABITA KUMARI DATTA', '6005', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6006, '6006', 'e10adc3949ba59abbe56e057f20f883e', 'RITA PARAJULI(POKHRE', '6006', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6007, '6007', 'e10adc3949ba59abbe56e057f20f883e', 'TULARAM CHAUDHARI', '6007', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6008, '6008', 'e10adc3949ba59abbe56e057f20f883e', 'URMILA DEVI BHATTARA', '6008', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6009, '6009', 'e10adc3949ba59abbe56e057f20f883e', 'UPENDRA PANDEY', '6009', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6010, '6010', 'e10adc3949ba59abbe56e057f20f883e', 'INDRANATH PATHAK', '6010', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6011, '6011', 'e10adc3949ba59abbe56e057f20f883e', 'BIRENDRA K. YADAV', '6011', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6012, '6012', 'e10adc3949ba59abbe56e057f20f883e', 'BHIM BAHADUR ROKAY', '6012', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6013, '6013', 'e10adc3949ba59abbe56e057f20f883e', 'OM PRASAD SHRESTHA', '6013', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6016, '6016', 'e10adc3949ba59abbe56e057f20f883e', 'NRIP BAHADUR RAWAL', '6016', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6017, '6017', 'e10adc3949ba59abbe56e057f20f883e', 'RAJIB LAMICHHANE', '6017', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6018, '6018', 'e10adc3949ba59abbe56e057f20f883e', 'BHA DEVI GHARTIMAGAR', '6018', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6019, '6019', 'e10adc3949ba59abbe56e057f20f883e', 'MOHAN PRASAD GHIMIRE', '6019', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6020, '6020', 'e10adc3949ba59abbe56e057f20f883e', 'SHARADA DEVI GHIMIRE', '6020', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6021, '6021', 'e10adc3949ba59abbe56e057f20f883e', 'KALPANA KU. SUBEDI', '6021', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6022, '6022', 'e10adc3949ba59abbe56e057f20f883e', 'DAN SINGH THAPA', '6022', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6023, '6023', 'e10adc3949ba59abbe56e057f20f883e', 'YUGAL KISHOR SHARMA', '6023', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6024, '6024', 'e10adc3949ba59abbe56e057f20f883e', 'DURGA DEVI KHATIWADA', '6024', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6025, '6025', 'e10adc3949ba59abbe56e057f20f883e', 'MINA KAFLE', '6025', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6026, '6026', 'e10adc3949ba59abbe56e057f20f883e', 'SAROJ KUMAR DHUNDEL', '6026', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6027, '6027', 'e10adc3949ba59abbe56e057f20f883e', 'SHOVA PANT', '6027', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6028, '6028', 'e10adc3949ba59abbe56e057f20f883e', 'KESHAV RAJ OJHA', '6028', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6029, '6029', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA P. SHARMA', '6029', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6030, '6030', 'e10adc3949ba59abbe56e057f20f883e', 'LAL BAHADUR BHANDARI', '6030', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6031, '6031', 'e10adc3949ba59abbe56e057f20f883e', 'NIRMALA DANGOL', '6031', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6032, '6032', 'e10adc3949ba59abbe56e057f20f883e', 'SUDHA DAWADI(WAGLE)', '6032', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6033, '6033', 'e10adc3949ba59abbe56e057f20f883e', 'PADAM PRASAD NEUPANE', '6033', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6034, '6034', 'e10adc3949ba59abbe56e057f20f883e', 'DIPA POKHREL', '6034', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6035, '6035', 'e10adc3949ba59abbe56e057f20f883e', 'PRAMILA KE. SHRESTHA', '6035', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6036, '6036', 'e10adc3949ba59abbe56e057f20f883e', 'MOHAN KRISHNA BHATTA', '6036', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6037, '6037', 'e10adc3949ba59abbe56e057f20f883e', 'SUDARSHAN BHURTEL', '6037', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6038, '6038', 'e10adc3949ba59abbe56e057f20f883e', 'MANOJ NIRAULA', '6038', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6039, '6039', 'e10adc3949ba59abbe56e057f20f883e', 'DIPAK K. RANABHAT', '6039', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6040, '6040', 'e10adc3949ba59abbe56e057f20f883e', 'GAURIMAYA SAPKOTA', '6040', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6041, '6041', 'e10adc3949ba59abbe56e057f20f883e', 'PREMCHANDRA PANDIT', '6041', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6042, '6042', 'e10adc3949ba59abbe56e057f20f883e', 'SITA KHADKA', '6042', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6043, '6043', 'e10adc3949ba59abbe56e057f20f883e', 'MAN B. ADHIKARI', '6043', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6044, '6044', 'e10adc3949ba59abbe56e057f20f883e', 'IREN SHRESTHA(RAJKAR', '6044', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6045, '6045', 'e10adc3949ba59abbe56e057f20f883e', 'DIPAK K. MAJHI THARU', '6045', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6046, '6046', 'e10adc3949ba59abbe56e057f20f883e', 'ARATI JOSHI', '6046', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6047, '6047', 'e10adc3949ba59abbe56e057f20f883e', 'DEVI DHAKAL(GAUTAM)', '6047', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6048, '6048', 'e10adc3949ba59abbe56e057f20f883e', 'RAM BAHADUR SHRESTHA', '6048', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6049, '6049', 'e10adc3949ba59abbe56e057f20f883e', 'SUMITRA UPADHYAYA PA', '6049', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6050, '6050', 'e10adc3949ba59abbe56e057f20f883e', 'TEK BAHADUR GHARTIMA', '6050', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6051, '6051', 'e10adc3949ba59abbe56e057f20f883e', 'BINA SHARMA GHIMIRE', '6051', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6052, '6052', 'e10adc3949ba59abbe56e057f20f883e', 'URMILA POKHREL(KOIRA', '6052', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6053, '6053', 'e10adc3949ba59abbe56e057f20f883e', 'RAM KUMAR KHADKA', '6053', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6054, '6054', 'e10adc3949ba59abbe56e057f20f883e', 'SHAKUNTALA SHAH', '6054', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6055, '6055', 'e10adc3949ba59abbe56e057f20f883e', 'SHREEHARI PUDASAINI', '6055', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6056, '6056', 'e10adc3949ba59abbe56e057f20f883e', 'MADU BHUJU', '6056', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6057, '6057', 'e10adc3949ba59abbe56e057f20f883e', 'SUWARNA RAWAL', '6057', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6058, '6058', 'e10adc3949ba59abbe56e057f20f883e', 'GANGALAL LAMSAL', '6058', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6060, '6060', 'e10adc3949ba59abbe56e057f20f883e', 'BABITA BASNET', '6060', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6061, '6061', 'e10adc3949ba59abbe56e057f20f883e', 'BIJENDRA PD YADAV', '6061', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6062, '6062', 'e10adc3949ba59abbe56e057f20f883e', 'KHADANANDA ACHARYA', '6062', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6063, '6063', 'e10adc3949ba59abbe56e057f20f883e', 'LAXMI KATHAYAT', '6063', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6064, '6064', 'e10adc3949ba59abbe56e057f20f883e', 'BISHNU PD CHAUDHARY', '6064', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6065, '6065', 'e10adc3949ba59abbe56e057f20f883e', 'BASUDEV GIRI', '6065', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6066, '6066', 'e10adc3949ba59abbe56e057f20f883e', 'TANKA BDR TIMILSINA', '6066', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6067, '6067', 'e10adc3949ba59abbe56e057f20f883e', 'SAROJ C. BHANDARY', '6067', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6068, '6068', 'e10adc3949ba59abbe56e057f20f883e', 'KUL BAHADUR TAMANG', '6068', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6069, '6069', 'e10adc3949ba59abbe56e057f20f883e', 'NAR BAHADUR THAPA', '6069', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6070, '6070', 'e10adc3949ba59abbe56e057f20f883e', 'GANESHMAN SHRESTHA', '6070', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6072, '6072', 'e10adc3949ba59abbe56e057f20f883e', 'YADAV PRASAD ACHARYA', '6072', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6073, '6073', 'e10adc3949ba59abbe56e057f20f883e', 'BHOTE B.LUNGE MAGAR', '6073', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6074, '6074', 'e10adc3949ba59abbe56e057f20f883e', 'BISHNU B. PANDIT', '6074', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6075, '6075', 'e10adc3949ba59abbe56e057f20f883e', 'BINIRAM PANDE', '6075', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6076, '6076', 'e10adc3949ba59abbe56e057f20f883e', 'PANCHA KUMAR BHADEL', '6076', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6077, '6077', 'e10adc3949ba59abbe56e057f20f883e', 'ACHYUT BISTA', '6077', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6078, '6078', 'e10adc3949ba59abbe56e057f20f883e', 'KALYAN SINGH RAWAL', '6078', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6079, '6079', 'e10adc3949ba59abbe56e057f20f883e', 'ARUN PRASAD MISHRA', '6079', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6080, '6080', 'e10adc3949ba59abbe56e057f20f883e', 'TEK B. KATUWAL', '6080', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6081, '6081', 'e10adc3949ba59abbe56e057f20f883e', 'TIKA BAHADUR BASNET', '6081', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6082, '6082', 'e10adc3949ba59abbe56e057f20f883e', 'GANESH BAHADUR THAPA', '6082', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6083, '6083', 'e10adc3949ba59abbe56e057f20f883e', 'GOBINDA B.BOHARA', '6083', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6084, '6084', 'e10adc3949ba59abbe56e057f20f883e', 'RABINDRA RAY YADAV', '6084', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6085, '6085', 'e10adc3949ba59abbe56e057f20f883e', 'NAKHELAL RAJBANSHI', '6085', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6087, '6087', 'e10adc3949ba59abbe56e057f20f883e', 'AKKAL BAHADUE BAL', '6087', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6088, '6088', 'e10adc3949ba59abbe56e057f20f883e', 'MADHAV P. BHATTARAI', '6088', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6089, '6089', 'e10adc3949ba59abbe56e057f20f883e', 'LEKH BAHADUR KUMAL', '6089', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6090, '6090', 'e10adc3949ba59abbe56e057f20f883e', 'DIPAK KUMAR KHADKA', '6090', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6091, '6091', 'e10adc3949ba59abbe56e057f20f883e', 'GIRI PRASAD POUDEL', '6091', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6092, '6092', 'e10adc3949ba59abbe56e057f20f883e', 'SHANKAR B. BASNET', '6092', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6093, '6093', 'e10adc3949ba59abbe56e057f20f883e', 'NARENDRA SHRESTHA', '6093', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6094, '6094', 'e10adc3949ba59abbe56e057f20f883e', 'PITANATH BUDHATHOKI', '6094', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6095, '6095', 'e10adc3949ba59abbe56e057f20f883e', 'RUKMINI KHATIWADA', '6095', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6096, '6096', 'e10adc3949ba59abbe56e057f20f883e', 'SHIVA RAJ SUBEDI', '6096', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6097, '6097', 'e10adc3949ba59abbe56e057f20f883e', 'NEETA KOIRALA', '6097', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6099, '6099', 'e10adc3949ba59abbe56e057f20f883e', 'KUMAR PUDASAINI', '6099', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6100, '6100', 'e10adc3949ba59abbe56e057f20f883e', 'SURESH POKHAREL', '6100', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6102, '6102', 'e10adc3949ba59abbe56e057f20f883e', 'BHAWANI DEUJA', '6102', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6103, '6103', 'e10adc3949ba59abbe56e057f20f883e', 'SUKAI THARU', '6103', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6104, '6104', 'e10adc3949ba59abbe56e057f20f883e', 'JHANKA NATH BHATTA', '6104', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6105, '6105', 'e10adc3949ba59abbe56e057f20f883e', 'RAMAN MAHARJAN', '6105', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6106, '6106', 'e10adc3949ba59abbe56e057f20f883e', 'DEEP SINGH RAUT', '6106', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6107, '6107', 'e10adc3949ba59abbe56e057f20f883e', 'SUJAN DHAKAL', '6107', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6108, '6108', 'e10adc3949ba59abbe56e057f20f883e', 'KISHOR BAJAGAIN', '6108', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6109, '6109', 'e10adc3949ba59abbe56e057f20f883e', 'YAMLAL POUDEL', '6109', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6111, '6111', 'e10adc3949ba59abbe56e057f20f883e', 'TIRTHA RAJ POUDEL', '6111', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6112, '6112', 'e10adc3949ba59abbe56e057f20f883e', 'BIJAYA DHAKAL', '6112', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6113, '6113', 'e10adc3949ba59abbe56e057f20f883e', 'AMRIT PD. POUDYAL', '6113', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6114, '6114', 'e10adc3949ba59abbe56e057f20f883e', 'BISHNU PD. POUDEL', '6114', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6115, '6115', 'e10adc3949ba59abbe56e057f20f883e', 'CHAKRABIR BHANDARI', '6115', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6116, '6116', 'e10adc3949ba59abbe56e057f20f883e', 'UMESH RAJ RIJAL', '6116', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6117, '6117', 'e10adc3949ba59abbe56e057f20f883e', 'DEBENDRA RAJ MAINALI', '6117', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6120, '6120', 'e10adc3949ba59abbe56e057f20f883e', 'PRAGYA GHIMIRE', '6120', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6121, '6121', 'e10adc3949ba59abbe56e057f20f883e', 'SIMA BAN', '6121', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6122, '6122', 'e10adc3949ba59abbe56e057f20f883e', 'KALPANA SEDHAI', '6122', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6123, '6123', 'e10adc3949ba59abbe56e057f20f883e', 'NARAYAN D.SHRESTHA', '6123', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6124, '6124', 'e10adc3949ba59abbe56e057f20f883e', 'RABI KUMAR SHRESTHA', '6124', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6126, '6126', 'e10adc3949ba59abbe56e057f20f883e', 'MITHILESH KUMAR JHA', '6126', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6127, '6127', 'e10adc3949ba59abbe56e057f20f883e', 'PARWESH RAY', '6127', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6129, '6129', 'e10adc3949ba59abbe56e057f20f883e', 'NETRA BUDH THAPA', '6129', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6130, '6130', 'e10adc3949ba59abbe56e057f20f883e', 'PRAKASH DHUNGANA', '6130', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6131, '6131', 'e10adc3949ba59abbe56e057f20f883e', 'NIRANJAN SWAR', '6131', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6132, '6132', 'e10adc3949ba59abbe56e057f20f883e', 'MADHU SUBEDI', '6132', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6133, '6133', 'e10adc3949ba59abbe56e057f20f883e', 'RAJESH KHANAL', '6133', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6135, '6135', 'e10adc3949ba59abbe56e057f20f883e', 'GANESH GHIMIRE', '6135', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6136, '6136', 'e10adc3949ba59abbe56e057f20f883e', 'SUBASH TIMILSINA', '6136', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6137, '6137', 'e10adc3949ba59abbe56e057f20f883e', 'BIKRAM THAPA MAGAR', '6137', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6138, '6138', 'e10adc3949ba59abbe56e057f20f883e', 'PREM KUMAR BHANDARI', '6138', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6139, '6139', 'e10adc3949ba59abbe56e057f20f883e', 'NARMADA ADHIKARI', '6139', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6140, '6140', 'e10adc3949ba59abbe56e057f20f883e', 'DOL RAJ PATHAK', '6140', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6141, '6141', 'e10adc3949ba59abbe56e057f20f883e', 'GANESH BHATTARAI', '6141', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6142, '6142', 'e10adc3949ba59abbe56e057f20f883e', 'TEJ BAHADUR KARKI', '6142', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6143, '6143', 'e10adc3949ba59abbe56e057f20f883e', 'BHAGAWATI DHUNGANA', '6143', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6144, '6144', 'e10adc3949ba59abbe56e057f20f883e', 'SHREEJANA DHAKAL', '6144', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6145, '6145', 'e10adc3949ba59abbe56e057f20f883e', 'TARA PD. POUDYAL', '6145', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6146, '6146', 'e10adc3949ba59abbe56e057f20f883e', 'KESHAV POKHAREL', '6146', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6148, '6148', 'e10adc3949ba59abbe56e057f20f883e', 'AYAN BHATTARAI', '6148', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6149, '6149', 'e10adc3949ba59abbe56e057f20f883e', 'ANUP DHAKAL', '6149', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6150, '6150', 'e10adc3949ba59abbe56e057f20f883e', 'DIPENDRA LAMICHHANE', '6150', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6152, '6152', 'e10adc3949ba59abbe56e057f20f883e', 'INUSHA SUBEDI', '6152', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6153, '6153', 'e10adc3949ba59abbe56e057f20f883e', 'ANITA MALLA', '6153', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6155, '6155', 'e10adc3949ba59abbe56e057f20f883e', 'SAMITA GAUTAM', '6155', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6156, '6156', 'e10adc3949ba59abbe56e057f20f883e', 'ABINASH RANA MAGAR', '6156', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6158, '6158', 'e10adc3949ba59abbe56e057f20f883e', 'KAJIRAM CHAUDHARI', '6158', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6160, '6160', 'e10adc3949ba59abbe56e057f20f883e', 'SHRIJANA SHRESTHA', '6160', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6161, '6161', 'e10adc3949ba59abbe56e057f20f883e', 'RAJESH KUMAR SAH', '6161', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6162, '6162', 'e10adc3949ba59abbe56e057f20f883e', 'FAIYAJ ALI', '6162', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6164, '6164', 'e10adc3949ba59abbe56e057f20f883e', 'SIMA KUMARI SHAH', '6164', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6165, '6165', 'e10adc3949ba59abbe56e057f20f883e', 'DIPAK KUNWAR', '6165', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6166, '6166', 'e10adc3949ba59abbe56e057f20f883e', 'SANTOSH JUNG KARKI', '6166', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6167, '6167', 'e10adc3949ba59abbe56e057f20f883e', 'DINESH KARKI', '6167', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6168, '6168', 'e10adc3949ba59abbe56e057f20f883e', 'TOYA NATH DAHAL', '6168', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6171, '6171', 'e10adc3949ba59abbe56e057f20f883e', 'MAHESH MARASINI', '6171', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6172, '6172', 'e10adc3949ba59abbe56e057f20f883e', 'RONIKA KOIRALA', '6172', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6173, '6173', 'e10adc3949ba59abbe56e057f20f883e', 'RUDRA ADHIKARI', '6173', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6174, '6174', 'e10adc3949ba59abbe56e057f20f883e', 'RUPESH NIRAULA', '6174', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6175, '6175', 'e10adc3949ba59abbe56e057f20f883e', 'NEHA BASNET', '6175', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6177, '6177', 'e10adc3949ba59abbe56e057f20f883e', 'ANJANA GHIMIRE', '6177', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6178, '6178', 'e10adc3949ba59abbe56e057f20f883e', 'ANJANA DANGAL', '6178', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6179, '6179', 'e10adc3949ba59abbe56e057f20f883e', 'PRAJWOL TUMBAPO', '6179', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6180, '6180', 'e10adc3949ba59abbe56e057f20f883e', 'ASHOK KR. CHAUDHARI', '6180', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6181, '6181', 'e10adc3949ba59abbe56e057f20f883e', 'SHIVA SHANKAR RAUT', '6181', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6182, '6182', 'e10adc3949ba59abbe56e057f20f883e', 'AJAYA GUPTA', '6182', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6183, '6183', 'e10adc3949ba59abbe56e057f20f883e', 'ALIJA SITAULA', '6183', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6184, '6184', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNA PD. BASTOLA', '6184', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6185, '6185', 'e10adc3949ba59abbe56e057f20f883e', 'GYANENDRA PD. RIMAL', '6185', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6186, '6186', 'e10adc3949ba59abbe56e057f20f883e', 'LAXMAN PATHAK', '6186', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6189, '6189', 'e10adc3949ba59abbe56e057f20f883e', 'GAHNASHYAM ADHIKARI', '6189', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6190, '6190', 'e10adc3949ba59abbe56e057f20f883e', 'NARAYAN BHANDARI', '6190', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6191, '6191', 'e10adc3949ba59abbe56e057f20f883e', 'BINDA BASNET', '6191', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6193, '6193', 'e10adc3949ba59abbe56e057f20f883e', 'RAJENDRA SUBEDI', '6193', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6194, '6194', 'e10adc3949ba59abbe56e057f20f883e', 'DEVI HAMAL THAKURI', '6194', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6195, '6195', 'e10adc3949ba59abbe56e057f20f883e', 'SITA ADHIKARI', '6195', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin');
INSERT INTO `tblextuser` (`user_id`, `logon_name`, `user_pass`, `user_name`, `staff_code`, `company_id`, `group_policy`, `start_date`, `end_date`, `status`, `input_date`, `inputter`, `authorizer`) VALUES
(6196, '6196', 'e10adc3949ba59abbe56e057f20f883e', 'SANGITA PAHARI', '6196', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6197, '6197', 'e10adc3949ba59abbe56e057f20f883e', 'JITENDRA BDR. GHARTI', '6197', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6198, '6198', 'e10adc3949ba59abbe56e057f20f883e', 'PREMNATH KASAJU', '6198', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6199, '6199', 'e10adc3949ba59abbe56e057f20f883e', 'BABITA GUPTA', '6199', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6200, '6200', 'e10adc3949ba59abbe56e057f20f883e', 'JITENDRA PRASAD SAH', '6200', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6201, '6201', 'e10adc3949ba59abbe56e057f20f883e', 'JULI PARIYAR', '6201', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6202, '6202', 'e10adc3949ba59abbe56e057f20f883e', 'BHIM BAHADUR THAPA', '6202', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6203, '6203', 'e10adc3949ba59abbe56e057f20f883e', 'NARAD BOGATI', '6203', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6204, '6204', 'e10adc3949ba59abbe56e057f20f883e', 'HIRA BAHADUR OLI', '6204', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6205, '6205', 'e10adc3949ba59abbe56e057f20f883e', 'MINA KUMARI SINGH', '6205', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6206, '6206', 'e10adc3949ba59abbe56e057f20f883e', 'NARESH AWASTHI', '6206', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6207, '6207', 'e10adc3949ba59abbe56e057f20f883e', 'SURJAN BAHADUR CHAND', '6207', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6208, '6208', 'e10adc3949ba59abbe56e057f20f883e', 'GANESH PD.PANDEY', '6208', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6209, '6209', 'e10adc3949ba59abbe56e057f20f883e', 'POSHAN SINGH G.K.', '6209', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6210, '6210', 'e10adc3949ba59abbe56e057f20f883e', 'ATISH SHARMA', '6210', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6211, '6211', 'e10adc3949ba59abbe56e057f20f883e', 'SAMJHAUTA TAMANG', '6211', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6212, '6212', 'e10adc3949ba59abbe56e057f20f883e', 'SURESH POKHREL', '6212', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6213, '6213', 'e10adc3949ba59abbe56e057f20f883e', 'LAXMAN BHATTARAI', '6213', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6214, '6214', 'e10adc3949ba59abbe56e057f20f883e', 'SHANTI PRASAD RIJAL', '6214', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6215, '6215', 'e10adc3949ba59abbe56e057f20f883e', 'TIRTHA RAJ PANDIT', '6215', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6216, '6216', 'e10adc3949ba59abbe56e057f20f883e', 'ASMITA PANTA', '6216', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6217, '6217', 'e10adc3949ba59abbe56e057f20f883e', 'CHITRA PANTA', '6217', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6218, '6218', 'e10adc3949ba59abbe56e057f20f883e', 'SANJIMA K. KARMACHAR', '6218', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6219, '6219', 'e10adc3949ba59abbe56e057f20f883e', 'MANOJ KUMAR CHAUDHAR', '6219', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6220, '6220', 'e10adc3949ba59abbe56e057f20f883e', 'CHANDRA KU. SINJALI', '6220', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6221, '6221', 'e10adc3949ba59abbe56e057f20f883e', 'MITHULAL CHAUDHARI', '6221', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6222, '6222', 'e10adc3949ba59abbe56e057f20f883e', 'SUNITA YADAV', '6222', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6223, '6223', 'e10adc3949ba59abbe56e057f20f883e', 'RAM CHARAN YADAV', '6223', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6224, '6224', 'e10adc3949ba59abbe56e057f20f883e', 'BRIHASPATI NEPALI', '6224', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6225, '6225', 'e10adc3949ba59abbe56e057f20f883e', 'DHARANA ACHARYA', '6225', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6226, '6226', 'e10adc3949ba59abbe56e057f20f883e', 'TAKKAR KUNWAR', '6226', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6227, '6227', 'e10adc3949ba59abbe56e057f20f883e', 'TIKA PRASAD SUBEDI', '6227', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6228, '6228', 'e10adc3949ba59abbe56e057f20f883e', 'SURYA BDR SHRESTHA', '6228', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6229, '6229', 'e10adc3949ba59abbe56e057f20f883e', 'NABIN POUDEL', '6229', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6230, '6230', 'e10adc3949ba59abbe56e057f20f883e', 'ARJUN KARKI', '6230', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6231, '6231', 'e10adc3949ba59abbe56e057f20f883e', 'MENUKA DUWADI', '6231', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6232, '6232', 'e10adc3949ba59abbe56e057f20f883e', 'GAURI BHANDARI', '6232', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6233, '6233', 'e10adc3949ba59abbe56e057f20f883e', 'BISHNU KUMARI BASYAL', '6233', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6234, '6234', 'e10adc3949ba59abbe56e057f20f883e', 'RISHMI CHAUDHARI', '6234', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6235, '6235', 'e10adc3949ba59abbe56e057f20f883e', 'HEM BUDHA', '6235', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6236, '6236', 'e10adc3949ba59abbe56e057f20f883e', 'BISHNU PD.KHANAL', '6236', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6237, '6237', 'e10adc3949ba59abbe56e057f20f883e', 'RAMA PARAJULI', '6237', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6238, '6238', 'e10adc3949ba59abbe56e057f20f883e', 'RAMILA KUMARI KHADKA', '6238', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6239, '6239', 'e10adc3949ba59abbe56e057f20f883e', 'GHANINDRA MAYA KARKI', '6239', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6240, '6240', 'e10adc3949ba59abbe56e057f20f883e', 'JANG BAHADUR KUMAL', '6240', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6241, '6241', 'e10adc3949ba59abbe56e057f20f883e', 'LAXMIKUMARI SHRESTHA', '6241', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6242, '6242', 'e10adc3949ba59abbe56e057f20f883e', 'DHARMANATH YADAV', '6242', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6243, '6243', 'e10adc3949ba59abbe56e057f20f883e', 'BIJAYA KANT JHA', '6243', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6244, '6244', 'e10adc3949ba59abbe56e057f20f883e', 'RANGBIR SUNAR', '6244', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6245, '6245', 'e10adc3949ba59abbe56e057f20f883e', 'SHILADEVI RAI', '6245', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6246, '6246', 'e10adc3949ba59abbe56e057f20f883e', 'KAMALA PANDE', '6246', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6247, '6247', 'e10adc3949ba59abbe56e057f20f883e', 'SURENDRA RANJIT', '6247', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6248, '6248', 'e10adc3949ba59abbe56e057f20f883e', 'NANDA B. MAHARJAN', '6248', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6249, '6249', 'e10adc3949ba59abbe56e057f20f883e', 'SANU KAJI SHRESTHA', '6249', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6250, '6250', 'e10adc3949ba59abbe56e057f20f883e', 'ARUN KUMAR YADAV', '6250', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6251, '6251', 'e10adc3949ba59abbe56e057f20f883e', 'KUMAR TAMANG', '6251', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6252, '6252', 'e10adc3949ba59abbe56e057f20f883e', 'MADHUSUDAN ARYAL', '6252', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6253, '6253', 'e10adc3949ba59abbe56e057f20f883e', 'SHYAMGOBINDA MAHARJA', '6253', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6254, '6254', 'e10adc3949ba59abbe56e057f20f883e', 'TANKA BAHADUR MAGAR', '6254', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6255, '6255', 'e10adc3949ba59abbe56e057f20f883e', 'BHOLA YADAV', '6255', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6256, '6256', 'e10adc3949ba59abbe56e057f20f883e', 'KHILA NATH SHARMA', '6256', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6257, '6257', 'e10adc3949ba59abbe56e057f20f883e', 'SAROJ DEVI KALWAR', '6257', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6258, '6258', 'e10adc3949ba59abbe56e057f20f883e', 'PUTALI MAYA RAI', '6258', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6259, '6259', 'e10adc3949ba59abbe56e057f20f883e', 'BIMALA KUNWAR ADHIKA', '6259', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6260, '6260', 'e10adc3949ba59abbe56e057f20f883e', 'LAXMI SUBEDI', '6260', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6261, '6261', 'e10adc3949ba59abbe56e057f20f883e', 'REG BAHADUR DANGI', '6261', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6262, '6262', 'e10adc3949ba59abbe56e057f20f883e', 'PHANADHAR POKHREL', '6262', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6263, '6263', 'e10adc3949ba59abbe56e057f20f883e', 'DEVRAJ NEUPANE', '6263', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6264, '6264', 'e10adc3949ba59abbe56e057f20f883e', 'LAXMAN MANANDHAR', '6264', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6265, '6265', 'e10adc3949ba59abbe56e057f20f883e', 'SHAMBHU RAI', '6265', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6266, '6266', 'e10adc3949ba59abbe56e057f20f883e', 'RAJ KUMAR MUSHAR', '6266', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6267, '6267', 'e10adc3949ba59abbe56e057f20f883e', 'BUCHCHI LAL YADAV', '6267', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6268, '6268', 'e10adc3949ba59abbe56e057f20f883e', 'RAM BAHADUR BHUJEL', '6268', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6269, '6269', 'e10adc3949ba59abbe56e057f20f883e', 'YOGENDRARAJ PARAJULI', '6269', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6270, '6270', 'e10adc3949ba59abbe56e057f20f883e', 'GYANENDRA B. KHADKA', '6270', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6271, '6271', 'e10adc3949ba59abbe56e057f20f883e', 'YAGYA BAHADUR BHUJEL', '6271', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6272, '6272', 'e10adc3949ba59abbe56e057f20f883e', 'KARNA BAHADUR MAHARA', '6272', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6273, '6273', 'e10adc3949ba59abbe56e057f20f883e', 'HARINANDA GAUTAM', '6273', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6274, '6274', 'e10adc3949ba59abbe56e057f20f883e', 'YAGYA PRASAD NEPAL', '6274', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6275, '6275', 'e10adc3949ba59abbe56e057f20f883e', 'MEL PRASAD ACHARYA', '6275', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6276, '6276', 'e10adc3949ba59abbe56e057f20f883e', 'BASANTA KUMAR BHUSAL', '6276', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6277, '6277', 'e10adc3949ba59abbe56e057f20f883e', 'JAYAMAL ADI', '6277', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6278, '6278', 'e10adc3949ba59abbe56e057f20f883e', 'KRISHNAPRASAD POUDEL', '6278', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6279, '6279', 'e10adc3949ba59abbe56e057f20f883e', 'GANESHPRASAD DHAMALA', '6279', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6280, '6280', 'e10adc3949ba59abbe56e057f20f883e', 'MAHA PRASAD PARAJULI', '6280', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6281, '6281', 'e10adc3949ba59abbe56e057f20f883e', 'RAKESH BASNET', '6281', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6282, '6282', 'e10adc3949ba59abbe56e057f20f883e', 'RAMKRISHNA PUDASAINI', '6282', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6283, '6283', 'e10adc3949ba59abbe56e057f20f883e', 'GUN B. ALEMAGAR', '6283', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6284, '6284', 'e10adc3949ba59abbe56e057f20f883e', 'EKINDRA B. TAMANG', '6284', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6285, '6285', 'e10adc3949ba59abbe56e057f20f883e', 'BAHADUR THARU', '6285', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6286, '6286', 'e10adc3949ba59abbe56e057f20f883e', 'TUL BAHADUR MAGAR', '6286', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6287, '6287', 'e10adc3949ba59abbe56e057f20f883e', 'HARI BAHADUR MALLA', '6287', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6288, '6288', 'e10adc3949ba59abbe56e057f20f883e', 'TIKA DATTA PANERU', '6288', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6289, '6289', 'e10adc3949ba59abbe56e057f20f883e', 'SITA ADHIKARI', '6289', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6290, '6290', 'e10adc3949ba59abbe56e057f20f883e', 'RADHIKA ADHIKARI', '6290', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6291, '6291', 'e10adc3949ba59abbe56e057f20f883e', 'INDRA MAYA SUBEDI', '6291', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6292, '6292', 'e10adc3949ba59abbe56e057f20f883e', 'LAXMI G.C.', '6292', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6293, '6293', 'e10adc3949ba59abbe56e057f20f883e', 'RAM BAHADUR THARU', '6293', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6294, '6294', 'e10adc3949ba59abbe56e057f20f883e', 'MIM BAHADUR GURUNG', '6294', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6295, '6295', 'e10adc3949ba59abbe56e057f20f883e', 'THAKUR MAN SHRESTHA', '6295', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6296, '6296', 'e10adc3949ba59abbe56e057f20f883e', 'SUNIL KUMAR YADAV', '6296', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6297, '6297', 'e10adc3949ba59abbe56e057f20f883e', 'SHANKAR P. CHAUDHARI', '6297', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6298, '6298', 'e10adc3949ba59abbe56e057f20f883e', 'HIM PRASAD SHRESTHA', '6298', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6299, '6299', 'e10adc3949ba59abbe56e057f20f883e', 'NAR KANTA BHAT', '6299', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6300, '6300', 'e10adc3949ba59abbe56e057f20f883e', 'RAJIV BIKRM ADHIKARI', '6300', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6301, '6301', 'e10adc3949ba59abbe56e057f20f883e', 'AMOD ULAK', '6301', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6302, '6302', 'e10adc3949ba59abbe56e057f20f883e', 'MANOJ KAFLE', '6302', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6303, '6303', 'e10adc3949ba59abbe56e057f20f883e', 'BIKASH BHATTRAI', '6303', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6304, '6304', 'e10adc3949ba59abbe56e057f20f883e', 'KESHAV KATTEL', '6304', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6305, '6305', 'e10adc3949ba59abbe56e057f20f883e', 'ARJUN KHANAL', '6305', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6306, '6306', 'e10adc3949ba59abbe56e057f20f883e', 'MANOJ KARKI', '6306', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6307, '6307', 'e10adc3949ba59abbe56e057f20f883e', 'GANESH GIMIRE', '6307', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6308, '6308', 'e10adc3949ba59abbe56e057f20f883e', 'LOK PRASAD GAUTAM', '6308', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6310, '6310', 'e10adc3949ba59abbe56e057f20f883e', 'CHANAK RAJ UPADHAYA', '6310', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6311, '6311', 'e10adc3949ba59abbe56e057f20f883e', 'Puspa Kumari Saha', '6311', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6312, '6312', 'e10adc3949ba59abbe56e057f20f883e', 'BIBHUTI KUMAR JHA', '6312', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6313, '6313', 'e10adc3949ba59abbe56e057f20f883e', 'BISHNU BHUJEL', '6313', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6314, '6314', 'e10adc3949ba59abbe56e057f20f883e', 'KESHAV PRASAD DHOTEL', '6314', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6315, '6315', 'e10adc3949ba59abbe56e057f20f883e', 'RABINDRA PRASAD REGMI', '6315', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6316, '6316', 'e10adc3949ba59abbe56e057f20f883e', 'HARI PRASAD ARAYAL', '6316', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6317, '6317', 'e10adc3949ba59abbe56e057f20f883e', 'ASHOK KUMAR SHRESTHA', '6317', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6318, '6318', 'e10adc3949ba59abbe56e057f20f883e', 'GURU PRASAD UPADHAYA', '6318', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6319, '6319', 'e10adc3949ba59abbe56e057f20f883e', 'Chitra Kunwar', '6319', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6320, '6320', 'e10adc3949ba59abbe56e057f20f883e', 'JEEVAN PRASAD JOSHI', '6320', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6321, '6321', 'e10adc3949ba59abbe56e057f20f883e', 'PADAM ROKAYA', '6321', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6322, '6322', 'e10adc3949ba59abbe56e057f20f883e', 'KESHAV BAHADUR SAUD', '6322', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6323, '6323', 'e10adc3949ba59abbe56e057f20f883e', 'BALI RAM CHAUDARI', '6323', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6324, '6324', 'e10adc3949ba59abbe56e057f20f883e', 'MOHIT KHADKA', '6324', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6325, '6325', 'e10adc3949ba59abbe56e057f20f883e', 'KIRAN POUDEL', '6325', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6326, '6326', 'e10adc3949ba59abbe56e057f20f883e', 'TULARAM THAPA', '6326', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6327, '6327', 'e10adc3949ba59abbe56e057f20f883e', 'Laxman k.c', '6327', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6328, '6328', 'e10adc3949ba59abbe56e057f20f883e', 'Tulsa Chantel Thapa', '6328', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6329, '6329', 'e10adc3949ba59abbe56e057f20f883e', 'NARENDRA BHANDARI', '6329', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6330, '6330', 'e10adc3949ba59abbe56e057f20f883e', 'JIREN BUDHATHOKI', '6330', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6331, '6331', 'e10adc3949ba59abbe56e057f20f883e', 'RADHA DEVI SHARMA', '6331', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6332, '6332', 'e10adc3949ba59abbe56e057f20f883e', 'YUBARAJ POKHAREL', '6332', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6333, '6333', 'e10adc3949ba59abbe56e057f20f883e', 'SUMAN BHANDHARI', '6333', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6334, '6334', 'e10adc3949ba59abbe56e057f20f883e', 'MUKESH K.C.', '6334', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6335, '6335', 'e10adc3949ba59abbe56e057f20f883e', 'BINOD PRASAD DHUNGANA', '6335', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6336, '6336', 'e10adc3949ba59abbe56e057f20f883e', 'MAMATA GAUTAM', '6336', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6337, '6337', 'e10adc3949ba59abbe56e057f20f883e', 'ARJUN KUMAR SHRESTHA', '6337', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6338, '6338', 'e10adc3949ba59abbe56e057f20f883e', 'RAJENDRA SHRESTHA', '6338', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6340, '6340', 'e10adc3949ba59abbe56e057f20f883e', 'MANISH KUMAR YADHAV', '6340', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6341, '6341', 'e10adc3949ba59abbe56e057f20f883e', 'PREM BAHADUR B.K.', '6341', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6342, '6342', 'e10adc3949ba59abbe56e057f20f883e', 'RAM PRASAD GIMIRE', '6342', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6344, '6344', 'e10adc3949ba59abbe56e057f20f883e', 'ANIL BHUSAL', '6344', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6345, '6345', 'e10adc3949ba59abbe56e057f20f883e', 'LILAWATI NEUPANE', '6345', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6346, '6346', 'e10adc3949ba59abbe56e057f20f883e', 'KHAMBI LAL SHARMA', '6346', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6347, '6347', 'e10adc3949ba59abbe56e057f20f883e', 'YAGYA RAJ SAPKOTA', '6347', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6348, '6348', 'e10adc3949ba59abbe56e057f20f883e', 'SUDHA BISTA THAPA', '6348', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6349, '6349', 'e10adc3949ba59abbe56e057f20f883e', 'RIMA BARAL', '6349', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6350, '6350', 'e10adc3949ba59abbe56e057f20f883e', 'DIPAK KHATIWADA', '6350', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6352, '6352', 'e10adc3949ba59abbe56e057f20f883e', 'GOMA THAPA', '6352', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6353, '6353', 'e10adc3949ba59abbe56e057f20f883e', 'PRATIKSHA NEPAL', '6353', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6354, '6354', 'e10adc3949ba59abbe56e057f20f883e', 'NUCHERAM PRAJAPATI', '6354', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6355, '6355', 'e10adc3949ba59abbe56e057f20f883e', 'PRITI KUMARI JHA', '6355', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6356, '6356', 'e10adc3949ba59abbe56e057f20f883e', 'MAHENDRA PRASAD SAHA', '6356', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6357, '6357', 'e10adc3949ba59abbe56e057f20f883e', 'Bhim Prasad Acharya', '6357', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6358, '6358', 'e10adc3949ba59abbe56e057f20f883e', 'Lila Nath Gimire', '6358', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6359, '6359', 'e10adc3949ba59abbe56e057f20f883e', 'Devi Prasad Bhandari', '6359', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6360, '6360', 'e10adc3949ba59abbe56e057f20f883e', 'Santosh Koirala', '6360', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6361, '6361', 'e10adc3949ba59abbe56e057f20f883e', 'Gyatri Niraula', '6361', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6365, '6365', 'e10adc3949ba59abbe56e057f20f883e', 'Chandra Prakesh Yadhav', '6365', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6366, '6366', 'e10adc3949ba59abbe56e057f20f883e', 'Sunil Kumar Raut', '6366', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6367, '6367', 'e10adc3949ba59abbe56e057f20f883e', 'Sahadev Agasthi', '6367', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6368, '6368', 'e10adc3949ba59abbe56e057f20f883e', 'Pradip Rijal', '6368', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6370, '6370', 'e10adc3949ba59abbe56e057f20f883e', 'Shiva Shanker Yadhav', '6370', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6371, '6371', 'e10adc3949ba59abbe56e057f20f883e', 'Pabitra Sapkota', '6371', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6372, '6372', 'e10adc3949ba59abbe56e057f20f883e', 'Sramika Sulpe', '6372', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6373, '6373', 'e10adc3949ba59abbe56e057f20f883e', 'Thakur Rajiv Kumar Singh', '6373', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6374, '6374', 'e10adc3949ba59abbe56e057f20f883e', 'Santosh Kumar Bhandari', '6374', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6375, '6375', 'e10adc3949ba59abbe56e057f20f883e', 'Indra Kala Khafle', '6375', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6376, '6376', 'e10adc3949ba59abbe56e057f20f883e', 'Suman Subedi', '6376', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6377, '6377', 'e10adc3949ba59abbe56e057f20f883e', 'SANTOSH SUBEDI', '6377', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6378, '6378', 'e10adc3949ba59abbe56e057f20f883e', 'Santosh Thapa', '6378', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6381, '6381', 'e10adc3949ba59abbe56e057f20f883e', 'Yamuna Silwal', '6381', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6382, '6382', 'e10adc3949ba59abbe56e057f20f883e', 'MILAN SHRESTHA', '6382', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6383, '6383', 'e10adc3949ba59abbe56e057f20f883e', 'Sanjaya Kumar Gupta', '6383', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6384, '6384', 'e10adc3949ba59abbe56e057f20f883e', 'Nirajan Sharma', '6384', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6385, '6385', 'e10adc3949ba59abbe56e057f20f883e', 'Sanju Sahu', '6385', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6386, '6386', 'e10adc3949ba59abbe56e057f20f883e', 'Suman Basyal', '6386', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6387, '6387', 'e10adc3949ba59abbe56e057f20f883e', 'Moti Lal Subedi', '6387', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6389, '6389', 'e10adc3949ba59abbe56e057f20f883e', 'Kamal Prasad Adhikari', '6389', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6391, '6391', 'e10adc3949ba59abbe56e057f20f883e', 'KAMALA BHANDARI RAWAL', '6391', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6392, '6392', 'e10adc3949ba59abbe56e057f20f883e', 'Subash Shrestha', '6392', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6394, '6394', 'e10adc3949ba59abbe56e057f20f883e', 'Dinesh Kumar Gupta', '6394', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6395, '6395', 'e10adc3949ba59abbe56e057f20f883e', 'Sirjana Bud Thapa', '6395', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6396, '6396', 'e10adc3949ba59abbe56e057f20f883e', 'Jaya Narayan Yadhav', '6396', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6397, '6397', 'e10adc3949ba59abbe56e057f20f883e', 'Dinesh Saha', '6397', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6398, '6398', 'e10adc3949ba59abbe56e057f20f883e', 'Sanjaya Gyawali', '6398', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6399, '6399', 'e10adc3949ba59abbe56e057f20f883e', 'Prabhu Dayal Sahau', '6399', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6400, '6400', 'e10adc3949ba59abbe56e057f20f883e', 'RAJESH DAHAL', '6400', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6401, '6401', 'e10adc3949ba59abbe56e057f20f883e', 'Rita Kumari Sardhar', '6401', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6402, '6402', 'e10adc3949ba59abbe56e057f20f883e', 'SHARAD KUMAR BIDHARI', '6402', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6404, '6404', 'e10adc3949ba59abbe56e057f20f883e', 'PREM BAHADUR THAPA', '6404', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6405, '6405', 'e10adc3949ba59abbe56e057f20f883e', 'GYANDRA BAHADUR DAHAL', '6405', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6406, '6406', 'e10adc3949ba59abbe56e057f20f883e', 'PASUPATI THAPA', '6406', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6407, '6407', 'e10adc3949ba59abbe56e057f20f883e', 'ARJUN RAJ PATHAK', '6407', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6408, '6408', 'e10adc3949ba59abbe56e057f20f883e', 'TOLAKANTA ADHIKARI', '6408', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6409, '6409', 'e10adc3949ba59abbe56e057f20f883e', 'SRIJANA DHAKAL', '6409', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6410, '6410', 'e10adc3949ba59abbe56e057f20f883e', 'PRABIN SHRESTHA', '6410', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6411, '6411', 'e10adc3949ba59abbe56e057f20f883e', 'SUNIL PRASAD RAUNIYAR', '6411', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6412, '6412', 'e10adc3949ba59abbe56e057f20f883e', 'NABARAJ BUDA', '6412', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6413, '6413', 'e10adc3949ba59abbe56e057f20f883e', 'SANJU SHAKYA', '6413', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6414, '6414', 'e10adc3949ba59abbe56e057f20f883e', 'DHAN PRASAD POUDEL', '6414', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6415, '6415', 'e10adc3949ba59abbe56e057f20f883e', 'ISHWOR DUNGANA', '6415', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6416, '6416', 'e10adc3949ba59abbe56e057f20f883e', 'DINESH NEPAL', '6416', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6417, '6417', 'e10adc3949ba59abbe56e057f20f883e', 'SAKTI KARKI', '6417', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6418, '6418', 'e10adc3949ba59abbe56e057f20f883e', 'BALKRISHNA ARAYAL', '6418', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6419, '6419', 'e10adc3949ba59abbe56e057f20f883e', 'KHEM RAJ KHANAL', '6419', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6420, '6420', 'e10adc3949ba59abbe56e057f20f883e', 'KOMA NANDA BHANDARI', '6420', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6421, '6421', 'e10adc3949ba59abbe56e057f20f883e', 'SAMBU KAFLE', '6421', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6422, '6422', 'e10adc3949ba59abbe56e057f20f883e', 'HARI PRASAD DUNGEL', '6422', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6423, '6423', 'e10adc3949ba59abbe56e057f20f883e', 'SANDYA ADHIKARI', '6423', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6425, '6425', 'e10adc3949ba59abbe56e057f20f883e', 'TARA DEVKOTA', '6425', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6426, '6426', 'e10adc3949ba59abbe56e057f20f883e', 'URMILA GIMIRE', '6426', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6427, '6427', 'e10adc3949ba59abbe56e057f20f883e', 'MIRA TAMANG', '6427', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6428, '6428', 'e10adc3949ba59abbe56e057f20f883e', 'GAGAN DIP SHRESTHA', '6428', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6429, '6429', 'e10adc3949ba59abbe56e057f20f883e', 'MANISH KUMAR CHAUDARI', '6429', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6430, '6430', 'e10adc3949ba59abbe56e057f20f883e', 'BHOJ RAJ JOSHI', '6430', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6431, '6431', 'e10adc3949ba59abbe56e057f20f883e', 'SINGA LAL SUNAR', '6431', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6432, '6432', 'e10adc3949ba59abbe56e057f20f883e', 'BIBEK KHADKA', '6432', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6433, '6433', 'e10adc3949ba59abbe56e057f20f883e', 'SURESH BAHADUR RAWAL', '6433', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6434, '6434', 'e10adc3949ba59abbe56e057f20f883e', 'CHANDRA PRASAD PANDEY', '6434', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6435, '6435', 'e10adc3949ba59abbe56e057f20f883e', 'NABARAJ BHATTA', '6435', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6436, '6436', 'e10adc3949ba59abbe56e057f20f883e', 'REKHA MISRA', '6436', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6437, '6437', 'e10adc3949ba59abbe56e057f20f883e', 'NABARAJ NEUPANE', '6437', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6438, '6438', 'e10adc3949ba59abbe56e057f20f883e', 'RABINA KUMARI BAKHARIYA', '6438', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6439, '6439', 'e10adc3949ba59abbe56e057f20f883e', 'NABAL KISWOR DHAHIT', '6439', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6440, '6440', 'e10adc3949ba59abbe56e057f20f883e', 'RAJEEV PRASAD SHAH', '6440', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6441, '6441', 'e10adc3949ba59abbe56e057f20f883e', 'ARBI SAHI', '6441', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6442, '6442', 'e10adc3949ba59abbe56e057f20f883e', 'BIROCHAN KHANAL', '6442', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6443, '6443', 'e10adc3949ba59abbe56e057f20f883e', 'TANKA MAHATARA', '6443', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6444, '6444', 'e10adc3949ba59abbe56e057f20f883e', 'SANJYA LAMSAL', '6444', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6445, '6445', 'e10adc3949ba59abbe56e057f20f883e', 'BASANTI GAUTAM', '6445', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6447, '6447', 'e10adc3949ba59abbe56e057f20f883e', 'SUBASH NEPAL', '6447', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6448, '6448', 'e10adc3949ba59abbe56e057f20f883e', 'RENU BINIYA', '6448', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6449, '6449', 'e10adc3949ba59abbe56e057f20f883e', 'LELIN MAGAR', '6449', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6450, '6450', 'e10adc3949ba59abbe56e057f20f883e', 'DIPINDHAR MAHATO', '6450', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6452, '6452', 'e10adc3949ba59abbe56e057f20f883e', 'KUSHAL TIWARI', '6452', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6453, '6453', 'e10adc3949ba59abbe56e057f20f883e', 'GOVINDA NEUPANE', '6453', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6454, '6454', 'e10adc3949ba59abbe56e057f20f883e', 'DIPAK THAPA', '6454', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6455, '6455', 'e10adc3949ba59abbe56e057f20f883e', 'RASHILA SHRESTHA', '6455', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6456, '6456', 'e10adc3949ba59abbe56e057f20f883e', 'KAMALA TAMANG', '6456', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6457, '6457', 'e10adc3949ba59abbe56e057f20f883e', 'SUNITA JAISAWAL', '6457', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6458, '6458', 'e10adc3949ba59abbe56e057f20f883e', 'LOKENDRA PRASAD RIMAL', '6458', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6459, '6459', 'e10adc3949ba59abbe56e057f20f883e', 'MADHAV POUDEL', '6459', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6460, '6460', 'e10adc3949ba59abbe56e057f20f883e', 'RITISHA SAHA', '6460', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(6461, '6461', 'e10adc3949ba59abbe56e057f20f883e', 'HARISHANKER NEUPANE', '6461', '0001', 'admin', '0000-00-00', '0000-00-00', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin'),
(8888, '8888', 'e10adc3949ba59abbe56e057f20f883e', 'Sunil KK', '8888', '0001', 'admin', '2017-01-01', '2020-01-25', 'CUR', '0000-00-00 00:00:00', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE IF NOT EXISTS `tbluser` (
  `UserName` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `Role` varchar(50) DEFAULT NULL,
  `StaffName` varchar(50) DEFAULT NULL,
  `Status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`UserName`, `Password`, `Role`, `StaffName`, `Status`) VALUES
('admin', 'admin', 'admin', 'Administrator', 0),
('arniko', 'arniko', 'admin', 'Administrator', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transactiontbl`
--

CREATE TABLE IF NOT EXISTS `transactiontbl` (
  `Id` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `refNo` varchar(35) CHARACTER SET utf8 DEFAULT NULL,
  `transactionType` varchar(2) CHARACTER SET utf8 DEFAULT NULL,
  `valueDate` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `bookingDate` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `debitAccountNumber` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `debitCurrency` varchar(3) CHARACTER SET utf8 DEFAULT NULL,
  `debitNarrative` varchar(35) CHARACTER SET utf8 DEFAULT NULL,
  `creditAccountNumber` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `creditCurrency` varchar(3) CHARACTER SET utf8 DEFAULT NULL,
  `creditNarative` varchar(35) CHARACTER SET utf8 DEFAULT NULL,
  `amount` double(16,2) DEFAULT NULL,
  `commissionCode` varchar(3) CHARACTER SET utf8 DEFAULT NULL,
  `commissionType` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `commissionAmount` double(16,2) DEFAULT NULL,
  `chequeNumber` varchar(35) CHARACTER SET utf8 DEFAULT NULL,
  `processingDate` datetime DEFAULT NULL,
  `Override` varchar(150) CHARACTER SET utf8 DEFAULT NULL,
  `recordStatus` varchar(4) CHARACTER SET utf8 DEFAULT 'UNAU',
  `branchCode` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `inputter` varchar(150) CHARACTER SET utf8 DEFAULT NULL,
  `authorizer` varchar(150) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usertbl`
--

CREATE TABLE IF NOT EXISTS `usertbl` (
  `userid` int(11) NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 NOT NULL,
  `status` varchar(1) CHARACTER SET utf8 NOT NULL DEFAULT '1',
  `givenrole` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `fullName` varchar(30) DEFAULT NULL,
  `post` varchar(30) DEFAULT NULL,
  `staffCode` varchar(10) DEFAULT NULL,
  `startDate` varchar(10) DEFAULT NULL,
  `endDate` varchar(10) DEFAULT NULL,
  `branchId` varchar(10) DEFAULT NULL,
  `roleName` varchar(30) DEFAULT NULL,
  `functionAllowed` varchar(500) DEFAULT NULL,
  `functionRestriction` varchar(500) DEFAULT NULL,
  `branchAllowed` varchar(500) DEFAULT NULL,
  `additionalFunctions` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `branchAllowedFunctions` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `curStatus` varchar(1) CHARACTER SET utf8 DEFAULT '0',
  `reserved5` varchar(50) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usertbl`
--

INSERT INTO `usertbl` (`userid`, `username`, `password`, `status`, `givenrole`, `fullName`, `post`, `staffCode`, `startDate`, `endDate`, `branchId`, `roleName`, `functionAllowed`, `functionRestriction`, `branchAllowed`, `additionalFunctions`, `branchAllowedFunctions`, `curStatus`, `reserved5`) VALUES
(1, '1', 'null', '1', 'null', '1', '1', '1', '1', '1', '1', NULL, '1', 'null', '001-Kalimati', 'null', NULL, '0', NULL),
(18, 'admin', 'admin', '1', '', 'sunil tandukar', 'posts', '101', '2017-11-11', '2017-11-11', '001', NULL, '#i,#v,#a,#r,#e', '001', 'null', '#dashboard', '#i', '1', NULL),
(19, '12', '12', '1', 'account', '12', '12', '12', '12', '12', '12', NULL, '12', 'null', 'null', '#dashboard,#exam,#student', NULL, '0', NULL),
(20, '1123', '1123', '1', 'admin', '1231', '123', '123', '123', '123', '123', NULL, 'i,v,e', 'null', '001-Kalimati', '#dashboard,#exam', NULL, '0', NULL),
(21, '12', '12', '1', 'account', '112', '12', '12', '12', '12', '12', NULL, '#e,#v,#i', 'null', '001-Kalimati', '#dashboard,#exam', NULL, '0', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vdccodes`
--

CREATE TABLE IF NOT EXISTS `vdccodes` (
  `VDCCode` varchar(5) NOT NULL,
  `VDCName` varchar(100) NOT NULL,
  `WardCount` int(11) NOT NULL,
  `DistrictCode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vdccodes`
--

INSERT INTO `vdccodes` (`VDCCode`, `VDCName`, `WardCount`, `DistrictCode`) VALUES
('10101', 'Fungling', 11, 1),
('10102', 'Athrai Tribeni', 5, 1),
('10103', 'Sidingwa', 7, 1),
('10104', 'Faktanglung', 7, 1),
('10105', 'Mikhwakhola', 5, 1),
('10106', 'Meringden', 6, 1),
('10107', 'Maiwakhola', 6, 1),
('10108', 'Yangwarak', 6, 1),
('10109', 'Sirijunga', 8, 1),
('10201', 'Fidim', 14, 2),
('10202', 'Falelung', 8, 2),
('10203', 'Falgunanda', 7, 2),
('10204', 'Hilihang', 7, 2),
('10205', 'Kummayek', 5, 2),
('10206', 'Miklajung', 8, 2),
('10207', 'Tumwewa', 5, 2),
('10208', 'Yangwarak', 6, 2),
('10301', 'Illam', 12, 3),
('10302', 'Deumai', 9, 3),
('10303', 'Mai', 10, 3),
('10304', 'Suryodaya', 14, 3),
('10305', 'Fakfokthum', 7, 3),
('10306', 'Chulachuli', 6, 3),
('10307', 'Maijogmai', 6, 3),
('10308', 'Mangsebung', 6, 3),
('10309', 'Rong', 6, 3),
('10310', 'Sandakpur', 5, 3),
('10401', 'Mechinagar', 15, 4),
('10402', 'Damak', 10, 4),
('10403', 'Kankai', 9, 4),
('10404', 'Bhadrapur', 10, 4),
('10405', 'Arjundhara', 11, 4),
('10406', 'Shivasatakshi', 11, 4),
('10407', 'Gauradaha', 9, 4),
('10408', 'Birtamod', 10, 4),
('10409', 'Kamal', 7, 4),
('10410', 'Gaurigunj', 6, 4),
('10411', 'Barhadashi', 7, 4),
('10412', 'Jhapa', 7, 4),
('10413', 'Buddhasanti', 7, 4),
('10414', 'Haldibari', 5, 4),
('10415', 'Kachankawal', 7, 4),
('10501', 'Chainpur', 11, 5),
('10502', 'Dharmadevi', 9, 5),
('10503', 'Khaadbaari', 11, 5),
('10504', 'Madi', 9, 5),
('10505', 'Paanchkhapan', 9, 5),
('10506', 'Bhotkhola', 5, 5),
('10507', 'Chichila', 5, 5),
('10508', 'Makalu', 6, 5),
('10509', 'Sabhapokhari', 6, 5),
('10510', 'Silichong', 5, 5),
('10601', 'Myanglung', 10, 6),
('10602', 'Laligurans', 9, 6),
('10603', 'Athrai ', 7, 6),
('10604', 'Chhathar', 6, 6),
('10605', 'Fedaap', 5, 6),
('10606', 'Menchhayayem', 6, 6),
('10701', 'Bhojpur', 12, 7),
('10702', 'Sadananda', 14, 7),
('10703', 'Tyamkemaiyum', 9, 7),
('10704', 'Ramprasadrai', 8, 7),
('10705', 'Arun', 7, 7),
('10706', 'Pauwadungma', 6, 7),
('10707', 'Salpasilichho', 6, 7),
('10708', 'Aamchowk', 10, 7),
('10709', 'Hatuwagadhi', 9, 7),
('10801', 'Pakhribaas', 10, 8),
('10802', 'Dhankuta', 10, 8),
('10803', 'Mahalaxmi', 9, 8),
('10804', 'Sagurigadhi', 10, 8),
('10805', 'Khalsa Chhintang Sahidbhumi', 7, 8),
('10806', 'Chhathar Jorpati', 6, 8),
('10807', 'Chaubise', 8, 8),
('10901', 'Biratnagar', 19, 9),
('10902', 'Belbaari', 11, 9),
('10903', 'Letang', 9, 9),
('10904', 'Pathari Sanischare', 10, 9),
('10905', 'Rangeli', 9, 9),
('10906', 'Ratuwamai', 10, 9),
('10907', 'Sunawarsi', 9, 9),
('10908', 'Urlabaari', 9, 9),
('10909', 'Sundarharaincha', 12, 9),
('10910', 'Budhiganga', 7, 9),
('10911', 'Dhanpalthan', 7, 9),
('10912', 'Gramthan', 7, 9),
('10913', 'Jahada', 7, 9),
('10914', 'Kanepokhari', 7, 9),
('10915', 'Katahari', 7, 9),
('10916', 'Kerabaari', 10, 9),
('10917', 'Miklajung', 9, 9),
('11001', 'Itahari', 20, 10),
('11002', 'Dharan', 20, 10),
('11003', 'Inaruwa', 10, 10),
('11004', 'Duhabi', 12, 10),
('11005', 'Ramdhuni', 9, 10),
('11006', 'Barah', 11, 10),
('11007', 'Dewangunj', 7, 10),
('11008', 'Koshi', 8, 10),
('11009', 'Gadhi', 6, 10),
('11010', 'Barju', 6, 10),
('11011', 'Bhokraha', 8, 10),
('11012', 'Harinagara', 7, 10),
('11101', 'Solududhkunda', 10, 11),
('11102', 'Dudhkoshi', 7, 11),
('11103', 'Khumbu Pasang Lhamu', 5, 11),
('11104', 'Dudhkausika', 9, 11),
('11105', 'Nechasalyan', 6, 11),
('11106', 'Mahakulung', 5, 11),
('11107', 'Likhu Pike', 5, 11),
('11108', 'Sotang', 5, 11),
('11201', 'Halesituwachung', 11, 12),
('11202', 'Rupakot Majhuwagadhi', 15, 12),
('11203', 'Aiselukharka', 7, 12),
('11204', 'Lamidada', 6, 12),
('11205', 'Jantedhunga', 6, 12),
('11206', 'Khotehang', 9, 12),
('11207', 'Kepilasgadhi', 7, 12),
('11208', 'Diprung', 7, 12),
('11209', 'Sakela', 5, 12),
('11210', 'Barahpokhari', 6, 12),
('11301', 'Siddhicharan', 12, 13),
('11302', 'Khijidemwa', 9, 13),
('11303', 'Champadevi', 10, 13),
('11304', 'Chisankhugadhi', 8, 13),
('11305', 'Manebhanjyang', 9, 13),
('11306', 'Molung', 8, 13),
('11307', 'Likhu', 9, 13),
('11308', 'Sunkoshi', 10, 13),
('11401', 'Katari', 14, 14),
('11402', 'Chaudandagadhi', 10, 14),
('11403', 'Triyuga', 16, 14),
('11404', 'Belaka', 9, 14),
('11405', 'Udaypurgadhi', 8, 14),
('11406', 'Tapli', 5, 14),
('11407', 'Rautamai', 8, 14),
('11408', 'Sunkoshi', 5, 14),
('23201', 'Chandrapur', 10, 32),
('23202', 'Garuda', 9, 32),
('23203', 'Gaur', 13, 32),
('23204', 'Baudhimai', 7, 32),
('23205', 'Brindaban', 8, 32),
('23206', 'Dewahi Gonahi', 7, 32),
('23207', 'Durga Bhagwati', 8, 32),
('23208', 'Gadhimai', 7, 32),
('23209', 'Gujara', 9, 32),
('23210', 'Katahariya', 9, 32),
('23211', 'Madhav Narayan', 9, 32),
('23212', 'Maulapur', 7, 32),
('23213', 'Fatuwa Bijayapur', 5, 32),
('23214', 'Ishanath', 9, 32),
('23215', 'Paroha', 8, 32),
('23216', 'Rajpur', 7, 32),
('23301', 'Kalaiya', 27, 33),
('23302', 'Jitpursimara', 23, 33),
('23303', 'Kolhawi', 11, 33),
('23304', 'Nijgadh', 13, 33),
('23305', 'Mahagadimai', 11, 33),
('23306', 'Simraungadh', 11, 33),
('23307', 'Adarsha Kotwal', 8, 33),
('23308', 'Karaiyamai', 8, 33),
('23309', 'Devtaal', 7, 33),
('23310', 'Pachrauta', 9, 33),
('23311', 'Parwanipur', 9, 33),
('23312', 'Prasauni', 7, 33),
('23313', 'Pheta', 8, 33),
('23314', 'Baragadhi', 6, 33),
('23315', 'Subarna', 8, 33),
('23401', 'Birgunj', 27, 34),
('23402', 'Pokhariya', 11, 34),
('23403', 'Subarnapur', 7, 34),
('23404', 'Jagarnathpur', 6, 34),
('23405', 'Dhobini', 5, 34),
('23406', 'Chhipaharmai', 5, 34),
('23407', 'Pakaha Mainapur', 5, 34),
('23408', 'Bindabasini', 5, 34),
('23409', 'Bahudarmai', 8, 34),
('23410', 'Belawa', 7, 34),
('23411', 'Parsagadhi', 6, 34),
('23412', 'Sakhuwa Prasauni', 6, 34),
('23413', 'Paterwa Sugauli', 7, 34),
('21501', 'rajbiraj nagarpalika', 15, 15),
('21502', 'Kanchanrup', 12, 15),
('21503', 'Dakneshwori ', 11, 15),
('21504', 'Bodebarsain', 16, 15),
('21505', 'Khadak', 11, 15),
('21506', 'Sambhunath', 11, 15),
('21507', 'Surunga', 11, 15),
('21508', 'hanumannagar kankalini', 14, 15),
('21509', 'Krishna sabaran', 5, 15),
('21510', 'Chhinnamasta', 8, 15),
('21511', 'Mahadeva', 6, 15),
('21512', 'Saptakosi', 11, 15),
('21513', 'Tirahut', 5, 15),
('21514', 'Tilathi Koiladi', 8, 15),
('21515', 'Rupani', 6, 15),
('21516', 'Belhi Chapena', 5, 15),
('21517', 'Bishnupur', 7, 15),
('22001', 'Janakpur', 24, 20),
('22002', 'Chhireshwor ', 11, 20),
('22003', 'Ganeshman Charnath', 11, 20),
('22004', 'Dhanusadham', 9, 20),
('22005', 'Nagarain', 10, 20),
('22006', 'Videha', 10, 20),
('22007', 'Mithila', 10, 20),
('22008', 'Sahidnagar', 9, 20),
('22009', 'Sabaila', 13, 20),
('22010', 'Siddidatri', 6, 20),
('22011', 'Janaknandini', 6, 20),
('22012', 'Bateshwor', 5, 20),
('22013', 'Mithila Bihari', 10, 20),
('22014', 'Mukhiyapatti musaharmiya', 6, 20),
('22015', 'Laxminiya', 7, 20),
('22016', 'Hansapur', 8, 20),
('22017', 'Aurahi', 8, 20),
('21601', 'Lahan', 24, 16),
('21602', 'Dhangadimai', 14, 16),
('21603', 'Siraha', 22, 16),
('21604', 'Golbazar', 13, 16),
('21605', 'Mirchaiya', 12, 16),
('21606', 'Kalyanpur', 12, 16),
('21607', 'Bhagawanpur', 5, 16),
('21608', 'Aurahi', 5, 16),
('21609', 'Bishnupur', 5, 16),
('21610', 'Sukhipur', 8, 16),
('21611', 'Karjanha', 7, 16),
('21612', 'Bariyarpatti', 5, 16),
('21613', 'Laxmipur Patari', 6, 16),
('21614', 'Naraha', 5, 16),
('21615', 'Sakhuwanankarkatti', 5, 16),
('21616', 'Arnama', 5, 16),
('21617', 'Nawarajpur', 5, 16),
('22101', 'Jaleshwor', 12, 21),
('22102', 'Bardibas', 13, 21),
('22103', 'Gausala', 12, 21),
('22104', 'Ekdara', 8, 21),
('22105', 'Somana', 8, 21),
('22106', 'Samsi', 7, 21),
('22107', 'Loharpatti', 8, 21),
('22108', 'Ramgopalpur', 6, 21),
('22109', 'Mahottari', 6, 21),
('22110', 'Manara', 8, 21),
('22111', 'Matihani', 6, 21),
('22112', 'Bhanggaha', 9, 21),
('22113', 'Balawa', 7, 21),
('22114', 'Pipara', 7, 21),
('22115', 'Aurahi', 7, 21),
('22201', 'Ishworpur', 15, 22),
('22202', 'Lalbandi', 17, 22),
('22203', 'Haripur', 10, 22),
('22204', 'Haripurba', 11, 22),
('22205', 'Hariban', 11, 22),
('22206', 'Barahathawa', 18, 22),
('22207', 'Balara', 12, 22),
('22208', 'Godaita', 11, 22),
('22209', 'Malangwa', 12, 22),
('22210', 'Bagmati', 10, 22),
('22211', 'Kabilasi', 8, 22),
('22212', 'Chakraghatta ', 13, 22),
('22213', 'Chandranagar', 7, 22),
('22214', 'Dhankaul', 9, 22),
('22215', 'Bramhapuri', 9, 22),
('22216', 'Ramnagar', 10, 22),
('22217', 'Bishnu', 12, 22),
('32301', 'Uttargaya ', 5, 23),
('32302', 'Kalika', 5, 23),
('32303', 'Gosainkunda', 6, 23),
('32304', 'Naukunda', 6, 23),
('32305', 'Parbatikunda', 5, 23),
('32501', 'Bidur', 13, 25),
('32502', 'Belkotgadhi', 13, 25),
('32503', 'Kakani', 8, 25),
('32504', 'Kispang', 5, 25),
('32505', 'Tadigaun', 6, 25),
('32506', 'Tarkeshwor', 6, 25),
('32507', 'Dupcheshwor', 7, 25),
('32508', 'Panchakanya', 5, 25),
('32509', 'Likhu', 6, 25),
('32510', 'Meghang', 6, 25),
('32511', 'Shivapuri', 8, 25),
('32512', 'Suryegadhi', 5, 25),
('32601', 'Kathmandu', 32, 26),
('32602', 'Kageshwori Manohara', 12, 26),
('32603', 'Kirtipur', 10, 26),
('32604', 'Gokarneshwor', 9, 26),
('32605', 'Chandragiri', 15, 26),
('32606', 'Tokha', 11, 26),
('32607', 'Tarkeshwor', 11, 26),
('32608', 'Dakchinkali', 9, 26),
('32609', 'Nagarjun', 10, 26),
('32610', 'Budhanilkantha', 13, 26),
('32611', 'Shankharapur', 9, 26),
('32701', 'Changu Narayan', 9, 27),
('32702', 'Bhaktapur', 10, 27),
('32703', 'Madhyepur Thimi', 9, 27),
('32704', 'Suryebinayak', 10, 27),
('33001', 'Chautara Sangachowkgadhi', 14, 30),
('33002', 'Barabise', 9, 30),
('33003', 'Melamchi', 13, 30),
('33004', 'Indrabati', 12, 30),
('33005', 'Jugal', 7, 30),
('33006', 'Panchpokhari Thanpal', 8, 30),
('33007', 'Balephi', 8, 30),
('33008', 'Botekoshi', 5, 30),
('33009', 'Lisankhu Pakhar', 7, 30),
('33010', 'Sunkoshi', 7, 30),
('33011', 'Helambhu', 7, 30),
('33012', 'Tripurasundari', 6, 30),
('31801', 'Manthali', 14, 18),
('31802', 'Ramechhap', 9, 18),
('31803', 'Umakunda', 7, 18),
('31804', 'Khandadevi', 9, 18),
('31805', 'Gokulganga', 6, 18),
('31806', 'Doramba', 7, 18),
('31807', 'Likhu', 7, 18),
('31808', 'Sunapati', 5, 18),
('31901', 'Kamalamaai', 14, 19),
('31902', 'Dudhauli', 14, 19),
('31903', 'Golanjor', 7, 19),
('31904', 'Ghyankhel', 5, 19),
('31905', 'Tinpatan', 11, 19),
('31906', 'Fikkal', 6, 19),
('31907', 'Marin', 8, 19),
('31908', 'Sunkoshi', 7, 19),
('31909', 'Hariharpurgadhi', 8, 19),
('32901', 'Dhulikhel', 12, 29),
('32902', 'Banepa', 14, 29),
('32903', 'Panauti', 12, 29),
('32904', 'Panchkhaal', 13, 29),
('32905', 'Namobuddha', 11, 29),
('32906', 'Khanikhola', 7, 29),
('32907', 'Chaurideurali', 9, 29),
('32908', 'Temaal', 9, 29),
('32909', 'Bethanchowk', 6, 29),
('32910', 'Bhumlu', 10, 29),
('32911', 'Mandandeupur', 12, 29),
('32912', 'Mahabharat', 8, 29),
('32913', 'Roshi', 12, 29),
('31701', 'Jiri', 9, 17),
('31702', 'Bhimeshwor', 9, 17),
('31703', 'Kalinchowk', 9, 17),
('31704', 'Gaurishankar', 9, 17),
('31705', 'Tamakoshi', 7, 17),
('31706', 'Melung', 7, 17),
('31707', 'Bigu', 8, 17),
('31708', 'Baiteshwor', 8, 17),
('31709', 'Shailung', 8, 17),
('32801', 'Lalitpur', 29, 28),
('32802', 'Godawari', 14, 28),
('32803', 'Mahalaxmi', 10, 28),
('32804', 'Konjyosom', 5, 28),
('32805', 'Bagmati', 7, 28),
('32806', 'Mahankaal', 6, 28),
('32401', 'Dhunibenshi', 9, 24),
('32402', 'Nilkantha', 14, 24),
('32403', 'Khaniyabash', 5, 24),
('32404', 'Gajuri', 8, 24),
('32405', 'Galchi', 8, 24),
('32406', 'Gangajamuna', 7, 24),
('32407', 'Jwalamukhi', 7, 24),
('32408', 'Thakre', 11, 24),
('32409', 'Netrabati', 5, 24),
('32410', 'Benighat Rorang', 10, 24),
('32411', 'Rubi Valley', 6, 24),
('32412', 'Sidhlake', 7, 24),
('32413', 'Tripurasundari', 7, 24),
('33101', 'Hetauda', 19, 31),
('33102', 'Thaha', 12, 31),
('33103', 'Indrasarobar', 5, 31),
('33104', 'Kailash', 10, 31),
('33105', 'Bakaiya', 12, 31),
('33106', 'Bagmati', 9, 31),
('33107', 'Bhimfedi', 9, 31),
('33108', 'Makwanpurgadhi', 8, 31),
('33109', 'Manhari', 9, 31),
('33110', 'Raksirang', 9, 31),
('33501', 'Bharatpur', 29, 35),
('33502', 'Kalika', 11, 35),
('33503', 'Khairhani', 13, 35),
('33504', 'Madi', 9, 35),
('33505', 'Ratnanagar', 16, 35),
('33506', 'Rapti', 13, 35),
('33507', 'Echyakamana', 7, 35),
('44101', 'Galyang', 11, 41),
('44102', 'Chapkot', 10, 41),
('44103', 'Putalibazar', 14, 41),
('44104', 'Virkot', 9, 41),
('44105', 'Waling', 14, 41),
('44106', 'Arjunchaupari', 6, 41),
('44107', 'Aadhikhola', 6, 41),
('44108', 'Kaligandaki', 7, 41),
('44109', 'Fedikhola', 5, 41),
('44110', 'Biruwa', 8, 41),
('44111', 'Harinas', 7, 41),
('43901', 'Pokhara Lekhanath', 33, 39),
('43902', 'Annapurna', 11, 39),
('43903', 'Machhapuchhre', 9, 39),
('43904', 'Madi', 12, 39),
('43905', 'Rupa', 7, 39),
('44801', 'Gharpajhong', 5, 48),
('44802', 'Thasang', 5, 48),
('44803', 'Dalome', 5, 48),
('44804', 'Lomanthang', 5, 48),
('44805', 'Barhagaun Muktichhetra', 5, 48),
('45101', 'Kushma', 14, 51),
('45102', 'Phalewas', 11, 51),
('45103', 'Jaljala', 9, 51),
('45104', 'paiyu', 7, 51),
('45105', 'Mahashila', 6, 51),
('45106', 'Modi', 8, 51),
('45107', 'Bihadi', 6, 51),
('43701', 'Narfu', 5, 37),
('43702', 'Nashon', 9, 37),
('43703', 'Neshyang', 9, 37),
('43704', 'Chame', 5, 37),
('44001', 'Bhanu', 13, 40),
('44002', 'Bhimad', 9, 40),
('44003', 'Byas', 14, 40),
('44004', 'Shuklagandaki', 12, 40),
('44005', 'Ambukhaireni', 6, 40),
('44006', 'Rhishing', 8, 40),
('44007', 'Ghiring', 5, 40),
('44008', 'Devghat', 5, 40),
('44009', 'Myagdi', 7, 40),
('44010', 'Bandipur', 6, 40),
('44901', 'Beni', 10, 49),
('44902', 'Annapurna', 8, 49),
('44903', 'Dhaulagiri', 7, 49),
('44904', 'Mangala', 5, 49),
('44905', 'Malika', 7, 49),
('44906', 'Raghuganga', 8, 49),
('45001', 'Baglung', 14, 50),
('45002', 'Galkot', 11, 50),
('45003', 'Jaimini', 10, 50),
('45004', 'Dhorpatan', 9, 50),
('45005', 'Bareng', 5, 50),
('45006', 'Kathekhola', 8, 50),
('45007', 'Tamankhola', 6, 50),
('45008', 'Tarakhola', 5, 50),
('45009', 'Nisikhola', 7, 50),
('45010', 'Badigad', 10, 50),
('43601', 'Gorkha', 14, 36),
('43602', 'Palungtar', 10, 36),
('43603', 'Sulikot', 8, 36),
('43604', 'Siranchok', 8, 36),
('43605', 'Ajirkot', 5, 36),
('43606', 'Aarughat', 10, 36),
('43607', 'Gandaki', 8, 36),
('43608', 'Chumnubri', 7, 36),
('43609', 'Dharche', 7, 36),
('43610', 'Bhimsen', 8, 36),
('43611', 'Sahid Lakhan', 9, 36),
('43801', 'Beshi Sahar', 11, 38),
('43802', 'Madhya Nepal', 10, 38),
('43803', 'Rainas', 10, 38),
('43804', 'Sundar Bajar', 11, 38),
('43805', 'Kobholasothar', 9, 38),
('43806', 'Dudhpokhari', 6, 38),
('43807', 'Dordi', 9, 38),
('43808', 'Marsyandi', 9, 38),
('54601', 'Butwal', 19, 46),
('54602', 'Lumbini Saskritik', 13, 46),
('54603', 'Sidharthanager', 13, 46),
('54604', 'Sammarimai', 7, 46),
('54605', 'Debdaha', 12, 46),
('54606', 'Sainamaina', 11, 46),
('54607', 'Tilottma', 17, 46),
('54608', 'Siyari', 7, 46),
('54609', 'Gaidahawa', 9, 46),
('54610', 'Kanchan', 5, 46),
('54611', 'Kotahimai', 7, 46),
('54612', 'Marchawari', 7, 46),
('54613', 'Mayadevi', 8, 46),
('54614', 'Omsatiya', 6, 46),
('54615', 'Rohindi', 7, 46),
('54616', 'Suddodhan', 7, 46),
('54401', 'Sandhikharka', 12, 44),
('54402', 'Sitganga', 14, 44),
('54403', 'Bhumikasthan', 10, 44),
('54404', 'Chhatradev', 8, 44),
('54405', 'Pandini', 8, 44),
('54406', 'Malarani', 9, 44),
('54501', 'Kawasoti', 17, 45),
('54502', 'Gaindakot', 18, 45),
('54503', 'Devchuli', 17, 45),
('54504', 'Bardghat', 16, 45),
('54505', 'Madhyabindu', 15, 45),
('54506', 'Ramgram', 18, 45),
('54507', 'Sunwal', 13, 45),
('54508', 'Tribenisusta', 7, 45),
('54509', 'Palhinandan', 6, 45),
('54510', 'Pratappur', 9, 45),
('54511', 'Bungdikali', 6, 45),
('54512', 'Bulingtar', 6, 45),
('54513', 'Binaie', 5, 45),
('54514', 'Sarawal', 7, 45),
('54515', 'Hupsekot', 6, 45),
('55601', 'Tulsipur', 19, 56),
('55602', 'Ghorahi', 19, 56),
('55603', 'Lamahi', 9, 56),
('55604', 'Bangalichuli', 8, 56),
('55605', 'Dangisaran', 7, 56),
('55606', 'Gadhawa', 8, 56),
('55607', 'Rajpur', 7, 56),
('55608', 'Rapti', 9, 56),
('55609', 'Santinagar', 7, 56),
('55610', 'Babai', 7, 56),
('55501', 'Sarada', 15, 55),
('55502', 'Bagchaur', 12, 55),
('55503', 'Bangad', 12, 55),
('55504', 'Kalimati', 7, 55),
('55505', 'Tribeni', 6, 55),
('55506', 'Kapurkot', 6, 55),
('55507', 'Chhatreswori', 7, 55),
('55508', 'Dhorchaur', 5, 55),
('55509', 'Kumakhamalika', 7, 55),
('55510', 'Darma', 6, 55),
('55201', 'Musikot', 14, 52),
('55202', 'Chaurjahari', 14, 52),
('55203', 'Aathabiskot', 14, 52),
('55204', 'Putha Uttarganga', 14, 52),
('55205', 'Bhume', 9, 52),
('55206', 'Sisne', 8, 52),
('55207', 'Baphikot', 10, 52),
('55208', 'Tribeni ', 10, 52),
('55209', 'Sanibheri', 11, 52),
('56501', 'Nepalgunj', 23, 65),
('56502', 'Koholpur', 15, 65),
('56503', 'Narainapur', 6, 65),
('56504', 'Raptisonari', 9, 65),
('56505', 'Baijanath', 8, 65),
('56506', 'Khajura', 8, 65),
('56507', 'Duduwa', 6, 65),
('56508', 'Janaki', 6, 65),
('55301', 'Rolpa', 10, 53),
('55302', 'Tribeni', 7, 53),
('55303', 'Duikholi', 6, 53),
('55304', 'Madi', 6, 53),
('55305', 'Runtigadhi', 9, 53),
('55306', 'Lungri', 7, 53),
('55307', 'Sukidaha', 7, 53),
('55308', 'Sunchhahari', 7, 53),
('55309', 'Subarnawoti', 8, 53),
('55310', 'Thabang', 5, 53),
('55401', 'Pyuthan', 10, 54),
('55402', 'Sworgadwari', 9, 54),
('55403', 'Gaumukhi', 7, 54),
('55404', 'Mandabi', 5, 54),
('55405', 'Sarumarani', 6, 54),
('55406', 'Mallarani', 5, 54),
('55407', 'Naubahini', 8, 54),
('55408', 'Jhimruk', 8, 54),
('55409', 'Arawoti', 6, 54),
('56601', 'Gulariya', 12, 66),
('56602', 'Madhuban', 9, 66),
('56603', 'Rajapur', 10, 66),
('56604', 'Thakurbaba', 9, 66),
('56605', 'Bansgadhi', 9, 66),
('56606', 'Barbardiya', 11, 66),
('56607', 'Badhaiyatal', 9, 66),
('56608', 'Geruwa', 6, 66),
('54201', 'Musikot', 9, 42),
('54202', 'Resunga', 14, 42),
('54203', 'Ishma', 6, 42),
('54204', 'Kaligandaki', 7, 42),
('54205', 'Gulmidarbar', 7, 42),
('54206', 'Satyawoti', 8, 42),
('54207', 'Chandrakot', 8, 42),
('54208', 'Ruru', 6, 42),
('54209', 'Chhatrakot', 6, 42),
('54210', 'Dhurkot', 7, 42),
('54211', 'Madane', 7, 42),
('54212', 'Malika', 8, 42),
('54301', 'Rampur', 10, 43),
('54302', 'Tansen', 14, 43),
('54303', 'Nisdi', 7, 43),
('54304', 'Purbakhola', 6, 43),
('54305', 'Rambha', 5, 43),
('54306', 'Mathagadi', 8, 43),
('54307', 'Tinau', 6, 43),
('54308', 'Baganaskali', 9, 43),
('54309', 'Ribdikot', 8, 43),
('54310', ' Rainadevi Chhahara', 8, 43),
('54701', 'Kapilvastu', 12, 47),
('54702', 'Buddhabhumi', 10, 47),
('54703', 'Shivaraj', 11, 47),
('54704', 'Maharajgang', 11, 47),
('54705', 'Krishnanagar', 12, 47),
('54706', 'Bandganga', 11, 47),
('54707', 'Mayadevi', 8, 47),
('54708', 'Yesodhara', 8, 47),
('54709', 'Bijayanagar', 7, 47),
('54710', 'Suddhodhan', 6, 47),
('66101', 'Simkot', 8, 61),
('66102', 'Namkha', 6, 61),
('66103', 'kharpunath', 5, 61),
('66104', 'Surkegad', 8, 61),
('66105', 'Chankheli', 6, 61),
('66106', 'Adanchuli', 6, 61),
('66107', 'Tajakot', 5, 61),
('65801', 'Chhayanath', 14, 58),
('65802', 'Mugumkarmarog', 9, 58),
('65803', 'Soru', 11, 58),
('65804', 'Khatyang', 11, 58),
('66001', 'Khadachakra', 11, 60),
('66002', 'Raskot', 9, 60),
('66003', 'Tilagupha', 11, 60),
('66004', 'Pachaljharana', 9, 60),
('66005', 'Sanni tribeni', 9, 60),
('66006', 'Naraharinath', 9, 60),
('66007', 'Kalika', 8, 60),
('66008', 'Mahabai', 7, 60),
('66009', 'Palata', 9, 60),
('65901', 'Chandannath', 10, 59),
('65902', 'Kankasundari', 8, 59),
('65903', 'Sinja', 6, 59),
('65904', 'Hima', 7, 59),
('65905', 'Tila', 9, 59),
('65906', 'Guthichaur', 5, 59),
('65907', 'Tatopani', 8, 59),
('65908', 'Patarasi', 7, 59),
('66401', 'Birendra', 16, 64),
('66402', 'Bheriganga', 13, 64),
('66403', 'Gurbhakot', 14, 64),
('66404', 'Pabchapuri', 11, 64),
('66405', 'Lekbesi', 10, 64),
('66406', 'Chaukune', 10, 64),
('66407', 'Barahatal', 10, 64),
('66408', 'Chingad', 6, 64),
('66409', 'Simta ', 9, 64),
('66301', 'Narayan', 11, 63),
('66302', 'Dullu', 13, 63),
('66303', 'Chamunda Bindrasaini', 9, 63),
('66304', 'Aathbis', 9, 63),
('66305', 'Bhagawatimai', 7, 63),
('66306', 'Gurash', 8, 63),
('66307', 'Dungeshwar', 6, 63),
('66308', 'Naumule', 8, 63),
('66309', 'Mahabu', 6, 63),
('66310', 'Bhairabi', 7, 63),
('66311', 'Thatikadh', 6, 63),
('65701', 'Thuli veri', 11, 57),
('65702', 'Tripurasundari', 11, 57),
('65703', 'Dolpa buddha', 6, 57),
('65704', 'She phoksundo', 9, 57),
('65705', 'Jagdulla', 6, 57),
('65706', 'Mudkechula', 9, 57),
('65707', 'Kaike', 7, 57),
('65708', 'Chharka tangsong', 6, 57),
('66201', 'veri', 13, 62),
('66202', 'Chhedagad', 13, 62),
('66203', 'Tribeni nalgad ', 13, 62),
('66204', 'Kuse ', 9, 62),
('66205', 'Junichande', 11, 62),
('66206', 'Barekot', 9, 62),
('66207', 'Shibalaya', 9, 62),
('77301', 'Dashrathachanda', 11, 73),
('77302', 'Patan ', 10, 73),
('77303', 'Melauli ', 9, 73),
('77304', 'Purchaudi ', 10, 73),
('77305', 'Surnaya', 8, 73),
('77306', 'Sisag', 9, 73),
('77307', 'Shivanath', 6, 73),
('77308', 'Pancheshwar', 6, 73),
('77309', 'Dogdakedar', 8, 73),
('77310', 'Dilasaini', 7, 73),
('77401', 'Amargadhi ', 11, 74),
('77402', 'Parsuram ', 12, 74),
('77403', 'Aalital', 8, 74),
('77404', 'Bhageshwar', 5, 74),
('77405', 'nabadurga', 5, 74),
('77406', 'Ajayameru ', 6, 74),
('77407', 'Ganyapdhura', 5, 74),
('77501', 'bhimdatta', 19, 75),
('77502', 'Punarbas', 11, 75),
('77503', 'Bedkot ', 10, 75),
('77504', 'Mahakali', 9, 75),
('77505', 'Shuklaphata', 12, 75),
('77506', 'Belauri', 10, 75),
('77507', 'Krishnapur', 9, 75),
('77508', 'Beldandi', 5, 75),
('77509', 'Laljhadi', 6, 75),
('77101', 'Dhangadhi', 19, 71),
('77102', 'Tikapur ', 9, 71),
('77103', 'Ghodaghodi ', 12, 71),
('77104', 'Lamkichuha', 10, 71),
('77105', 'bhajani ', 9, 71),
('77106', 'Godawari', 12, 71),
('77107', 'Gauriganga', 11, 71),
('77108', 'Janaki', 9, 71),
('77109', 'Bardagoriya', 6, 71),
('77110', 'Mohanyal', 7, 71),
('77111', 'Kailari', 9, 71),
('77112', 'Joshipur ', 7, 71),
('77113', 'Chure', 6, 71),
('77001', 'Dipayal siladhi ', 9, 70),
('77002', 'Shikhar', 11, 70),
('77003', 'Purbichauki', 7, 70),
('77004', 'Badikedar', 5, 70),
('77005', 'Jorayal', 6, 70),
('77006', 'Sayal', 6, 70),
('77007', 'Aadarsh', 7, 70),
('77008', 'K.I.C', 7, 70),
('77009', 'Bogatan', 7, 70),
('76801', 'Mangalsen', 14, 68),
('76802', 'Kamalbajar', 10, 68),
('76803', 'Sanphebagar', 14, 68),
('76804', 'Panchadewal Binayak', 9, 68),
('76805', 'Chaurpati ', 7, 68),
('76806', 'Mellekh', 8, 68),
('76807', 'Bannigadi Jayagadh', 6, 68),
('76808', 'Ramaroshan', 7, 68),
('76809', 'Dhakari', 8, 68),
('76810', 'Turmakhad', 8, 68),
('76901', 'jayaprithvi', 11, 69),
('76902', 'Bungal', 11, 69),
('76903', 'Talkot', 7, 69),
('76904', 'Masta', 7, 69),
('76905', 'Khaptadchhanna', 7, 69),
('76906', 'Thalara', 9, 69),
('76907', 'Bitthadchir', 9, 69),
('76908', 'Surma ', 5, 69),
('76909', 'Chhabispathibhera', 7, 69),
('76910', 'Durgathali', 7, 69),
('76911', 'Kedarsyun', 9, 69),
('76912', 'Kanda', 5, 69),
('76701', 'Badimalika', 9, 67),
('76702', 'Tribeni', 9, 67),
('76703', 'Budhiganga', 10, 67),
('76704', 'Budhinanda', 10, 67),
('76705', 'Gaumun ', 6, 67),
('76706', 'Pandav', 6, 67),
('76707', 'Swamikartik', 5, 67),
('76708', 'Chhededaha', 7, 67),
('76709', 'Himali', 7, 67),
('77201', 'Mahakali', 9, 72),
('77202', 'Shailyashikar', 9, 72),
('77203', 'Malikarjun', 8, 72),
('77204', 'Apihimal', 6, 72),
('77205', 'Duhu ', 5, 72),
('77206', 'Naugad', 6, 72),
('77207', 'Marma', 6, 72),
('77208', 'Lekam', 6, 72),
('77209', 'Byash', 6, 72);

-- --------------------------------------------------------

--
-- Structure for view `exam_summary`
--
DROP TABLE IF EXISTS `exam_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `exam_summary` AS select `exam_marks_tbl`.`studentid` AS `studentid`,`exam_marks_tbl`.`examid` AS `examid`,sum(`exam_marks_tbl`.`totalmarks`) AS `sum(totalmarks)`,sum(`exam_marks_tbl`.`fullmarks`) AS `sum(fullmarks)`,((sum(`exam_marks_tbl`.`totalmarks`) / sum(`exam_marks_tbl`.`fullmarks`)) * 100) AS `percentage`,`exam`.`examname` AS `examname`,`exam`.`startdate` AS `startdate`,`exam_type`.`examtypename` AS `examtypename`,cast(now() as date) AS `curdate` from ((`exam_marks_tbl` left join `exam` on((`exam`.`examid` = `exam_marks_tbl`.`examid`))) left join `exam_type` on((`exam`.`examtypeid` = `exam_type`.`examtypeid`)));

-- --------------------------------------------------------

--
-- Structure for view `studentdetail`
--
DROP TABLE IF EXISTS `studentdetail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `studentdetail` AS select `studentinfo`.`studentid` AS `studentid`,`studentinfo`.`LegacyId` AS `LegacyId`,`studentinfo`.`studentname` AS `studentname`,`studentinfo`.`sex` AS `sex`,`studentinfo`.`smotherlanguage` AS `smotherlanguage`,`studentinfo`.`sethinicgroup` AS `sethinicgroup`,`studentinfo`.`sreligion` AS `sreligion`,`studentinfo`.`dob` AS `dob`,`studentinfo`.`doben` AS `doben`,`studentinfo`.`differentlyabledYN` AS `differentlyabledYN`,`studentinfo`.`differentlyabledtype` AS `differentlyabledtype`,`studentinfo`.`admissionclass` AS `admissionclass`,`studentinfo`.`section` AS `section`,`studentinfo`.`rollno` AS `rollno`,`studentinfo`.`housegroup` AS `housegroup`,`studentinfo`.`oldschool` AS `oldschool`,`studentinfo`.`reasonleav` AS `reasonleav`,`studentinfo`.`hobby` AS `hobby`,`studentinfo`.`specialinterest` AS `specialinterest`,`studentinfo`.`inputter` AS `inputter`,`studentinfo`.`entrydate` AS `entrydate`,`studentinfo`.`admissiondate` AS `admissiondate`,`studentinfo`.`admissiondateen` AS `admissiondateen` from `studentinfo`;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD KEY `fk_attendance_studentid` (`studentid`);

--
-- Indexes for table `castetbl`
--
ALTER TABLE `castetbl`
  ADD PRIMARY KEY (`casteid`);

--
-- Indexes for table `claim_bill_content`
--
ALTER TABLE `claim_bill_content`
  ADD PRIMARY KEY (`claim_bill_content_id`);

--
-- Indexes for table `claim_bill_tbl`
--
ALTER TABLE `claim_bill_tbl`
  ADD PRIMARY KEY (`claim_bill_id`);

--
-- Indexes for table `classadmission`
--
ALTER TABLE `classadmission`
  ADD PRIMARY KEY (`studentid`);

--
-- Indexes for table `classlist`
--
ALTER TABLE `classlist`
  ADD PRIMARY KEY (`classid`);

--
-- Indexes for table `classroom`
--
ALTER TABLE `classroom`
  ADD PRIMARY KEY (`classroomid`), ADD KEY `fk_classroom_classid` (`classid`), ADD KEY `fk_classroom_sectionid` (`sectionid`);

--
-- Indexes for table `classroom_student`
--
ALTER TABLE `classroom_student`
  ADD KEY `fk_classroom_student_classroomid` (`classroomid`), ADD KEY `fk_classroom_student_studentid` (`studentid`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`courseid`), ADD KEY `fk_course_subjectid` (`subjectid`), ADD KEY `fk_course_studentid` (`studentid`);

--
-- Indexes for table `coursetbl`
--
ALTER TABLE `coursetbl`
  ADD PRIMARY KEY (`coursetblid`), ADD KEY `fk_coursetbl_gradeid` (`gradeid`), ADD KEY `fk_coursetbl_subjectid` (`subjectid`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`examid`), ADD KEY `fk_exam_examtypeid` (`examtypeid`);

--
-- Indexes for table `exam_marks_tbl`
--
ALTER TABLE `exam_marks_tbl`
  ADD PRIMARY KEY (`exammarksid`);

--
-- Indexes for table `exam_result`
--
ALTER TABLE `exam_result`
  ADD KEY `fk_exam_result_examid` (`examid`), ADD KEY `fk_exam_result_studentid` (`studentid`), ADD KEY `fk_exam_result_courseid` (`courseid`);

--
-- Indexes for table `exam_type`
--
ALTER TABLE `exam_type`
  ADD PRIMARY KEY (`examtypeid`);

--
-- Indexes for table `feetype`
--
ALTER TABLE `feetype`
  ADD PRIMARY KEY (`feecode`);

--
-- Indexes for table `fee_invoice_content`
--
ALTER TABLE `fee_invoice_content`
  ADD PRIMARY KEY (`fee_invoice_contentid`);

--
-- Indexes for table `fee_invoice_tbl`
--
ALTER TABLE `fee_invoice_tbl`
  ADD PRIMARY KEY (`fee_invoice_id`);

--
-- Indexes for table `generalsettings`
--
ALTER TABLE `generalsettings`
  ADD PRIMARY KEY (`settings_id`);

--
-- Indexes for table `housegrouptbl`
--
ALTER TABLE `housegrouptbl`
  ADD PRIMARY KEY (`housegroupid`);

--
-- Indexes for table `languagetbl`
--
ALTER TABLE `languagetbl`
  ADD PRIMARY KEY (`languageid`);

--
-- Indexes for table `saddresstbl`
--
ALTER TABLE `saddresstbl`
  ADD PRIMARY KEY (`saddressid`), ADD KEY `fk_saddresstbl_studentid` (`studentid`);

--
-- Indexes for table `sbirthcertificatetbl`
--
ALTER TABLE `sbirthcertificatetbl`
  ADD PRIMARY KEY (`sbirthcertificateid`), ADD KEY `fk_sbirthcertificatetbl_studentid` (`studentid`);

--
-- Indexes for table `sectiontbl`
--
ALTER TABLE `sectiontbl`
  ADD PRIMARY KEY (`sectionid`);

--
-- Indexes for table `sfatherdetailtbl`
--
ALTER TABLE `sfatherdetailtbl`
  ADD PRIMARY KEY (`sfatherdetailid`), ADD KEY `fk_sfatherdetailtbl_studentid` (`studentid`);

--
-- Indexes for table `slocalguardiantbl`
--
ALTER TABLE `slocalguardiantbl`
  ADD PRIMARY KEY (`slocalguardianid`), ADD KEY `fk_slocalguardiantbl_studentid` (`studentid`);

--
-- Indexes for table `smotherdetailtbl`
--
ALTER TABLE `smotherdetailtbl`
  ADD PRIMARY KEY (`smotherdetailid`), ADD KEY `fk_smotherdetailtbl_studentid` (`studentid`);

--
-- Indexes for table `specialinteresttbl`
--
ALTER TABLE `specialinteresttbl`
  ADD PRIMARY KEY (`specialinterestid`);

--
-- Indexes for table `studentinfo`
--
ALTER TABLE `studentinfo`
  ADD PRIMARY KEY (`studentid`);

--
-- Indexes for table `subjectlist`
--
ALTER TABLE `subjectlist`
  ADD PRIMARY KEY (`subjectid`);

--
-- Indexes for table `usertbl`
--
ALTER TABLE `usertbl`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `castetbl`
--
ALTER TABLE `castetbl`
  MODIFY `casteid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `claim_bill_content`
--
ALTER TABLE `claim_bill_content`
  MODIFY `claim_bill_content_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `claim_bill_tbl`
--
ALTER TABLE `claim_bill_tbl`
  MODIFY `claim_bill_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `classlist`
--
ALTER TABLE `classlist`
  MODIFY `classid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `classroom`
--
ALTER TABLE `classroom`
  MODIFY `classroomid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `courseid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `coursetbl`
--
ALTER TABLE `coursetbl`
  MODIFY `coursetblid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exam`
--
ALTER TABLE `exam`
  MODIFY `examid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exam_marks_tbl`
--
ALTER TABLE `exam_marks_tbl`
  MODIFY `exammarksid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exam_type`
--
ALTER TABLE `exam_type`
  MODIFY `examtypeid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `fee_invoice_content`
--
ALTER TABLE `fee_invoice_content`
  MODIFY `fee_invoice_contentid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `fee_invoice_tbl`
--
ALTER TABLE `fee_invoice_tbl`
  MODIFY `fee_invoice_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `generalsettings`
--
ALTER TABLE `generalsettings`
  MODIFY `settings_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `housegrouptbl`
--
ALTER TABLE `housegrouptbl`
  MODIFY `housegroupid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `languagetbl`
--
ALTER TABLE `languagetbl`
  MODIFY `languageid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `saddresstbl`
--
ALTER TABLE `saddresstbl`
  MODIFY `saddressid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sbirthcertificatetbl`
--
ALTER TABLE `sbirthcertificatetbl`
  MODIFY `sbirthcertificateid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT for table `sectiontbl`
--
ALTER TABLE `sectiontbl`
  MODIFY `sectionid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `sfatherdetailtbl`
--
ALTER TABLE `sfatherdetailtbl`
  MODIFY `sfatherdetailid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `slocalguardiantbl`
--
ALTER TABLE `slocalguardiantbl`
  MODIFY `slocalguardianid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT for table `smotherdetailtbl`
--
ALTER TABLE `smotherdetailtbl`
  MODIFY `smotherdetailid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `specialinteresttbl`
--
ALTER TABLE `specialinteresttbl`
  MODIFY `specialinterestid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `studentinfo`
--
ALTER TABLE `studentinfo`
  MODIFY `studentid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT for table `subjectlist`
--
ALTER TABLE `subjectlist`
  MODIFY `subjectid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `usertbl`
--
ALTER TABLE `usertbl`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
ADD CONSTRAINT `fk_attendance_studentid` FOREIGN KEY (`studentid`) REFERENCES `studentinfo` (`studentid`) ON UPDATE CASCADE;

--
-- Constraints for table `classroom`
--
ALTER TABLE `classroom`
ADD CONSTRAINT `fk_classroom_classid` FOREIGN KEY (`classid`) REFERENCES `classlist` (`classid`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_classroom_sectionid` FOREIGN KEY (`sectionid`) REFERENCES `sectiontbl` (`sectionid`) ON UPDATE CASCADE;

--
-- Constraints for table `classroom_student`
--
ALTER TABLE `classroom_student`
ADD CONSTRAINT `fk_classroom_student_classroomid` FOREIGN KEY (`classroomid`) REFERENCES `classroom` (`classroomid`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_classroom_student_studentid` FOREIGN KEY (`studentid`) REFERENCES `studentinfo` (`studentid`) ON UPDATE CASCADE;

--
-- Constraints for table `course`
--
ALTER TABLE `course`
ADD CONSTRAINT `fk_course_studentid` FOREIGN KEY (`studentid`) REFERENCES `studentinfo` (`studentid`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_course_subjectid` FOREIGN KEY (`subjectid`) REFERENCES `subjectlist` (`subjectid`) ON UPDATE CASCADE;

--
-- Constraints for table `coursetbl`
--
ALTER TABLE `coursetbl`
ADD CONSTRAINT `fk_coursetbl_gradeid` FOREIGN KEY (`gradeid`) REFERENCES `classlist` (`classid`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_coursetbl_subjectid` FOREIGN KEY (`subjectid`) REFERENCES `subjectlist` (`subjectid`) ON UPDATE CASCADE;

--
-- Constraints for table `exam`
--
ALTER TABLE `exam`
ADD CONSTRAINT `fk_exam_examtypeid` FOREIGN KEY (`examtypeid`) REFERENCES `exam_type` (`examtypeid`) ON UPDATE CASCADE;

--
-- Constraints for table `exam_result`
--
ALTER TABLE `exam_result`
ADD CONSTRAINT `fk_exam_result_courseid` FOREIGN KEY (`courseid`) REFERENCES `course` (`courseid`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_exam_result_examid` FOREIGN KEY (`examid`) REFERENCES `exam` (`examid`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_exam_result_studentid` FOREIGN KEY (`studentid`) REFERENCES `studentinfo` (`studentid`) ON UPDATE CASCADE;

--
-- Constraints for table `saddresstbl`
--
ALTER TABLE `saddresstbl`
ADD CONSTRAINT `fk_saddresstbl_studentid` FOREIGN KEY (`studentid`) REFERENCES `studentinfo` (`studentid`) ON UPDATE CASCADE;

--
-- Constraints for table `sbirthcertificatetbl`
--
ALTER TABLE `sbirthcertificatetbl`
ADD CONSTRAINT `fk_sbirthcertificatetbl_studentid` FOREIGN KEY (`studentid`) REFERENCES `studentinfo` (`studentid`) ON UPDATE CASCADE;

--
-- Constraints for table `sfatherdetailtbl`
--
ALTER TABLE `sfatherdetailtbl`
ADD CONSTRAINT `fk_sfatherdetailtbl_studentid` FOREIGN KEY (`studentid`) REFERENCES `studentinfo` (`studentid`) ON UPDATE CASCADE;

--
-- Constraints for table `slocalguardiantbl`
--
ALTER TABLE `slocalguardiantbl`
ADD CONSTRAINT `fk_slocalguardiantbl_studentid` FOREIGN KEY (`studentid`) REFERENCES `studentinfo` (`studentid`) ON UPDATE CASCADE;

--
-- Constraints for table `smotherdetailtbl`
--
ALTER TABLE `smotherdetailtbl`
ADD CONSTRAINT `fk_smotherdetailtbl_studentid` FOREIGN KEY (`studentid`) REFERENCES `studentinfo` (`studentid`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
