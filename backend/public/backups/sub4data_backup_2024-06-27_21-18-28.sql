

CREATE TABLE `api` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `api_name` varchar(191) NOT NULL,
  `api_key` varchar(191) NOT NULL,
  `api_secret` varchar(191) NOT NULL,
  `api_url` varchar(191) NOT NULL,
  `api_contract_code` varchar(191) DEFAULT NULL,
  `api_payment_charges` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO api VALUES("1","monnify","MK_TEST_URAHPHAT77","78DLT2XQ6KFM2HYVRSAUPSR9LEHHWMAE","https://sandbox.monnify.com","0426346591","1.5","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO api VALUES("2","smartrecharge","5yu3wd7jord06w4hvu54cadhju0y6f5bgs1","","https://smartrechargeapi.com/api/v2","","","0000-00-00 00:00:00","0000-00-00 00:00:00");


CREATE TABLE `banks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `bank_name` varchar(191) NOT NULL,
  `account_name` varchar(191) NOT NULL,
  `account_number` varchar(191) NOT NULL,
  `reference` varchar(191) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO banks VALUES("6","9","Wema bank","Ele","5000358118","ELECT1686463044","2023-06-11 05:57:26","2023-06-11 05:57:26");
INSERT INTO banks VALUES("7","10","Wema bank","Rem","5000390667","REMIL1686661296","2023-06-13 13:01:38","2023-06-13 13:01:38");
INSERT INTO banks VALUES("8","23","Wema bank","Tomiwa","5000358118","ELECT1686463044","2024-06-05 07:21:18","2024-06-05 07:21:18");
INSERT INTO banks VALUES("9","24","Wema bank","Tomiwa","5000358118","ELECT1686463044","2024-06-05 07:24:51","2024-06-05 07:24:51");
INSERT INTO banks VALUES("10","25","Wema bank","Tomiwa","5000358118","ELECT1686463044","2024-06-05 08:03:09","2024-06-05 08:03:09");
INSERT INTO banks VALUES("11","26","Wema bank","Tomiwa","5000358118","ELECT1686463044","2024-06-05 08:08:21","2024-06-05 08:08:21");
INSERT INTO banks VALUES("12","27","Wema bank","Tomiwa","5000358118","ELECT1686463044","2024-06-05 08:13:32","2024-06-05 08:13:32");
INSERT INTO banks VALUES("13","28","Wema bank","Tomiwa","5000358118","ELECT1686463044","2024-06-25 02:32:29","2024-06-25 02:32:29");


CREATE TABLE `beneficiaries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `number` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `beneficiaries_number_unique` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_keyword` mediumtext DEFAULT NULL,
  `meta_description` mediumtext DEFAULT NULL,
  `slug` varchar(191) NOT NULL,
  `api_slug` varchar(50) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `image` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO categories VALUES("5","2","Airtime Purchase","null","null","airtime","airtime","Airtime","null","uploads/categories/1686016177.svg","1","2023-06-05 18:01:15","2023-06-06 01:49:37");
INSERT INTO categories VALUES("6","2","Data Purchase","null","null","data","datashare","Data","null","uploads/categories/1686016240.jpg","1","2023-06-06 01:50:40","2023-06-06 02:43:10");
INSERT INTO categories VALUES("7","2","Bill Payment","","","bill","tv","Bill Payment","","uploads/categories/1686049956.jpg","1","2023-06-06 11:12:36","2023-06-06 11:12:36");
INSERT INTO categories VALUES("8","2","Electricity Bill","","","electricity","electric","Electricity Bill","","uploads/categories/1686049982.jpg","1","2023-06-06 11:13:02","2023-06-06 11:13:02");


CREATE TABLE `discounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_by_id` int(11) NOT NULL,
  `created_for_id` varchar(191) NOT NULL DEFAULT 'all',
  `used_by_id` int(11) NOT NULL,
  `code` varchar(191) NOT NULL,
  `percentage` double(11,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `used` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `discounts_code_unique` (`code`),
  CONSTRAINT `discounts_ibfk_1` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO discounts VALUES("1","2","all","0","SUB74062","100","1","0","2024-06-24 20:02:08","2024-06-25 18:59:43");
INSERT INTO discounts VALUES("3","2","all","0","SUB39453","100","0","0","2024-06-24 20:06:10","2024-06-24 23:49:05");
INSERT INTO discounts VALUES("4","2","all","0","SUB93359","26.5","0","0","2024-06-24 20:10:41","2024-06-24 23:53:02");
INSERT INTO discounts VALUES("5","2","all","0","SUB94698","26.5","0","0","2024-06-24 20:21:53","2024-06-25 00:22:53");
INSERT INTO discounts VALUES("6","2","all","0","SUB93881","26.5","1","0","2024-06-24 20:23:44","2024-06-24 20:23:44");
INSERT INTO discounts VALUES("7","2","all","0","SUB26467","26.5","1","0","2024-06-24 20:25:03","2024-06-24 20:25:03");
INSERT INTO discounts VALUES("8","2","all","0","SUB37450","26.5","1","0","2024-06-24 20:27:58","2024-06-24 20:27:58");
INSERT INTO discounts VALUES("9","2","all","0","SUB49842","26.5","1","0","2024-06-24 20:29:10","2024-06-24 20:29:10");
INSERT INTO discounts VALUES("10","2","1","0","SUB64937","26.5","1","0","2024-06-24 20:30:57","2024-06-24 20:30:57");


CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



CREATE TABLE `ip_whitelists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO ip_whitelists VALUES("3","1.1.1.2","1","2024-03-17 21:57:35","2024-03-17 22:54:07","0");
INSERT INTO ip_whitelists VALUES("4","127.0.0.1","1","2024-06-05 08:44:14","2024-06-05 08:44:14","1");
INSERT INTO ip_whitelists VALUES("6","192.168.56.1","1","2024-06-25 01:08:20","2024-06-25 01:08:20","1");


CREATE TABLE `levels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `level` int(11) NOT NULL,
  `percentage` float NOT NULL DEFAULT 99,
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `level` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO levels VALUES("1","Basic","1","0","1","0000-00-00 00:00:00","2024-02-25 14:38:46");
INSERT INTO levels VALUES("2","Agent","2","2","1","0000-00-00 00:00:00","2024-06-06 01:36:38");


CREATE TABLE `login_attempts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `successful` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO login_attempts VALUES("1","2","127.0.0.1","0","2024-06-06 07:21:54","2024-06-06 07:21:54");
INSERT INTO login_attempts VALUES("2","2","127.0.0.1","0","2024-06-06 07:22:12","2024-06-06 07:22:12");
INSERT INTO login_attempts VALUES("3","2","127.0.0.1","0","2024-06-06 07:42:42","2024-06-06 07:42:42");
INSERT INTO login_attempts VALUES("4","2","127.0.0.1","0","2024-06-06 07:42:50","2024-06-06 07:42:50");
INSERT INTO login_attempts VALUES("5","2","127.0.0.1","0","2024-06-06 07:42:54","2024-06-06 07:42:54");
INSERT INTO login_attempts VALUES("6","2","127.0.0.1","0","2024-06-06 07:42:57","2024-06-06 07:42:57");
INSERT INTO login_attempts VALUES("7","2","127.0.0.1","0","2024-06-06 07:43:00","2024-06-06 07:43:00");
INSERT INTO login_attempts VALUES("8","1","127.0.0.1","1","2024-06-06 07:44:21","2024-06-06 07:44:21");
INSERT INTO login_attempts VALUES("9","1","127.0.0.1","1","2024-06-06 12:48:11","2024-06-06 12:48:11");
INSERT INTO login_attempts VALUES("10","1","127.0.0.1","1","2024-06-06 12:48:56","2024-06-06 12:48:56");
INSERT INTO login_attempts VALUES("11","1","127.0.0.1","1","2024-06-06 12:49:50","2024-06-06 12:49:50");
INSERT INTO login_attempts VALUES("12","1","127.0.0.1","1","2024-06-06 12:50:38","2024-06-06 12:50:38");
INSERT INTO login_attempts VALUES("13","1","127.0.0.1","1","2024-06-06 12:51:55","2024-06-06 12:51:55");
INSERT INTO login_attempts VALUES("14","1","127.0.0.1","1","2024-06-06 12:54:01","2024-06-06 12:54:01");
INSERT INTO login_attempts VALUES("15","1","127.0.0.1","1","2024-06-06 12:54:42","2024-06-06 12:54:42");
INSERT INTO login_attempts VALUES("16","1","127.0.0.1","1","2024-06-06 12:56:06","2024-06-06 12:56:06");
INSERT INTO login_attempts VALUES("17","1","127.0.0.1","1","2024-06-06 12:58:41","2024-06-06 12:58:41");
INSERT INTO login_attempts VALUES("18","1","127.0.0.1","1","2024-06-06 12:59:55","2024-06-06 12:59:55");
INSERT INTO login_attempts VALUES("19","1","127.0.0.1","1","2024-06-06 13:02:13","2024-06-06 13:02:13");
INSERT INTO login_attempts VALUES("20","1","127.0.0.1","1","2024-06-06 13:38:06","2024-06-06 13:38:06");
INSERT INTO login_attempts VALUES("21","1","127.0.0.1","1","2024-06-06 13:40:11","2024-06-06 13:40:11");
INSERT INTO login_attempts VALUES("22","1","127.0.0.1","1","2024-06-06 13:40:23","2024-06-06 13:40:23");
INSERT INTO login_attempts VALUES("23","1","127.0.0.1","1","2024-06-06 13:41:11","2024-06-06 13:41:11");
INSERT INTO login_attempts VALUES("24","1","127.0.0.1","1","2024-06-06 13:41:24","2024-06-06 13:41:24");
INSERT INTO login_attempts VALUES("25","1","127.0.0.1","1","2024-06-06 13:42:35","2024-06-06 13:42:35");
INSERT INTO login_attempts VALUES("26","1","127.0.0.1","1","2024-06-11 23:54:12","2024-06-11 23:54:12");
INSERT INTO login_attempts VALUES("27","2","127.0.0.1","1","2024-06-24 13:02:38","2024-06-24 13:02:38");
INSERT INTO login_attempts VALUES("28","2","127.0.0.1","1","2024-06-25 00:54:47","2024-06-25 00:54:47");
INSERT INTO login_attempts VALUES("29","2","127.0.0.1","1","2024-06-25 00:56:48","2024-06-25 00:56:48");
INSERT INTO login_attempts VALUES("30","1","192.168.56.1","1","2024-06-25 01:14:12","2024-06-25 01:14:12");
INSERT INTO login_attempts VALUES("31","1","192.168.56.1","0","2024-06-25 02:00:39","2024-06-25 02:00:39");
INSERT INTO login_attempts VALUES("32","1","192.168.56.1","1","2024-06-25 02:00:52","2024-06-25 02:00:52");
INSERT INTO login_attempts VALUES("33","2","192.168.56.1","1","2024-06-25 02:05:52","2024-06-25 02:05:52");
INSERT INTO login_attempts VALUES("34","28","192.168.56.1","1","2024-06-25 07:55:01","2024-06-25 07:55:01");
INSERT INTO login_attempts VALUES("35","28","192.168.56.1","1","2024-06-25 09:09:35","2024-06-25 09:09:35");
INSERT INTO login_attempts VALUES("36","1","192.168.56.1","1","2024-06-25 09:58:53","2024-06-25 09:58:53");
INSERT INTO login_attempts VALUES("37","28","127.0.0.1","0","2024-06-25 10:03:30","2024-06-25 10:03:30");
INSERT INTO login_attempts VALUES("38","1","127.0.0.1","1","2024-06-25 10:03:43","2024-06-25 10:03:43");
INSERT INTO login_attempts VALUES("39","28","127.0.0.1","1","2024-06-25 10:04:25","2024-06-25 10:04:25");
INSERT INTO login_attempts VALUES("40","28","127.0.0.1","1","2024-06-25 10:04:31","2024-06-25 10:04:31");
INSERT INTO login_attempts VALUES("41","28","127.0.0.1","1","2024-06-25 10:05:09","2024-06-25 10:05:09");
INSERT INTO login_attempts VALUES("42","1","127.0.0.1","1","2024-06-25 10:06:34","2024-06-25 10:06:34");
INSERT INTO login_attempts VALUES("43","1","127.0.0.1","0","2024-06-25 10:06:54","2024-06-25 10:06:54");
INSERT INTO login_attempts VALUES("44","1","127.0.0.1","0","2024-06-25 10:07:07","2024-06-25 10:07:07");
INSERT INTO login_attempts VALUES("45","28","127.0.0.1","1","2024-06-25 10:07:17","2024-06-25 10:07:17");
INSERT INTO login_attempts VALUES("46","28","127.0.0.1","1","2024-06-25 11:15:52","2024-06-25 11:15:52");
INSERT INTO login_attempts VALUES("47","28","127.0.0.1","1","2024-06-25 11:17:05","2024-06-25 11:17:05");
INSERT INTO login_attempts VALUES("48","28","127.0.0.1","1","2024-06-25 11:20:24","2024-06-25 11:20:24");
INSERT INTO login_attempts VALUES("49","28","127.0.0.1","1","2024-06-25 11:21:16","2024-06-25 11:21:16");
INSERT INTO login_attempts VALUES("50","28","127.0.0.1","1","2024-06-25 11:21:54","2024-06-25 11:21:54");
INSERT INTO login_attempts VALUES("51","28","127.0.0.1","1","2024-06-25 11:22:51","2024-06-25 11:22:51");
INSERT INTO login_attempts VALUES("52","28","127.0.0.1","1","2024-06-25 11:23:48","2024-06-25 11:23:48");
INSERT INTO login_attempts VALUES("53","28","127.0.0.1","1","2024-06-25 11:24:54","2024-06-25 11:24:54");
INSERT INTO login_attempts VALUES("54","28","127.0.0.1","1","2024-06-25 11:25:14","2024-06-25 11:25:14");
INSERT INTO login_attempts VALUES("55","28","127.0.0.1","1","2024-06-25 11:26:05","2024-06-25 11:26:05");
INSERT INTO login_attempts VALUES("56","28","127.0.0.1","1","2024-06-25 11:29:31","2024-06-25 11:29:31");
INSERT INTO login_attempts VALUES("57","28","127.0.0.1","1","2024-06-25 11:29:52","2024-06-25 11:29:52");
INSERT INTO login_attempts VALUES("58","28","127.0.0.1","1","2024-06-25 11:30:56","2024-06-25 11:30:56");
INSERT INTO login_attempts VALUES("59","28","127.0.0.1","1","2024-06-25 11:31:54","2024-06-25 11:31:54");
INSERT INTO login_attempts VALUES("60","1","127.0.0.1","1","2024-06-25 11:32:47","2024-06-25 11:32:47");
INSERT INTO login_attempts VALUES("61","28","192.168.56.1","1","2024-06-25 12:21:07","2024-06-25 12:21:07");
INSERT INTO login_attempts VALUES("62","1","127.0.0.1","0","2024-06-25 13:07:56","2024-06-25 13:07:56");
INSERT INTO login_attempts VALUES("63","1","127.0.0.1","1","2024-06-25 13:08:05","2024-06-25 13:08:05");
INSERT INTO login_attempts VALUES("64","1","127.0.0.1","1","2024-06-25 13:11:25","2024-06-25 13:11:25");
INSERT INTO login_attempts VALUES("65","1","127.0.0.1","0","2024-06-25 13:26:46","2024-06-25 13:26:46");
INSERT INTO login_attempts VALUES("66","1","127.0.0.1","1","2024-06-25 13:27:00","2024-06-25 13:27:00");
INSERT INTO login_attempts VALUES("67","1","127.0.0.1","1","2024-06-25 13:27:59","2024-06-25 13:27:59");
INSERT INTO login_attempts VALUES("68","1","127.0.0.1","1","2024-06-25 13:33:16","2024-06-25 13:33:16");
INSERT INTO login_attempts VALUES("69","1","127.0.0.1","1","2024-06-25 13:56:27","2024-06-25 13:56:27");
INSERT INTO login_attempts VALUES("70","1","127.0.0.1","1","2024-06-25 13:57:10","2024-06-25 13:57:10");
INSERT INTO login_attempts VALUES("71","1","127.0.0.1","1","2024-06-25 14:44:25","2024-06-25 14:44:25");
INSERT INTO login_attempts VALUES("72","1","127.0.0.1","1","2024-06-25 14:44:54","2024-06-25 14:44:54");
INSERT INTO login_attempts VALUES("73","1","127.0.0.1","1","2024-06-25 14:54:52","2024-06-25 14:54:52");
INSERT INTO login_attempts VALUES("74","1","127.0.0.1","1","2024-06-25 15:47:08","2024-06-25 15:47:08");
INSERT INTO login_attempts VALUES("75","1","127.0.0.1","1","2024-06-25 15:50:37","2024-06-25 15:50:37");
INSERT INTO login_attempts VALUES("76","1","127.0.0.1","1","2024-06-25 15:54:45","2024-06-25 15:54:45");
INSERT INTO login_attempts VALUES("77","2","192.168.56.1","1","2024-06-25 17:14:18","2024-06-25 17:14:18");
INSERT INTO login_attempts VALUES("78","1","127.0.0.1","1","2024-06-27 10:44:34","2024-06-27 10:44:34");
INSERT INTO login_attempts VALUES("79","1","127.0.0.1","1","2024-06-27 10:48:15","2024-06-27 10:48:15");
INSERT INTO login_attempts VALUES("80","1","127.0.0.1","1","2024-06-27 12:51:51","2024-06-27 12:51:51");
INSERT INTO login_attempts VALUES("81","1","127.0.0.1","1","2024-06-27 19:02:46","2024-06-27 19:02:46");
INSERT INTO login_attempts VALUES("82","1","127.0.0.1","1","2024-06-27 19:05:51","2024-06-27 19:05:51");
INSERT INTO login_attempts VALUES("83","1","127.0.0.1","1","2024-06-27 19:17:28","2024-06-27 19:17:28");
INSERT INTO login_attempts VALUES("84","1","127.0.0.1","1","2024-06-27 20:39:45","2024-06-27 20:39:45");
INSERT INTO login_attempts VALUES("85","1","127.0.0.1","1","2024-06-27 20:40:32","2024-06-27 20:40:32");
INSERT INTO login_attempts VALUES("86","2","127.0.0.1","1","2024-06-27 20:44:54","2024-06-27 20:44:54");


CREATE TABLE `merchant_api` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `private_key` longtext NOT NULL,
  `public_key` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO merchant_api VALUES("1","1","-----BEGIN PRIVATE KEY-----
MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAKm5ecmlGoVRI+FO
BiUt5Z8uxHbXVHcgGPV77vP1CdUiCsponuAxMye7/j8myaLBYevJSbkPG1YufV87
NlbCzS9UNUkgx0zMY/Sc1Cc7OuwjQry1w3UVULGU6S8YWTGboswYVpzmbVoqAZLa
U0MavaUJaHPlbo1i5fpJscrkKlqRAgMBAAECgYB0cL0vLEhvomU9U6w/oadheFJt
PfnC6JB3Cpm7YSdnw70ndHNbWCXCYuVhKhk3wfiOLUCY59ZXX/m/df4ns+nUKpAB
XZxrAuOFsA+rDj2fBJzuQROfUQyYuHVDE2ekFXL53XfyNVLulE3ef5fLEZFo22hz
mp6G3qFaY5fy97rL4QJBANZGIswP83RJfEl2OjivwGlwm8o4uoacQIsPrP4ImTK5
oV4ADUYthX4Zv4PQjcvGGcCQjZDyGTFaNcloqbWRFJUCQQDKxnxafagr8Kb4hZ2s
qt27dfz+KTdcBSJJ5HctsSy8XOx1hnJmEI0D1iLnm2pE6L/bASaGq24GwDk3bVxx
oFMNAkBSn7LVSyVOZvO1BBDJQQQJ5HE+Vgee1muQ89d6EWi5hZjyvURhFjaOfHE7
69Rxig7uEQ91n9UVEbsB0gj2yV3NAkA9uS9vKCLBxU4+BgYZ4iT+hArPnuIwC4wF
bBru+KiCadK8b4FxGgairVMQpxkxApwr4OzGP3aNbYO9IHfsSn4dAkEAjKX8t6+9
b9KWSCRzXw1MhBDs2knjnfZcCRqJLnKHmuOv3RaxH0qXGzkkcURijenCCAw8/GrO
tr3HZbTaYMSQUQ==
-----END PRIVATE KEY-----","-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCpuXnJpRqFUSPhTgYlLeWfLsR2
11R3IBj1e+7z9QnVIgrKaJ7gMTMnu/4/JsmiwWHryUm5DxtWLn1fOzZWws0vVDVJ
IMdMzGP0nNQnOzrsI0K8tcN1FVCxlOkvGFkxm6LMGFac5m1aKgGS2lNDGr2lCWhz
5W6NYuX6SbHK5CpakQIDAQAB
-----END PUBLIC KEY-----","2024-06-05 23:17:53","2024-06-05 23:17:53");
INSERT INTO merchant_api VALUES("2","1","-----BEGIN PRIVATE KEY-----
MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAK1mx3aQcQCZcxvo
PSbr6ZTgx9KGbqX38SyU8TtWio7q9Fs7AEjLx0fGAU8Pk0AwMrSTG0QkuVeatWDJ
jKI4KwS9suucsx9NAMSgWCmnUnhBPhibPUJT2VbTfEvVNWVAHvHbYXIsPHySkoQG
Q16jaVta6rxTJdWzgS34biPmqn6jAgMBAAECgYARg07j56SyFc1tZSA//RWjRqyH
07H7KzZ9dTGD97KYypwRVr0pnQMseZAKRx1tHzEP0cewMzFQ6rwk4VZFz/xwHJG4
jjwUmnssk5e5EJ1jawZixZw0IxoiruCu+SIaoMsxLHUeWxuGlRZ3a9L1WPhW3pZl
2Lg3hthb/UKuS9XT8QJBANhkOtI5s4A1hwJP8WLFCHS3SNBRCqR1LBBXROSe+Ebw
Ap4S2YHQd5CTwOmUZGqPo27BWNspmQonwraAzX2V64sCQQDNJBpXRV5la41+Tka4
QVHstovgd2yVMlwm1qyZNt18xJNHvQZrxUIhtUHOHeUlaIS3tLkr3g9KooYnBV9w
2XxJAkAKGoP0lOUgs18eaIUoy3JdoMExmNcaXq40BR8eXZ3SEhrNLqwhN46dnYiA
X4FgyFwlK7nuYb7Xjou04ca2em2JAkA7dRJZZxa0CJdLG37t2qjXFhW2qoaDO8Rv
0VrXUYqipgsWCNh6lgLT6Eg5aHrI++EzqaLd7w+5jx+Y4brG55JZAkEAy4Ww2JwM
zJ5Q11HxIwfdQ/xsAGMiAM4tb2f/LNS4g1aM1kW2BI9t9/NPBxVLvA2DNYue8ZBt
yTSFXKoUtrdd6A==
-----END PRIVATE KEY-----","-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCtZsd2kHEAmXMb6D0m6+mU4MfS
hm6l9/EslPE7VoqO6vRbOwBIy8dHxgFPD5NAMDK0kxtEJLlXmrVgyYyiOCsEvbLr
nLMfTQDEoFgpp1J4QT4Ymz1CU9lW03xL1TVlQB7x22FyLDx8kpKEBkNeo2lbWuq8
UyXVs4Et+G4j5qp+owIDAQAB
-----END PUBLIC KEY-----","2024-06-05 23:18:58","2024-06-05 23:18:58");
INSERT INTO merchant_api VALUES("3","1","-----BEGIN PRIVATE KEY-----
MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBANUQUJNS3Ptc/kmX
lBSRzgERmcR8+0YQ735djvGTW5wzRpVKTaupK2TIo/Sc/NgPKCjB6iV6SpYUvhXJ
ou2O2kg6Ce7yID5Uv8Vs8CeI6jyrwJ2640seP1NDs77bi6Vgc++EzWcECzDrqEuk
wfx24wJXccehW+G+K+XdWrXWjarPAgMBAAECgYAbS7fG5/q/iS5apzylVfiaUnLs
pUZbt5e3DK1fbY1y+W61eYtxzn5srveyQtpxo591eUJSAtTDXWzsxaRF4uM72a85
1icV2dbu62IUPb3VEgNCpEZdoKrBx2RbXaDOXTryvOguWaefm8XFPs36JEsgzZSS
LbkxOGRofSaR3kNoYQJBAPNvvAEoi7wRdDBPiUe4UuiYr3ai5EPBbnRQcVkqWyOS
7rFiax3k6xxIvPqbTH1cFiTDdZM5Cngn6h0zdxHyd8UCQQDgD0xEe+e+dyq/do1t
5GGI2QA1ldb3gdgPeajrwC1kehFLlZJYXlZLH54i6wTKp5ND9TAzmQ4bxEq8KEA0
xe2DAkEAh9a/l/3iC23J4fNf7U9jpDsfHhpDObPESM9ikJjcBnvFCeKbVzEYKM5F
9amXAxTRnm4bO63Gs8nCD81aEf+06QJBAKR+Vq3IkaCheD7MWJSfIIQJXD/627Em
IGtsE/nQQwMLIvtsud4qlAvfEIfuJrxpPpKbxWF8MoFsILn2ivyzeuUCQQCEgGM4
h2VqR7Fq9R2hsJrzebYhiMMtC1xN31vzgHHjDoU0Mem71H6QyTDnAuTX9ib9Rion
3nhOKhkrCAdbZb7D
-----END PRIVATE KEY-----","-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDVEFCTUtz7XP5Jl5QUkc4BEZnE
fPtGEO9+XY7xk1ucM0aVSk2rqStkyKP0nPzYDygoweolekqWFL4VyaLtjtpIOgnu
8iA+VL/FbPAniOo8q8CduuNLHj9TQ7O+24ulYHPvhM1nBAsw66hLpMH8duMCV3HH
oVvhvivl3Vq11o2qzwIDAQAB
-----END PUBLIC KEY-----","2024-06-05 23:23:03","2024-06-05 23:23:03");
INSERT INTO merchant_api VALUES("4","1","-----BEGIN PRIVATE KEY-----
MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAKxLj/Tl2+lTXyJ3
tnHimKWfUx9dcdiiQVQMdKjW1ERAaxWsLTmFiZ2GhiHpG0qmuwh+gchfXjiUKTYp
fmFzmqsZ8M1ox6SO2X7ytorDOZ/QY8535yedyYoUkv9qHPB0poBm/9ouEu5d00c0
sp0CoQC/GvNd+s1s9cYdV9ofj6kVAgMBAAECgYAMiZ8bIhLjorZ8ipuTI/sZqkNh
N+qN6hi45gMjOibOJKXmONY9plMCTIS8OPtMbl+T2ajWDOKNWXK6R0C0FLZ/eFwA
jTpSAftyl7I1Q3MZ/gt6mPzAQzNQ7wqTnHUL9pY+InDSQg2PGJhhiRDI+4FaFovR
Naepnz8BtnsZFYP97QJBANbGIAIZcPol7qSScPToXzza+jtelC0GS8yTXLSa3qyZ
q/NPe8m/goBaTdW/0UnxMXTpO4rbtRF1OdJqzUpJxhsCQQDNXg3MTbnRfxZj5GKB
zcQjXyOM7W1iSqu3MjiHM1obrCrJT5mN1JFFlg/JAMAA7A9/ILbwwnt0pPH9edKO
rgCPAkEAuWDDSeyZtmA9TnFT7CAR7B36NHpbHU286TQcpYqzPnlZkKZ/a1DQnGbV
nfR1+gOkM4wIp78h15K+ON+UmFV7FwJAKm0KxrEr+SabFong+9XpdjE6Y+vM1Ch+
7vq2COBH9j2MHUiPfWhzln+YxTqdb9NUpDu672QOIxvMTkQzhnxV6wJAHyRKw5M9
1Ir8DDY1LI81nF5KNCQD6j8blKa6HV+CjboI71i2PVWXmnOP1i/Vxye8PK4NC2RR
x92utqDjQpXYQg==
-----END PRIVATE KEY-----","-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCsS4/05dvpU18id7Zx4piln1Mf
XXHYokFUDHSo1tREQGsVrC05hYmdhoYh6RtKprsIfoHIX144lCk2KX5hc5qrGfDN
aMekjtl+8raKwzmf0GPOd+cnncmKFJL/ahzwdKaAZv/aLhLuXdNHNLKdAqEAvxrz
XfrNbPXGHVfaH4+pFQIDAQAB
-----END PUBLIC KEY-----","2024-06-05 23:32:21","2024-06-05 23:32:21");
INSERT INTO merchant_api VALUES("5","1","-----BEGIN PRIVATE KEY-----
MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAMfipfeuBhguitww
UnxgKwk5KwXshXm+tfH10hCjPbVRiUN2iHEU1moKXRRIobAoGuON6/SfXLIrjjXP
Ezp9TwwbCmhpAEapvPGNEnkJqdKYDHItc8eddyr9KqkubXdb3b+XwuRqCG/Pq+tz
0ddN2n8aKzDX2UtSAMzqDQ/DJhv1AgMBAAECgYAQ/1gHsNe51LNgOAe7pd3jAeaD
sXJEQRBty+6aFZeYxJ88imbd3tzA1bLGl8qQFUj8EsR+39JdIFEOiFZlQeSnx2ZC
JnP4UXjIBh7eLxQN2p1obrTDxF9p+o1QUTa3VjjxjVpiQRnbGDlYFLpVZ7+fpQgH
aWKT5EL95/CNfZkd3QJBAOZudjyetXjp4y5+bf2zd/ZIyngKOys4Et2DWo5ZghyM
CuCBXr1Y2Rplc0vQEriQTyuspSs7q5V0XtJlLJABBrsCQQDeEIF1066dgP35kg3O
KvQeVH0HccuaBL1bLEBQp0ts92gU1H0btSNQVZF2rQKje4zUXzJysPNBTuoTgCIf
9jUPAkEAjNpgs9VfoDV3hOgLW9TkM0tzV8UJPfXcskKki/byrXh8/ZaWzq8MpjH1
NBZQGzk667twiujCjWzAuWLWxn+aGQJAOl1qOVbGuTzzA8pgeISPnv0j03YURkni
nvj1en1N9LjeEUN8EnE8c9vZnLCCVgeeDx9qOfzKIqskGLX/whjK/wJAb8xIElCu
Nwf4QhaAtwLLbtcUmLhqNOfuS3BcIhGKFTwhbMVUkS93QE6fhmxPAHYlhKdb6Axx
HVxB0Uhxa3a1Kw==
-----END PRIVATE KEY-----","-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDH4qX3rgYYLorcMFJ8YCsJOSsF
7IV5vrXx9dIQoz21UYlDdohxFNZqCl0USKGwKBrjjev0n1yyK441zxM6fU8MGwpo
aQBGqbzxjRJ5CanSmAxyLXPHnXcq/SqpLm13W92/l8Lkaghvz6vrc9HXTdp/Gisw
19lLUgDM6g0PwyYb9QIDAQAB
-----END PUBLIC KEY-----","2024-06-05 23:33:15","2024-06-05 23:33:15");
INSERT INTO merchant_api VALUES("6","1","-----BEGIN PRIVATE KEY-----
MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAK9GRUBDJOJMaKcs
JUJGQ1bSxnTQBYkPMC1ATFKi/Ay5rnWwlvY0RLcrdP8LjzUkfqK40Pd1ms+aFC80
zjZr7iP2aotvPQ+II3rY8Wx6KEl0E+7sK0Tqa9i5vmK6GIVGF7Ih58D2T0yFZAHl
/fApXdB18F7cgn97sCvJ2wQSoYs3AgMBAAECgYEAgxGZV6TeQBvDZr+sXRMN6C9W
GKQ2f3fMHwqmCGW49gskWv3i5dnQSOlGZDLQtHzF9gkeuu5HBlfCIErsqeWr/hvB
dlB7pUGVGXhvav1T2MaGLYLRsqel5Cj/SbuWEpB2I33h/9wmtH7RJ7gPd1CuxytP
FOFs1+v0vGRO2OzQoQECQQDWmAoGKsfJThKL2bG5o6LPnaePAY5kD/h1AdxMFiDV
vRdh/wBiqMBRTTWpKlyVsCPV14jGdx3jo4T45yeoFF7JAkEA0RgIINmALNodF/lf
awYU6VX/GvkgHm0y2XzTA52F62tMqqbSI0mFkmtYRDo2uIErccMVhPGXHyEVrV+G
L6mZ/wJBAKtryJYklnO4ahhNTit9DBHNXoxeMeC84TyWv+QHyTL0Wjlt+mDVbMuF
YdhAfrUUf4vTIO9pN/cgKJisDoG1xAECQEb+jeP5dZfFBxPYzBkem4MOe+vAorMy
CI3n4A3eMlZYvFNFCRyKHhw07mdcDLBgy0t5HZliHhmntiCDyp/sSikCQG9pbPFH
LVsVusVuehlMiMBJBqy22p17lYvwUU32cPWGZYxIozUYUeyKAxyrz84AjIaTax1T
bylH4zTqYsPqf4c=
-----END PRIVATE KEY-----","-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCvRkVAQyTiTGinLCVCRkNW0sZ0
0AWJDzAtQExSovwMua51sJb2NES3K3T/C481JH6iuND3dZrPmhQvNM42a+4j9mqL
bz0PiCN62PFseihJdBPu7CtE6mvYub5iuhiFRheyIefA9k9MhWQB5f3wKV3QdfBe
3IJ/e7ArydsEEqGLNwIDAQAB
-----END PUBLIC KEY-----","2024-06-05 23:34:49","2024-06-05 23:34:49");
INSERT INTO merchant_api VALUES("7","1","-----BEGIN PRIVATE KEY-----
MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBAOOhuKwWqUceiG+U
YqIJSjEsE56jES0z7L/cLpc2BMZnczB/QNdgIE31oMixT141OPY6Euua2l1E1TBI
smuaDN1ZErxJyJ+bk9qU+O5rv7HAT3YZhE9C6hu/P9u7IoVWgN4Kf5MG6ng0Jar2
nTRQlfxS1pnV4CgZsz84/XKkDHARAgMBAAECgYEAwktwuJqjJIxAQpUyV0J8rFoF
6Rsg9ydiBiWnMvQtwTfdz2Be9Tcce86TzZnit/PPygOp0KadiozNN2hluoiEPvKg
68IioUSjEKDhR1bLRT6HucwyHOoxPEDzJvVY04YEu4rUhbnOM0lt63EVpBTJEneT
vmCQQIqO77Vn0H+PAdECQQD36mkfZN0TxdAQaU4LCe+E/eptyEflJCYOAsakfx0z
zIjXWJEyLV/L4hNtxLk5owzD6LdZmzM5w67SFKeSqW8tAkEA6w37M7uiY5zwhPuE
3THe8e5qFbvZi7zziTdMV33cyyuRlmxzoZV2ksFNUZ8lkXj7e0JDzABXhliCWKRs
C89y9QJBAJw4QQ/ATjMUdlyxDrWUCDNkkWGmT++LTNONWkDzvKIUY7JXI/9baj8e
caG80f8IyJV2wnqbercOoM3OqB2Z2O0CQQDM7zSr5xTvCp69Itm1TMzXXAmMB2rl
pYkjgl4CDg9Z6BOX9dhe8gQecYBrAHltuvBvh9e6XjXxQOvsQvac2XKdAkA/MiXu
B9inv91KZnXj+CqRuQpzLyTOwm4QykWqLt4SeyWKIPoekEQbxjLqSBgka23Au7nB
iqsBZDpwG0lqRXjo
-----END PRIVATE KEY-----","-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDjobisFqlHHohvlGKiCUoxLBOe
oxEtM+y/3C6XNgTGZ3Mwf0DXYCBN9aDIsU9eNTj2OhLrmtpdRNUwSLJrmgzdWRK8
Scifm5PalPjua7+xwE92GYRPQuobvz/buyKFVoDeCn+TBup4NCWq9p00UJX8UtaZ
1eAoGbM/OP1ypAxwEQIDAQAB
-----END PUBLIC KEY-----","2024-06-05 23:39:51","2024-06-05 23:39:51");
INSERT INTO merchant_api VALUES("8","1","-----BEGIN PRIVATE KEY-----
MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAMR36r94AtZJ1oDH
oYNL5k9hBPKfUTGmt0y+1Egj7VuZ3sGEKOsDys0KFUsVzvl4L1VNVMTbFA3L1y6l
vapRK1QoPi7UKjUmRMNR+Rl5mvBjEPf7/maftBO8VkVKhWHr9NAHOxjQHT7rVrLr
jcn1E21+9qGRGrC3XLtkinUiDJpdAgMBAAECgYEAthNsOoW+G1nSsQZRaJyulGIV
c8SyOpGGzlkL4s9o6btv9WfFhAe/qsXtdeiAKDJ5q1Q/ezCNJTwD7/cqDu2qeHQP
S26tIaiC/s22xdOnypzOTRSywzT+EsJmjxTrjOXtqXMgwqDvM+v7cFlxLIMT7f1P
6fyn2J/0H+nwUW6XiwECQQDkwvZ9EIIALv5VvgZf2nWSqlhq9PVyt9lJS8qnMTxO
RibUbo5H1ksqH6oQ5Yw+JfKVv+PmqWB/d+ihOZljRkGzAkEA29yaz3GSarf/c8b/
GDX3bDc9OizzCAXoK9pjdTkHVFTETkVvjKcq8MMwa6U/pwKVi1jVnwmjAEUgmKAv
x4ELrwJAXatjKJSg1phndg5oJ8mZCOQNbkY9VqrnIvcQ1OL5MYfSEHvwcIPTpTzv
8xk7EpuRODYpiGJka+1aaOHf5+F1twJAM229AL1ORIxZwtlPnngxMi0Rs2QETWIk
Vu20yhzW7BEQAkcXusz3rG3cC7IR250tIfVbsuHsMQn6f/kodABpnQJAGQ2663m2
m6lkymzMToKOlKTDqu7nPhnzlyqYSPQGiWmf3uNHi+VcT861Q6DK9QUru0xirEfX
jDFMQfprbfTv3w==
-----END PRIVATE KEY-----","-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDEd+q/eALWSdaAx6GDS+ZPYQTy
n1ExprdMvtRII+1bmd7BhCjrA8rNChVLFc75eC9VTVTE2xQNy9cupb2qUStUKD4u
1Co1JkTDUfkZeZrwYxD3+/5mn7QTvFZFSoVh6/TQBzsY0B0+61ay643J9RNtfvah
kRqwt1y7ZIp1IgyaXQIDAQAB
-----END PUBLIC KEY-----","2024-06-05 23:51:24","2024-06-05 23:51:24");
INSERT INTO merchant_api VALUES("9","1","-----BEGIN PRIVATE KEY-----
MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAOdbcgh3cgpiagln
bvL3I0cIcctvbqymeAsC5r4wdMFNZVyeh81+LTdBI20pgofPNzVF+/PW8ooJ9DAU
n20A0AMoR0yBswj+BkkrYuk6gzR7dbsZEOr+hs4obKjAObSbpg7AdNkapXoHvNBm
rOG12YI45o9to/nOZFudcKw0zVTjAgMBAAECgYBWYw/eV3Nuqza60jNcZ6l1gZK0
CqTBtNsICYpNI9zEvPiHL+63bVDG2/y1axWBTn9n1fzxHKatom/acCjjU7VXcriR
kUMkjLiQ2z8c0nq/IjxQpqKJosdcMg05ModkdreRY0psTOxq/OqpKSYcprYiDmmo
JEw0gkNH8DdIyQKkIQJBAPReglUcQpES84gOFDUanPrS8ib9CZtIc4WknwfIfd8Y
sP1XK0Wx9Eu6vHnj9L55xTMqIfqELX0q/FWPtvmIEPECQQDyXmSzYvuc0g0HFK6s
jeP/A9C1Xk9oEPkRotWy3uFe5CxtiJPXmdaLgKDMtR0p5OdKgxVAHGkg0lNe3Cqn
lUMTAkEAncrBAdAjs6W3Fy1wIvIyV0wLDN3rbBeWcL9h6RavIHXDI3M7/97uzk+g
EFz/1lau3WDhW/App18wXNdV4T7ZIQJAf8e0X7832J4FsE3/KYpFQhXI21Y1lzAb
oGixMfS/7T9vDPCMwYahzjqqjEKQdZ3xMx+Y/Iv+AQfiXIjHFENlcQJBAIDsoO5D
gHCDJTRQ0k4map9witQUl/dnLPlfamSlX4whJ8vuHbRFZyG463FkzXztc5osESrX
unrwSNuQWPE8Nck=
-----END PRIVATE KEY-----","-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDnW3IId3IKYmoJZ27y9yNHCHHL
b26spngLAua+MHTBTWVcnofNfi03QSNtKYKHzzc1Rfvz1vKKCfQwFJ9tANADKEdM
gbMI/gZJK2LpOoM0e3W7GRDq/obOKGyowDm0m6YOwHTZGqV6B7zQZqzhtdmCOOaP
baP5zmRbnXCsNM1U4wIDAQAB
-----END PUBLIC KEY-----","2024-06-27 18:59:33","2024-06-27 18:59:33");


CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO migrations VALUES("35","2014_10_12_000000_create_users_table","1");
INSERT INTO migrations VALUES("37","2019_08_19_000000_create_failed_jobs_table","1");
INSERT INTO migrations VALUES("39","2022_02_18_142516_create_categories_table","1");
INSERT INTO migrations VALUES("40","2022_02_20_174544_create_products_table","1");
INSERT INTO migrations VALUES("44","2023_06_03_101104_create_services_table","1");
INSERT INTO migrations VALUES("45","2023_06_04_152425_create_levels_table","2");
INSERT INTO migrations VALUES("46","2023_06_05_151410_create_banks_table","3");
INSERT INTO migrations VALUES("47","2023_06_07_075256_create_transactions_table","4");
INSERT INTO migrations VALUES("48","2019_12_14_000001_create_personal_access_tokens_table","5");
INSERT INTO migrations VALUES("49","2014_10_12_100000_create_password_resets_table","6");
INSERT INTO migrations VALUES("51","2023_06_09_141301_create_pin_resets_table","7");
INSERT INTO migrations VALUES("52","2023_06_10_011915_create_activity_logs_table","8");
INSERT INTO migrations VALUES("53","2023_06_11_110845_create_api_table","9");
INSERT INTO migrations VALUES("54","2023_07_11_192332_create_beneficiaries_table","10");
INSERT INTO migrations VALUES("55","2024_02_23_212230_cupdate_users_table","10");
INSERT INTO migrations VALUES("56","2024_02_24_202643_update_users_table","10");
INSERT INTO migrations VALUES("57","2024_02_24_202826_update_password_resets_table","10");
INSERT INTO migrations VALUES("58","2024_03_17_200205_create_ip_whitelists_table","10");
INSERT INTO migrations VALUES("59","2024_03_17_214848_update_ip_whitelists_table","11");
INSERT INTO migrations VALUES("60","2024_06_05_092506_create_merchant_api_table","12");
INSERT INTO migrations VALUES("61","2024_06_05_230927_update_keys_columns_in_merchant_api_table","13");
INSERT INTO migrations VALUES("62","2024_06_05_231241_update_keys_columns_in_merchant_api_table","14");
INSERT INTO migrations VALUES("63","2024_06_06_062808_add_login_attempts_to_users_table","15");
INSERT INTO migrations VALUES("67","2024_06_06_070500_drop_activities_logs_table","19");
INSERT INTO migrations VALUES("68","2024_06_06_070016_drop_activities_log_table","20");
INSERT INTO migrations VALUES("69","2024_06_06_070411_drop_activity_log_table","20");
INSERT INTO migrations VALUES("70","2024_06_06_071103_drop_login_attempts_table","20");
INSERT INTO migrations VALUES("71","2024_06_06_071510_drop_login_attempts_table","21");
INSERT INTO migrations VALUES("72","2024_06_06_071616_create_login_attempts_table","22");
INSERT INTO migrations VALUES("73","2024_06_06_072832_add_login_attempts_and_lockout_to_users_table","23");
INSERT INTO migrations VALUES("74","2024_06_06_084912_add_mfa_column_to_users_table","24");
INSERT INTO migrations VALUES("76","2024_06_06_104508_rename_pin_resets_table_to_otps_table","25");
INSERT INTO migrations VALUES("78","2024_06_24_131132_create_discounts_table","26");


CREATE TABLE `otps` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) NOT NULL,
  `token` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO otps VALUES("1","cafeat9ja@gmail.com","21436","2023-06-09 14:41:44","2023-06-09 14:41:44");
INSERT INTO otps VALUES("7","cafeat9ja@gmail.com","65775","2023-06-09 14:57:11","2023-06-09 14:57:11");
INSERT INTO otps VALUES("8","cafeat9ja@gmail.com","66265","2023-06-09 15:12:53","2023-06-09 15:12:53");
INSERT INTO otps VALUES("9","cafeat9ja@gmail.com","51390","2024-02-25 09:44:28","2024-02-25 09:44:28");
INSERT INTO otps VALUES("10","cafeat9ja@gmail.com","70881","2024-03-16 06:06:55","2024-03-16 06:06:55");
INSERT INTO otps VALUES("11","cafeat9ja@gmail.com","13561","2024-03-16 06:07:15","2024-03-16 06:07:15");
INSERT INTO otps VALUES("12","admin10@gmail.com","63893","2024-06-05 09:04:33","2024-06-05 09:04:33");
INSERT INTO otps VALUES("13","cafeat9ja@gmail.com","87703","2024-06-06 11:54:23","2024-06-06 11:54:23");
INSERT INTO otps VALUES("14","cafeat9ja@gmail.com","61681","2024-06-06 11:54:59","2024-06-06 11:54:59");
INSERT INTO otps VALUES("15","cafeat9ja@gmail.com","88466","2024-06-06 11:57:15","2024-06-06 11:57:15");
INSERT INTO otps VALUES("16","cafeat9ja@gmail.com","49404","2024-06-06 12:00:48","2024-06-06 12:00:48");
INSERT INTO otps VALUES("17","cafeat9ja@gmail.com","29267","2024-06-06 12:14:11","2024-06-06 12:14:11");
INSERT INTO otps VALUES("18","cafeat9ja@gmail.com","62898","2024-06-06 12:15:53","2024-06-06 12:15:53");
INSERT INTO otps VALUES("19","cafeat9ja@gmail.com","43288","2024-06-06 12:17:49","2024-06-06 12:17:49");
INSERT INTO otps VALUES("20","cafeat9ja@gmail.com","55965","2024-06-06 12:18:32","2024-06-06 12:18:32");
INSERT INTO otps VALUES("21","cafeat9ja@gmail.com","72856","2024-06-06 12:32:20","2024-06-06 12:32:20");
INSERT INTO otps VALUES("22","cafeat9ja@gmail.com","94954","2024-06-06 12:36:41","2024-06-06 12:36:41");
INSERT INTO otps VALUES("23","cafeat9ja@gmail.com","84569","2024-06-06 12:41:10","2024-06-06 12:41:10");
INSERT INTO otps VALUES("24","cafeat9ja@gmail.com","43206","2024-06-06 12:41:24","2024-06-06 12:41:24");
INSERT INTO otps VALUES("25","cafeat9ja@gmail.com","75186","2024-06-06 12:48:05","2024-06-06 12:48:05");
INSERT INTO otps VALUES("26","cafeat9ja@gmail.com","47225","2024-06-06 12:48:50","2024-06-06 12:48:50");
INSERT INTO otps VALUES("27","cafeat9ja@gmail.com","19864","2024-06-06 12:49:44","2024-06-06 12:49:44");
INSERT INTO otps VALUES("28","cafeat9ja@gmail.com","84446","2024-06-06 12:50:33","2024-06-06 12:50:33");
INSERT INTO otps VALUES("29","cafeat9ja@gmail.com","72710","2024-06-06 12:51:50","2024-06-06 12:51:50");
INSERT INTO otps VALUES("30","cafeat9ja@gmail.com","18227","2024-06-06 12:53:56","2024-06-06 12:53:56");
INSERT INTO otps VALUES("31","cafeat9ja@gmail.com","42206","2024-06-06 12:54:37","2024-06-06 12:54:37");
INSERT INTO otps VALUES("32","cafeat9ja@gmail.com","40152","2024-06-06 12:56:01","2024-06-06 12:56:01");
INSERT INTO otps VALUES("33","cafeat9ja@gmail.com","82495","2024-06-06 12:58:36","2024-06-06 12:58:36");
INSERT INTO otps VALUES("34","cafeat9ja@gmail.com","30327","2024-06-06 12:59:50","2024-06-06 12:59:50");
INSERT INTO otps VALUES("35","cafeat9ja@gmail.com","83631","2024-06-06 13:02:08","2024-06-06 13:02:08");
INSERT INTO otps VALUES("36","cafeat9ja@gmail.com","54774","2024-06-06 13:33:53","2024-06-06 13:33:53");
INSERT INTO otps VALUES("37","cafeat9ja@gmail.com","19298","2024-06-06 13:34:45","2024-06-06 13:34:45");
INSERT INTO otps VALUES("38","cafeat9ja@gmail.com","93842","2024-06-06 13:38:28","2024-06-06 13:38:28");
INSERT INTO otps VALUES("39","user@gmail.com","51761","2024-06-25 02:21:15","2024-06-25 02:21:15");
INSERT INTO otps VALUES("40","user@gmail.com","90623","2024-06-25 02:28:03","2024-06-25 02:28:03");
INSERT INTO otps VALUES("41","user@gmail.com","45410","2024-06-25 02:32:04","2024-06-25 02:32:04");
INSERT INTO otps VALUES("42","cafeat9ja@gmail.com","79285","2024-06-25 12:26:10","2024-06-25 12:26:10");
INSERT INTO otps VALUES("43","cafeat9ja@gmail.com","18886","2024-06-25 12:32:00","2024-06-25 12:32:00");
INSERT INTO otps VALUES("44","cafeat9ja@gmail.com","69446","2024-06-25 12:32:34","2024-06-25 12:32:34");
INSERT INTO otps VALUES("45","cafeat9ja@gmail.com","65469","2024-06-25 12:34:07","2024-06-25 12:34:07");
INSERT INTO otps VALUES("46","cafeat9ja@gmail.com","52330","2024-06-25 12:34:51","2024-06-25 12:34:51");
INSERT INTO otps VALUES("47","cafeat9ja@gmail.com","82928","2024-06-25 12:36:25","2024-06-25 12:36:25");
INSERT INTO otps VALUES("48","cafeat9ja@gmail.com","25361","2024-06-25 12:40:17","2024-06-25 12:40:17");
INSERT INTO otps VALUES("49","cafeat9ja@gmail.com","99668","2024-06-25 12:43:17","2024-06-25 12:43:17");
INSERT INTO otps VALUES("50","cafeat9ja@gmail.com","41231","2024-06-25 12:44:19","2024-06-25 12:44:19");
INSERT INTO otps VALUES("51","cafeat9ja@gmail.com","39281","2024-06-25 13:11:52","2024-06-25 13:11:52");
INSERT INTO otps VALUES("52","cafeat9ja@gmail.com","30042","2024-06-25 13:20:36","2024-06-25 13:20:36");
INSERT INTO otps VALUES("53","cafeat9ja@gmail.com","40011","2024-06-25 13:21:58","2024-06-25 13:21:58");
INSERT INTO otps VALUES("54","cafeat9ja@gmail.com","72711","2024-06-25 13:24:02","2024-06-25 13:24:02");
INSERT INTO otps VALUES("55","cafeat9ja@gmail.com","30678","2024-06-25 13:24:29","2024-06-25 13:24:29");
INSERT INTO otps VALUES("56","cafeat9ja@gmail.com","44063","2024-06-25 13:40:00","2024-06-25 13:40:00");
INSERT INTO otps VALUES("57","cafeat9ja@gmail.com","61330","2024-06-25 13:45:59","2024-06-25 13:45:59");
INSERT INTO otps VALUES("58","cafeat9ja@gmail.com","80143","2024-06-25 13:47:33","2024-06-25 13:47:33");
INSERT INTO otps VALUES("59","cafeat9ja@gmail.com","72543","2024-06-25 13:49:26","2024-06-25 13:49:26");
INSERT INTO otps VALUES("60","cafeat9ja@gmail.com","79526","2024-06-25 13:52:24","2024-06-25 13:52:24");
INSERT INTO otps VALUES("61","cafeat9ja@gmail.com","30896","2024-06-25 13:55:55","2024-06-25 13:55:55");
INSERT INTO otps VALUES("62","cafeat9ja@gmail.com","43612","2024-06-25 13:56:50","2024-06-25 13:56:50");
INSERT INTO otps VALUES("63","cafeat9ja@gmail.com","80999","2024-06-25 15:53:00","2024-06-25 15:53:00");
INSERT INTO otps VALUES("64","cafeat9ja@gmail.com","36971","2024-06-25 16:00:01","2024-06-25 16:00:01");
INSERT INTO otps VALUES("65","cafeat9ja@gmail.com","38738","2024-06-25 16:36:28","2024-06-25 16:36:28");
INSERT INTO otps VALUES("66","cafeat9ja@gmail.com","65552","2024-06-25 16:37:42","2024-06-25 16:37:42");
INSERT INTO otps VALUES("67","cafeat9ja@gmail.com","45488","2024-06-25 16:40:25","2024-06-25 16:40:25");
INSERT INTO otps VALUES("68","cafeat9ja@gmail.com","96681","2024-06-25 16:41:07","2024-06-25 16:41:07");
INSERT INTO otps VALUES("69","cafeat9ja@gmail.com","86473","2024-06-25 16:42:17","2024-06-25 16:42:17");
INSERT INTO otps VALUES("70","cafeat9ja@gmail.com","97914","2024-06-25 16:48:48","2024-06-25 16:48:48");


CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO password_resets VALUES("1","cafeat9ja@gmail.com","95409","2023-06-08 19:38:23","2023-06-08 19:38:23");
INSERT INTO password_resets VALUES("2","cafeat9ja@gmail.com","44048","2023-06-08 19:40:27","2023-06-08 19:40:27");
INSERT INTO password_resets VALUES("3","cafeat9ja@gmail.com","33983","2023-06-08 19:51:17","2023-06-08 19:51:17");
INSERT INTO password_resets VALUES("4","cafeat9ja@gmail.com","55962","2023-06-08 19:53:06","2023-06-08 19:53:06");
INSERT INTO password_resets VALUES("5","cafeat9ja@gmail.com","45615","2023-06-09 02:02:19","2023-06-09 02:02:19");
INSERT INTO password_resets VALUES("6","cafeat9ja@gmail.com","41983","2023-06-09 02:03:22","2023-06-09 02:03:22");
INSERT INTO password_resets VALUES("7","cafeat9ja@gmail.com","20156","2023-06-09 02:58:46","2023-06-09 02:58:46");
INSERT INTO password_resets VALUES("8","cafeat9ja@gmail.com","95126","2023-06-09 02:58:49","2023-06-09 02:58:49");
INSERT INTO password_resets VALUES("9","cafeat9ja@gmail.com","26815","2023-06-09 02:58:49","2023-06-09 02:58:49");
INSERT INTO password_resets VALUES("10","cafeat9ja@gmail.com","49066","2023-06-09 02:58:50","2023-06-09 02:58:50");
INSERT INTO password_resets VALUES("11","cafeat9ja@gmail.com","38005","2023-06-09 02:58:51","2023-06-09 02:58:51");
INSERT INTO password_resets VALUES("12","cafeat9ja@gmail.com","90923","2023-06-09 02:58:51","2023-06-09 02:58:51");
INSERT INTO password_resets VALUES("13","cafeat9ja@gmail.com","25116","2023-06-09 02:58:51","2023-06-09 02:58:51");
INSERT INTO password_resets VALUES("14","cafeat9ja@gmail.com","72072","2023-06-09 02:58:52","2023-06-09 02:58:52");
INSERT INTO password_resets VALUES("15","cafeat9ja@gmail.com","42960","2023-06-09 02:58:52","2023-06-09 02:58:52");
INSERT INTO password_resets VALUES("16","cafeat9ja@gmail.com","47419","2023-06-09 02:58:53","2023-06-09 02:58:53");
INSERT INTO password_resets VALUES("17","cafeat9ja@gmail.com","45256","2023-06-09 03:01:58","2023-06-09 03:01:58");
INSERT INTO password_resets VALUES("18","cafeat9ja@gmail.com","77231","2023-06-09 03:02:01","2023-06-09 03:02:01");
INSERT INTO password_resets VALUES("19","cafeat9ja@gmail.com","84301","2023-06-09 03:02:01","2023-06-09 03:02:01");
INSERT INTO password_resets VALUES("20","cafeat9ja@gmail.com","73233","2023-06-09 03:02:03","2023-06-09 03:02:03");
INSERT INTO password_resets VALUES("21","cafeat9ja@gmail.com","40142","2023-06-09 03:02:03","2023-06-09 03:02:03");
INSERT INTO password_resets VALUES("22","cafeat9ja@gmail.com","63760","2023-06-09 03:02:04","2023-06-09 03:02:04");
INSERT INTO password_resets VALUES("23","cafeat9ja@gmail.com","55538","2023-06-09 03:02:05","2023-06-09 03:02:05");
INSERT INTO password_resets VALUES("24","cafeat9ja@gmail.com","49056","2023-06-09 03:02:06","2023-06-09 03:02:06");
INSERT INTO password_resets VALUES("25","cafeat9ja@gmail.com","99680","2023-06-09 03:02:06","2023-06-09 03:02:06");
INSERT INTO password_resets VALUES("26","cafeat9ja@gmail.com","49798","2023-06-09 03:02:07","2023-06-09 03:02:07");
INSERT INTO password_resets VALUES("27","cafeat9ja@gmail.com","89530","2023-06-09 03:07:08","2023-06-09 03:07:08");
INSERT INTO password_resets VALUES("28","cafeat9ja@gmail.com","57265","2023-06-09 03:07:11","2023-06-09 03:07:11");
INSERT INTO password_resets VALUES("29","cafeat9ja@gmail.com","20333","2023-06-09 03:07:11","2023-06-09 03:07:11");
INSERT INTO password_resets VALUES("30","cafeat9ja@gmail.com","75302","2023-06-09 03:07:12","2023-06-09 03:07:12");
INSERT INTO password_resets VALUES("31","cafeat9ja@gmail.com","24228","2023-06-09 03:07:12","2023-06-09 03:07:12");
INSERT INTO password_resets VALUES("32","cafeat9ja@gmail.com","99734","2023-06-09 03:07:13","2023-06-09 03:07:13");
INSERT INTO password_resets VALUES("33","cafeat9ja@gmail.com","96196","2023-06-09 03:24:56","2023-06-09 03:24:56");
INSERT INTO password_resets VALUES("34","cafeat9ja@gmail.com","44209","2023-06-09 05:41:55","2023-06-09 05:41:55");
INSERT INTO password_resets VALUES("35","cafeat9ja@gmail.com","29209","2023-06-09 09:38:50","2023-06-09 09:38:50");
INSERT INTO password_resets VALUES("36","cafeat9ja@gmail.com","19348","2023-06-09 09:41:14","2023-06-09 09:41:14");
INSERT INTO password_resets VALUES("37","cafeat9ja@gmail.com","54496","2023-06-09 13:06:10","2023-06-09 13:06:10");
INSERT INTO password_resets VALUES("38","cafeat9ja@gmail.com","95818","2023-06-09 13:08:56","2023-06-09 13:08:56");
INSERT INTO password_resets VALUES("39","cafeat9ja@gmail.com","10099","2023-06-09 13:11:19","2023-06-09 13:11:19");
INSERT INTO password_resets VALUES("40","cafeat9ja@gmail.com","49052","2023-06-09 13:14:49","2023-06-09 13:14:49");
INSERT INTO password_resets VALUES("41","cafeat9ja@gmail.com","36419","2023-06-09 13:17:24","2023-06-09 13:17:24");
INSERT INTO password_resets VALUES("42","cafeat9ja@gmail.com","27693","2023-06-09 13:18:17","2023-06-09 13:18:17");
INSERT INTO password_resets VALUES("43","cafeat9ja@gmail.com","95322","2023-06-09 13:20:51","2023-06-09 13:20:51");
INSERT INTO password_resets VALUES("44","cafeat9ja@gmail.com","95253","2023-06-09 13:25:29","2023-06-09 13:25:29");
INSERT INTO password_resets VALUES("45","cafeat9ja@gmail.com","98270","2023-06-09 13:29:27","2023-06-09 13:29:27");
INSERT INTO password_resets VALUES("46","cafeat9ja@gmail.com","96318","2023-06-09 13:30:11","2023-06-09 13:30:11");
INSERT INTO password_resets VALUES("47","cafeat9ja@gmail.com","38822","2023-06-09 13:32:30","2023-06-09 13:32:30");
INSERT INTO password_resets VALUES("48","cafeat9ja@gmail.com","96073","2023-06-09 13:35:04","2023-06-09 13:35:04");
INSERT INTO password_resets VALUES("49","cafeat9ja@gmail.com","81650","2023-06-09 13:38:07","2023-06-09 13:38:07");
INSERT INTO password_resets VALUES("50","oluwadaretomiwa@gmail.com","15008","2023-06-10 09:07:56","2023-06-10 09:07:56");
INSERT INTO password_resets VALUES("51","oluwadaretomiwa@gmail.com","74968","2023-06-10 09:13:46","2023-06-10 09:13:46");
INSERT INTO password_resets VALUES("52","oluwadaretomiwa@gmail.com","56275","2023-06-10 09:23:38","2023-06-10 09:23:38");
INSERT INTO password_resets VALUES("53","admin2@gmail.com","45425","2023-06-11 04:31:02","2023-06-11 04:31:02");
INSERT INTO password_resets VALUES("54","admin2@gmail.com","64520","2023-06-11 05:05:14","2023-06-11 05:05:14");
INSERT INTO password_resets VALUES("55","admin2@gmail.com","61936","2023-06-11 05:56:53","2023-06-11 05:56:53");
INSERT INTO password_resets VALUES("56","oluwadaretomiwa@gmail.com","97390","2023-06-13 13:00:01","2023-06-13 13:00:01");
INSERT INTO password_resets VALUES("57","cafeat9ja2@gmail.com","38108","2024-02-25 08:50:07","2024-02-25 08:50:07");
INSERT INTO password_resets VALUES("58","cafeat9ja2@gmail.com","95196","2024-02-25 08:50:28","2024-02-25 08:50:28");
INSERT INTO password_resets VALUES("59","cafeat9ja2@gmail.com","47324","2024-02-25 08:51:54","2024-02-25 08:51:54");
INSERT INTO password_resets VALUES("60","cafeat9ja2@gmail.com","63699","2024-02-25 10:46:15","2024-02-25 10:46:15");
INSERT INTO password_resets VALUES("61","cafeat9ja2@gmail.com","34775","2024-02-25 10:46:34","2024-02-25 10:46:34");
INSERT INTO password_resets VALUES("62","cafeat9ja2@gmail.com","79405","2024-02-25 10:47:38","2024-02-25 10:47:38");
INSERT INTO password_resets VALUES("63","cafeat9ja2@gmail.com","25243","2024-02-25 10:50:05","2024-02-25 10:50:05");
INSERT INTO password_resets VALUES("64","cafeat9ja2@gmail.com","36282","2024-02-25 10:55:27","2024-02-25 10:55:27");
INSERT INTO password_resets VALUES("65","oluwadaretomiwa2@gmail.com","45941","2024-02-25 10:56:55","2024-02-25 10:56:55");
INSERT INTO password_resets VALUES("66","oluwadaretomiwa2@gmail.com","95993","2024-02-25 10:58:10","2024-02-25 10:58:10");
INSERT INTO password_resets VALUES("67","oluwadaretomiwa@gmail.com","30256","2024-02-25 10:59:09","2024-02-25 10:59:09");
INSERT INTO password_resets VALUES("68","oluwadaretomiwa@gmail.com","16644","2024-02-25 11:01:19","2024-02-25 11:01:19");
INSERT INTO password_resets VALUES("69","oluwadaretomiwa@gmail.com","48632","2024-02-25 11:15:20","2024-02-25 11:15:20");
INSERT INTO password_resets VALUES("70","oluwadaretomiwa@gmail.com","20488","2024-02-25 11:19:52","2024-02-25 11:19:52");
INSERT INTO password_resets VALUES("71","oluwadaretomiwa@gmail.com","13077","2024-02-25 11:24:58","2024-02-25 11:24:58");
INSERT INTO password_resets VALUES("72","oluwadaretomiwa@gmail.com","46608","2024-02-25 11:29:22","2024-02-25 11:29:22");
INSERT INTO password_resets VALUES("73","oluwadaretomiwa@gmail.com","52582","2024-02-25 11:44:27","2024-02-25 11:44:27");
INSERT INTO password_resets VALUES("74","oluwadaretomiwa@gmail.com","73785","2024-02-25 11:49:32","2024-02-25 11:49:32");
INSERT INTO password_resets VALUES("75","cafeat9ja2@gmail.com","88453","2024-02-25 12:04:48","2024-02-25 12:04:48");
INSERT INTO password_resets VALUES("76","cafeat9ja2@gmail.com","87016","2024-02-25 12:05:17","2024-02-25 12:05:17");
INSERT INTO password_resets VALUES("77","cafeat9ja2@gmail.com","63211","2024-02-25 12:06:27","2024-02-25 12:06:27");
INSERT INTO password_resets VALUES("78","cafeat9ja2@gmail.com","56730","2024-02-25 12:06:37","2024-02-25 12:06:37");
INSERT INTO password_resets VALUES("79","cafeat9ja2@gmail.com","35341","2024-02-25 12:26:40","2024-02-25 12:26:40");
INSERT INTO password_resets VALUES("80","cafeat9ja2@gmail.com","29293","2024-02-25 12:29:57","2024-02-25 12:29:57");
INSERT INTO password_resets VALUES("81","cafeat9ja2@gmail.com","87456","2024-02-25 13:00:53","2024-02-25 13:00:53");
INSERT INTO password_resets VALUES("82","cafeat9ja2@gmail.com","16529","2024-02-25 13:03:16","2024-02-25 13:03:16");
INSERT INTO password_resets VALUES("83","cafeat9ja2@gmail.com","12634","2024-02-25 13:04:18","2024-02-25 13:04:18");
INSERT INTO password_resets VALUES("84","cafeat9ja2@gmail.com","95119","2024-02-25 13:12:59","2024-02-25 13:12:59");
INSERT INTO password_resets VALUES("85","cafeat9ja2@gmail.com","16323","2024-02-25 13:25:14","2024-02-25 13:25:14");
INSERT INTO password_resets VALUES("86","cafeat9ja3@gmail.com","94977","2024-02-25 13:29:03","2024-02-25 13:29:03");
INSERT INTO password_resets VALUES("87","admin3@gmail.com","42486","2024-03-03 10:17:33","2024-03-03 10:17:33");
INSERT INTO password_resets VALUES("88","admin3@gmail.com","63747","2024-03-03 10:22:35","2024-03-03 10:22:35");
INSERT INTO password_resets VALUES("89","admin3@gmail.com","71656","2024-03-03 10:25:10","2024-03-03 10:25:10");
INSERT INTO password_resets VALUES("90","adminsd@gmail.com","64192","2024-03-16 23:04:48","2024-03-16 23:04:48");
INSERT INTO password_resets VALUES("91","adminsd@gmail.com","52136","2024-03-16 23:05:13","2024-03-16 23:05:13");
INSERT INTO password_resets VALUES("92","adminsd@gmail.com","30887","2024-03-16 23:05:28","2024-03-16 23:05:28");
INSERT INTO password_resets VALUES("93","admin4@gmail.com","27970","2024-06-05 06:42:34","2024-06-05 06:42:34");
INSERT INTO password_resets VALUES("94","admin5@gmail.com","59068","2024-06-05 07:09:40","2024-06-05 07:09:40");
INSERT INTO password_resets VALUES("95","admin6@gmail.com","41907","2024-06-05 07:11:05","2024-06-05 07:11:05");
INSERT INTO password_resets VALUES("96","admin7@gmail.com","76093","2024-06-05 07:21:07","2024-06-05 07:21:07");
INSERT INTO password_resets VALUES("97","admin8@gmail.com","57321","2024-06-05 07:24:40","2024-06-05 07:24:40");
INSERT INTO password_resets VALUES("98","admin9@gmail.com","61978","2024-06-05 08:02:41","2024-06-05 08:02:41");
INSERT INTO password_resets VALUES("99","admin10@gmail.com","59744","2024-06-05 08:08:05","2024-06-05 08:08:05");
INSERT INTO password_resets VALUES("100","admin11@gmail.com","94823","2024-06-05 08:13:17","2024-06-05 08:13:17");


CREATE TABLE `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `roles_id` int(11) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `permissions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `permissions_ibfk_2` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=753 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO permissions VALUES("462","2","67","1","2024-03-01 09:11:58","2024-03-16 07:59:26");
INSERT INTO permissions VALUES("463","2","68","1","2024-03-01 09:11:58","2024-03-16 07:59:26");
INSERT INTO permissions VALUES("464","2","69","1","2024-03-01 09:11:58","2024-03-16 07:59:26");
INSERT INTO permissions VALUES("465","2","70","1","2024-03-01 09:11:58","2024-03-16 07:59:26");
INSERT INTO permissions VALUES("466","2","71","1","2024-03-01 09:11:58","2024-03-16 07:59:26");
INSERT INTO permissions VALUES("467","2","72","1","2024-03-01 09:11:58","2024-03-16 07:59:26");
INSERT INTO permissions VALUES("468","2","73","1","2024-03-01 09:11:58","2024-03-16 07:59:26");
INSERT INTO permissions VALUES("469","2","74","1","2024-03-01 09:11:58","2024-03-16 07:59:26");
INSERT INTO permissions VALUES("470","2","75","1","2024-03-01 09:11:58","2024-03-16 07:59:26");
INSERT INTO permissions VALUES("471","2","76","1","2024-03-01 09:11:58","2024-03-16 07:59:26");
INSERT INTO permissions VALUES("472","2","77","1","2024-03-01 09:11:58","2024-03-16 07:59:26");
INSERT INTO permissions VALUES("473","2","78","1","2024-03-01 09:11:58","2024-03-16 07:59:26");
INSERT INTO permissions VALUES("474","2","79","1","2024-03-01 09:11:58","2024-03-16 07:59:26");
INSERT INTO permissions VALUES("475","2","80","1","2024-03-01 09:11:59","2024-03-16 07:59:27");
INSERT INTO permissions VALUES("476","2","85","1","2024-03-01 09:11:59","2024-03-16 07:59:27");
INSERT INTO permissions VALUES("477","2","86","1","2024-03-01 09:11:59","2024-03-16 07:59:27");
INSERT INTO permissions VALUES("478","2","87","1","2024-03-01 09:11:59","2024-03-16 07:59:27");
INSERT INTO permissions VALUES("479","2","88","1","2024-03-01 09:11:59","2024-03-16 07:59:27");
INSERT INTO permissions VALUES("480","2","93","1","2024-03-01 09:11:59","2024-03-16 07:59:27");
INSERT INTO permissions VALUES("481","2","94","1","2024-03-01 09:11:59","2024-03-16 07:59:27");
INSERT INTO permissions VALUES("482","2","95","1","2024-03-01 09:11:59","2024-03-16 07:59:27");
INSERT INTO permissions VALUES("483","2","96","1","2024-03-01 09:11:59","2024-03-16 07:59:27");
INSERT INTO permissions VALUES("484","2","97","1","2024-03-01 09:11:59","2024-03-16 07:59:27");
INSERT INTO permissions VALUES("535","9","101","1","2024-03-01 09:19:26","2024-03-16 11:36:38");
INSERT INTO permissions VALUES("536","9","102","1","2024-03-01 09:19:26","2024-03-16 11:33:04");
INSERT INTO permissions VALUES("537","9","103","1","2024-03-01 09:19:27","2024-03-17 20:45:54");
INSERT INTO permissions VALUES("538","9","104","1","2024-03-01 09:19:27","2024-03-17 20:45:54");
INSERT INTO permissions VALUES("539","2","98","1","2024-03-03 08:18:18","2024-03-16 07:59:27");
INSERT INTO permissions VALUES("540","2","99","1","2024-03-03 08:18:18","2024-03-16 07:59:27");
INSERT INTO permissions VALUES("541","2","100","1","2024-03-03 08:18:18","2024-03-16 07:59:27");
INSERT INTO permissions VALUES("542","2","101","1","2024-03-03 08:18:18","2024-03-16 07:59:27");
INSERT INTO permissions VALUES("543","2","102","1","2024-03-03 08:18:18","2024-03-16 07:59:27");
INSERT INTO permissions VALUES("544","2","103","1","2024-03-03 08:18:18","2024-03-16 07:59:27");
INSERT INTO permissions VALUES("545","2","104","1","2024-03-03 08:18:18","2024-03-16 07:59:27");
INSERT INTO permissions VALUES("546","2","53","1","2024-03-03 10:26:57","2024-03-16 07:59:27");
INSERT INTO permissions VALUES("547","18","53","0","2024-03-03 11:07:37","2024-06-05 06:41:33");
INSERT INTO permissions VALUES("548","18","55","0","2024-03-03 11:07:38","2024-06-05 06:41:33");
INSERT INTO permissions VALUES("549","18","56","0","2024-03-03 11:07:38","2024-06-05 06:41:33");
INSERT INTO permissions VALUES("550","18","57","0","2024-03-03 11:07:38","2024-06-05 06:41:33");
INSERT INTO permissions VALUES("551","18","58","0","2024-03-03 11:07:38","2024-06-05 06:41:33");
INSERT INTO permissions VALUES("552","18","59","0","2024-03-03 11:07:38","2024-06-05 06:41:33");
INSERT INTO permissions VALUES("553","18","60","0","2024-03-03 11:07:38","2024-06-05 06:41:33");
INSERT INTO permissions VALUES("554","18","61","0","2024-03-03 11:07:38","2024-06-05 06:41:33");
INSERT INTO permissions VALUES("555","18","62","0","2024-03-03 11:07:38","2024-06-05 06:41:33");
INSERT INTO permissions VALUES("556","18","63","0","2024-03-03 11:07:38","2024-06-05 06:41:33");
INSERT INTO permissions VALUES("557","18","64","0","2024-03-03 11:07:38","2024-06-05 06:41:33");
INSERT INTO permissions VALUES("558","18","65","0","2024-03-03 11:07:38","2024-06-05 06:41:33");
INSERT INTO permissions VALUES("559","18","66","0","2024-03-03 11:07:38","2024-06-05 06:41:34");
INSERT INTO permissions VALUES("560","18","67","0","2024-03-03 11:07:38","2024-06-05 06:41:34");
INSERT INTO permissions VALUES("561","18","68","0","2024-03-03 11:07:38","2024-06-05 06:41:34");
INSERT INTO permissions VALUES("562","18","69","0","2024-03-03 11:07:38","2024-06-05 06:41:34");
INSERT INTO permissions VALUES("563","18","70","0","2024-03-03 11:07:39","2024-06-05 06:41:34");
INSERT INTO permissions VALUES("564","18","71","0","2024-03-03 11:07:39","2024-06-05 06:41:34");
INSERT INTO permissions VALUES("565","18","72","0","2024-03-03 11:07:39","2024-06-05 06:41:34");
INSERT INTO permissions VALUES("566","18","73","0","2024-03-03 11:07:39","2024-06-05 06:41:34");
INSERT INTO permissions VALUES("567","18","74","0","2024-03-03 11:07:39","2024-06-05 06:41:34");
INSERT INTO permissions VALUES("568","18","75","0","2024-03-03 11:07:39","2024-06-05 06:41:34");
INSERT INTO permissions VALUES("569","18","76","0","2024-03-03 11:07:39","2024-06-05 06:41:34");
INSERT INTO permissions VALUES("570","18","77","0","2024-03-03 11:07:39","2024-06-05 06:41:34");
INSERT INTO permissions VALUES("571","18","78","0","2024-03-03 11:07:39","2024-06-05 06:41:34");
INSERT INTO permissions VALUES("572","18","79","0","2024-03-03 11:07:39","2024-06-05 06:41:34");
INSERT INTO permissions VALUES("573","18","80","0","2024-03-03 11:07:39","2024-06-05 06:41:34");
INSERT INTO permissions VALUES("574","18","85","0","2024-03-03 11:07:39","2024-06-05 06:41:34");
INSERT INTO permissions VALUES("575","18","86","0","2024-03-03 11:07:39","2024-06-05 06:41:34");
INSERT INTO permissions VALUES("576","18","87","0","2024-03-03 11:07:39","2024-06-05 06:41:34");
INSERT INTO permissions VALUES("577","18","88","0","2024-03-03 11:07:39","2024-06-05 06:41:34");
INSERT INTO permissions VALUES("578","18","93","0","2024-03-03 11:07:39","2024-06-05 06:41:34");
INSERT INTO permissions VALUES("579","18","94","0","2024-03-03 11:07:40","2024-06-05 06:41:34");
INSERT INTO permissions VALUES("580","18","95","0","2024-03-03 11:07:40","2024-06-05 06:41:35");
INSERT INTO permissions VALUES("581","18","96","0","2024-03-03 11:07:40","2024-06-05 06:41:35");
INSERT INTO permissions VALUES("582","18","97","0","2024-03-03 11:07:40","2024-06-05 06:41:35");
INSERT INTO permissions VALUES("583","18","98","0","2024-03-03 11:07:40","2024-06-05 06:41:35");
INSERT INTO permissions VALUES("584","18","99","0","2024-03-03 11:07:40","2024-06-05 06:41:35");
INSERT INTO permissions VALUES("585","18","100","0","2024-03-03 11:07:40","2024-06-05 06:41:35");
INSERT INTO permissions VALUES("586","18","101","0","2024-03-03 11:07:40","2024-06-05 06:41:35");
INSERT INTO permissions VALUES("587","18","102","0","2024-03-03 11:07:40","2024-06-05 06:41:35");
INSERT INTO permissions VALUES("588","18","103","0","2024-03-03 11:07:40","2024-06-05 06:41:35");
INSERT INTO permissions VALUES("589","18","104","0","2024-03-03 11:07:40","2024-06-05 06:41:35");
INSERT INTO permissions VALUES("590","9","53","1","2024-03-16 07:57:21","2024-03-17 20:45:54");
INSERT INTO permissions VALUES("591","18","105","0","2024-03-17 20:43:50","2024-06-05 06:41:35");
INSERT INTO permissions VALUES("592","18","106","0","2024-03-17 20:43:50","2024-06-05 06:41:35");
INSERT INTO permissions VALUES("593","18","107","0","2024-03-17 20:43:50","2024-06-05 06:41:35");
INSERT INTO permissions VALUES("594","18","108","0","2024-03-17 20:43:50","2024-06-05 06:41:35");
INSERT INTO permissions VALUES("595","1","53","1","2024-03-17 20:50:50","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("596","1","55","1","2024-03-17 20:50:50","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("597","1","56","1","2024-03-17 20:50:50","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("598","1","57","1","2024-03-17 20:50:51","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("599","1","58","1","2024-03-17 20:50:51","2024-03-17 20:50:51");
INSERT INTO permissions VALUES("600","1","59","1","2024-03-17 20:50:51","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("601","1","60","1","2024-03-17 20:50:51","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("602","1","61","1","2024-03-17 20:50:51","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("603","1","62","1","2024-03-17 20:50:51","2024-03-17 20:50:51");
INSERT INTO permissions VALUES("604","1","63","1","2024-03-17 20:50:51","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("605","1","64","1","2024-03-17 20:50:51","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("606","1","65","1","2024-03-17 20:50:51","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("607","1","66","1","2024-03-17 20:50:51","2024-03-17 20:50:51");
INSERT INTO permissions VALUES("608","1","67","1","2024-03-17 20:50:51","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("609","1","68","1","2024-03-17 20:50:51","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("610","1","69","1","2024-03-17 20:50:51","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("611","1","70","1","2024-03-17 20:50:51","2024-03-17 20:50:51");
INSERT INTO permissions VALUES("612","1","71","1","2024-03-17 20:50:51","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("613","1","72","1","2024-03-17 20:50:51","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("614","1","73","1","2024-03-17 20:50:51","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("615","1","74","1","2024-03-17 20:50:52","2024-03-17 20:50:52");
INSERT INTO permissions VALUES("616","1","75","1","2024-03-17 20:50:52","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("617","1","76","1","2024-03-17 20:50:52","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("618","1","77","1","2024-03-17 20:50:52","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("619","1","78","1","2024-03-17 20:50:52","2024-03-17 20:50:52");
INSERT INTO permissions VALUES("620","1","79","1","2024-03-17 20:50:52","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("621","1","80","1","2024-03-17 20:50:52","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("622","1","85","1","2024-03-17 20:50:52","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("623","1","86","1","2024-03-17 20:50:52","2024-03-17 20:50:52");
INSERT INTO permissions VALUES("624","1","87","1","2024-03-17 20:50:52","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("625","1","88","1","2024-03-17 20:50:52","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("626","1","93","1","2024-03-17 20:50:52","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("627","1","94","1","2024-03-17 20:50:53","2024-03-17 20:50:53");
INSERT INTO permissions VALUES("628","1","95","1","2024-03-17 20:50:53","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("629","1","96","1","2024-03-17 20:50:53","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("630","1","97","1","2024-03-17 20:50:53","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("631","1","98","1","2024-03-17 20:50:53","2024-03-17 20:50:53");
INSERT INTO permissions VALUES("632","1","99","1","2024-03-17 20:50:53","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("633","1","100","1","2024-03-17 20:50:53","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("634","1","101","1","2024-03-17 20:50:53","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("635","1","102","1","2024-03-17 20:50:53","2024-03-17 20:50:53");
INSERT INTO permissions VALUES("636","1","103","1","2024-03-17 20:50:53","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("637","1","104","1","2024-03-17 20:50:53","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("638","1","105","1","2024-03-17 20:50:53","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("639","1","106","1","2024-03-17 20:50:53","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("640","1","107","1","2024-03-17 20:50:53","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("641","1","108","1","2024-03-17 20:50:53","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("642","2","55","1","2024-03-17 20:52:28","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("643","2","56","1","2024-03-17 20:52:28","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("644","2","57","1","2024-03-17 20:52:28","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("645","2","58","1","2024-03-17 20:52:29","2024-03-17 20:52:29");
INSERT INTO permissions VALUES("646","2","59","1","2024-03-17 20:52:29","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("647","2","60","1","2024-03-17 20:52:29","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("648","2","61","1","2024-03-17 20:52:29","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("649","2","62","1","2024-03-17 20:52:29","2024-03-17 20:52:29");
INSERT INTO permissions VALUES("650","2","63","1","2024-03-17 20:52:29","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("651","2","64","1","2024-03-17 20:52:29","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("652","2","65","1","2024-03-17 20:52:29","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("653","2","66","1","2024-03-17 20:52:29","2024-03-17 20:52:29");
INSERT INTO permissions VALUES("654","2","105","1","2024-03-17 20:52:29","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("655","2","106","1","2024-03-17 20:52:29","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("656","2","107","1","2024-03-17 20:52:29","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("657","2","108","1","2024-03-17 20:52:29","2024-03-17 20:52:55");
INSERT INTO permissions VALUES("658","9","55","0","2024-06-05 05:58:05","2024-06-05 05:58:05");
INSERT INTO permissions VALUES("659","9","56","0","2024-06-05 05:58:05","2024-06-05 05:58:05");
INSERT INTO permissions VALUES("660","9","57","0","2024-06-05 05:58:05","2024-06-05 05:58:05");
INSERT INTO permissions VALUES("661","9","58","1","2024-06-05 05:58:05","2024-06-05 05:58:05");
INSERT INTO permissions VALUES("662","9","59","0","2024-06-05 05:58:05","2024-06-05 05:58:05");
INSERT INTO permissions VALUES("663","9","60","0","2024-06-05 05:58:05","2024-06-05 05:58:05");
INSERT INTO permissions VALUES("664","9","61","0","2024-06-05 05:58:05","2024-06-05 05:58:05");
INSERT INTO permissions VALUES("665","9","62","1","2024-06-05 05:58:05","2024-06-05 05:58:05");
INSERT INTO permissions VALUES("666","9","63","0","2024-06-05 05:58:05","2024-06-05 05:58:05");
INSERT INTO permissions VALUES("667","9","64","0","2024-06-05 05:58:06","2024-06-05 05:58:06");
INSERT INTO permissions VALUES("668","9","65","0","2024-06-05 05:58:06","2024-06-05 05:58:06");
INSERT INTO permissions VALUES("669","9","66","1","2024-06-05 05:58:06","2024-06-05 05:58:06");
INSERT INTO permissions VALUES("670","9","67","0","2024-06-05 05:58:06","2024-06-05 05:58:06");
INSERT INTO permissions VALUES("671","9","68","0","2024-06-05 05:58:06","2024-06-05 05:58:06");
INSERT INTO permissions VALUES("672","9","69","0","2024-06-05 05:58:06","2024-06-05 05:58:06");
INSERT INTO permissions VALUES("673","9","70","1","2024-06-05 05:58:06","2024-06-05 05:58:06");
INSERT INTO permissions VALUES("674","9","71","0","2024-06-05 05:58:06","2024-06-05 05:58:06");
INSERT INTO permissions VALUES("675","9","72","0","2024-06-05 05:58:06","2024-06-05 05:58:06");
INSERT INTO permissions VALUES("676","9","73","0","2024-06-05 05:58:06","2024-06-05 05:58:06");
INSERT INTO permissions VALUES("677","9","74","1","2024-06-05 05:58:06","2024-06-05 05:58:06");
INSERT INTO permissions VALUES("678","9","75","0","2024-06-05 05:58:06","2024-06-05 05:58:06");
INSERT INTO permissions VALUES("679","9","76","0","2024-06-05 05:58:06","2024-06-05 05:58:06");
INSERT INTO permissions VALUES("680","9","77","0","2024-06-05 05:58:06","2024-06-05 05:58:06");
INSERT INTO permissions VALUES("681","9","78","1","2024-06-05 05:58:06","2024-06-05 05:58:06");
INSERT INTO permissions VALUES("682","9","79","0","2024-06-05 05:58:06","2024-06-05 05:58:06");
INSERT INTO permissions VALUES("683","9","80","0","2024-06-05 05:58:06","2024-06-05 05:58:06");
INSERT INTO permissions VALUES("684","9","85","0","2024-06-05 05:58:06","2024-06-05 05:58:06");
INSERT INTO permissions VALUES("685","9","86","1","2024-06-05 05:58:06","2024-06-05 05:58:06");
INSERT INTO permissions VALUES("686","9","87","0","2024-06-05 05:58:07","2024-06-05 05:58:07");
INSERT INTO permissions VALUES("687","9","88","0","2024-06-05 05:58:07","2024-06-05 05:58:07");
INSERT INTO permissions VALUES("688","9","93","0","2024-06-05 05:58:07","2024-06-05 05:58:07");
INSERT INTO permissions VALUES("689","9","94","1","2024-06-05 05:58:07","2024-06-05 05:58:07");
INSERT INTO permissions VALUES("690","9","95","0","2024-06-05 05:58:07","2024-06-05 05:58:07");
INSERT INTO permissions VALUES("691","9","96","0","2024-06-05 05:58:07","2024-06-05 05:58:07");
INSERT INTO permissions VALUES("692","9","97","0","2024-06-05 05:58:07","2024-06-05 05:58:07");
INSERT INTO permissions VALUES("693","9","98","1","2024-06-05 05:58:07","2024-06-05 05:58:07");
INSERT INTO permissions VALUES("694","9","99","0","2024-06-05 05:58:07","2024-06-05 05:58:07");
INSERT INTO permissions VALUES("695","9","100","0","2024-06-05 05:58:07","2024-06-05 05:58:07");
INSERT INTO permissions VALUES("696","9","105","0","2024-06-05 05:58:07","2024-06-05 05:58:07");
INSERT INTO permissions VALUES("697","9","106","0","2024-06-05 05:58:07","2024-06-05 05:58:07");
INSERT INTO permissions VALUES("698","9","107","0","2024-06-05 05:58:07","2024-06-05 05:58:07");
INSERT INTO permissions VALUES("699","9","108","0","2024-06-05 05:58:07","2024-06-05 05:58:07");
INSERT INTO permissions VALUES("700","24","53","0","2024-06-05 07:59:31","2024-06-05 07:59:31");
INSERT INTO permissions VALUES("701","24","55","0","2024-06-05 07:59:32","2024-06-05 07:59:32");
INSERT INTO permissions VALUES("702","24","56","0","2024-06-05 07:59:32","2024-06-05 07:59:32");
INSERT INTO permissions VALUES("703","24","57","0","2024-06-05 07:59:32","2024-06-05 07:59:32");
INSERT INTO permissions VALUES("704","24","58","1","2024-06-05 07:59:32","2024-06-05 07:59:32");
INSERT INTO permissions VALUES("705","24","59","0","2024-06-05 07:59:33","2024-06-05 07:59:33");
INSERT INTO permissions VALUES("706","24","60","0","2024-06-05 07:59:33","2024-06-05 07:59:33");
INSERT INTO permissions VALUES("707","24","61","0","2024-06-05 07:59:33","2024-06-05 07:59:33");
INSERT INTO permissions VALUES("708","24","62","1","2024-06-05 07:59:33","2024-06-05 07:59:33");
INSERT INTO permissions VALUES("709","24","63","0","2024-06-05 07:59:33","2024-06-05 07:59:33");
INSERT INTO permissions VALUES("710","24","64","0","2024-06-05 07:59:33","2024-06-05 07:59:33");
INSERT INTO permissions VALUES("711","24","65","0","2024-06-05 07:59:33","2024-06-05 07:59:33");
INSERT INTO permissions VALUES("712","24","66","1","2024-06-05 07:59:33","2024-06-05 07:59:33");
INSERT INTO permissions VALUES("713","24","67","0","2024-06-05 07:59:33","2024-06-05 07:59:33");
INSERT INTO permissions VALUES("714","24","68","0","2024-06-05 07:59:34","2024-06-05 07:59:34");
INSERT INTO permissions VALUES("715","24","69","0","2024-06-05 07:59:34","2024-06-05 07:59:34");
INSERT INTO permissions VALUES("716","24","70","1","2024-06-05 07:59:34","2024-06-05 07:59:34");
INSERT INTO permissions VALUES("717","24","71","0","2024-06-05 07:59:34","2024-06-05 07:59:34");
INSERT INTO permissions VALUES("718","24","72","0","2024-06-05 07:59:34","2024-06-05 07:59:34");
INSERT INTO permissions VALUES("719","24","73","0","2024-06-05 07:59:34","2024-06-05 07:59:34");
INSERT INTO permissions VALUES("720","24","74","1","2024-06-05 07:59:34","2024-06-05 07:59:34");
INSERT INTO permissions VALUES("721","24","75","0","2024-06-05 07:59:35","2024-06-05 07:59:35");
INSERT INTO permissions VALUES("722","24","76","0","2024-06-05 07:59:35","2024-06-05 07:59:35");
INSERT INTO permissions VALUES("723","24","77","0","2024-06-05 07:59:35","2024-06-05 07:59:35");
INSERT INTO permissions VALUES("724","24","78","1","2024-06-05 07:59:35","2024-06-05 07:59:35");
INSERT INTO permissions VALUES("725","24","79","0","2024-06-05 07:59:35","2024-06-05 07:59:35");
INSERT INTO permissions VALUES("726","24","80","0","2024-06-05 07:59:35","2024-06-05 07:59:35");
INSERT INTO permissions VALUES("727","24","85","0","2024-06-05 07:59:35","2024-06-05 07:59:35");
INSERT INTO permissions VALUES("728","24","86","1","2024-06-05 07:59:35","2024-06-05 07:59:35");
INSERT INTO permissions VALUES("729","24","87","0","2024-06-05 07:59:35","2024-06-05 07:59:35");
INSERT INTO permissions VALUES("730","24","88","0","2024-06-05 07:59:35","2024-06-05 07:59:35");
INSERT INTO permissions VALUES("731","24","93","0","2024-06-05 07:59:36","2024-06-05 07:59:36");
INSERT INTO permissions VALUES("732","24","94","1","2024-06-05 07:59:36","2024-06-05 07:59:36");
INSERT INTO permissions VALUES("733","24","95","0","2024-06-05 07:59:36","2024-06-05 07:59:36");
INSERT INTO permissions VALUES("734","24","96","0","2024-06-05 07:59:37","2024-06-05 07:59:37");
INSERT INTO permissions VALUES("735","24","97","0","2024-06-05 07:59:37","2024-06-05 07:59:37");
INSERT INTO permissions VALUES("736","24","98","1","2024-06-05 07:59:37","2024-06-05 07:59:37");
INSERT INTO permissions VALUES("737","24","99","0","2024-06-05 07:59:37","2024-06-05 07:59:37");
INSERT INTO permissions VALUES("738","24","100","0","2024-06-05 07:59:37","2024-06-05 07:59:37");
INSERT INTO permissions VALUES("739","24","101","0","2024-06-05 07:59:37","2024-06-05 07:59:37");
INSERT INTO permissions VALUES("740","24","102","1","2024-06-05 07:59:37","2024-06-05 07:59:37");
INSERT INTO permissions VALUES("741","24","103","0","2024-06-05 07:59:38","2024-06-05 07:59:38");
INSERT INTO permissions VALUES("742","24","104","0","2024-06-05 07:59:38","2024-06-05 07:59:38");
INSERT INTO permissions VALUES("743","24","105","0","2024-06-05 07:59:38","2024-06-05 07:59:38");
INSERT INTO permissions VALUES("744","24","106","0","2024-06-05 07:59:38","2024-06-05 07:59:38");
INSERT INTO permissions VALUES("745","24","107","0","2024-06-05 07:59:38","2024-06-05 07:59:38");
INSERT INTO permissions VALUES("746","24","108","0","2024-06-05 07:59:38","2024-06-05 07:59:38");
INSERT INTO permissions VALUES("747","2","109","1","2024-06-06 00:13:57","2024-06-06 00:14:42");
INSERT INTO permissions VALUES("748","24","109","0","2024-06-24 13:03:08","2024-06-24 13:03:08");
INSERT INTO permissions VALUES("749","2","110","1","2024-06-24 19:19:17","2024-06-24 19:20:34");
INSERT INTO permissions VALUES("750","2","111","1","2024-06-24 19:19:17","2024-06-24 19:20:34");
INSERT INTO permissions VALUES("751","2","112","1","2024-06-24 19:19:17","2024-06-24 19:20:35");
INSERT INTO permissions VALUES("752","2","113","1","2024-06-24 19:19:18","2024-06-24 19:20:34");


CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=287 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO personal_access_tokens VALUES("17","AppModelsUser","8","admin2@gmail.com_Token","5fa0bb6a50e0fa00818c244964072bc77ceb0c456348ce357fecdd34df0f3d45","[\"*\"]","0000-00-00 00:00:00","2023-06-11 05:55:35","2023-06-11 05:55:35");
INSERT INTO personal_access_tokens VALUES("33","AppModelsUser","2","admin@gmail.com_AdminToken","2e9082cb73dc0e899bee719a98a963bf0daefbfec0637243e86d29d0151e4219","[\"server:admin\"]","2023-06-14 12:58:15","2023-06-14 12:58:04","2023-06-14 12:58:15");
INSERT INTO personal_access_tokens VALUES("74","App\\Models\\User","18","admin3@gmail.com_Token","85c626e5da56e0eca26513324e83645e85331e64a5bb14d164325ca13866db0c","[\"*\"]","2024-03-03 11:41:50","2024-03-03 10:25:31","2024-03-03 11:41:50");
INSERT INTO personal_access_tokens VALUES("75","App\\Models\\User","18","admin3@gmail.com_AdminToken","1325e4f69ebd2a700700bd701101a0c209868861e3af84487f11919d0fb0b6da","[\"server:admin\"]","2024-03-03 11:50:59","2024-03-03 11:44:47","2024-03-03 11:50:59");
INSERT INTO personal_access_tokens VALUES("76","App\\Models\\User","18","admin3@gmail.com_AdminToken","9b5bc9492b3e01c0bd638ec955c1dfcfe910fab6ea9c2f7caefcaa0071b65150","[\"server:admin\"]","2024-03-03 14:07:09","2024-03-03 11:53:47","2024-03-03 14:07:09");
INSERT INTO personal_access_tokens VALUES("197","App\\Models\\User","25","admin9@gmail.com_Token","1b0117852b6777fbc043c6392660af5a07d0ba09776d73577dbdf8cc479f151f","[\"*\"]","","2024-06-05 08:03:10","2024-06-05 08:03:10");
INSERT INTO personal_access_tokens VALUES("206","App\\Models\\User","26","admin10@gmail.com_Token","00700aed157fbd4b34dbf15fb6fafc7d8a57610b474ed117c8c07c79270ab3fb","[\"client:user\"]","2024-06-05 10:23:11","2024-06-05 08:51:12","2024-06-05 10:23:11");
INSERT INTO personal_access_tokens VALUES("277","App\\Models\\User","2","admin@gmail.com_AdminToken","cabb9673ad0c6113b8eb9c41e4a38ff80a6c475b4a52bfa7a2bb3223e7517c9a","[\"server:admin\"]","2024-06-25 18:59:42","2024-06-25 17:14:17","2024-06-25 18:59:42");
INSERT INTO personal_access_tokens VALUES("286","App\\Models\\User","2","admin@gmail.com_AdminToken","d0d0c40678b067d7b76e650f68ed2b238e080db339518cff40762542f5b7d5c3","[\"server:admin\"]","2024-06-27 21:18:27","2024-06-27 20:44:54","2024-06-27 21:18:27");


CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `api_product_id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `charges` decimal(10,2) NOT NULL,
  `description` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO products VALUES("1","5","mtn_custom","MTN Airtime","3.30","0.00","MTN Airtime","uploads/products/1686017821.png","1","2023-06-06 02:17:01","2024-02-25 14:34:46");
INSERT INTO products VALUES("2","5","airtel_custom","Airtel Airtime","3.80","0.00","Airtel Airtime","uploads/products/1686018013.png","1","2023-06-06 02:20:13","2023-06-13 08:45:49");
INSERT INTO products VALUES("3","5","glo_custom","Glo Airtime","7.80","0.00","GLO Corporate Data","uploads/products/1686018059.png","1","2023-06-06 02:20:59","2023-06-13 08:46:05");
INSERT INTO products VALUES("4","5","9mobile_custom","9mobile Airtime","6.00","0.00","9mobile Airtime","uploads/products/1686018091.png","1","2023-06-06 02:21:31","2023-06-13 08:46:19");
INSERT INTO products VALUES("5","6","mtn-data-sme","MTN SME Data","0.00","0.00","MTN SME Data","uploads/products/1686019467.png","1","2023-06-06 02:44:27","2023-06-06 02:44:27");
INSERT INTO products VALUES("6","6","mtn-data-corporate","MTN Corporate Data","0.00","0.00","MTN Corporate Data","uploads/products/1686019527.jpg","1","2023-06-06 02:45:27","2023-06-06 02:45:27");
INSERT INTO products VALUES("7","6","glo-data-sme","GLO SME Data","0.00","0.00","GLO SME Data","uploads/products/1686019577.png","0","2023-06-06 02:46:17","2023-06-14 12:09:41");
INSERT INTO products VALUES("8","6","glo_corporate_data","GLO Corporate Data","0.00","0.00","GLO Corporate Data","uploads/products/1686019630.jpg","1","2023-06-06 02:47:10","2023-06-06 02:47:10");
INSERT INTO products VALUES("9","6","airtel-data-sme","AIRTEL SME Data","0.00","0.00","AIRTEL SME Data","uploads/products/1686019666.png","1","2023-06-06 02:47:46","2023-06-06 02:47:46");
INSERT INTO products VALUES("10","6","9mobile-data","9mobile SME Data","0.00","0.00","9mobile SME","uploads/products/1686019756.png","1","2023-06-06 02:49:16","2023-06-06 02:49:16");
INSERT INTO products VALUES("11","7","gotv","Gotv","0.00","0.00","Gotv","uploads/products/1686050089.png","1","2023-06-06 11:14:49","2023-06-06 11:14:49");
INSERT INTO products VALUES("12","7","dstv","Dstv","0.00","0.00","Dstv","uploads/products/1686050130.png","1","2023-06-06 11:15:30","2023-06-06 11:15:30");
INSERT INTO products VALUES("13","7","startimes","Startimes","0.00","0.00","Startimes","uploads/products/1686050243.png","1","2023-06-06 11:17:23","2023-06-06 11:17:23");
INSERT INTO products VALUES("14","8","abuja_distribution_company","Abuja Distribution Company","0.00","100.00","Abuja Distribution Company","uploads/products/1686051298.jpg","1","2023-06-06 11:34:58","2023-06-14 12:28:29");
INSERT INTO products VALUES("15","8","kaduna_distribution_company","Kaduna Distribution Company","0.00","100.00","Kaduna Distribution Company","uploads/products/1686051345.jpg","1","2023-06-06 11:35:45","2023-06-14 12:28:47");
INSERT INTO products VALUES("16","8","kano_distribution_company","Kano Distribution Company","0.00","100.00","Kano Distribution Company","uploads/products/1686051379.jpg","1","2023-06-06 11:36:19","2023-06-14 12:29:08");
INSERT INTO products VALUES("17","8","jos_distribution_company","Jos Distribution Company","0.00","100.00","Jos Distribution Company","uploads/products/1686051418.jpg","1","2023-06-06 11:36:58","2023-06-14 12:29:27");
INSERT INTO products VALUES("18","8","ibadan_distribution_company","Ibadan Distribution Company","0.00","100.00","Ibadan Distribution Company","uploads/products/1686051446.jpg","1","2023-06-06 11:37:26","2023-06-14 12:29:45");
INSERT INTO products VALUES("19","8","ikeja_distribution_company","Ikeja Distribution Company","0.00","100.00","Ikeja Distribution Company","uploads/products/1686051476.jpg","1","2023-06-06 11:37:56","2023-06-14 12:30:03");
INSERT INTO products VALUES("20","8","eko_distribution_company","Eko Distribution Company","0.00","100.00","Eko Distribution Company","uploads/products/1686051500.jpg","1","2023-06-06 11:38:20","2023-06-14 12:30:22");
INSERT INTO products VALUES("21","8","enugu_distribution_company","Enugu Distribution Company","0.00","100.00","Enugu Distribution Company","uploads/products/1686051529.jpg","1","2023-06-06 11:38:49","2023-06-14 12:30:44");
INSERT INTO products VALUES("22","8","port_harcourt_distribution_company","Port Harcourt Distribution Company","0.00","100.00","Port Harcourt Distribution Company","uploads/products/1686051553.jpg","1","2023-06-06 11:39:13","2023-06-14 12:30:59");


CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(20) NOT NULL,
  `default_permission` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO roles VALUES("53","Read all activities","read_activies","0","2024-02-29 12:00:00","2024-03-01 07:19:55");
INSERT INTO roles VALUES("55","Read Aceess Control Lists","read_acls","0","2024-02-29 12:00:00","2024-03-01 07:17:16");
INSERT INTO roles VALUES("56","Update Aceess Control Lists","update_acls","0","2024-02-29 12:00:00","2024-02-29 12:00:00");
INSERT INTO roles VALUES("57","Create Categories","create_categories","0","2024-02-29 12:00:00","2024-02-29 12:00:00");
INSERT INTO roles VALUES("58","Read Categories","read_categories","1","2024-02-29 12:00:00","2024-03-03 10:04:39");
INSERT INTO roles VALUES("59","Update Categories","update_categories","0","2024-02-29 12:00:00","2024-02-29 12:00:00");
INSERT INTO roles VALUES("60","Delete Categories","delete_categories","0","2024-02-29 12:00:00","2024-02-29 12:00:00");
INSERT INTO roles VALUES("61","Create Products","create_products","0","2024-02-29 12:00:00","2024-02-29 12:00:00");
INSERT INTO roles VALUES("62","Read Products","read_products","1","2024-02-29 12:00:00","2024-03-03 10:04:49");
INSERT INTO roles VALUES("63","Update Products","update_products","0","2024-02-29 12:00:00","2024-02-29 12:00:00");
INSERT INTO roles VALUES("64","Delete Products","delete_products","0","2024-02-29 12:00:00","2024-02-29 12:00:00");
INSERT INTO roles VALUES("65","Create Services","create_services","0","2024-02-29 12:00:00","2024-02-29 12:00:00");
INSERT INTO roles VALUES("66","Read Services","read_services","1","2024-02-29 12:00:00","2024-03-03 10:04:57");
INSERT INTO roles VALUES("67","Update Services","update_services","0","2024-02-29 12:00:00","2024-02-29 12:00:00");
INSERT INTO roles VALUES("68","Delete Services","delete_services","0","2024-02-29 12:00:00","2024-02-29 12:00:00");
INSERT INTO roles VALUES("69","Create Levels","create_levels","0","2024-02-29 12:00:00","2024-02-29 12:00:00");
INSERT INTO roles VALUES("70","Read Levels","read_levels","1","2024-02-29 12:00:00","2024-03-03 10:05:06");
INSERT INTO roles VALUES("71","Update Levels","update_levels","0","2024-02-29 12:00:00","2024-02-29 12:00:00");
INSERT INTO roles VALUES("72","Delete Levels","delete_levels","0","2024-02-29 12:00:00","2024-02-29 12:00:00");
INSERT INTO roles VALUES("73","Create APIs","create_apis","0","2024-02-29 12:00:00","2024-02-29 12:00:00");
INSERT INTO roles VALUES("74","Read APIs","read_apis","1","2024-02-29 12:00:00","2024-03-03 10:05:20");
INSERT INTO roles VALUES("75","Update APIs","update_apis","0","2024-02-29 12:00:00","2024-02-29 12:00:00");
INSERT INTO roles VALUES("76","Delete APIs","delete_apis","0","2024-02-29 12:00:00","2024-02-29 12:00:00");
INSERT INTO roles VALUES("77","Create Users","create_users","0","2024-02-29 12:00:00","2024-02-29 12:00:00");
INSERT INTO roles VALUES("78","Read Users","read_users","1","2024-02-29 12:00:00","2024-03-03 10:05:31");
INSERT INTO roles VALUES("79","Update Users","update_users","0","2024-02-29 12:00:00","2024-02-29 12:00:00");
INSERT INTO roles VALUES("80","Delete Users","delete_users","0","2024-02-29 12:00:00","2024-02-29 12:00:00");
INSERT INTO roles VALUES("85","Create Messages","create_messages","0","2024-02-29 12:00:00","2024-02-29 12:00:00");
INSERT INTO roles VALUES("86","Read Messages","read_messages","1","2024-02-29 12:00:00","2024-03-03 10:05:45");
INSERT INTO roles VALUES("87","Update Messages","update_messages","0","2024-02-29 12:00:00","2024-02-29 12:00:00");
INSERT INTO roles VALUES("88","Delete Messages","delete_messages","0","2024-02-29 12:00:00","2024-02-29 12:00:00");
INSERT INTO roles VALUES("93","Create Activities","create_activities","0","2024-02-29 12:00:00","2024-02-29 12:00:00");
INSERT INTO roles VALUES("94","Read Activities","read_activities","1","2024-02-29 12:00:00","2024-03-03 10:15:38");
INSERT INTO roles VALUES("95","Update Activities","update_activities","0","2024-02-29 12:00:00","2024-02-29 12:00:00");
INSERT INTO roles VALUES("96","Delete Activities","delete_activities","0","2024-02-29 12:00:00","2024-02-29 12:00:00");
INSERT INTO roles VALUES("97","Create DB Backups","create_db_backups","0","2024-02-29 12:00:00","2024-02-29 12:00:00");
INSERT INTO roles VALUES("98","Read DB Backups","read_db_backups","1","2024-02-29 12:00:00","2024-03-03 10:15:29");
INSERT INTO roles VALUES("99","Update DB Backups","update_db_backups","0","2024-02-29 12:00:00","2024-02-29 12:00:00");
INSERT INTO roles VALUES("100","Delete DB Backups","delete_db_backups","0","2024-02-29 12:00:00","2024-02-29 12:00:00");
INSERT INTO roles VALUES("101","Create Transactions","create_transactions","0","2024-03-01 09:04:34","2024-03-01 09:04:34");
INSERT INTO roles VALUES("102","Read Transactions","read_transactions","1","2024-03-01 09:04:34","2024-03-03 10:15:22");
INSERT INTO roles VALUES("103","Update Transactions","update_transactions","0","2024-03-01 09:04:34","2024-03-01 09:04:34");
INSERT INTO roles VALUES("104","Delete Transactions","delete_transactions","0","2024-03-01 09:04:34","2024-03-01 09:04:34");
INSERT INTO roles VALUES("105","Create IPs","create_ips","0","2024-03-17 20:22:32","2024-03-17 20:22:32");
INSERT INTO roles VALUES("106","Read IPs","read_ips","0","2024-03-17 20:22:32","2024-03-17 20:22:32");
INSERT INTO roles VALUES("107","Update IPs","update_ips","0","2024-03-17 20:22:32","2024-03-17 20:22:32");
INSERT INTO roles VALUES("108","Delete IPs","delete_ips","0","2024-03-17 20:22:32","2024-03-17 20:22:32");
INSERT INTO roles VALUES("109","Read Merchants","read_merchants","0","2024-06-06 01:13:01","2024-06-06 01:13:01");
INSERT INTO roles VALUES("110","Create discount","create_discount","0","2024-03-17 20:22:32","2024-03-17 20:22:32");
INSERT INTO roles VALUES("111","Read discounts","read_discounts","0","2024-03-17 20:22:32","2024-03-17 20:22:32");
INSERT INTO roles VALUES("112","Update discount","update_discount","0","2024-03-17 20:22:32","2024-03-17 20:22:32");
INSERT INTO roles VALUES("113","Delete discount","delete_discount","0","2024-03-17 20:22:32","2024-03-17 20:22:32");


CREATE TABLE `services` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `api_service_id` varchar(191) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO services VALUES("1","5","DATA SHARE 1GB","","220.00","data_share_1gb","1","2023-06-06 10:25:53","2024-02-25 14:36:06");
INSERT INTO services VALUES("2","5","DATA SHARE 2GB","","450.00","data_share_2gb","1","2023-06-06 10:26:30","2023-06-13 04:15:07");
INSERT INTO services VALUES("3","5","DATA SHARE 5GB","","1125.00","data_share_5gb","1","2023-06-06 10:28:48","2023-06-13 04:15:40");
INSERT INTO services VALUES("4","5","DATA SHARE 3GB","","675.00","data_share_3gb","1","2023-06-06 10:30:46","2023-06-13 04:16:06");
INSERT INTO services VALUES("5","5","DATA SHARE 500MB","","110.00","data_share_500mb","1","2023-06-06 10:31:15","2023-06-12 16:26:57");
INSERT INTO services VALUES("6","5","DATA SHARE 10GB","","2250.00","data_share_10gb","1","2023-06-06 10:31:54","2023-06-13 04:16:35");
INSERT INTO services VALUES("7","9","Data Share Airtel 100MB 7Days","","25.00","data_share_airtel_100mb_7days","1","2023-06-06 10:41:46","2023-06-13 04:22:07");
INSERT INTO services VALUES("8","9","Data Share Airtel 500MB 30Days","","110.00","data_share_airtel_500mb_30days","1","2023-06-06 10:42:12","2023-06-13 04:23:38");
INSERT INTO services VALUES("9","9","Data Share Airtel 1GB 30Days","","220.00","data_share_airtel_1gb_30days","1","2023-06-06 10:42:41","2023-06-13 04:24:04");
INSERT INTO services VALUES("10","9","Data Share Airtel 2GB 30Days","","450.00","data_share_airtel_2gb_30days","1","2023-06-06 10:43:10","2023-06-13 04:26:00");
INSERT INTO services VALUES("11","9","Data Share Airtel 5GB 30Days","","1100.00","data_share_airtel_5gb_30days","1","2023-06-06 10:44:28","2023-06-13 04:27:20");
INSERT INTO services VALUES("12","9","Data Share Airtel 10GB 30Days","","2250.00","data_share_airtel_10gb_30days","1","2023-06-06 10:44:54","2023-06-13 04:28:10");
INSERT INTO services VALUES("13","9","Data Share Airtel 15GB 30Days","","3300.00","data_share_airtel_15gb_30days","1","2023-06-06 10:45:20","2023-06-13 04:28:36");
INSERT INTO services VALUES("14","9","Data Share Airtel 20GB 30Days","","4500.00","data_share_airtel_20gb_30days","1","2023-06-06 10:45:44","2023-06-13 04:29:42");
INSERT INTO services VALUES("15","9","Data Share Airtel 300MB 7Days","","75.00","data_share_airtel_300mb_7days","1","2023-06-06 10:46:07","2023-06-13 04:30:18");
INSERT INTO services VALUES("16","10","9mobile SME 1GB","","165.00","9mobile_sme_1gb","1","2023-06-06 10:47:11","2023-06-13 04:31:13");
INSERT INTO services VALUES("17","10","9mobile SME 1.5GB","","245.00","9mobile_sme_1_5gb","1","2023-06-06 10:47:36","2023-06-13 04:31:48");
INSERT INTO services VALUES("18","10","9mobile SME 2GB","","325.00","9mobile_sme_2gb","1","2023-06-06 10:48:07","2023-06-13 04:32:29");
INSERT INTO services VALUES("19","10","9mobile SME 3GB","","4850.00","9mobile_sme_3gb","1","2023-06-06 10:48:40","2023-06-13 04:34:57");
INSERT INTO services VALUES("20","10","9mobile SME 5GB","","850.00","9mobile_sme_5gb","1","2023-06-06 10:49:27","2023-06-13 04:35:54");
INSERT INTO services VALUES("21","10","9mobile SME 10GB","","1650.00","9mobile_sme_10gb","1","2023-06-06 10:50:05","2023-06-13 04:37:05");
INSERT INTO services VALUES("22","10","9mobile SME 4GB","","650.00","9mobile_sme_4gb","1","2023-06-06 10:50:41","2023-06-13 04:39:00");
INSERT INTO services VALUES("23","10","9mobile SME 40GB","","6500.00","9mobile_sme_40gb","1","2023-06-06 10:51:08","2023-06-13 04:39:51");
INSERT INTO services VALUES("24","10","9mobile SME 7.5GB","","1250.00","9mobile_sme_7_5gb","1","2023-06-06 10:51:37","2023-06-13 04:42:07");
INSERT INTO services VALUES("25","10","9mobile SME 500MB","","85.00","9mobile_sme_500mb","1","2023-06-06 10:52:08","2023-06-13 04:42:47");
INSERT INTO services VALUES("26","10","9mobile SME 300MB","","50.00","9mobile_sme_300mb","1","2023-06-06 10:52:36","2023-06-13 04:43:22");
INSERT INTO services VALUES("27","10","9mobile SME 100MB","","30.00","9mobile_sme_100mb","1","2023-06-06 10:53:39","2023-06-13 04:44:55");
INSERT INTO services VALUES("28","10","9mobile SME 11GB","","2000.00","9mobile_sme_11gb","1","2023-06-06 10:54:11","2023-06-13 04:45:44");
INSERT INTO services VALUES("29","6","MTN Corporate Data 500MB","","116.00","mtn_corporate_data_500mb","1","2023-06-06 10:57:35","2023-06-14 12:16:50");
INSERT INTO services VALUES("30","6","MTN Corporate Data 1GB","","230.00","mtn_corporate_data_1gb","1","2023-06-06 10:58:02","2023-06-13 04:49:07");
INSERT INTO services VALUES("31","6","MTN Corporate Data 2GB","","470.00","mtn_corporate_data_2gb","1","2023-06-06 10:58:36","2023-06-13 04:50:08");
INSERT INTO services VALUES("32","6","MTN Corporate Data 3GB","","700.00","mtn_corporate_data_3gb","1","2023-06-06 10:59:08","2023-06-13 04:51:02");
INSERT INTO services VALUES("33","6","MTN Corporate Data 5GB","","1200.00","mtn_corporate_data_5gb","1","2023-06-06 10:59:54","2023-06-13 04:52:01");
INSERT INTO services VALUES("34","6","MTN Corporate Data 10GB","","2400.00","mtn_corporate_data_10gb","1","2023-06-06 11:00:29","2023-06-13 04:52:38");
INSERT INTO services VALUES("35","6","MTN Corporate Data 15GB","","3500.00","mtn_corporate_data_15gb","1","2023-06-06 11:01:01","2023-06-13 04:53:31");
INSERT INTO services VALUES("36","6","MTN Corporate Data 20GB","","4800.00","mtn_corporate_data_20gb","1","2023-06-06 11:01:26","2023-06-13 04:54:07");
INSERT INTO services VALUES("37","6","MTN Corporate Data 40GB","","9200.00","mtn_corporate_data_40gb","1","2023-06-06 11:01:58","2023-06-13 04:55:05");
INSERT INTO services VALUES("38","6","MTN Corporate Data 250MB","","60.00","mtn_corporate_data_250mb","1","2023-06-06 11:02:33","2023-06-13 04:56:07");
INSERT INTO services VALUES("39","6","MTN Corporate Data 150MB","","50.00","mtn_corporate_data_150mb","1","2023-06-06 11:03:09","2023-06-13 04:57:07");
INSERT INTO services VALUES("40","6","MTN Corporate Data 50MB","","16.00","mtn_corporate_data_50mb","1","2023-06-06 11:03:43","2023-06-13 04:57:47");
INSERT INTO services VALUES("41","6","MTN Corporate Data 25GB","","8000.00","mtn_corporate_data_25gb","0","2023-06-06 11:04:28","2023-06-13 05:01:02");
INSERT INTO services VALUES("42","6","MTN Corporate Data 75GB","","18000.00","mtn_corporate_data_75gb","1","2023-06-06 11:05:00","2023-06-13 05:02:22");
INSERT INTO services VALUES("43","6","MTN Corporate Data 100GB","","24500.00","mtn_corporate_data_100gb","1","2023-06-06 11:05:34","2023-06-13 05:03:32");
INSERT INTO services VALUES("44","8","GLO CG 200MB","","70.00","glo_cg_200mb","1","2023-06-06 11:07:18","2023-06-06 11:07:18");
INSERT INTO services VALUES("45","8","GLO CG 500MB","","125.00","glo_cg_500mb","1","2023-06-06 11:07:50","2023-06-13 05:05:54");
INSERT INTO services VALUES("46","8","GLO CG 1GB","","250.00","glo_cg_1gb","1","2023-06-06 11:08:30","2023-06-13 05:06:39");
INSERT INTO services VALUES("47","8","GLO CG 2GB","","485.00","glo_cg_2gb","1","2023-06-06 11:09:09","2023-06-13 05:07:51");
INSERT INTO services VALUES("48","8","GLO CG 3GB","","700.00","glo_cg_3gb","1","2023-06-06 11:09:45","2023-06-13 05:08:56");
INSERT INTO services VALUES("49","8","GLO CG 5GB","","1250.00","glo_cg_5gb","1","2023-06-06 11:10:14","2023-06-13 05:09:27");
INSERT INTO services VALUES("50","8","GLO CG 10GB","","2450.00","glo_cg_10gb","1","2023-06-06 11:10:39","2023-06-13 05:10:13");
INSERT INTO services VALUES("51","11","GOTv Max","","4800.00","gotv_max","1","2023-06-06 11:21:00","2023-06-13 05:12:08");
INSERT INTO services VALUES("52","11","GOTv Smallie","","1000.00","gotv_smallie","1","2023-06-06 11:21:24","2023-06-13 05:12:35");
INSERT INTO services VALUES("53","11","GOTv Jinja","","2200.00","gotv_jinja","1","2023-06-06 11:21:49","2023-06-13 05:13:06");
INSERT INTO services VALUES("54","11","Gotv Jolli","","3200.00","gotv_jolli","1","2023-06-06 11:22:12","2023-06-13 05:13:34");
INSERT INTO services VALUES("55","11","Gotv Super","","6300.00","gotv_super","0","2023-06-06 11:22:44","2023-06-13 06:56:42");
INSERT INTO services VALUES("56","12","DSTv Compact","","10350.00","dstv_compact","1","2023-06-06 11:23:30","2023-06-13 06:58:06");
INSERT INTO services VALUES("57","12","DsTv Compact Plus","","16400.00","dstv_compact_plus","1","2023-06-06 11:23:52","2023-06-13 06:58:40");
INSERT INTO services VALUES("58","12","DSTv Premium","","24350.00","dstv_premium","1","2023-06-06 11:24:15","2023-06-13 06:59:38");
INSERT INTO services VALUES("59","12","DSTv Confam","","6100.00","dstv_confam","1","2023-06-06 11:24:35","2023-06-13 07:00:09");
INSERT INTO services VALUES("60","12","Dstv Padi","","2450.00","dstv_padi","1","2023-06-06 11:24:55","2023-06-13 07:00:58");
INSERT INTO services VALUES("61","12","DSTv Yanga","","3450.00","dstv_yanga","1","2023-06-06 11:25:27","2023-06-13 07:01:39");
INSERT INTO services VALUES("62","13","StarTimes Nova","","1150.00","startimes_nova","1","2023-06-06 11:26:17","2023-06-13 07:02:34");
INSERT INTO services VALUES("63","13","StarTimes Basic","","2050.00","startimes_basic","1","2023-06-06 11:26:40","2023-06-13 07:03:06");
INSERT INTO services VALUES("64","13","StarTimes Smart","","2700.00","startimes_smart","1","2023-06-06 11:27:03","2023-06-13 07:03:23");
INSERT INTO services VALUES("65","13","StarTimes Classic","","3050.00","startimes_classic","1","2023-06-06 11:27:25","2023-06-13 07:04:02");
INSERT INTO services VALUES("66","13","StarTimes Super","","5200.00","startimes_super","1","2023-06-06 11:27:48","2023-06-13 07:04:35");
INSERT INTO services VALUES("67","14","Abuja Distribution Company Postpaid","","0.00","aedc_postpaid_custom","1","2023-06-06 11:45:57","2023-06-06 11:46:44");
INSERT INTO services VALUES("68","14","Abuja Distribution Company Prepaid","","0.00","aedc_prepaid_custom","1","2023-06-06 11:47:07","2023-06-06 11:47:07");
INSERT INTO services VALUES("69","15","Kaduna Distribution Company Postpaid","","0.00","kedco_postpaid_custom","1","2023-06-06 11:47:59","2023-06-06 11:48:22");
INSERT INTO services VALUES("70","15","Kaduna Distribution Company Prepaid","","0.00","kedco_prepaid_custom","1","2023-06-06 11:48:52","2023-06-06 11:48:52");
INSERT INTO services VALUES("71","16","Kano Distribution Company PostPaid","","0.00","kedc_postpaid_custom","1","2023-06-06 11:49:24","2023-06-06 11:49:24");
INSERT INTO services VALUES("72","16","Kano Distribution Company PrePaid","","0.00","kedc_prepaid_custom","1","2023-06-06 11:49:49","2023-06-06 11:49:49");
INSERT INTO services VALUES("73","17","Jos Distribution Company Postpaid","","0.00","jedc_postpaid_custom","1","2023-06-06 11:50:58","2023-06-06 11:50:58");
INSERT INTO services VALUES("74","17","Jos Distribution Company Prepaid","","0.00","jedc_prepaid_custom","1","2023-06-06 11:51:33","2023-06-06 11:51:33");
INSERT INTO services VALUES("75","18","Ibadan Distribution Company Postpaid","","0.00","ibedc_postpaid_custom","1","2023-06-06 11:52:24","2023-06-06 11:52:24");
INSERT INTO services VALUES("76","18","Ibadan Distribution Company Prepaid","","0.00","ibedc_pretpaid_custom","1","2023-06-06 11:53:07","2023-06-06 11:53:07");
INSERT INTO services VALUES("77","19","Ikeja Distribution Company Postpaid","","0.00","ikedc_postpaid_custom","1","2023-06-06 11:53:45","2023-06-06 11:53:45");
INSERT INTO services VALUES("78","19","Ikeja Distribution Company Prepaid","","0.00","ikedc_prepaid_custom","1","2023-06-06 11:54:06","2023-06-06 11:54:06");
INSERT INTO services VALUES("79","20","Eko Distribution Company Postpaid","","0.00","ekedc_postpaid_custom","1","2023-06-06 11:55:10","2023-06-06 11:55:10");
INSERT INTO services VALUES("80","20","Eko Distribution Company Prepaid","","0.00","ekedc_prepaid_custom","1","2023-06-06 11:55:34","2023-06-06 11:55:34");
INSERT INTO services VALUES("81","21","Enugu Distribution Company Postpaid","","0.00","eedc_postpaid_custom","1","2023-06-06 11:56:13","2023-06-06 11:56:13");
INSERT INTO services VALUES("82","21","Enugu Distribution Company Prepaid","","0.00","eedc_prepaid_custom","1","2023-06-06 11:56:34","2023-06-06 11:56:34");
INSERT INTO services VALUES("83","22","Port Harcourt Distribution Company Postpaid","","0.00","phed_postpaid_custom","1","2023-06-06 11:57:25","2023-06-06 11:57:25");
INSERT INTO services VALUES("84","22","Port Harcourt Distribution Company Postpaid","","0.00","phed_prepaid_custom","1","2023-06-06 11:57:52","2023-06-06 11:57:52");


CREATE TABLE `transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `reference` varchar(50) NOT NULL,
  `api_reference` varchar(50) DEFAULT NULL,
  `status` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO transactions VALUES("5","1","debit","6","5","3","1470.00","₦1,470 DATA SHARE 5GB","SUB320862483","","failed","2023-06-07 14:01:33","2023-06-14 08:30:03");
INSERT INTO transactions VALUES("6","1","debit","7","11","51","3565.00","₦3,565 GOTv Max","SUB1680784425","","success","2023-06-07 15:38:20","2023-06-07 15:38:20");
INSERT INTO transactions VALUES("7","1","debit","7","11","55","4704.00","₦4,704 Gotv Super","SUB1665287946","","success","2023-06-07 15:42:00","2023-06-07 15:42:00");
INSERT INTO transactions VALUES("8","1","debit","7","11","53","1654.00","₦1,654 GOTv Jinja","SUB1759074058","","success","2023-06-07 15:48:11","2023-06-07 15:48:11");
INSERT INTO transactions VALUES("9","1","debit","7","11","52","809.00","₦809 GOTv Smallie","SUB502669858","","success","2023-06-07 15:50:18","2023-06-07 15:50:18");
INSERT INTO transactions VALUES("10","1","debit","7","11","54","2426.00","₦2,426 Gotv Jolli","SUB1867490878","","success","2023-06-07 15:53:43","2023-06-07 15:53:43");
INSERT INTO transactions VALUES("11","1","debit","7","11","54","2426.00","₦2,426 Gotv Jolli","SUB214782036","","success","2023-06-07 16:04:56","2023-06-07 16:04:56");
INSERT INTO transactions VALUES("12","1","debit","7","11","54","2426.00","₦2,426 Gotv Jolli","SUB1173775357","","success","2023-06-07 16:08:07","2023-06-07 16:08:07");
INSERT INTO transactions VALUES("13","1","debit","5","1","0","74.00","₦74 MTN Airtime","SUB419781863","","success","2023-06-07 20:32:50","2023-06-07 20:32:50");
INSERT INTO transactions VALUES("14","1","debit","5","1","0","74.00","₦74 MTN Airtime","SUB543434598","","success","2023-06-07 20:34:01","2023-06-07 20:34:01");
INSERT INTO transactions VALUES("15","1","debit","5","1","0","74.00","₦74 MTN Airtime","SUB2135317798","","success","2023-06-07 20:34:50","2023-06-07 20:34:50");
INSERT INTO transactions VALUES("16","1","debit","5","1","0","74.00","₦74 MTN Airtime","SUB1553528367","","success","2023-06-07 20:54:05","2023-06-07 20:54:05");
INSERT INTO transactions VALUES("17","1","debit","5","1","0","74.00","₦74 MTN Airtime","SUB794662214","","success","2023-06-07 20:56:54","2023-06-07 20:56:54");
INSERT INTO transactions VALUES("18","1","debit","5","1","0","74.00","₦74 MTN Airtime","SUB1072577270","","success","2023-06-07 20:57:44","2023-06-07 20:57:44");
INSERT INTO transactions VALUES("19","1","debit","5","1","0","74.00","₦74 MTN Airtime","SUB2021222858","","success","2023-06-07 20:59:58","2023-06-07 20:59:58");
INSERT INTO transactions VALUES("20","1","debit","5","4","0","74.00","₦74 9mobile Airtime","SUB727853310","","success","2023-06-07 21:00:24","2023-06-07 21:00:24");
INSERT INTO transactions VALUES("21","1","debit","6","5","1","221.00","₦221 DATA SHARE 1GB","SUB118940434","","success","2023-06-07 21:00:56","2023-06-07 21:00:56");
INSERT INTO transactions VALUES("22","1","debit","7","11","52","809.00","₦809 GOTv Smallie","SUB1686242905","","success","2023-06-07 21:06:41","2023-06-07 21:06:41");
INSERT INTO transactions VALUES("23","1","debit","7","11","52","809.00","₦809 GOTv Smallie","SUB227275831","","success","2023-06-07 21:09:45","2023-06-07 21:09:45");
INSERT INTO transactions VALUES("24","1","debit","8","19","0","735.00","₦735 Ikeja Distribution Company","SUB538212631","","success","2023-06-07 21:26:54","2023-06-07 21:26:54");
INSERT INTO transactions VALUES("26","1","credit_transfer","0","0","0","100.00","₦100 sent from TOMIWA KUNLE OLUWADARE","TRANS1777863518","","success","2023-06-08 05:56:02","2023-06-08 05:56:02");
INSERT INTO transactions VALUES("27","1","debit_transfer","0","0","0","100.00","₦100 sent to TOMIWA KUNLE OLUWADARE","TRANS1230848976","","success","2023-06-08 05:56:02","2023-06-08 05:56:02");
INSERT INTO transactions VALUES("28","1","credit_transfer","0","0","0","100.00","₦100 sent from ADMIN ACCOUNT","TRANS1023661873","","success","2023-06-08 05:59:09","2023-06-08 05:59:09");
INSERT INTO transactions VALUES("29","1","debit_transfer","0","0","0","100.00","₦100 sent to ADMIN ACCOUNT","TRANS1940454089","","success","2023-06-08 05:59:09","2023-06-08 05:59:09");
INSERT INTO transactions VALUES("30","1","credit_transfer","0","0","0","41.00","₦41 sent from ADMIN ACCOUNT","TRANS591100778","","success","2023-06-08 06:06:02","2023-06-08 06:06:02");
INSERT INTO transactions VALUES("31","1","debit_transfer","0","0","0","41.00","₦41 sent to ADMIN ACCOUNT","TRANS1154970010","","success","2023-06-08 06:06:02","2023-06-08 06:06:02");
INSERT INTO transactions VALUES("32","1","credit_transfer","0","0","0","1.00","₦1 sent from ADMIN ACCOUNT","TRANS771325171","","success","2023-06-08 06:08:40","2023-06-08 06:08:40");
INSERT INTO transactions VALUES("33","1","debit_transfer","0","0","0","1.00","₦1 sent to ADMIN ACCOUNT","TRANS265977364","","success","2023-06-08 06:08:40","2023-06-08 06:08:40");
INSERT INTO transactions VALUES("34","1","credit_transfer","0","0","0","1.00","₦1 sent from ADMIN ACCOUNT","TRANS1618571225","","success","2023-06-08 06:10:50","2023-06-08 06:10:50");
INSERT INTO transactions VALUES("35","1","debit_transfer","0","0","0","1.00","₦1 sent to ADMIN ACCOUNT","TRANS1685972273","","success","2023-06-08 06:10:50","2023-06-08 06:10:50");
INSERT INTO transactions VALUES("36","1","credit_transfer","0","0","0","10.00","₦10 sent from ADMIN ACCOUNT","TRANS325707796","","success","2023-06-08 06:19:38","2023-06-08 06:19:38");
INSERT INTO transactions VALUES("37","1","debit_transfer","0","0","0","10.00","₦10 sent to TOMIWA KUNLE OLUWADARE","TRANS678184350","","success","2023-06-08 06:19:38","2023-06-08 06:19:38");
INSERT INTO transactions VALUES("38","1","credit_transfer","0","0","0","10.00","₦10 sent from ADMIN ACCOUNT","TRANS1390156311","","success","2023-06-08 06:21:26","2023-06-08 06:21:26");
INSERT INTO transactions VALUES("39","1","debit_transfer","0","0","0","10.00","₦10 sent to TOMIWA KUNLE OLUWADARE","TRANS348535001","","success","2023-06-08 06:21:26","2023-06-08 06:21:26");
INSERT INTO transactions VALUES("40","1","credit_transfer","0","0","0","100.00","₦100 sent from ADMIN ACCOUNT","TRANS346121904","","success","2023-06-08 14:42:20","2023-06-08 14:42:20");
INSERT INTO transactions VALUES("41","1","debit_transfer","0","0","0","100.00","₦100 sent to TOMIWA KUNLE OLUWADARE","TRANS703295914","","success","2023-06-08 14:42:20","2023-06-08 14:42:20");
INSERT INTO transactions VALUES("42","1","credit_transfer","0","0","0","10.00","₦10 sent from ADMIN ACCOUNT","TRANS1936523866","","success","2023-06-08 14:57:53","2023-06-08 14:57:53");
INSERT INTO transactions VALUES("43","2","debit_transfer","0","0","0","10.00","₦10 sent to TOMIWA KUNLE OLUWADARE","TRANS1049086391","","success","2023-06-08 14:57:53","2023-06-08 14:57:53");
INSERT INTO transactions VALUES("44","2","credit_transfer","0","0","0","100.00","₦100 sent from TOMIWA KUNLE OLUWADARE","TRANS1796965142","","success","2023-06-08 15:53:11","2023-06-08 15:53:11");
INSERT INTO transactions VALUES("45","1","debit_transfer","0","0","0","100.00","₦100 sent to ADMIN ACCOUNT","TRANS441303389","","success","2023-06-08 15:53:11","2023-06-08 15:53:11");
INSERT INTO transactions VALUES("46","1","debit","7","11","52","809.00","₦809 GOTv Smallie for 7023687567","SUB94171299","","success","2023-06-08 16:38:17","2023-06-08 16:38:17");
INSERT INTO transactions VALUES("47","1","debit","5","1","0","74.00","₦74 MTN Airtime","SUB93535641","","success","2023-06-08 16:39:07","2023-06-08 16:39:07");
INSERT INTO transactions VALUES("48","1","debit","5","1","0","37.00","₦37 MTN Airtime","SUB1389480312","","success","2023-06-09 11:07:32","2023-06-09 11:07:32");
INSERT INTO transactions VALUES("49","1","debit","5","1","0","37.00","₦37 MTN Airtime","SUB1266025134","","success","2023-06-09 11:08:37","2023-06-09 11:08:37");
INSERT INTO transactions VALUES("50","1","debit","5","1","0","37.00","₦37 MTN Airtime","SUB1954039700","","success","2023-06-09 11:36:34","2023-06-09 11:36:34");
INSERT INTO transactions VALUES("51","1","debit","5","1","0","37.00","₦37 MTN Airtime","SUB989819796","","success","2023-06-09 11:43:10","2023-06-09 11:43:10");
INSERT INTO transactions VALUES("52","1","debit","5","1","0","37.00","₦37 MTN Airtime","SUB1127879653","","success","2023-06-09 11:53:12","2023-06-09 11:53:12");
INSERT INTO transactions VALUES("53","1","debit","5","1","0","37.00","₦37 MTN Airtime","SUB205980544","","success","2023-06-09 11:55:32","2023-06-09 11:55:32");
INSERT INTO transactions VALUES("54","1","debit","5","1","0","37.00","₦37 MTN Airtime","SUB1104603931","","success","2023-06-09 11:58:08","2023-06-09 11:58:08");
INSERT INTO transactions VALUES("55","1","debit","5","1","0","37.00","₦37 MTN Airtime","SUB1133595523","","success","2023-06-09 12:09:15","2023-06-09 12:09:15");
INSERT INTO transactions VALUES("57","1","credit","0","0","0","102.00","₦102 Credit to your account via Monnify","SUB1062728829","SUB1291940504?paymentReference=SUB1291940504","unknown","2023-06-11 18:41:49","2023-06-11 18:41:49");
INSERT INTO transactions VALUES("58","1","credit","0","0","0","200.00","₦200 Credit to your account via Monnify","SUB1786012658","SUB615770131?paymentReference=SUB615770131","success","2023-06-11 18:47:33","2023-06-11 18:47:33");
INSERT INTO transactions VALUES("59","1","debit","5","1","0","74.00","₦74 MTN Airtime","SUB307451535","","success","2023-06-12 03:18:31","2023-06-12 03:18:31");
INSERT INTO transactions VALUES("60","1","debit","5","1","0","74.00","₦74 MTN Airtime","SUB1886656253","","success","2023-06-12 03:23:57","2023-06-12 03:23:57");
INSERT INTO transactions VALUES("61","9","credit","0","0","0","10.00","₦10 Credit to your account via Monnify","SUB1061421106","MNFY|39|20230611200934|000621","PAID","2023-06-12 05:56:22","2023-06-12 05:56:22");
INSERT INTO transactions VALUES("62","10","credit","0","0","0","1000.00","₦1,000 Credit to your account via Monnify","SUB856637233","SUB1517123382?paymentReference=SUB1517123382","success","2023-06-13 13:36:04","2023-06-13 13:36:04");
INSERT INTO transactions VALUES("63","1","credit_transfer","0","0","0","1.00","₦1 sent from Remilekun Amos","TRANS228870174","","success","2023-06-13 13:48:31","2023-06-13 13:48:31");
INSERT INTO transactions VALUES("64","10","debit_transfer","0","0","0","1.00","₦1 sent to TOMIWA KUNLE OLUWADARE","TRANS172685287","","success","2023-06-13 13:48:31","2023-06-13 13:48:31");
INSERT INTO transactions VALUES("65","10","credit","0","0","0","100.00","₦100 Credit to your account via Monnify","SUB1433350825","MNFY|39|20230613160439|000884","PAID","2023-06-13 15:07:04","2023-06-13 15:07:04");
INSERT INTO transactions VALUES("66","1","debit","5","1","0","0.00","₦0 MTN Airtime","SUB1558120862","5522646","failed","2023-06-14 08:01:50","2023-06-14 08:30:05");
INSERT INTO transactions VALUES("67","1","debit","5","1","0","0.20","₦0 MTN Airtime","SUB1212899814","5523417","failed","2023-06-14 09:17:36","2023-06-14 09:23:03");
INSERT INTO transactions VALUES("68","1","debit","5","1","0","0.20","₦0 MTN Airtime","SUB1929969443","5523619","failed","2023-06-14 09:38:52","2023-06-14 09:43:03");
INSERT INTO transactions VALUES("69","1","debit","6","6","40","16.00","₦16 MTN Corporate Data 50MB","SUB815668415","5524764","success","2023-06-14 12:18:12","2023-06-14 12:18:12");
INSERT INTO transactions VALUES("70","28","credit_transfer","","","","41.00","₦41 sent from Tomiwa Oluwadare","TRANS35590244","","success","2024-06-25 16:59:34","2024-06-25 16:59:34");
INSERT INTO transactions VALUES("71","1","debit_transfer","","","","41.00","₦41 sent to Lerry","TRANS986585585","","success","2024-06-25 16:59:34","2024-06-25 16:59:34");


CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `password` varchar(191) NOT NULL,
  `pin` varchar(191) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `access_token` varchar(50) DEFAULT NULL,
  `role_as` int(1) NOT NULL DEFAULT 0,
  `level` int(1) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1,
  `balance` decimal(10,2) DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `login_attempts` int(11) NOT NULL DEFAULT 0,
  `lockout_time` timestamp NULL DEFAULT NULL,
  `mfa` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users VALUES("1","Tomiwa Oluwadare","cafeat9ja@gmail.com","2024-06-27 21:40:32","$2y$10$6kFxcmBGtqwhB3qgvTFbeufK.Dvo0l9kJPAHAuDLE0YEluMz.BuUe","1234","","285|zL8WttoVx7UfiYM7OS345DY6GaimA9BQILvlFkXp","0","1","1","3840.40","2023-06-05 15:50:13","2024-06-27 20:40:31","0","","0");
INSERT INTO users VALUES("2","Small God","admin@gmail.com","2024-06-27 21:44:54","$2y$10$ql3JV963ShkxCSoVMz74e.F3GFYeFZZESfCsle7WXTCEEStkGEPc2","","","286|x3tvbXWKduEdVRbyHpgGG8dG0gz4qk8Gzyoqu8wd","1","1","1","227.00","2023-06-05 17:05:00","2024-06-27 20:44:54","0","","0");
INSERT INTO users VALUES("3","Ayeni Ajayi","oluwadartomiwa@gmail.com","0000-00-00 00:00:00","$2y$10$A6KX7Q1XMRagU2MGsYeeWu7qqBhazEjJsN5on2M/nHJ5j2sk/WujC","1234","","","0","1","1","0.00","2023-06-08 17:26:54","2023-06-08 17:29:41","0","","0");
INSERT INTO users VALUES("4","SME Data","oluwadaretomiwa@gmail.co","0000-00-00 00:00:00","$2y$10$H02aDYwvlcPHX0qmPPnxp.7CTkvaDYlDem19hrf5tjELitCtRsDLa","","","","0","1","1","0.00","2023-06-10 09:41:38","2023-06-10 09:41:38","0","","0");
INSERT INTO users VALUES("9","Admin 2","admin2@gmail.com","2024-06-05 06:43:31","$2y$10$ql3JV963ShkxCSoVMz74e.F3GFYeFZZESfCsle7WXTCEEStkGEPc2","","","189|zFOm3qc5ZNYewIslgITKcFXCIwWCM46YSZ3N07Wi","1","1","1","10.00","2023-06-11 05:57:26","2024-06-05 05:43:31","0","","0");
INSERT INTO users VALUES("16","TOMIWA KUNLE OLUWADARE","cafeat9ja2@gmail.com","","$2y$10$dO.nsfmajO.Y2lzbzQhVoOynv.XmskhfgUGAvxcLkgsJ00qsM9fou","","","","0","1","1","0.00","2024-02-25 13:27:35","2024-02-25 13:27:35","0","","0");
INSERT INTO users VALUES("17","-","cafeat9ja3@gmail.com","","$2y$10$MmUVjlFxe3Wf8DZNTg8CduPRHaRx5hCjL6hC.pDgsTi8F4EO7JYGa","","","","0","1","1","0.00","2024-02-25 13:29:13","2024-02-25 13:29:13","0","","0");
INSERT INTO users VALUES("18","ADMIN 3","admin3@gmail.com","2024-03-17 20:43:50","$2y$10$cXBRTzOi3fDPTGSA301s6Ovnm57JtYW0z7ixzwW2y02rV1vKRPPd6","","","76|xlHnuZ08mL5Ps9uXCTmlpUtkSIV9Cikw0dRSAEQr","1","1","1","0.00","2024-03-03 10:25:31","2024-03-17 20:43:50","0","","0");
INSERT INTO users VALUES("19","Admin 4","admin4@gmail.com","2024-06-05 08:02:34","$2y$10$JZKZ841bBtMTnIg5L2qyzuQpxQnFShGTUnmwcipETbymubrksqPvm","","","","0","1","1","0.00","2024-06-05 07:02:34","2024-06-05 07:02:34","0","","0");
INSERT INTO users VALUES("20","Admin 5","admin5@gmail.com","2024-06-05 08:09:51","$2y$10$JBWI6TwMnwK4YqjUPTiaAu.wqHXxOsh8rZZoR4Xi46Mo5QRyV1oBy","","","","0","1","1","0.00","2024-06-05 07:09:51","2024-06-05 07:09:51","0","","0");
INSERT INTO users VALUES("21","Admin 6","admin6@gmail.com","2024-06-05 08:11:14","$2y$10$5ehQeyhINxKpUoHQQG578O9mQxgZHAmxFcjtsAwK1RjIpRFtMjmKq","","","","0","1","1","0.00","2024-06-05 07:11:14","2024-06-05 07:11:14","0","","0");
INSERT INTO users VALUES("23","Admin 7","admin7@gmail.com","2024-06-05 08:21:18","$2y$10$a3h22ETS1QSALUrv7UgVZubqeWmeDcvnaqYB4k5VGFflpAO/6E5WW","","","","0","1","1","0.00","2024-06-05 07:21:18","2024-06-05 07:21:18","0","","0");
INSERT INTO users VALUES("24","Admin 8","admin8@gmail.com","2024-06-05 09:00:52","$2y$10$l5f4wOe4tmGmcXlPhREWy.bDrIagPTa3WzW4m42hRKP2g6YFUA6HC","","","196|O9I8sy7sdy58K77pIvooLfP2chzaSw5Fg8TdvFc0","1","1","1","0.00","2024-06-05 07:24:51","2024-06-05 08:00:52","0","","0");
INSERT INTO users VALUES("25","Admin 9","admin9@gmail.com","2024-06-05 09:03:09","$2y$10$K8jlXFwXfXZxcCl08mAzWeK1FGEw6mSQgyTT/2VwWAUip1XsXaJy6","","","","0","1","1","0.00","2024-06-05 08:03:09","2024-06-05 08:03:09","0","","0");
INSERT INTO users VALUES("26","Admin 10","admin10@gmail.com","2024-06-05 09:51:13","$2y$10$lQtf9RZE.rpFDb.UQtsJBuhVzoFJk46jajPMgln0yBUb8snk.9rEi","","","206|3b9n2JuFMHImrRKkdhRKDnOkWie939ayfqcBkIfn","0","1","1","0.00","2024-06-05 08:08:21","2024-06-05 08:51:13","0","","0");
INSERT INTO users VALUES("27","Admin 11","admin11@gmail.com","2024-06-05 09:13:32","$2y$10$RymYYcggPhNsWXAMC5JqEux00cmhZe06pMTFuyAC05ssEsTVmFvdG","","","","0","1","1","0.00","2024-06-05 08:13:32","2024-06-05 08:13:32","0","","0");
INSERT INTO users VALUES("28","Lerry","user@gmail.com","2024-06-25 17:59:34","$2y$10$wMqLalbZUj9oPZPepumlOuZ./e6VBlq12qJZdU1D5ziXurvfoiNXu","","","263|FxErnLHEtoYSjCWgrCgXl4dkW8pssycxpdofFcJw","0","1","1","41.00","2024-06-25 02:32:29","2024-06-25 16:59:34","0","","0");
