-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 31, 2020 at 09:07 AM
-- Server version: 5.6.41-84.1
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wiztok_demo1`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `device` varchar(191) NOT NULL,
  `browser` varchar(191) NOT NULL,
  `ip` varchar(191) NOT NULL,
  `extra` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `greeting` varchar(191) DEFAULT NULL,
  `message` text NOT NULL,
  `regards` varchar(191) DEFAULT NULL,
  `notify` smallint(6) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `name`, `slug`, `subject`, `greeting`, `message`, `regards`, `notify`, `created_at`, `updated_at`) VALUES
(1, 'Token Purchase - Order Placed by Online Gateway (USER)', 'order-submit-online-user', 'Order placed for Token Purchase #[[order_id]]', 'Thank you for your contribution! ', 'You have requested to purchase [[token_symbol]] token. Your order has been received and is now being waiting for payment. You order details are show below for your reference. \n\n[[order_details]]\n\nYour token balance will appear in your account as soon as we have confirmed your payment from [[payment_gateway]].\n\nFeel free to contact us if you have any questions. \n ', 'true', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(2, 'Token Purchase - Order Unpaid/Rejected by Gateway (USER)', 'order-canceled-user', 'Unpaid Order Canceled #[[order_id]]', 'Hello [[user_name]],', 'We noticed that you just tried to purchase [[token_symbol]] token, however we have not received your payment of [[payment_amount]] via [[payment_gateway]] for [[total_tokens]] Token.\n\nIt looks like your payment gateway ([[payment_gateway]]) has been rejected the transaction. \n\n[[order_details]]\n\nIf you want to pay manually, please feel free to contact us via [[support_email]]\n ', 'true', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(3, 'Token Purchase - Payment Approved by Gateway (ADMIN)', 'order-successful-admin', 'Payment Received - Order #[[order_id]]', 'Hello Admin,', 'You just received a payment of [[payment_amount]] for order (#[[order_id]]) via [[payment_gateway]]. \n\nThis order has now been approved automatically and token balance added to contributor ([[user_email]]) account. \n\n\nPS. Do not reply to this email.  \nThank you.\n ', 'false', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(4, 'Token Purchase - Payment Rejected/Canceled by Gateway (ADMIN)', 'order-rejected-admin', 'Payment Rejected - Order #[[order_id]]', 'Hello Admin,', 'The order (#[[order_id]]) has been canceled, however the payment was not successful and [[payment_gateway]] rejected or canceled the transaction. \n\n\n[[order_details]] \n\n\nPS. Do not reply to this email.  \nThank you.\n ', 'false', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(5, 'Welcome Email', 'welcome-email', 'Welcome to [[site_name]]', 'Hi [[user_name]],', 'Thanks for joining our platform! \n\nAs a member of our platform, you can mange your account, purchase token, referrals etc. \n\nFind out more about in - [[site_url]]', 'true', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(6, 'Send Email to User', 'send-user-email', 'New Message - [[site_name]]', 'Hi [[user_name]], ', '[[messages]]', 'true', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(7, 'Password Change Email', 'users-change-password-email', 'Password change request on [[site_name]]', 'Hello [[user_name]],', 'You are receiving this email because we received a password change request for your account.', 'true', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(8, 'Unusual Login Email', 'users-unusual-login-email    ', 'Unusual Login Attempt on [[site_name]]!!!!', 'Hi [[user_name]], ', 'Someone tried to log in too many times in your [[site_name]] account.', 'true', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(9, 'Confirm Your Email', 'users-confirm-password-email', 'Please verify your email address - [[site_name]]', 'Welcome!', 'Hello [[user_name]]! \n\nThank you for registering on our platform. You\'re almost ready to start.\n\nSimply click the button below to confirm your email address and active your account.', 'true', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(10, 'Password Reset Email by Admin', 'users-reset-password-email', 'Your Password is reseted on [[site_name]]', 'Hello [[user_name]],', 'We are reset your login password as per your requested via support.', 'true', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(11, '2FA Disable Confirmation by Admin', 'users-reset-2fa-email', 'Disable 2FA Authentication Request', 'Hello [[user_name]],', 'We are reset your 2FA authentication as per your requested via support.\n\n If you really want to reset 2FA authentication security in your account, then click the button below to confirm and reset 2FA security.', 'true', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(12, 'KYC Approved Email', 'kyc-approved-email', 'KYC Verified: Contribute in [[site_name]] ICO', 'Hello [[user_name]],', 'Thank you for submitting your verification request. \n\nWe are pleased to let you know that your identity (KYC) has been verified and you are granted to participate in our token sale.\n\nWe invite you to get back to contributor account and purchase token before sales end.', 'true', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(13, 'KYC Rejected Email', 'kyc-rejected-email', 'KYC Application has been rejected - [[site_name]]', 'Hello [[user_name]],', 'Thank you for submitting your verification request. We\'re having difficulties verifying your identity. \n\nThe information you had submitted was unfortunately rejected for following reason: \n[[message]]\n\nDon\'t be upset! Still you want to verity your identity, please get back to your account and fill form with proper information and upload correct documents to complete your identity verification process.', 'true', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(14, 'KYC Missing Email', 'kyc-missing-email', 'Identity Verification: Action Required - [[site_name]]', 'Hello [[user_name]],', 'Thank you for submitting your verification request. We\'re having difficulties verifying your identity. \n\nThe information you had submitted was unfortunately rejected because of the following reason:\n[[message]]\n\nWe request to get back to your account in order to upload new documents and complete the identity verification.', 'true', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(15, 'KYC Submitted Email', 'kyc-submit-email', 'Document submitted for Identity Verification - [[site_name]]', 'Hello [[user_name]],', 'Thank you for submitting your verification request. We\'ve received your submitted document and other information for identity verification.\n\nWe\'ll review your information and if all is in order will approve your identity. If the information is incorrect or something missing, we will request this as soon as possible.', 'true', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(16, 'Token Purchase - Order Placed by Manual payment (USER)', 'order-submit-user', 'Order placed for Token Purchase #[[order_id]]', 'Thank you for your contribution!', 'You have requested to purchase [[token_symbol]] token. Your order has been received and is now being processed. You order details are show below for your reference. \n\n[[order_details]]\n\nIf you have not made the payment yet, please send your payments to the following address: [[payment_from]]\n\nYour order will be processed within 6 hours from the receipt of payment and token balance will appear in your account as soon as we have confirmed your payment. \n\nFeel free to contact us if you have any questions.', 'true', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(17, 'Token Purchase - Order Successful (USER)', 'order-successful-user', 'Token Purchase Successful - Order #[[order_id]]', 'Congratulation [[user_name]], you order has been processed successfully.', 'Thank you for your contribution and purchase our [[token_symbol]] Token! \n\n[[order_details]]\n\nYour token balances now appear in your account. Please login into your and check your balance. Please note that, we will send smart contract end of the token sales. \n\nFeel free to contact us if you have any questions.\n', 'true', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(18, 'Token Purchase - Order Rejected by Admin (USER)', 'order-rejected-user', 'Canceled Order #[[order_id]]', 'Hello [[user_name]],', 'The order (#[[order_id]]) has been canceled. \n\nWe noticed that you just tried to purchase [[token_symbol]] token, however we have not received your payment of [[payment_amount]] from your wallet ([[payment_from]]) for [[total_tokens]] Token.\n\nIf you still want to contribute please login into account and purchase the token again. \n[[site_login]]\n\nFeel free to contact us if you have any questions.\n', 'true', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(19, 'Token Purchase - Order Placed (ADMIN)', 'order-placed-admin', 'New Token Purchase Request #[[order_id]]', 'Hello Admin,', 'You have received a token purchased request form [[user_name]].\n\n[[order_details]]\n\nOrder By: [[user_name]]\nEmail Address: [[user_email]]\n\nPlease login into account and check details of transaction and take necessary steps.\n\n\nPS. Do not reply to this email. \nThank you.\n', 'false', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(20, 'Token Purchase - Canceled by User (ADMIN)', 'order-canceled-admin', 'Order #[[order_id]] Canceled by Contributor', 'Hello Admin,', 'The order (#[[order_id]]) has been canceled by [[user_name]] (contributor).\n\n\nPS. Do not reply to this email.\nThank you.\n', 'false', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(21, 'Token Refund - Refund By Admin (USER)', 'order-refund-token', 'Your order has been refunded', 'Hello [[user_name]],', 'Thank you for purchase [[token_symbol]] token from [[site_name]].\n\nWe found some problem in your payment so we have refunded your order and readjusted your token balance. Please find below your refund and original purchase order details.\n[[refund_details]]\n[[order_details]]\n\nNote: Your payment already refunded via same payment method that you used for payment.\n\nIf you have any questions about this refund, please feel free to contact us.\n', 'true', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03');

-- --------------------------------------------------------

--
-- Table structure for table `global_metas`
--

CREATE TABLE `global_metas` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `value` text,
  `extra` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ico_metas`
--

CREATE TABLE `ico_metas` (
  `id` int(10) UNSIGNED NOT NULL,
  `stage_id` int(11) NOT NULL,
  `option_name` varchar(191) NOT NULL,
  `option_value` text NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ico_metas`
--

INSERT INTO `ico_metas` (`id`, `stage_id`, `option_name`, `option_value`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'bonus_option', '{\"base\":{\"amount\":25,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":1},\"bonus_amount\":{\"status\":1,\"tire_1\":{\"amount\":15,\"token\":2500},\"tire_2\":{\"amount\":null,\"token\":null},\"tire_3\":{\"amount\":null,\"token\":null}}}', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(2, 1, 'price_option', '{\"tire_1\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_2\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_3\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0}}', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(3, 2, 'bonus_option', '{\"base\":{\"amount\":25,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":1},\"bonus_amount\":{\"status\":1,\"tire_1\":{\"amount\":15,\"token\":2500},\"tire_2\":{\"amount\":null,\"token\":null},\"tire_3\":{\"amount\":null,\"token\":null}}}', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(4, 2, 'price_option', '{\"tire_1\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_2\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_3\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0}}', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(5, 3, 'bonus_option', '{\"base\":{\"amount\":25,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":1},\"bonus_amount\":{\"status\":1,\"tire_1\":{\"amount\":15,\"token\":2500},\"tire_2\":{\"amount\":null,\"token\":null},\"tire_3\":{\"amount\":null,\"token\":null}}}', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(6, 3, 'price_option', '{\"tire_1\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_2\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_3\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0}}', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(7, 4, 'bonus_option', '{\"base\":{\"amount\":25,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":1},\"bonus_amount\":{\"status\":1,\"tire_1\":{\"amount\":15,\"token\":2500},\"tire_2\":{\"amount\":null,\"token\":null},\"tire_3\":{\"amount\":null,\"token\":null}}}', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(8, 4, 'price_option', '{\"tire_1\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_2\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_3\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0}}', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(9, 5, 'bonus_option', '{\"base\":{\"amount\":25,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":1},\"bonus_amount\":{\"status\":1,\"tire_1\":{\"amount\":15,\"token\":2500},\"tire_2\":{\"amount\":null,\"token\":null},\"tire_3\":{\"amount\":null,\"token\":null}}}', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(10, 5, 'price_option', '{\"tire_1\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_2\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_3\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0}}', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(11, 6, 'bonus_option', '{\"base\":{\"amount\":25,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":1},\"bonus_amount\":{\"status\":1,\"tire_1\":{\"amount\":15,\"token\":2500},\"tire_2\":{\"amount\":null,\"token\":null},\"tire_3\":{\"amount\":null,\"token\":null}}}', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(12, 6, 'price_option', '{\"tire_1\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_2\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_3\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0}}', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(13, 7, 'bonus_option', '{\"base\":{\"amount\":25,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":1},\"bonus_amount\":{\"status\":1,\"tire_1\":{\"amount\":15,\"token\":2500},\"tire_2\":{\"amount\":null,\"token\":null},\"tire_3\":{\"amount\":null,\"token\":null}}}', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(14, 7, 'price_option', '{\"tire_1\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_2\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_3\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0}}', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(15, 8, 'bonus_option', '{\"base\":{\"amount\":25,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":1},\"bonus_amount\":{\"status\":1,\"tire_1\":{\"amount\":15,\"token\":2500},\"tire_2\":{\"amount\":null,\"token\":null},\"tire_3\":{\"amount\":null,\"token\":null}}}', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(16, 8, 'price_option', '{\"tire_1\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_2\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_3\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0}}', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(17, 9, 'bonus_option', '{\"base\":{\"amount\":25,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":1},\"bonus_amount\":{\"status\":1,\"tire_1\":{\"amount\":15,\"token\":2500},\"tire_2\":{\"amount\":null,\"token\":null},\"tire_3\":{\"amount\":null,\"token\":null}}}', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(18, 9, 'price_option', '{\"tire_1\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_2\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_3\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0}}', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(19, 10, 'bonus_option', '{\"base\":{\"amount\":25,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":1},\"bonus_amount\":{\"status\":1,\"tire_1\":{\"amount\":15,\"token\":2500},\"tire_2\":{\"amount\":null,\"token\":null},\"tire_3\":{\"amount\":null,\"token\":null}}}', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(20, 10, 'price_option', '{\"tire_1\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_2\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_3\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0}}', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(21, 11, 'bonus_option', '{\"base\":{\"amount\":25,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":1},\"bonus_amount\":{\"status\":1,\"tire_1\":{\"amount\":15,\"token\":2500},\"tire_2\":{\"amount\":null,\"token\":null},\"tire_3\":{\"amount\":null,\"token\":null}}}', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(22, 11, 'price_option', '{\"tire_1\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_2\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_3\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0}}', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(23, 12, 'bonus_option', '{\"base\":{\"amount\":25,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":1},\"bonus_amount\":{\"status\":1,\"tire_1\":{\"amount\":15,\"token\":2500},\"tire_2\":{\"amount\":null,\"token\":null},\"tire_3\":{\"amount\":null,\"token\":null}}}', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(24, 12, 'price_option', '{\"tire_1\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_2\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_3\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0}}', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03');

-- --------------------------------------------------------

--
-- Table structure for table `ico_stages`
--

CREATE TABLE `ico_stages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `total_tokens` bigint(20) NOT NULL,
  `base_price` double NOT NULL,
  `min_purchase` int(11) NOT NULL DEFAULT '0',
  `max_purchase` int(11) NOT NULL DEFAULT '0',
  `soft_cap` bigint(20) NOT NULL DEFAULT '0',
  `hard_cap` bigint(20) NOT NULL DEFAULT '0',
  `display_mode` varchar(191) NOT NULL,
  `private` int(11) NOT NULL DEFAULT '0',
  `user_panel_display` int(11) NOT NULL DEFAULT '0',
  `sales_token` double NOT NULL DEFAULT '0',
  `sales_amount` double NOT NULL DEFAULT '0',
  `status` varchar(191) NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ico_stages`
--

INSERT INTO `ico_stages` (`id`, `name`, `start_date`, `end_date`, `total_tokens`, `base_price`, `min_purchase`, `max_purchase`, `soft_cap`, `hard_cap`, `display_mode`, `private`, `user_panel_display`, `sales_token`, `sales_amount`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Demo Stage 1', '2020-05-31 20:07:03', '2020-07-01 20:07:03', 850000, 0.2, 100, 10000, 0, 0, 'normal', 0, 0, 0, 0, 'active', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(2, 'Demo Stage 2', '2020-07-01 20:07:03', '2020-07-31 20:07:03', 850000, 0.2, 100, 10000, 0, 0, 'normal', 0, 0, 0, 0, 'active', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(3, 'Demo Stage 3', '2020-07-01 20:07:03', '2020-07-31 20:07:03', 850000, 0.2, 100, 10000, 0, 0, 'normal', 0, 0, 0, 0, 'active', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(4, 'Demo Stage 4', '2020-07-01 20:07:03', '2020-07-31 20:07:03', 850000, 0.2, 100, 10000, 0, 0, 'normal', 0, 0, 0, 0, 'active', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(5, 'Demo Stage 5', '2020-07-01 20:07:03', '2020-07-31 20:07:03', 850000, 0.2, 100, 10000, 0, 0, 'normal', 0, 0, 0, 0, 'active', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(6, 'Demo Stage 6', '2020-07-01 20:07:03', '2020-07-31 20:07:03', 850000, 0.2, 100, 10000, 0, 0, 'normal', 0, 0, 0, 0, 'active', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(7, 'Demo Stage 7', '2020-07-01 20:07:03', '2020-07-31 20:07:03', 850000, 0.2, 100, 10000, 0, 0, 'normal', 0, 0, 0, 0, 'active', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(8, 'Demo Stage 8', '2020-07-01 20:07:03', '2020-07-31 20:07:03', 850000, 0.2, 100, 10000, 0, 0, 'normal', 0, 0, 0, 0, 'active', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(9, 'Demo Stage 9', '2020-07-01 20:07:03', '2020-07-31 20:07:03', 850000, 0.2, 100, 10000, 0, 0, 'normal', 0, 0, 0, 0, 'active', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(10, 'Demo Stage 10', '2020-07-01 20:07:03', '2020-07-31 20:07:03', 850000, 0.2, 100, 10000, 0, 0, 'normal', 0, 0, 0, 0, 'active', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(11, 'Demo Stage 11', '2020-07-01 20:07:03', '2020-07-31 20:07:03', 850000, 0.2, 100, 10000, 0, 0, 'normal', 0, 0, 0, 0, 'active', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(12, 'Demo Stage 12', '2020-07-01 20:07:03', '2020-07-31 20:07:03', 850000, 0.2, 100, 10000, 0, 0, 'normal', 0, 0, 0, 0, 'active', '2020-06-01 01:07:03', '2020-06-01 01:07:03');

-- --------------------------------------------------------

--
-- Table structure for table `kycs`
--

CREATE TABLE `kycs` (
  `id` int(10) UNSIGNED NOT NULL,
  `userId` int(11) NOT NULL,
  `firstName` varchar(191) NOT NULL,
  `lastName` varchar(191) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `dob` varchar(191) DEFAULT NULL,
  `gender` varchar(191) DEFAULT NULL,
  `address1` varchar(191) DEFAULT NULL,
  `address2` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `zip` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `telegram` varchar(191) DEFAULT '',
  `documentType` varchar(191) DEFAULT '',
  `document` varchar(191) DEFAULT '',
  `document2` varchar(191) DEFAULT '',
  `document3` varchar(191) DEFAULT '',
  `walletName` varchar(191) DEFAULT '',
  `walletAddress` varchar(191) DEFAULT '',
  `notes` text,
  `reviewedBy` int(11) NOT NULL DEFAULT '0',
  `reviewedAt` datetime DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `label` varchar(191) NOT NULL,
  `short` varchar(191) DEFAULT NULL,
  `code` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `label`, `short`, `code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'English', 'English', 'EN', 'en', 1, '2020-06-01 01:07:04', '2020-06-01 01:07:04');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_11_01_043848_create_settings_table', 1),
(4, '2018_11_03_084440_create_activities_table', 1),
(5, '2018_11_03_091911_create_user_metas_table', 1),
(6, '2018_11_03_100212_create_transactions_table', 1),
(7, '2018_11_05_055256_create_kycs_table', 1),
(8, '2018_11_08_110810_create_ico_stages_table', 1),
(9, '2018_11_10_054817_create_ico_metas_table', 1),
(10, '2018_11_12_090411_create_payment_methods_table', 1),
(11, '2018_11_22_102451_create_pages_table', 1),
(12, '2018_11_27_123445_create_email_templates_table', 1),
(13, '2018_12_11_134112_create_global_metas_table', 1),
(14, '2019_05_05_123232_create_referrals_table', 1),
(15, '2019_07_16_133004_add_refund_column_in_transactions_table', 1),
(16, '2019_08_28_124836_add_lang_column_in_pages_table', 1),
(17, '2019_08_28_130012_create_languages_table', 1),
(18, '2019_08_28_130334_create_translates_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `menu_title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `custom_slug` varchar(191) NOT NULL,
  `meta_keyword` varchar(191) DEFAULT NULL,
  `meta_description` text,
  `meta_index` int(11) NOT NULL DEFAULT '1',
  `description` longtext NOT NULL,
  `external_link` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'active',
  `lang` varchar(191) NOT NULL DEFAULT 'en',
  `public` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `menu_title`, `slug`, `custom_slug`, `meta_keyword`, `meta_description`, `meta_index`, `description`, `external_link`, `status`, `lang`, `public`, `created_at`, `updated_at`) VALUES
(1, 'Thank you for your interest to our [[site_name]]', 'Welcome block', 'home_top', 'home-top-block', NULL, NULL, 1, 'You can contribute [[token_symbol]] token go through Buy Token page. \n\n You can get a quick response to any questions, and chat with the project in our Telegram: https://t.me/icocrypto \n\n<strong>Don’t hesitate to invite your friends!</strong> \n\n[[whitepaper_download_button]]', NULL, 'active', 'en', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(2, 'How to buy?', 'How to buy?', 'how_buy', 'how-to-buy', NULL, NULL, 1, 'Login with your email and password then go to Buy Token!', NULL, 'active', 'en', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(3, 'FAQ ', 'FAQ ', 'faq', 'faq', NULL, NULL, 1, 'Frequently Ask Questions...', NULL, 'active', 'en', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(4, 'Privacy and Policy', 'Privacy and Policy', 'privacy', 'privacy-policy', NULL, NULL, 1, '[[site_name]] Privacy and Policies...', NULL, 'active', 'en', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(5, 'Terms and Condition', 'Terms and Condition', 'terms', 'terms-and-condition', NULL, NULL, 1, '[[site_name]] Terms and Condition...', NULL, 'active', 'en', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(6, 'ICO Distribution', 'ICO Distribution', 'distribution', 'ico-distribution', NULL, NULL, 1, 'Distribution page content', NULL, 'hide', 'en', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(7, 'Referral', 'Referral', 'referral', 'referral', NULL, NULL, 1, 'Invite your friends and family and receive free tokens. \nThe referral link may be used during a token contribution, in the pre-sale and the ICO. \n\nImagine giving your unique referral link to your crypto-friend and he or she contributes tokens using your link, the bonus will be sent to your account automatically. The strategy is simple: the more links you send to your colleagues, family and friends - the more tokens you may earn!', NULL, 'hide', 'en', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(8, 'Custom Page', 'Custom Page', 'custom_page', 'custom-page', NULL, NULL, 1, 'Details about the page!', NULL, 'hide', 'en', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_method` varchar(191) NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `data` text NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `payment_method`, `title`, `description`, `data`, `status`, `created_at`, `updated_at`) VALUES
(1, 'manual', 'Pay via Crypto', 'You can send payment direct to our wallets. We will manually verify.', '{\"eth\":{\"status\":\"inactive\",\"address\":null,\"limit\":null,\"price\":null,\"num\":3,\"req\":\"no\"},\"btc\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\"},\"ltc\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\"},\"bch\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\"},\"bnb\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\"},\"trx\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\"},\"xlm\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\"},\"xrp\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\"},\"usdt\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\"},\"usdc\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\"},\"dash\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\"},\"waves\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\"},\"xmr\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\"}}', 'inactive', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(2, 'bank', 'Pay via Bank Transfer', 'You can send payment direct to our bank account.', '{\"bank_account_name\":null,\"bank_account_number\":null,\"bank_holder_address\":null,\"bank_name\":null,\"bank_address\":null,\"routing_number\":null,\"iban\":null,\"swift_bic\":null}', 'inactive', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(3, 'paypal', 'Pay with PayPal', 'You can send your payment using your PayPal account.', '{\"email\":null,\"sandbox\":0,\"clientId\":null,\"clientSecret\":null,\"is_active\":0}', 'inactive', '2020-06-01 01:07:03', '2020-06-01 01:07:03');

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_bonus` int(11) DEFAULT NULL,
  `refer_by` int(11) DEFAULT NULL,
  `refer_bonus` int(11) DEFAULT NULL,
  `meta_data` longtext,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `field` varchar(191) NOT NULL,
  `value` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `field`, `value`, `created_at`, `updated_at`) VALUES
(1, 'tokenlite_install', '2020-05-31 20:07:02', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(2, 'site_name', 'TokenLite', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(3, 'site_email', 'info@yourdomain.com', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(4, 'site_base_currency', 'USD', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(5, 'site_copyright', 'All Right Reserved.', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(6, 'site_support_address', '', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(7, 'site_support_phone', '', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(8, 'site_support_email', '', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(9, 'token_default_in_userpanel', 'ETH', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(10, 'token_sales_raised', 'token', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(11, 'token_sales_total', 'token', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(12, 'token_sales_cap', 'token', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(13, 'tokenlite_credible', 'none', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(14, 'main_website_url', NULL, '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(15, 'pm_automatic_rate_time', '30', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(16, 'theme_admin', 'style', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(17, 'theme_user', 'style', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(18, 'theme_custom', '0', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(19, 'theme_auth_layout', 'default', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(20, 'site_date_format', 'd M, Y', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(21, 'site_time_format', 'h:i A', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(22, 'site_timezone', 'UTC', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(23, 'tokenlite_ukey', '5hcPWdxQ', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(24, 'site_social_links', '{\"onsite\":\"on\",\"onlogin\":\"on\",\"facebook\":null,\"twitter\":null,\"linkedin\":null,\"github\":null,\"medium\":null,\"youtube\":null,\"telegram\":null}', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(25, 'referral_system', '0', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(26, 'referral_allow', 'all_time', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(27, 'referral_calc', 'percent', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(28, 'referral_bonus', '10', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(29, 'referral_bonus_join', '10', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(30, 'referral_info_show', '0', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(31, 'referral_allow_join', 'all_time', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(32, 'referral_calc_join', 'percent', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(33, 'token_wallet_opt', '{\"wallet_opt\":[\"ethereum\",\"bitcoin\",\"litecoin\"]}', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(34, 'token_wallet_note', 'Address should be ERC20-compliant.', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(35, 'token_wallet_custom', '{\"cw_name\":null,\"cw_text\":null}', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(36, 'token_wallet_req', '1', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(37, 'user_in_cur1', 'eth', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(38, 'user_in_cur2', 'btc', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(39, 'user_mytoken_page', '1', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(40, 'user_mytoken_stage', '1', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(41, 'languages_show_as', 'code', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(42, 'languages_switcher', '0', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(43, 'languages_default', 'en', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(44, 'site_mail_driver', 'mail', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(45, 'site_mail_host', '', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(46, 'site_mail_port', '587', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(47, 'site_mail_encryption', 'tls', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(48, 'site_mail_from_address', 'noreply@yourdomain.com', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(49, 'site_mail_from_name', 'TokenLite', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(50, 'site_mail_username', '', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(51, 'site_mail_password', '', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(52, 'site_mail_footer', 'Best Regards\n[[site_name]]', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(53, 'tokenlite_pkey', '23604094', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(54, 'site_admin_management', '0', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(55, 'manage_access_default', '{\"level\":[\"none\"]}', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(56, 'kyc_opt_hide', '0', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(57, 'kyc_public', '1', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(58, 'kyc_before_email', '0', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(59, 'kyc_firstname', '{\"show\":1,\"req\":1}', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(60, 'kyc_lastname', '{\"show\":1,\"req\":1}', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(61, 'kyc_email', '{\"show\":1,\"req\":1}', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(62, 'kyc_phone', '{\"show\":1,\"req\":0}', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(63, 'kyc_dob', '{\"show\":1,\"req\":0}', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(64, 'kyc_gender', '{\"show\":1,\"req\":1}', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(65, 'kyc_country', '{\"show\":1,\"req\":1}', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(66, 'kyc_state', '{\"show\":1,\"req\":1}', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(67, 'kyc_city', '{\"show\":1,\"req\":1}', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(68, 'kyc_zip', '{\"show\":1,\"req\":1}', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(69, 'kyc_address1', '{\"show\":1,\"req\":1}', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(70, 'kyc_address2', '{\"show\":1,\"req\":0}', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(71, 'kyc_telegram', '{\"show\":1,\"req\":0}', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(72, 'kyc_document_passport', '1', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(73, 'kyc_document_nidcard', '1', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(74, 'kyc_document_driving', '1', '2020-06-01 01:07:02', '2020-06-01 01:07:02'),
(75, 'kyc_wallet', '{\"show\":1,\"req\":1}', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(76, 'kyc_wallet_custom', '{\"cw_name\":null,\"cw_text\":null}', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(77, 'kyc_wallet_note', 'Address should be ERC20-compliant.', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(78, 'kyc_wallet_opt', '{\"wallet_opt\":[\"ethereum\",\"bitcoin\",\"litecoin\"]}', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(79, 'token_purchase_usd', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(80, 'pmc_active_usd', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(81, 'token_purchase_eur', '0', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(82, 'pmc_active_eur', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(83, 'token_purchase_gbp', '0', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(84, 'pmc_active_gbp', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(85, 'token_purchase_cad', '0', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(86, 'pmc_active_cad', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(87, 'token_purchase_aud', '0', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(88, 'pmc_active_aud', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(89, 'token_purchase_try', '0', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(90, 'pmc_active_try', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(91, 'token_purchase_rub', '0', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(92, 'pmc_active_rub', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(93, 'token_purchase_inr', '0', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(94, 'pmc_active_inr', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(95, 'token_purchase_brl', '0', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(96, 'pmc_active_brl', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(97, 'token_purchase_nzd', '0', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(98, 'pmc_active_nzd', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(99, 'token_purchase_pln', '0', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(100, 'pmc_active_pln', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(101, 'token_purchase_jpy', '0', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(102, 'pmc_active_jpy', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(103, 'token_purchase_myr', '0', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(104, 'pmc_active_myr', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(105, 'token_purchase_idr', '0', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(106, 'pmc_active_idr', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(107, 'token_purchase_ngn', '0', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(108, 'pmc_active_ngn', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(109, 'token_purchase_mxn', '0', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(110, 'pmc_active_mxn', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(111, 'token_purchase_php', '0', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(112, 'pmc_active_php', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(113, 'token_purchase_chf', '0', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(114, 'pmc_active_chf', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(115, 'token_purchase_thb', '0', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(116, 'pmc_active_thb', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(117, 'token_purchase_sgd', '0', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(118, 'pmc_active_sgd', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(119, 'token_purchase_czk', '0', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(120, 'pmc_active_czk', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(121, 'token_purchase_nok', '0', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(122, 'pmc_active_nok', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(123, 'token_purchase_zar', '0', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(124, 'pmc_active_zar', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(125, 'token_purchase_sek', '0', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(126, 'pmc_active_sek', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(127, 'token_purchase_kes', '0', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(128, 'pmc_active_kes', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(129, 'token_purchase_nad', '0', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(130, 'pmc_active_nad', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(131, 'token_purchase_dkk', '0', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(132, 'pmc_active_dkk', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(133, 'token_purchase_hkd', '0', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(134, 'pmc_active_hkd', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(135, 'token_purchase_eth', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(136, 'pmc_active_eth', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(137, 'token_purchase_btc', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(138, 'pmc_active_btc', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(139, 'token_purchase_ltc', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(140, 'pmc_active_ltc', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(141, 'token_purchase_xrp', '0', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(142, 'pmc_active_xrp', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(143, 'token_purchase_xlm', '0', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(144, 'pmc_active_xlm', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(145, 'token_purchase_bch', '0', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(146, 'pmc_active_bch', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(147, 'token_purchase_bnb', '0', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(148, 'pmc_active_bnb', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(149, 'token_purchase_usdt', '0', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(150, 'pmc_active_usdt', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(151, 'token_purchase_trx', '0', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(152, 'pmc_active_trx', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(153, 'token_purchase_usdc', '0', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(154, 'pmc_active_usdc', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(155, 'token_purchase_dash', '0', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(156, 'pmc_active_dash', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(157, 'token_purchase_waves', '0', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(158, 'pmc_active_waves', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(159, 'token_purchase_xmr', '0', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(160, 'pmc_active_xmr', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(161, 'pm_exchange_method', 'automatic', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(162, 'pm_exchange_auto_lastcheck', '2020-05-31 19:57:03', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(163, 'token_calculate', 'normal', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(164, 'token_calculate_note', 'normal', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(165, 'token_default_method', 'ETH', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(166, 'active_payment_modules', '{\"Manual\":{\"type\":\"core\",\"version\":\"1.0\"},\"Bank\":{\"type\":\"core\",\"version\":\"1.0\"},\"Paypal\":{\"type\":\"core\",\"version\":\"1.0\"}}', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(167, 'site_api_key', '5ukFujjovuwDZOP0IRzNRet5', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(168, 'site_api_secret', '3fbF3ed3689aKY8u', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(169, 'nio_lkey', '1kJQekwp2gkqnqtw4meSpbggGsHFJU3B', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(170, 'pmc_rate_usd', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(171, 'pmc_rate_eur', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(172, 'pmc_rate_gbp', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(173, 'pmc_rate_cad', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(174, 'pmc_rate_aud', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(175, 'pmc_rate_try', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(176, 'pmc_rate_rub', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(177, 'pmc_rate_inr', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(178, 'pmc_rate_brl', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(179, 'pmc_rate_nzd', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(180, 'pmc_rate_pln', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(181, 'pmc_rate_jpy', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(182, 'pmc_rate_myr', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(183, 'pmc_rate_idr', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(184, 'pmc_rate_ngn', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(185, 'pmc_rate_mxn', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(186, 'pmc_rate_php', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(187, 'pmc_rate_chf', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(188, 'pmc_rate_thb', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(189, 'pmc_rate_sgd', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(190, 'pmc_rate_czk', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(191, 'pmc_rate_nok', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(192, 'pmc_rate_zar', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(193, 'pmc_rate_sek', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(194, 'pmc_rate_kes', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(195, 'pmc_rate_nad', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(196, 'pmc_rate_dkk', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(197, 'pmc_rate_hkd', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(198, 'pmc_rate_eth', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(199, 'pmc_rate_btc', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(200, 'pmc_rate_ltc', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(201, 'pmc_rate_xrp', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(202, 'pmc_rate_xlm', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(203, 'pmc_rate_bch', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(204, 'pmc_rate_bnb', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(205, 'pmc_rate_usdt', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(206, 'pmc_rate_trx', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(207, 'pmc_rate_usdc', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(208, 'pmc_rate_dash', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(209, 'pmc_rate_waves', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(210, 'pmc_rate_xmr', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(211, 'actived_stage', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(212, 'token_name', 'TokenLite', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(213, 'token_symbol', 'TLE', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(214, 'token_decimal_min', '2', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(215, 'token_decimal_max', '6', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(216, 'token_decimal_show', '3', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(217, 'token_price_show', '1', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(218, 'token_before_kyc', '0', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(219, 'site_db_version', '193508', '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(220, 'lang_last_update_en', '1590934024', '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(221, 'lang_last_generate_en', '1590934024', '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(222, 'lang_db_version', '193514', '2020-06-01 01:07:04', '2020-06-01 01:07:04');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `tnx_id` varchar(191) NOT NULL,
  `tnx_type` varchar(191) NOT NULL,
  `tnx_time` datetime NOT NULL,
  `tokens` double NOT NULL DEFAULT '0',
  `bonus_on_base` double NOT NULL DEFAULT '0',
  `bonus_on_token` double NOT NULL DEFAULT '0',
  `total_bonus` double NOT NULL DEFAULT '0',
  `total_tokens` double NOT NULL,
  `stage` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `amount` double DEFAULT NULL,
  `receive_amount` double NOT NULL DEFAULT '0',
  `receive_currency` varchar(191) DEFAULT NULL,
  `base_amount` double DEFAULT NULL,
  `base_currency` varchar(191) DEFAULT NULL,
  `base_currency_rate` double DEFAULT NULL,
  `currency` varchar(191) DEFAULT NULL,
  `currency_rate` double DEFAULT NULL,
  `all_currency_rate` text,
  `wallet_address` varchar(191) DEFAULT NULL,
  `payment_method` varchar(191) DEFAULT NULL,
  `payment_id` varchar(191) NOT NULL DEFAULT '',
  `payment_to` varchar(191) DEFAULT NULL,
  `checked_by` text,
  `added_by` text,
  `checked_time` datetime DEFAULT NULL,
  `details` varchar(191) NOT NULL DEFAULT '',
  `extra` text,
  `status` varchar(191) NOT NULL DEFAULT '',
  `dist` int(11) NOT NULL DEFAULT '0',
  `refund` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `translates`
--

CREATE TABLE `translates` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `text` text,
  `pages` varchar(191) NOT NULL DEFAULT 'global',
  `group` varchar(191) NOT NULL DEFAULT 'system',
  `panel` varchar(191) NOT NULL DEFAULT 'any',
  `load` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `translates`
--

INSERT INTO `translates` (`id`, `key`, `name`, `text`, `pages`, `group`, `panel`, `load`, `created_at`, `updated_at`) VALUES
(1, 'messages.email_exist', 'base', 'Email is already exist!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(2, 'messages.email.unique', 'base', 'Email address should be unique!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(3, 'messages.email.reset', 'base', 'Somthing is wrong! We are unable to send reset link to your email. Please! contact with administrator via :email.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(4, 'messages.email.verify', 'base', 'Somthing is wrong! We are unable to send the verification link to your email. Please! contact with administrator via :email.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(5, 'messages.email.password_change', 'base', 'Somthing is wrong! We are unable to send the confirmation link to your email. Please! contact with administrator via :email.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(6, 'messages.email.failed', 'base', 'But email was not send to user. Please check your mail setting credential.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(7, 'messages.form.invalid', 'base', 'Invalid form data!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(8, 'messages.form.wrong', 'base', 'Something wrong in form submission!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(9, 'messages.wrong', 'base', 'Something is wrong!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(10, 'messages.nothing', 'base', 'Nothing to do!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(11, 'messages.agree', 'base', 'You should agree our terms and policy.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(12, 'messages.errors', 'base', 'An error occurred. Please try again.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(13, 'messages.login.email_verify', 'base', 'Please login to verify you email address.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(14, 'messages.login.inactive', 'base', 'Your account may inactive or suspended. Please contact us if something wrong.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(15, 'messages.register.success.heading', 'base', 'Thank you!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(16, 'messages.register.success.subhead', 'base', 'Your sign-up process is almost done.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(17, 'messages.register.success.msg', 'base', 'Please check your email and verify your account.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(18, 'messages.verify.verified', 'base', 'Email address is already verified.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(19, 'messages.verify.not_found', 'base', 'User Account is not found!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(20, 'messages.verify.expired', 'base', 'Your verification link is expired!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(21, 'messages.verify.invalid', 'base', 'Your verification link is invalid!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(22, 'messages.verify.confirmed', 'base', 'Your email is verified now!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(23, 'messages.verify.success.heading', 'base', 'Congratulations!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(24, 'messages.verify.success.subhead', 'base', 'You\'ve successfully verified your email address and your account is now active.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(25, 'messages.verify.success.msg', 'base', 'Please sign-in to start token purchase.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(26, 'messages.trnx.created', 'base', 'Transaction successful, You will redirect to payment page.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(27, 'messages.trnx.wrong', 'base', 'Something is wrong!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(28, 'messages.trnx.required', 'base', 'Transaction id is required!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(29, 'messages.trnx.canceled', 'base', 'Transaction failed! Try again.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(30, 'messages.trnx.notfound', 'base', 'Transaction id is not found', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(31, 'messages.trnx.reviewing', 'base', 'We are reviewing your payment!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(32, 'messages.trnx.canceled_own', 'base', 'You had canceled your order', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(33, 'messages.trnx.require_currency', 'base', 'Currency is required!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(34, 'messages.trnx.require_token', 'base', 'Token amount is required!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(35, 'messages.trnx.select_method', 'base', 'Select payment method!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(36, 'messages.trnx.minimum_token', 'base', 'You have to purchase more than 1 token.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(37, 'messages.trnx.purchase_token', 'base', 'Tokens Purchase', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(38, 'messages.trnx.referral_bonus', 'base', 'Referral Bonus', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(39, 'messages.trnx.payments.not_available', 'base', 'Sorry! Currently payment method not available in your selected currency!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(40, 'messages.trnx.manual.success', 'base', 'Transaction successful!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(41, 'messages.trnx.manual.failed', 'base', 'Transaction Failed!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(42, 'messages.trnx.admin.approved', 'base', 'Transaction approved and token added to user.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(43, 'messages.trnx.admin.canceled', 'base', 'Transaction canceled.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(44, 'messages.trnx.admin.deleted', 'base', 'Transaction Deleted.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(45, 'messages.trnx.admin.already_deleted', 'base', 'This transaction is already deleted.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(46, 'messages.trnx.admin.already_approved', 'base', 'This transaction is already approved.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(47, 'messages.trnx.admin.already_canceled', 'base', 'This transaction is already canceled.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(48, 'messages.trnx.admin.already_updated', 'base', 'This transaction is already updated to :status.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(49, 'messages.token.success', 'base', 'Token added to the user account!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(50, 'messages.token.failed', 'base', 'Failed to add token!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(51, 'messages.insert.success', 'base', ':what insert successful!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(52, 'messages.insert.warning', 'base', 'Something is wrong!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(53, 'messages.insert.failed', 'base', ':what insert failed!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(54, 'messages.stage.expired', 'base', 'Sorry, this stage is expired!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(55, 'messages.stage.inactive', 'base', 'Currently no active stage found!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(56, 'messages.stage.notice', 'base', 'Please create a new stage or update stage date, because this stage is expired!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(57, 'messages.stage.upcoming', 'base', 'Stage will start at :time', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(58, 'messages.stage.delete_failed', 'base', 'You can not remove the last stage.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(59, 'messages.stage.not_started', 'base', 'Our sell have not started yet. Please check after some times.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(60, 'messages.stage.completed', 'base', 'Our token sales has been finished. Thank you very much for your contribution.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(61, 'messages.update.success', 'base', ':what has been updated!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(62, 'messages.update.warning', 'base', 'Something is wrong!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(63, 'messages.update.failed', 'base', ':what updating failed!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(64, 'messages.password.old_err', 'base', 'Your old password is incorrect.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(65, 'messages.password.success', 'base', 'Password successfully changed!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(66, 'messages.password.changed', 'base', 'We have sent a verification code to your email please confirm and change.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(67, 'messages.password.failed', 'base', 'Varification link has expired!!! try again', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(68, 'messages.password.token', 'base', 'Invalid link/token!!! try again', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(69, 'messages.delete.delete', 'base', ':what is deleted!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(70, 'messages.delete.delete_failed', 'base', ':what is deletion failed!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(71, 'messages.kyc.approved', 'base', 'KYC application approved successfully!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(72, 'messages.kyc.missing', 'base', 'KYC application is missing!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(73, 'messages.kyc.rejected', 'base', 'KYC application is rejected!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(74, 'messages.kyc.wait', 'base', 'Your KYC Application is placed, please wait for our review.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(75, 'messages.kyc.mandatory', 'base', 'Identity verification (KYC/AML) is mandatory to participate in our token sale.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(76, 'messages.kyc.forms.submitted', 'base', 'You have successfully submitted your application for identity verification.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(77, 'messages.kyc.forms.failed', 'base', 'We weren\'t able to process the application submission for identity verification. Please reload this page and fill the form again and submit. ', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(78, 'messages.kyc.forms.document', 'base', ':NAME is required, Please upload your document.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(79, 'messages.upload.success', 'base', ':what has been uploaded!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(80, 'messages.upload.warning', 'base', 'Something is wrong!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(81, 'messages.upload.invalid', 'base', 'This type of file is not supported!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(82, 'messages.upload.failed', 'base', ':what uploading failed!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(83, 'messages.invalid.address', 'base', 'Enter a valid wallet address.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(84, 'messages.invalid.address_is', 'base', 'Enter a valid :is wallet address.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(85, 'messages.invalid.social', 'base', 'Sorry, Social login is not available now.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(86, 'messages.mail.send', 'base', 'Email has been send successfully.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(87, 'messages.mail.failed', 'base', 'Failed to send email.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(88, 'messages.mail.issues', 'base', 'Unable to send email! Please check your mail setting credential.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(89, 'messages.wallet.change', 'base', 'Wallet address change request submitted.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(90, 'messages.wallet.cancel', 'base', 'Wallet address change request is canceled.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(91, 'messages.wallet.approved', 'base', 'Wallet address change request is approved.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(92, 'messages.wallet.failed', 'base', 'Wallet address change request is failed.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(93, 'messages.ico_not_setup', 'base', 'ICO Sales opening soon, Please check after sometimes.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(94, 'messages.demo_payment_note', 'base', 'All the <span class=\"badge badge-xs badge-purple ucap\">Add-ons</span> type payment modules is NOT part of main product. You\'ve to purchase separately from CodeCanyon to get those. <strong><a href=\"https://codecanyon.net/user/softnio/portfolio\" target=\"_blank\">Check out here</a></strong>.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(95, 'messages.demo_user', 'base', 'Your action can\'t perform as you login with a Demo Account. For full-access, please send an email at info@softnio.com.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(96, 'messages.demo_preview', 'base', 'You can\'t perform this action as this is preview purpose.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(97, 'messages.stage_update', 'base', 'Successfully :status the stage!!', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(98, 'messages.payment_method_update', 'base', 'Payment method :status', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(99, 'messages.required_app', 'base', 'The :what payment module required minimum :version version of application. Please update your core application to latest version.', 'messages, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(100, 'messages.permission', 'base', 'You do not have enough permissions to perform requested operation.', 'messages, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(101, 'pagination.previous', 'base', '&laquo; Previous', 'pagination, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(102, 'pagination.next', 'base', 'Next &raquo;', 'pagination, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(103, 'passwords.password', 'base', 'Passwords must be at least six characters and match the confirmation.', 'passwords, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(104, 'passwords.reset', 'base', 'Your password has been reset!', 'passwords, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(105, 'passwords.sent', 'base', 'We have e-mailed your password reset link!', 'passwords, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(106, 'passwords.token', 'base', 'This password reset token is invalid.', 'passwords, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(107, 'passwords.user', 'base', 'We can\'t find a user with that e-mail address.', 'passwords, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(108, 'auth.failed', 'base', 'These credentials do not match our records.', 'auth, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(109, 'auth.throttle', 'base', 'Too many login attempts. Please try again in :seconds', 'auth, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(110, 'auth.recaptcha', 'base', 'Your request failed to complete as bot detected.', 'auth, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(111, 'auth.health.save_action', 'base', 'Please register and activate the application to perform the action.', 'auth, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(112, 'auth.health.fail', 'base', 'Invalidated-the-license-due-to-wrong-key', 'auth, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(113, 'validation.accepted', 'base', 'The :attribute must be accepted.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(114, 'validation.active_url', 'base', 'The :attribute is not a valid URL.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(115, 'validation.after', 'base', 'The :attribute must be a date after :date.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(116, 'validation.after_or_equal', 'base', 'The :attribute must be a date after or equal to :date.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(117, 'validation.alpha', 'base', 'The :attribute may only contain letters.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(118, 'validation.alpha_dash', 'base', 'The :attribute may only contain letters, numbers, dashes and underscores.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(119, 'validation.alpha_num', 'base', 'The :attribute may only contain letters and numbers.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(120, 'validation.array', 'base', 'The :attribute must be an array.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(121, 'validation.before', 'base', 'The :attribute must be a date before :date.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(122, 'validation.before_or_equal', 'base', 'The :attribute must be a date before or equal to :date.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(123, 'validation.between.numeric', 'base', 'The :attribute must be between :min and :max.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(124, 'validation.between.file', 'base', 'The :attribute must be between :min and :max kilobytes.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(125, 'validation.between.string', 'base', 'The :attribute must be between :min and :max characters.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(126, 'validation.between.array', 'base', 'The :attribute must have between :min and :max items.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(127, 'validation.boolean', 'base', 'The :attribute field must be true or false.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(128, 'validation.confirmed', 'base', 'The :attribute confirmation does not match.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(129, 'validation.date', 'base', 'The :attribute is not a valid date.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(130, 'validation.date_equals', 'base', 'The :attribute must be a date equal to :date.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(131, 'validation.date_format', 'base', 'The :attribute does not match the format :format.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(132, 'validation.different', 'base', 'The :attribute and :other must be different.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(133, 'validation.digits', 'base', 'The :attribute must be :digits digits.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(134, 'validation.digits_between', 'base', 'The :attribute must be between :min and :max digits.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(135, 'validation.dimensions', 'base', 'The :attribute has invalid image dimensions.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(136, 'validation.distinct', 'base', 'The :attribute field has a duplicate value.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(137, 'validation.email', 'base', 'The :attribute must be a valid email address.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(138, 'validation.exists', 'base', 'The selected :attribute is invalid.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(139, 'validation.file', 'base', 'The :attribute must be a file.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(140, 'validation.filled', 'base', 'The :attribute field must have a value.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(141, 'validation.gt.numeric', 'base', 'The :attribute must be greater than :value.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(142, 'validation.gt.file', 'base', 'The :attribute must be greater than :value kilobytes.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(143, 'validation.gt.string', 'base', 'The :attribute must be greater than :value characters.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(144, 'validation.gt.array', 'base', 'The :attribute must have more than :value items.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(145, 'validation.gte.numeric', 'base', 'The :attribute must be greater than or equal :value.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(146, 'validation.gte.file', 'base', 'The :attribute must be greater than or equal :value kilobytes.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(147, 'validation.gte.string', 'base', 'The :attribute must be greater than or equal :value characters.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(148, 'validation.gte.array', 'base', 'The :attribute must have :value items or more.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(149, 'validation.image', 'base', 'The :attribute must be an image.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(150, 'validation.in', 'base', 'The selected :attribute is invalid.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(151, 'validation.in_array', 'base', 'The :attribute field does not exist in :other.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(152, 'validation.integer', 'base', 'The :attribute must be an integer.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(153, 'validation.ip', 'base', 'The :attribute must be a valid IP address.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(154, 'validation.ipv4', 'base', 'The :attribute must be a valid IPv4 address.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(155, 'validation.ipv6', 'base', 'The :attribute must be a valid IPv6 address.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(156, 'validation.json', 'base', 'The :attribute must be a valid JSON string.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(157, 'validation.lt.numeric', 'base', 'The :attribute must be less than :value.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(158, 'validation.lt.file', 'base', 'The :attribute must be less than :value kilobytes.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(159, 'validation.lt.string', 'base', 'The :attribute must be less than :value characters.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(160, 'validation.lt.array', 'base', 'The :attribute must have less than :value items.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(161, 'validation.lte.numeric', 'base', 'The :attribute must be less than or equal :value.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(162, 'validation.lte.file', 'base', 'The :attribute must be less than or equal :value kilobytes.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(163, 'validation.lte.string', 'base', 'The :attribute must be less than or equal :value characters.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(164, 'validation.lte.array', 'base', 'The :attribute must not have more than :value items.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(165, 'validation.max.numeric', 'base', 'The :attribute may not be greater than :max.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(166, 'validation.max.file', 'base', 'The :attribute may not be greater than :max kilobytes.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(167, 'validation.max.string', 'base', 'The :attribute may not be greater than :max characters.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(168, 'validation.max.array', 'base', 'The :attribute may not have more than :max items.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(169, 'validation.mimes', 'base', 'The :attribute must be a file of type: :values.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(170, 'validation.mimetypes', 'base', 'The :attribute must be a file of type: :values.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(171, 'validation.min.numeric', 'base', 'The :attribute must be at least :min.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(172, 'validation.min.file', 'base', 'The :attribute must be at least :min kilobytes.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(173, 'validation.min.string', 'base', 'The :attribute must be at least :min characters.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(174, 'validation.min.array', 'base', 'The :attribute must have at least :min items.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(175, 'validation.not_in', 'base', 'The selected :attribute is invalid.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(176, 'validation.not_regex', 'base', 'The :attribute format is invalid.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(177, 'validation.numeric', 'base', 'The :attribute must be a number.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(178, 'validation.present', 'base', 'The :attribute field must be present.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(179, 'validation.regex', 'base', 'The :attribute format is invalid.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(180, 'validation.required', 'base', 'The :attribute field is required.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(181, 'validation.required_if', 'base', 'The :attribute field is required when :other is :value.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(182, 'validation.required_unless', 'base', 'The :attribute field is required unless :other is in :values.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(183, 'validation.required_with', 'base', 'The :attribute field is required when :values is present.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(184, 'validation.required_with_all', 'base', 'The :attribute field is required when :values are present.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(185, 'validation.required_without', 'base', 'The :attribute field is required when :values is not present.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(186, 'validation.required_without_all', 'base', 'The :attribute field is required when none of :values are present.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(187, 'validation.same', 'base', 'The :attribute and :other must match.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(188, 'validation.size.numeric', 'base', 'The :attribute must be :size.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(189, 'validation.size.file', 'base', 'The :attribute must be :size kilobytes.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(190, 'validation.size.string', 'base', 'The :attribute must be :size characters.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(191, 'validation.size.array', 'base', 'The :attribute must contain :size items.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(192, 'validation.starts_with', 'base', 'The :attribute must start with one of the following: :values', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(193, 'validation.string', 'base', 'The :attribute must be a string.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(194, 'validation.timezone', 'base', 'The :attribute must be a valid zone.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(195, 'validation.unique', 'base', 'The :attribute has already been taken.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(196, 'validation.uploaded', 'base', 'The :attribute failed to upload.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(197, 'validation.url', 'base', 'The :attribute format is invalid.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(198, 'validation.uuid', 'base', 'The :attribute must be a valid UUID.', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(199, 'validation.custom.attribute-name.rule-name', 'base', 'custom-message', 'validation, global', 'system', 'any', 1, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(200, 'validation.only.required', 'base', 'Required.', 'validation, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(201, 'validation.min.char', 'base', 'At least :num chars.', 'validation, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(202, 'validation.max.char', 'base', 'Maximum :num chars.', 'validation, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(203, 'validation.same.value', 'base', 'Enter the same value.', 'validation, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(204, 'validation.email.valid', 'base', 'Enter valid email.', 'validation, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(205, 'validation.issue', 'base', 'Currently we are facing some technical issue, please try again after sometime.', 'validation, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(206, 'auth.signin', 'base', 'Sign-in', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(207, 'auth.sign_in_btn', 'base', 'Sign In', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(208, 'auth.sign_in', 'base', 'Sign in', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(209, 'auth.with_your', 'base', 'with your', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(210, 'auth.account', 'base', 'Account', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(211, 'auth.your_email', 'base', 'Your Email', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(212, 'auth.password', 'base', 'Password', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(213, 'auth.remember_me', 'base', 'Remember Me', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(214, 'auth.forgot_password', 'base', 'Forgot password?', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(215, 'auth.no_account', 'base', 'Don’t have an account?', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(216, 'auth.sign_with', 'base', 'Or Sign in with', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(217, 'auth.facebook', 'base', 'Facebook', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(218, 'auth.google', 'base', 'Google', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(219, 'auth.sign_here', 'base', 'Sign up here', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(220, 'auth.welcome', 'base', 'Welcome!', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(221, 'auth.logout', 'base', 'Logout', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(222, 'auth.sign_up', 'base', 'Sign up', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(223, 'auth.create_new', 'base', 'Create New', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(224, 'auth.email_verified', 'base', 'Email Verified', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(225, 'auth.resend_email', 'base', 'Resend Email', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(226, 'auth.set_admin_account', 'base', 'Please setup admin account.', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(227, 'auth.repeat_password', 'base', 'Repeat Password', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(228, 'auth.reset_password', 'base', 'Reset password', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(229, 'auth.forgot_password_note', 'base', 'If you forgot your password, well, then we\'ll email you instructions to reset your password.', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(230, 'auth.your_email_address', 'base', 'Your Email Address', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(231, 'auth.your_name', 'base', 'Your Name', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(232, 'auth.your_full_name', 'base', 'Your Full Name', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(233, 'auth.your_mobile', 'base', 'Your Mobile Number', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(234, 'auth.enter_full_name', 'base', 'Enter Full Name', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(235, 'auth.enter_email_address', 'base', 'Enter Email Address', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(236, 'auth.enter_mobile', 'base', 'Enter Mobile Number', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(237, 'auth.enter_password', 'base', 'Enter Password', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(238, 'auth.reset_link', 'base', 'Send Reset Link', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(239, 'auth.return_login', 'base', 'Return to login', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(240, 'auth.agree', 'base', 'I agree to the', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(241, 'auth.agree_and', 'base', 'and', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(242, 'auth.agree_terms', 'base', 'By registering you agree to the terms and conditions.', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(243, 'auth.agree_confirm', 'base', 'You should accept our terms and policy.', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(244, 'auth.create_account', 'base', 'Create Account', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(245, 'auth.already_account', 'base', 'Already have an account ?', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(246, 'auth.sign_instead', 'base', 'Sign in instead', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(247, 'auth.verify_email', 'base', 'Please verify your email address.', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(248, 'auth.cancel_signup', 'base', 'Cancel Signup', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(249, 'auth.sign_out', 'base', 'Sign Out', 'auth, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(250, 'dashboard.main_site', 'base', 'Main Site', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(251, 'dashboard.title_user_dashboard', 'base', 'User Dashboard', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(252, 'dashboard.title_user_transactions', 'base', 'User Transactions', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(253, 'dashboard.title_user_account', 'base', 'User Account', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(254, 'dashboard.title_user_token', 'base', ':symbol Token Balance', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(255, 'dashboard.title_token', 'base', 'My Token', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(256, 'dashboard.title_kyc', 'base', 'KYC Application', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(257, 'dashboard.title_dashboard', 'base', 'Dashboard', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(258, 'dashboard.title_transactions', 'base', 'Transactions', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(259, 'dashboard.title_profile', 'base', 'Profile', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(260, 'dashboard.kyc_details', 'base', 'User KYC Details', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(261, 'dashboard.id_verification', 'base', 'Begin ID-Verification', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(262, 'dashboard.buy_token', 'base', 'Buy Token', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(263, 'dashboard.current_price', 'base', 'Current Price', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(264, 'dashboard.buy_token_now', 'base', 'Buy Token Now', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(265, 'dashboard.kyc_approved', 'base', 'KYC Approved', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(266, 'dashboard.kyc_application', 'base', 'KYC Application', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(267, 'dashboard.kyc_pending', 'base', 'KYC Pending', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(268, 'dashboard.submit_kyc', 'base', 'Submit KYC', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(269, 'dashboard.your_contribution_in', 'base', 'Your Contribution in', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(270, 'dashboard.token_balance', 'base', 'Token Balance', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(271, 'dashboard.token_name', 'base', 'Token Name', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(272, 'dashboard.token_symbol', 'base', 'Token Symbol', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(273, 'dashboard.white_paper', 'base', 'White Paper', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(274, 'dashboard.contact_support', 'base', 'Contact Support', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(275, 'dashboard.my_profile', 'base', 'My Profile', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(276, 'dashboard.referral', 'base', 'Referral', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(277, 'dashboard.referral_url', 'base', 'Referral URL', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(278, 'dashboard.referral_lists', 'base', 'Referral Lists', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(279, 'dashboard.activity', 'base', 'Activity', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(280, 'dashboard.download_whitepaper', 'base', 'Download Whitepaper', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(281, 'dashboard.add_wallet_befor', 'base', 'Add your wallet address before buy', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(282, 'dashboard.account_status', 'base', 'Your Account Status', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(283, 'dashboard.receiving_wallet', 'base', 'Receiving Wallet', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(284, 'dashboard.new_address', 'base', 'New address under review for approve.', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(285, 'dashboard.your_wallet', 'base', 'Add Your Wallet Address', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(286, 'dashboard.earn_with_referral', 'base', 'Earn with Referral', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(287, 'dashboard.invite_friends', 'base', 'Invite your friends & family.', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(288, 'dashboard.refer_link', 'base', 'Use above link to refer your friend and get referral bonus.', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(289, 'dashboard.contact_support_team', 'base', 'Contact our support team via email', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(290, 'dashboard.current_bonus', 'base', 'Current Bonus', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(291, 'dashboard.start_date', 'base', 'Start Date', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(292, 'dashboard.end_date', 'base', 'End Date', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(293, 'dashboard.bonus_start_in', 'base', 'The Bonus Start in', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(294, 'dashboard.bonus_end_in', 'base', 'The Bonus End in', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(295, 'dashboard.token_sales_progress', 'base', 'Token Sales Progress', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(296, 'dashboard.raised', 'base', 'Raised', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(297, 'dashboard.total', 'base', 'Total', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(298, 'dashboard.sales_end_in', 'base', 'Sales End in', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(299, 'dashboard.sales_end_at', 'base', 'Sales End at', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(300, 'dashboard.sales_start_in', 'base', 'Sales Start in', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(301, 'dashboard.sales_start_at', 'base', 'Sales Start at', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(302, 'dashboard.raised_amount', 'base', 'Raised Amount', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(303, 'dashboard.total_token', 'base', 'Total Token', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(304, 'dashboard.hard_cap', 'base', 'Hard Cap', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(305, 'dashboard.hardcap', 'base', 'Hardcap', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(306, 'dashboard.soft_cap', 'base', 'Soft Cap', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(307, 'dashboard.softcap', 'base', 'Softcap', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03');
INSERT INTO `translates` (`id`, `key`, `name`, `text`, `pages`, `group`, `panel`, `load`, `created_at`, `updated_at`) VALUES
(308, 'dashboard.token_sales_finished', 'base', 'Our token sales has been finished. Thank you very much for your contribution.', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(309, 'dashboard.view_transaction', 'base', 'View Transaction', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(310, 'dashboard.tranx_types', 'base', 'Types', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(311, 'dashboard.tranx_type', 'base', 'Type', 'dashboard, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(312, 'dashboard.purchased_title', 'base', 'Purchased', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(313, 'dashboard.user_name', 'base', 'User Name', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(314, 'dashboard.title_note', 'base', 'Note:', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(315, 'dashboard.title_details', 'base', 'Details', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(316, 'dashboard.oops', 'base', 'Oops!!!', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(317, 'dashboard.token_title', 'base', 'My :symbol Token', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(318, 'dashboard.buy_more', 'base', 'Buy More Token', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(319, 'dashboard.equivalent_to', 'base', 'Equivalent to', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(320, 'dashboard.total_token_amount', 'base', 'Total Token Amount', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(321, 'dashboard.purchased_token', 'base', 'Purchased Token', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(322, 'dashboard.referral_token', 'base', 'Referral Token', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(323, 'dashboard.bonuses_token', 'base', 'Bonuses Token', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(324, 'dashboard.total_contributed', 'base', 'Total Contributed', 'dashboard, global', 'system', 'any', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(325, 'profile.profile_details', 'base', 'Profile Details', 'user_profile, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(326, 'profile.email_confirm', 'base', 'Your password will only change after your confirmation by email.', 'user_profile, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(327, 'profile.personal_data', 'base', 'Personal Data', 'user_profile, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(328, 'profile.settings', 'base', 'Settings', 'user_profile, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(329, 'profile.full_name', 'base', 'Full Name', 'user_profile, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(330, 'profile.email_address', 'base', 'Email Address', 'user_profile, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(331, 'profile.mobile_number', 'base', 'Mobile Number', 'user_profile, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(332, 'profile.date_of_birth', 'base', 'Date of Birth', 'user_profile, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(333, 'profile.nationality', 'base', 'Nationality', 'user_profile, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(334, 'profile.select_country', 'base', 'Select Country', 'user_profile, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(335, 'profile.update_profile', 'base', 'Update Profile', 'user_profile, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(336, 'profile.security_settings', 'base', 'Security Settings', 'user_profile, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(337, 'profile.save_activities_log', 'base', 'Save my activities log', 'user_profile, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(338, 'profile.confirm_email', 'base', 'Confirm me through email before password change', 'user_profile, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(339, 'profile.manage_notification', 'base', 'Manage Notification', 'user_profile, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(340, 'profile.resumption_notify', 'base', 'Notify me by email about resumption of sales', 'user_profile, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(341, 'profile.sales_notify', 'base', 'Notify me by email about sales and latest news', 'user_profile, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(342, 'profile.unusual_activity', 'base', 'Alert me by email in case of unusual activity in my account', 'user_profile, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(343, 'profile.update', 'base', 'Update', 'user_profile, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(344, 'profile.old_password', 'base', 'Old Password', 'user_profile, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(345, 'profile.new_password', 'base', 'New Password', 'user_profile, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(346, 'profile.confirm_password', 'base', 'Confirm New Password', 'user_profile, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(347, 'profile.min_6_digit', 'base', 'Password should be a minimum of 6 digits and include lower and uppercase letter.', 'user_profile, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(348, 'profile.activitiy_log', 'base', 'Account Activities Log', 'user_profile, user_activity, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(349, 'profile.activitiy_clear', 'base', 'Clear All', 'user_profile, user_activity, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(350, 'profile.activitiy_note', 'base', 'Here is your recent activities. You can clear this log as well as disable the feature from profile settings tabs.', 'user_profile, user_activity, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(351, 'profile.activitiy_date', 'base', 'Date', 'user_profile, user_activity, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(352, 'profile.activitiy_device', 'base', 'Device', 'user_profile, user_activity, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(353, 'profile.activitiy_browser', 'base', 'Browser', 'user_profile, user_activity, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(354, 'profile.activitiy_ip', 'base', 'IP', 'user_profile, user_activity, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(355, 'profile.tranx_list', 'base', 'Transactions list', 'user_profile, user_transaction', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(356, 'profile.tranx_amount', 'base', 'Amount', 'user_profile, user_transaction', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(357, 'profile.tranx_from', 'base', 'From', 'user_profile, user_transaction', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(358, 'profile.tranx_to', 'base', 'To', 'user_profile, user_transaction', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(359, 'profile.tranx_pay', 'base', 'Pay', 'user_profile, user_transaction', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(360, 'profile.token_types', 'base', 'Token Types', 'user_profile, user_transaction', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(361, 'profile.tokens', 'base', 'Tokens', 'user_profile, user_transaction', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(362, 'profile.tranx_no', 'base', 'Tranx NO', 'user_profile, user_transaction', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(363, 'profile.no_data', 'base', 'No data available in table', 'user_profile, user_transaction', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(364, 'profile.no_records', 'base', 'No records', 'user_profile, user_transaction', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(365, 'profile.search_placeholder', 'base', 'Type in to Search', 'user_profile, user_transaction', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(366, 'profile.cap_types', 'base', 'TYPES', 'user_profile, user_transaction', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(367, 'profile.any_type', 'base', 'Any Type', 'user_profile, user_transaction', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(368, 'profile.purchase', 'base', 'Purchase', 'user_profile, user_transaction', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(369, 'profile.cap_status', 'base', 'STATUS', 'user_profile, user_transaction', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(370, 'profile.cap_show_all', 'base', 'Show All', 'user_profile, user_transaction', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(371, 'profile.approved', 'base', 'Approved', 'user_profile, user_transaction', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(372, 'profile.pending', 'base', 'Pending', 'user_profile, user_transaction', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(373, 'profile.canceled', 'base', 'Canceled', 'user_profile, user_transaction', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(374, 'kyc.verify_title', 'base', 'KYC Verification', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(375, 'kyc.verify_title_sub', 'base', 'To comply with regulations each participant is required to go through identity verification (KYC/AML) to prevent fraud, money laundering operations, transactions banned under the sanctions regime or those which fund terrorism. Please, complete our fast and secure verification process to participate in token offerings.', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(376, 'kyc.identity_title', 'base', 'Identity Verification - KYC', 'dashboard, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(377, 'kyc.identity_desc', 'base', 'To comply with regulation, participant will have to go through identity verification.', 'dashboard, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(378, 'kyc.form_not_submitted', 'base', 'You have not submitted your necessary documents to verify your identity.', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(379, 'kyc.form_submit', 'base', 'It would great if you please submit the form. If you have any question, please feel free to contact our support team.', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(380, 'kyc.complete_kyc', 'base', 'Click here to complete your KYC', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(381, 'kyc.completed_kyc', 'base', 'You have completed the process of KYC', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(382, 'kyc.waiting_id_verify', 'base', 'We are still waiting for your identity verification. Once our team verified your identity, you will be notified by email. You can also check your KYC compliance status from your profile page.', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(383, 'kyc.back_to_profile', 'base', 'Back to Profile', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(384, 'kyc.under_process', 'base', 'Your application verification under process.', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(385, 'kyc.still_working', 'base', 'We are still working on your identity verification. Once our team verified your identity, you will be notified by email.', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(386, 'kyc.resubmit_form', 'base', 'In our verification process, we found information that is incorrect or missing. Please resubmit the form. In case of any issues with the submission please contact our support team.', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(387, 'kyc.submit_again', 'base', 'Submit Again', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(388, 'kyc.verified_title', 'base', 'Your identity verified successfully.', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(389, 'kyc.verified_desc', 'base', 'One of our team members verified your identity. Now you can participate in our token sale. Thank you.', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(390, 'kyc.info_missing', 'base', 'We found some information to be missing.', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(391, 'kyc.form_rejected', 'base', 'Sorry! Your application was rejected.', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(392, 'kyc.verify_head', 'base', 'Begin your ID-Verification', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(393, 'kyc.verify_text', 'base', 'In order to purchase our tokens, please verify your identity.', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(394, 'kyc.verify_text_token', 'base', 'Verify your identity to participate in token sale.', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(395, 'kyc.not_submitted', 'base', 'You have not submitted your documents to verify your identity (KYC).', 'dashboard, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(396, 'kyc.click_proceed', 'base', 'Click to Proceed', 'dashboard, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(397, 'kyc.document_received', 'base', 'We have received your document.', 'dashboard, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(398, 'kyc.review_information', 'base', 'We will review your information and if all is in order will approve your identity. You will be notified by email once we verified your identity (KYC).', 'dashboard, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(399, 'kyc.kyc_rejected', 'base', 'KYC Application has been rejected!', 'dashboard, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(400, 'kyc.resubmit_application', 'base', 'We were having difficulties verifying your identity. In our verification process, we found information are incorrect or missing. Please re-submit the application again and verify your identity.', 'dashboard, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(401, 'kyc.resubmit', 'base', 'Resubmit', 'dashboard, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(402, 'kyc.kyc_verified', 'base', 'Identity (KYC) has been verified.', 'dashboard, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(403, 'kyc.token_sale', 'base', 'One for our team verified your identity. You are eligible to participate in our token sale.', 'dashboard, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(404, 'kyc.purchase_token', 'base', 'Purchase Token', 'dashboard, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(405, 'kyc.kyc_verification_required', 'base', 'KYC verification required for purchase token', 'dashboard, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(406, 'kyc.form.personal_details', 'base', 'Personal Details', 'kyc, kyc_form, global', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(407, 'kyc.form.personal_details_sub', 'base', 'Your basic personal information is required for identification purposes.', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(408, 'kyc.form.personal_details_note', 'base', 'Please type carefully and fill out the form with your personal details. You are not allowed to edit the details once you have submitted the application.', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(409, 'kyc.form.first_name', 'base', 'First Name', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(410, 'kyc.form.last_name', 'base', 'Last Name', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(411, 'kyc.form.phone_number', 'base', 'Phone Number', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(412, 'kyc.form.gender', 'base', 'Gender', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(413, 'kyc.form.select_gender', 'base', 'Select Gender', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(414, 'kyc.form.male', 'base', 'Male', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(415, 'kyc.form.female', 'base', 'Female', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(416, 'kyc.form.other', 'base', 'Other', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(417, 'kyc.form.telegram_username', 'base', 'Telegram Username', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(418, 'kyc.form.your_address', 'base', 'Your Address', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(419, 'kyc.form.country', 'base', 'Country', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(420, 'kyc.form.state', 'base', 'State', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(421, 'kyc.form.city', 'base', 'City', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(422, 'kyc.form.postal_code', 'base', 'Zip / Postal Code', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(423, 'kyc.form.address_line_1', 'base', 'Address Line 1', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(424, 'kyc.form.address_line_2', 'base', 'Address Line 2', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(425, 'kyc.form.document_upload', 'base', 'Document Upload', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(426, 'kyc.form.scan_documents', 'base', 'To verify your identity, we ask you to upload high-quality scans or photos of your official identification documents issued by the government.', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(427, 'kyc.form.upload_documents', 'base', 'In order to complete, please upload any of the following personal documents.', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(428, 'kyc.form.passport', 'base', 'Passport', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(429, 'kyc.form.national_id_card', 'base', 'National ID Card', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(430, 'kyc.form.driver_license', 'base', 'Driver’s License', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(431, 'kyc.form.check_requirements', 'base', 'To avoid delays with verification process, please double-check to ensure the below requirements are fully met:', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(432, 'kyc.form.visible_documents', 'base', 'Document should be in good condition and clearly visible.', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(433, 'kyc.form.no_glare', 'base', 'There is no light glare or reflections on the card.', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(434, 'kyc.form.not_expire_credentials', 'base', 'Chosen credential must not be expired.', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(435, 'kyc.form.file_limitation', 'base', 'File is at least 1 MB in size and has at least 300 dpi resolution.', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(436, 'kyc.form.drag_and_drop_file', 'base', 'Drag and drop file', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(437, 'kyc.form.select', 'base', 'Select', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(438, 'kyc.form.or', 'base', 'or', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(439, 'kyc.form.upload_doc_copy', 'base', 'Upload Here Your :doctype Copy', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(440, 'kyc.form.nid_back_side', 'base', 'Upload Here Your National ID Back Side', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(441, 'kyc.form.photo_selfie', 'base', 'Upload a selfie as a Photo Proof while holding document in your hand', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(442, 'kyc.form.paying_wallet', 'base', 'Your Paying Wallet', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(443, 'kyc.form.paying_wallet_submit', 'base', 'Submit your wallet address that you are going to send funds', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(444, 'kyc.form.paying_wallet_note', 'base', 'DO NOT USE your exchange wallet address such as Kraken, Bitfinex, Bithumb, Binance etc.', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(445, 'kyc.form.select_wallet', 'base', 'Select Wallet', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(446, 'kyc.form.enter_your_wallet', 'base', 'Enter your wallet address', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(447, 'kyc.form.your_wallet_address', 'base', 'Your personal wallet address', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(448, 'kyc.form.agree_terms', 'base', 'I have read the', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(449, 'kyc.form.agree_info', 'base', 'All the personal information I have entered is correct.', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(450, 'kyc.form.agree_individual', 'base', 'I certify that, I am registering to participate in the token distribution event(s) in the capacity of an individual (and beneficial owner) and not as an agent or representative of a third party corporate entity.', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(451, 'kyc.form.agree_final', 'base', 'I understand that, I can participate in the token distribution event(s) only with the wallet address that was entered in the application form.', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(452, 'kyc.form.proceed', 'base', 'Proceed to Verify', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(453, 'kyc.form.confirm_terms', 'base', 'You should read our terms and policy.', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(454, 'kyc.form.confirm_info', 'base', 'Confirm that all information is correct.', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(455, 'kyc.form.confirm_individual', 'base', 'Certify that you are individual.', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(456, 'kyc.form.confirm_final', 'base', 'Confirm that you understand.', 'kyc', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(457, 'buy_token.sale_start_soon', 'base', 'Our sale will start soon. Please check back at a later date/time or feel free to contact us.', 'buy_token', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(458, 'buy_token.calculate', 'base', 'Choose currency and calculate :SYMBOL token price', 'buy_token', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(459, 'buy_token.choose_currency', 'base', 'You can buy our :SYMBOL token using the below currency choices to become part of our project.', 'buy_token', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(460, 'buy_token.amount_of_contribute', 'base', 'Amount of contribute', 'buy_token', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(461, 'buy_token.contribute_amout', 'base', 'Enter the amount you would like to contribute in order to calculate the amount of tokens you will receive. The calculator below helps to convert the required quantity of tokens into the amount of your selected currency.', 'buy_token', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(462, 'buy_token.minimum_amount', 'base', 'Minimum contribution amount is required.', 'buy_token', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(463, 'buy_token.bonus', 'base', 'Bonus', 'buy_token', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(464, 'buy_token.on_sale', 'base', 'On Sale', 'buy_token', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(465, 'buy_token.sale_bonus', 'base', 'Sale Bonus', 'buy_token', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(466, 'buy_token.amount_bonus', 'base', 'Amount Bonus', 'buy_token', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(467, 'buy_token.exchange_note', 'base', 'Your contribution will be calculated based on exchange rate at the moment when your transaction is confirmed.', 'buy_token', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(468, 'buy_token.payment_button', 'base', 'Make Payment', 'buy_token', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(469, 'buy_token.token_note', 'base', 'Tokens will appear in your account after payment successfully made and approved by our team. Please note that, :SYMBOL token will be distributed after the token sales end-date.', 'buy_token', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(470, 'buy_token.token_sales', 'base', 'Token Sales', 'buy_token', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(471, 'buy_token.token_price', 'base', 'Token Price', 'buy_token', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(472, 'buy_token.exchange_rate', 'base', 'Exchange Rate', 'buy_token', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(473, 'buy_token.end_at', 'base', 'End at', 'buy_token', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(474, 'buy_token.choose_method', 'base', 'You can choose any of following payment method to make your payment. The token balance will appear in your account after successful payment.', 'buy_token', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(475, 'buy_token.select_method', 'base', 'Select payment method:', 'buy_token', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(476, 'buy_token.appear_address', 'base', 'Our payment address will appear or redirect you for payment after your order placed.', 'buy_token', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(477, 'buy_token.charge_fee', 'base', 'Payment gateway may charge you a processing fees.', 'buy_token', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(478, 'payment.order.title', 'base', 'Confirmation Your Payment', 'payment, order', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(479, 'payment.order.cancel_title', 'base', 'Oops! Payment Canceled!', 'payment, cancel', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(480, 'payment.order.cancel_desc', 'base', 'You have canceled your payment. If you continue to have issues, please contact us with order no. :orderid.', 'payment, cancel', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(481, 'payment.order.close', 'base', 'Close', 'payment, cancel', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(482, 'payment.order.placed', 'base', 'Your Order no. :orderid has been placed successfully.', 'payment, order', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(483, 'payment.order.pending', 'base', 'Your Order no. :orderid has been placed & waiting for payment.', 'payment, order', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(484, 'payment.order.onhold', 'base', 'Your Order no. :orderid has been placed & waiting for team approval.', 'payment, order', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(485, 'payment.info.crypto_amount', 'base', 'Please send :amount :currency to the address below. The token balance will appear in your account only after transaction gets :num confirmation and approved by our team.', 'payment, order', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(486, 'payment.info.crypto_receive', 'base', 'To receiving :token :symbol token, please send :amount :currency to the address below. The token balance will appear in your account only after transaction gets :num confirmation and approved by our team.', 'payment, order', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(487, 'payment.info.bank_amount', 'base', 'Please make your payment of :amount :currency through bank to the below bank address. The token balance will appear in your account only after your transaction gets approved by our team.', 'payment, order', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(488, 'payment.info.bank_receive', 'base', 'To receiving :token :symbol token, please make your payment of :amount :currency through bank to the below bank address. The token balance will appear in your account only after your transaction gets approved by our team.', 'payment, order', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(489, 'payment.info.gateway_amount', 'base', 'The token balance will appear in your account only after you transaction gets :num confirmations and approved by :gateway.', 'payment, online', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(490, 'payment.info.gateway_receive', 'base', 'To receiving :token :symbol token, please make your payment of :amount :currency through :gateway. The token balance will appear in your account after we received your payment.', 'payment, order', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(491, 'payment.info.wallet_verify', 'base', 'To speed up verification process please enter your wallet address from where you\'ll transferring your amount to our address.', 'payment, order', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(492, 'payment.info.hash_verify', 'base', 'To speed up verification process, please enter your transaction hash or payment id.', 'payment, order', 'system', 'user', 0, '2020-06-01 01:07:03', '2020-06-01 01:07:03'),
(493, 'payment.wallet_address', 'base', 'Enter Your Wallet Address', 'payment, order', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(494, 'payment.payment_address', 'base', 'Insert your payment address', 'payment, order', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(495, 'payment.cancel_order', 'base', 'Cancel Order', 'payment, order', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(496, 'payment.select_method', 'base', 'Select your payment method.', 'payment, order', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(497, 'payment.note_hint', 'base', 'Do not make payment through exchange (Kraken, Bitfinex). You can use MyEtherWallet, MetaMask, Mist wallets etc.', 'payment, order', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(498, 'payment.note_alert', 'base', 'In case you send a different amount, number of :SYMBOL token will update accordingly.', 'payment, order', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(499, 'payment.note_redirect', 'base', 'Our payment address will appear or redirect you for payment after the order is placed.', 'payment, order', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(500, 'payment.payment_process', 'base', 'Payment Process', 'payment, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(501, 'payment.payment_confirm', 'base', 'Confirm Payment', 'payment, order', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(502, 'payment.skip_address', 'base', 'I\'ll provide wallet address later', 'payment, order', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(503, 'payment.gas_limit', 'base', 'SET GAS LIMIT:', 'payment, offline', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(504, 'payment.gas_price', 'base', 'SET GAS PRICE:', 'payment, offline', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(505, 'payment.send_amount_to', 'base', 'Send Amount:', 'payment, order', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(506, 'payment.amount_with_bonus', 'base', 'Please make payment of :amount to receive :token_amount token including bonus :token_bonus token.', 'payment, manual', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(507, 'payment.amount_no_bonus', 'base', 'Please make payment of :amount to receive :token_amount token.', 'payment, manual', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(508, 'payment.deposit_title', 'base', 'Payment Address for Deposit', 'payment, manual', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(509, 'payment.deposit_address', 'base', 'Payment to the following :Name Wallet Address', 'payment, manual', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(510, 'payment.deposit_address_or_scan', 'base', 'Payment to the following :Name Wallet Address Or scan the QR code', 'payment, manual', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(511, 'payment.scan_code', 'base', 'Scan QR code to payment.', 'payment, manual', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(512, 'payment.agree_terms', 'base', 'I hereby agree to the token purchase agreement and token sale term.', 'payment, manual', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(513, 'payment.no_method', 'base', 'Sorry! There is no payment method available for this currency. Please choose another currency or contact our support team.', 'payment, manual', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(514, 'payment.review_title', 'base', 'We\'re reviewing your payment.', 'payment, manual', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(515, 'payment.review_desc', 'base', 'We\'ll review your transaction and get back to your within 6 hours. You\'ll receive an email with the details of your contribution.', 'payment, manual', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(516, 'payment.already_paid', 'base', 'Click here if you already paid', 'payment, online', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(517, 'payment.bellow_address', 'base', 'Make your payment to the below address', 'payment, online', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(518, 'payment.check_status', 'base', 'Check Status', 'payment, online', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(519, 'payment.gateway_status', 'base', 'Check status on :gateway', 'payment, online', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(520, 'payment.send_amount', 'base', 'Please send :amount :currency to the address below.', 'payment, online', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(521, 'payment.pay_or_cancel', 'base', 'Click the Pay button below to make payment for this transaction, or you can cancel this transaction.', 'payment, online', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(522, 'payment.refunded_token', 'base', 'Refunded Token', 'payment, online', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(523, 'payment.refunded_amount', 'base', 'Refunded Amount', 'payment, online', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(524, 'payment.refund_note', 'base', 'Refund Note', 'payment, online', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(525, 'payment.bank_details', 'base', 'Bank Details for Payment', 'payment, bank', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(526, 'payment.bank_note', 'base', 'The token balance will appear in your account only after your transaction gets approved by our team.', 'payment, bank', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(527, 'payment.bank_iban', 'base', 'IBAN', 'payment, bank', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(528, 'payment.bank_name', 'base', 'Bank Name', 'payment, bank', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(529, 'payment.bank_address', 'base', 'Bank Address', 'payment, bank', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(530, 'payment.bank_routing', 'base', 'Routing Number', 'payment, bank', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(531, 'payment.bank_swift', 'base', 'Swift/BIC', 'payment, bank', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(532, 'payment.bank_account_name', 'base', 'Account Name', 'payment, bank', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(533, 'payment.bank_account_number', 'base', 'Account Number', 'payment, bank', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(534, 'payment.bank_account_address', 'base', 'Account Holder Address', 'payment, bank', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(535, 'payment.bank_make_payment', 'base', 'Make Payment to the Following Bank Account', 'payment, bank', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(536, 'payment.bank_referance', 'base', 'Use this transaction id (#:orderid) as reference. Make your payment within 24 hours, If we will not received your payment within 24 hours, then we will cancel the transaction.', 'payment, bank', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(537, 'payment.pay_via', 'base', 'Pay via', 'payment, bank', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(538, 'tranx.details', 'base', 'Transaction Details', 'transaction, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(539, 'tranx.order_no', 'base', 'The order no. :orderid was placed on :datetime.', 'transaction, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(540, 'tranx.successfully_paid', 'base', 'You have successfully paid this transaction', 'transaction, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(541, 'tranx.via', 'base', 'via', 'transaction, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(542, 'tranx.wallet', 'base', 'wallet', 'transaction, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(543, 'tranx.order_failed', 'base', 'Sorry! Your order has been :status due to payment.', 'transaction, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(544, 'tranx.canceled_transfer_request', 'base', 'The transfer request was canceled at :time.', 'transaction, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(545, 'tranx.under_review', 'base', 'The transaction is currently under review. We will send you an email once our review is complete.', 'transaction, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(546, 'tranx.canceled_admin', 'base', 'The transaction was canceled by Administrator at :time.', 'transaction, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(547, 'tranx.canceled_user', 'base', 'You have canceled this transaction.', 'transaction, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(548, 'tranx.approved_admin', 'base', 'Transaction has been approved at :time.', 'transaction, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(549, 'tranx.token_details', 'base', 'Token Details', 'transaction, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(550, 'tranx.token_of_stage', 'base', 'Token of Stage', 'transaction, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(551, 'tranx.token_amount', 'base', 'Token Amount (T)', 'transaction, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(552, 'tranx.bonus_token', 'base', 'Bonus Token (B)', 'transaction, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(553, 'tranx.offline_payment', 'base', 'Offline Payment', 'transaction, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(554, 'tranx.online_payment', 'base', 'Online Payment', 'transaction, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(555, 'tranx.issue_occured', 'base', 'Sorry, seems there is an issues occurred and we couldn’t process your request. Please contact us with your order no. :orderid, if you continue to having the issues.', 'transaction, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(556, 'wallet.do_not_use', 'base', 'DO NOT USE your exchange wallet address OR if you don\'t have a private key of the your address. You WILL NOT receive your token and WILL LOSE YOUR FUNDS if you do.', 'user_wallet', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(557, 'wallet.erc_address', 'base', 'Address should be ERC20-compliant.', 'user_wallet', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(558, 'wallet.receive_info', 'base', 'In order to receive your :SYMBOL token, please select your wallet address and you have to put the address below input box. You will receive :SYMBOL token to this address after the token sale end.', 'user_wallet', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(559, 'wallet.current', 'base', 'Current Wallet', 'user_wallet', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(560, 'wallet.type', 'base', 'Wallet Type', 'user_wallet', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(561, 'wallet.receive_address', 'base', ':Name Wallet Address for receiving token', 'user_wallet', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(562, 'wallet.add_wallet', 'base', 'Add Wallet', 'user_wallet', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(563, 'wallet.enter_wallet', 'base', 'Enter your :Name wallet address', 'user_wallet', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(564, 'wallet.enter_new_wallet', 'base', 'Enter your new :Name wallet address', 'user_wallet', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(565, 'wallet.request', 'base', 'Request for change', 'user_wallet', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(566, 'wallet.request_update', 'base', 'Request for Update Wallet', 'user_wallet', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(567, 'status.approved', 'base', 'Approved', 'status, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(568, 'status.pending', 'base', 'Pending', 'status, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(569, 'status.progress', 'base', 'Progress', 'status, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(570, 'status.rejected', 'base', 'Rejected', 'status, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(571, 'status.warning', 'base', 'Warning', 'status, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(572, 'status.success', 'base', 'Success', 'status, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(573, 'status.running', 'base', 'Running', 'status, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(574, 'status.upcoming', 'base', 'Upcoming', 'status, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(575, 'status.completed', 'base', 'Completed', 'status, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(576, 'status.expired', 'base', 'Expired', 'status, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(577, 'status.pause', 'base', 'Pause', 'status, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(578, 'status.inactive', 'base', 'Inactive', 'status, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(579, 'status.edit', 'base', 'Edit', 'status, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(580, 'status.add', 'base', 'Add', 'status, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(581, 'status.see', 'base', 'See', 'status, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(582, 'status.more', 'base', 'More', 'status, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(583, 'status.view', 'base', 'View', 'status, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(584, 'status.enable', 'base', 'Enable', 'status, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(585, 'status.enabled', 'base', 'Enabled', 'status, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(586, 'status.disable', 'base', 'Disable', 'status, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(587, 'status.disabled', 'base', 'Disabled', 'status, global', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(588, 'auth.2fa.hello', 'base', 'Hello', 'user_2fa', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(589, 'auth.2fa.title', 'base', '2FA', 'user_2fa', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(590, 'auth.2fa.reset_2fa', 'base', 'Reset 2FA', 'user_2fa', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(591, 'auth.2fa.enable_2fa', 'base', 'Enable 2FA', 'user_2fa', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(592, 'auth.2fa.confirm_2fa', 'base', 'Confirm 2FA', 'user_2fa', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(593, 'auth.2fa.disable_2fa', 'base', 'Disable 2FA', 'user_2fa', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(594, 'auth.2fa.current_status', 'base', 'Current Status:', 'user_2fa', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(595, 'auth.2fa.authentication', 'base', '2FA Authentication', 'user_2fa', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(596, 'auth.2fa.two-factor_verification', 'base', 'Two-Factor Verification', 'user_2fa', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(597, 'auth.2fa.verify_code', 'base', 'Enter the Code to verify', 'user_2fa', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(598, 'auth.2fa.reset_authentication', 'base', 'Reset 2FA Authentication', 'user_2fa', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(599, 'auth.2fa.authentication_code', 'base', 'Enter your authentication code', 'user_2fa', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(600, 'auth.2fa.google_code', 'base', 'Enter Google Authenticator Code', 'user_2fa', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(601, 'auth.2fa.auth', 'base', 'Two-factor authentication is a method for protection of your account. When it is activated you are required to enter not only your password, but also a special code. You can receive this code in mobile app. Even if third party gets access to your password, they still won\'t be able to access your account without the 2FA code.', 'user_2fa', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(602, 'auth.2fa.lost_access', 'base', 'If you lost your phone or uninstall the Google Authenticator app, then you will lost access of your account.', 'user_2fa', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(603, 'auth.2fa.step_2', 'base', 'Step 2:', 'user_2fa', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(604, 'auth.2fa.scan_qr_code', 'base', 'Scan the below QR code by your Google Authenticator app, or you can add account manually.', 'user_2fa', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(605, 'auth.2fa.manually_add_account', 'base', 'Manually add Account:', 'user_2fa', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(606, 'auth.2fa.account_name', 'base', 'Account Name:', 'user_2fa', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(607, 'auth.2fa.key', 'base', 'Key:', 'user_2fa', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04');
INSERT INTO `translates` (`id`, `key`, `name`, `text`, `pages`, `group`, `panel`, `load`, `created_at`, `updated_at`) VALUES
(608, 'auth.2fa.verification_code', 'base', 'Enter the verification code generated by your mobile application (Google Authenticator).', 'user_2fa', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(609, 'auth.2fa.contact_us', 'base', 'If you lost your phone or Uninstall the Google Authenticator app and enable to access your account please contact with us.', 'user_2fa', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(610, 'auth.2fa.step_1', 'base', 'Step 1:', 'user_2fa', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(611, 'auth.2fa.install_this_app_from', 'base', 'Install this app from', 'user_2fa', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(612, 'auth.2fa.google_play', 'base', 'Google Play', 'user_2fa', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(613, 'auth.2fa.store_or', 'base', 'store or', 'user_2fa', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(614, 'auth.2fa.app_store', 'base', 'App Store', 'user_2fa', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(615, 'auth.2fa.reset_auth', 'base', 'Please enter your account password to reset 2FA authentication.', 'user_2fa', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(616, 'auth.2fa.invalid', 'base', 'You have provide a invalid 2FA authentication code!', 'user_2fa', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(617, 'auth.2fa.wrong', 'base', 'Please enter a valid authentication code!', 'user_2fa', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(618, 'auth.2fa.enabled', 'base', 'Successfully enable 2FA security in your account.', 'user_2fa', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(619, 'auth.2fa.disabled', 'base', 'Successfully disable 2FA security in your account.', 'user_2fa', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(620, 'referral.referee', 'base', 'Referee', 'referral', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(621, 'referral.earn_token', 'base', 'Earn Token', 'referral', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(622, 'referral.bought_token', 'base', 'Bought Token', 'referral', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(623, 'referral.register_date', 'base', 'Register Date', 'referral', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(624, 'referral.no_one_join_yet!', 'base', 'No one join yet!', 'referral', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(625, 'referral.not_purchased', 'base', 'Not purchased yet', 'referral', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(626, 'referral.token_purchase', 'base', 'Token purchase by', 'referral', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(627, 'referral.referred_by', 'base', 'You are referred by', 'referral', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(628, 'referral.received_token', 'base', 'You have received bonus token.', 'referral', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04'),
(629, 'referral.refered_by', 'base', 'Your were invited by :userid', 'referral', 'system', 'user', 0, '2020-06-01 01:07:04', '2020-06-01 01:07:04');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'active',
  `registerMethod` varchar(191) DEFAULT 'Email',
  `social_id` varchar(191) DEFAULT NULL,
  `mobile` varchar(191) DEFAULT NULL,
  `dateOfBirth` varchar(191) DEFAULT NULL,
  `nationality` varchar(191) DEFAULT NULL,
  `lastLogin` datetime NOT NULL,
  `walletType` varchar(191) DEFAULT NULL,
  `walletAddress` varchar(191) DEFAULT NULL,
  `role` enum('admin','manager','user') NOT NULL DEFAULT 'user',
  `contributed` double DEFAULT NULL,
  `tokenBalance` double DEFAULT NULL,
  `referral` varchar(191) DEFAULT NULL,
  `referralInfo` text,
  `google2fa` int(11) NOT NULL DEFAULT '0',
  `google2fa_secret` text,
  `type` enum('demo','main') NOT NULL DEFAULT 'main',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_metas`
--

CREATE TABLE `user_metas` (
  `id` int(10) UNSIGNED NOT NULL,
  `userId` int(11) NOT NULL,
  `notify_admin` int(11) NOT NULL DEFAULT '0',
  `newsletter` int(11) NOT NULL DEFAULT '1',
  `unusual` int(11) NOT NULL DEFAULT '1',
  `save_activity` varchar(191) NOT NULL DEFAULT 'TRUE',
  `pwd_chng` varchar(191) NOT NULL DEFAULT 'TRUE',
  `pwd_temp` varchar(191) DEFAULT NULL,
  `email_expire` datetime DEFAULT NULL,
  `email_token` varchar(220) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_templates_slug_unique` (`slug`);

--
-- Indexes for table `global_metas`
--
ALTER TABLE `global_metas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ico_metas`
--
ALTER TABLE `ico_metas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ico_stages`
--
ALTER TABLE `ico_stages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kycs`
--
ALTER TABLE `kycs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `languages_code_unique` (`code`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payment_methods_payment_method_unique` (`payment_method`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translates`
--
ALTER TABLE `translates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_metas`
--
ALTER TABLE `user_metas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `global_metas`
--
ALTER TABLE `global_metas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ico_metas`
--
ALTER TABLE `ico_metas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `ico_stages`
--
ALTER TABLE `ico_stages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `kycs`
--
ALTER TABLE `kycs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translates`
--
ALTER TABLE `translates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=630;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_metas`
--
ALTER TABLE `user_metas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
