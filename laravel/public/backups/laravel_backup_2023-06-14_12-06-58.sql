

CREATE TABLE `activity_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) NOT NULL,
  `title` varchar(191) NOT NULL,
  `log` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO activity_logs VALUES("1","bulk_email","Happy Holidays",'a:3:{s:4:"name";s:11:"Ayeni Ajayi";s:5:"title";s:14:"Happy Holidays";s:7:"message";s:797:"Dear  Esteemed Partner,

Happy Good Friday and Easter Celebrations from us to you!

We hope that you enjoy this time with your family, friends and loved ones. Good Friday is a time for reflection and remembering the sacrifice of Jesus, and Easter is a time for celebration and new beginnings.

We would like to take this opportunity to thank you for your continued support and loyalty. We are grateful for the trust you have placed in us and we look forward to continuing to serve you in the future.

As we prepare to celebrate the Easter holiday, let us all take this time to reflect on the true meaning of Easter, and to celebrate the gift of life and the joy of family.

Thank you again for your loyalty and we wish you a safe and happy Easter holiday.

From all of us at Vtpass,

Happy Easter!";}',"2023-06-10 03:31:01","2023-06-10 03:31:01");
INSERT INTO activity_logs VALUES("2","bulk_email","Happy Holidays",'a:3:{s:4:"name";s:11:"Ayeni Ajayi";s:5:"title";s:14:"Happy Holidays";s:7:"message";s:797:"Dear  Esteemed Partner,

Happy Good Friday and Easter Celebrations from us to you!

We hope that you enjoy this time with your family, friends and loved ones. Good Friday is a time for reflection and remembering the sacrifice of Jesus, and Easter is a time for celebration and new beginnings.

We would like to take this opportunity to thank you for your continued support and loyalty. We are grateful for the trust you have placed in us and we look forward to continuing to serve you in the future.

As we prepare to celebrate the Easter holiday, let us all take this time to reflect on the true meaning of Easter, and to celebrate the gift of life and the joy of family.

Thank you again for your loyalty and we wish you a safe and happy Easter holiday.

From all of us at Vtpass,

Happy Easter!";}',"2023-06-10 03:46:05","2023-06-10 03:46:05");
INSERT INTO activity_logs VALUES("3","bulk_email","Happy Holidays",'a:3:{s:4:"name";s:11:"Ayeni Ajayi";s:5:"title";s:14:"Happy Holidays";s:7:"message";s:774:"Happy Good Friday and Easter Celebrations from us to you!

We hope that you enjoy this time with your family, friends and loved ones. Good Friday is a time for reflection and remembering the sacrifice of Jesus, and Easter is a time for celebration and new beginnings.

We would like to take this opportunity to thank you for your continued support and loyalty. We are grateful for the trust you have placed in us and we look forward to continuing to serve you in the future.

As we prepare to celebrate the Easter holiday, let us all take this time to reflect on the true meaning of Easter, and to celebrate the gift of life and the joy of family.

Thank you again for your loyalty and we wish you a safe and happy Easter holiday.

From all of us at Sub4Data,

Happy Easter!";}',"2023-06-10 04:08:14","2023-06-10 04:08:14");
INSERT INTO activity_logs VALUES("4","bulk_email","Happy Holidays",'a:3:{s:4:"name";s:11:"Ayeni Ajayi";s:5:"title";s:14:"Happy Holidays";s:7:"message";s:772:"Happy Good Friday and Easter Celebrations from us to you!

We hope that you enjoy this time with your family, friends and loved ones. Good Friday is a time for reflection and remembering the sacrifice of Jesus, and Easter is a time for celebration and new beginnings.

We would like to take this opportunity to thank you for your continued support and loyalty. We are grateful for the trust you have placed in us and we look forward to continuing to serve you in the future.

As we prepare to celebrate the Easter holiday, let us all take this time to reflect on the true meaning of Easter, and to celebrate the gift of life and the joy of family.

Thank you again for your loyalty and we wish you a safe and happy Easter holiday.

From all of us at Vtpass,

Happy Easter!";}',"2023-06-10 04:11:33","2023-06-10 04:11:33");
INSERT INTO activity_logs VALUES("5","monnify_credit","Monnify Merchant Credit Payment",'a:8:{s:4:"name";s:22:"TOMIWA KUNLE OLUWADARE";s:5:"email";s:19:"cafeat9ja@gmail.com";s:5:"title";s:47:"[Debit Transaction] Thank you for your purchase";s:7:"balance";d:3743.5;s:9:"reference";s:12:"SUB826558396";s:5:"price";s:3:"100";s:11:"description";s:41:"₦100 Credit to your account via Monnify";s:10:order_date";s:19:"2023-06-11 18:12:37";}',"2023-06-11 18:12:41","2023-06-11 18:12:41");
INSERT INTO activity_logs VALUES("6","monnify_credit","Monnify Merchant Credit Payment",'a:8:{s:4:"name";s:22:"TOMIWA KUNLE OLUWADARE";s:5:"email";s:19:"cafeat9ja@gmail.com";s:5:"title";s:47:"[Debit Transaction] Thank you for your purchase";s:7:"balance";d:3743.5;s:9:"reference";s:13:"SUB1234547564";s:5:"price";s:3:"100";s:11:"description";s:41:"₦100 Credit to your account via Monnify";s:10:order_date";s:19:"2023-06-11 18:13:47";}',"2023-06-11 18:13:51","2023-06-11 18:13:51");
INSERT INTO activity_logs VALUES("7","monnify_credit","Monnify Merchant Credit Payment",'a:8:{s:4:"name";s:22:"TOMIWA KUNLE OLUWADARE";s:5:"email";s:19:"cafeat9ja@gmail.com";s:5:"title";s:47:"[Debit Transaction] Thank you for your purchase";s:7:"balance";d:3845;s:9:"reference";s:13:"SUB1062728829";s:5:"price";s:3:"102";s:11:"description";s:41:"₦102 Credit to your account via Monnify";s:10:order_date";s:19:"2023-06-11 18:41:45";}',"2023-06-11 18:41:49","2023-06-11 18:41:49");
INSERT INTO activity_logs VALUES("8","monnify_credit","Monnify Merchant Credit Payment",'a:8:{s:4:"name";s:22:"TOMIWA KUNLE OLUWADARE";s:5:"email";s:19:"cafeat9ja@gmail.com";s:5:"title";s:47:"[Debit Transaction] Thank you for your purchase";s:7:"balance";d:4045;s:9:"reference";s:13:"SUB1786012658";s:5:"price";s:3:"200";s:11:"description";s:41:"₦200 Credit to your account via Monnify";s:10:order_date";s:19:"2023-06-11 18:47:28";}',"2023-06-11 18:47:32","2023-06-11 18:47:32");
INSERT INTO activity_logs VALUES("9","debit","₦74 MTN Airtime",'a:8:{s:4:"name";s:22:"TOMIWA KUNLE OLUWADARE";s:5:"email";s:19:"cafeat9ja@gmail.com";s:5:"title";s:47:"[Debit Transaction] Thank you for your purchase";s:7:"balance";d:3971.5;s:9:"reference";s:12:"SUB307451535";s:5:"price";s:2:"74";s:11:"description";s:17:"₦74 MTN Airtime";s:10:order_date";s:19:"2023-06-12 03:18:27";}',"2023-06-12 03:18:31","2023-06-12 03:18:31");
INSERT INTO activity_logs VALUES("10","debit","₦74 MTN Airtime",'a:8:{s:4:"name";s:22:"TOMIWA KUNLE OLUWADARE";s:5:"email";s:19:"cafeat9ja@gmail.com";s:5:"title";s:47:"[Debit Transaction] Thank you for your purchase";s:7:"balance";d:3898;s:9:"reference";s:13:"SUB1886656253";s:5:"price";s:2:"74";s:11:"description";s:17:"₦74 MTN Airtime";s:10:order_date";s:19:"2023-06-12 03:23:52";}',"2023-06-12 03:23:57","2023-06-12 03:23:57");
INSERT INTO activity_logs VALUES("11","monnify_credit","Monnify Merchant Credit Payment",'a:8:{s:4:"name";s:16:"Electricity Bill";s:5:"email";s:16:"admin2@gmail.com";s:5:"title";s:37:"[Credit Transaction] Payment Received";s:7:"balance";i:10;s:9:"reference";s:13:"SUB1061421106";s:5:"price";s:2:"10";s:11:"description";s:40:"₦10 Credit to your account via Monnify";s:10:order_date";s:19:"2023-06-12 05:56:14";}',"2023-06-12 05:56:22","2023-06-12 05:56:22");
INSERT INTO activity_logs VALUES("12","monnify_credit","Monnify Merchant Credit Payment",'a:8:{s:4:"name";s:14:"Remilekun Amos";s:5:"email";s:25:"oluwadaretomiwa@gmail.com";s:5:"title";s:37:"[Credit Transaction] Payment received";s:7:"balance";i:1000;s:9:"reference";s:12:"SUB856637233";s:5:"price";s:5:"1,000";s:11:"description";s:43:"₦1,000 Credit to your account via Monnify";s:10:order_date";s:19:"2023-06-13 13:35:59";}',"2023-06-13 13:36:04","2023-06-13 13:36:04");
INSERT INTO activity_logs VALUES("13","credit_transfer","₦1 sent from Remilekun Amos",'a:8:{s:4:"name";s:14:"Remilekun Amos";s:5:"email";s:25:"oluwadaretomiwa@gmail.com";s:5:"title";s:29:"[Credit Transaction] Transfer";s:7:"balance";d:999;s:9:"reference";s:14:"TRANS172685287";s:5:"price";s:1:"1";s:11:"description";s:35:"₦1 sent to TOMIWA KUNLE OLUWADARE";s:10:order_date";s:19:"2023-06-13 13:48:22";}',"2023-06-13 13:48:25","2023-06-13 13:48:25");
INSERT INTO activity_logs VALUES("14","debit_transfer","₦1 sent to TOMIWA KUNLE OLUWADARE",'a:8:{s:4:"name";s:22:"TOMIWA KUNLE OLUWADARE";s:5:"email";s:19:"cafeat9ja@gmail.com";s:5:"title";s:28:"[Debit Transaction] Transfer";s:7:"balance";d:3899;s:9:"reference";s:14:"TRANS228870174";s:5:"price";s:1:"1";s:11:"description";s:29:"₦1 sent from Remilekun Amos";s:10:order_date";s:19:"2023-06-13 13:48:25";}',"2023-06-13 13:48:31","2023-06-13 13:48:31");
INSERT INTO activity_logs VALUES("15","monnify_credit","Monnify Merchant Credit Payment",'a:8:{s:4:"name";s:14:"Remilekun Amos";s:5:"email";s:25:"oluwadaretomiwa@gmail.com";s:5:"title";s:37:"[Credit Transaction] Payment Received";s:7:"balance";d:1099;s:9:"reference";s:13:"SUB1433350825";s:5:"price";s:3:"100";s:11:"description";s:41:"₦100 Credit to your account via Monnify";s:10:order_date";s:19:"2023-06-13 15:07:00";}',"2023-06-13 15:07:04","2023-06-13 15:07:04");
INSERT INTO activity_logs VALUES("16","debit","₦0 MTN Airtime",'a:8:{s:4:"name";s:22:"TOMIWA KUNLE OLUWADARE";s:5:"email";s:19:"cafeat9ja@gmail.com";s:5:"title";s:47:"[Debit Transaction] Thank you for your purchase";s:7:"balance";d:3898.8;s:9:"reference";s:13:"SUB1558120862";s:5:"price";s:1:"0";s:11:"description";s:16:"₦0 MTN Airtime";s:10:order_date";s:19:"2023-06-14 08:01:41";}',"2023-06-14 08:01:50","2023-06-14 08:01:50");
INSERT INTO activity_logs VALUES("17","debit","₦0 MTN Airtime",'a:8:{s:4:"name";s:22:"TOMIWA KUNLE OLUWADARE";s:5:"email";s:19:"cafeat9ja@gmail.com";s:5:"title";s:47:"[Debit Transaction] Thank you for your purchase";s:7:"balance";d:3898.6000000000004;s:9:"reference";s:13:"SUB1212899814";s:5:"price";s:1:"0";s:11:"description";s:16:"₦0 MTN Airtime";s:10:order_date";s:19:"2023-06-14 09:17:30";}',"2023-06-14 09:17:36","2023-06-14 09:17:36");
INSERT INTO activity_logs VALUES("18","credit","Refunded ₦0 MTN Airtime",'a:8:{s:4:"name";s:22:"TOMIWA KUNLE OLUWADARE";s:5:"email";s:19:"cafeat9ja@gmail.com";s:5:"title";s:47:"[Debit Transaction] Thank you for your purchase";s:7:"balance";d:3898.4;s:9:"reference";s:7:"5523417";s:5:"price";s:1:"0";s:11:"description";s:25:"Refunded ₦0 MTN Airtime";s:10:order_date";s:19:"2023-06-14 09:18:03";}',"2023-06-14 09:18:07","2023-06-14 09:18:07");
INSERT INTO activity_logs VALUES("19","credit","Refunded ₦0 MTN Airtime",'a:8:{s:4:"name";s:22:"TOMIWA KUNLE OLUWADARE";s:5:"email";s:19:"cafeat9ja@gmail.com";s:5:"title";s:47:"[Debit Transaction] Thank you for your purchase";s:7:"balance";d:3898.4;s:9:"reference";s:7:"5523417";s:5:"price";s:1:"0";s:11:"description";s:25:"Refunded ₦0 MTN Airtime";s:10:order_date";s:19:"2023-06-14 09:19:04";}',"2023-06-14 09:19:08","2023-06-14 09:19:08");
INSERT INTO activity_logs VALUES("20","credit","Refunded ₦0 MTN Airtime",'a:8:{s:4:"name";s:22:"TOMIWA KUNLE OLUWADARE";s:5:"email";s:19:"cafeat9ja@gmail.com";s:5:"title";s:47:"[Debit Transaction] Thank you for your purchase";s:7:"balance";d:3898.4;s:9:"reference";s:7:"5523417";s:5:"price";s:1:"0";s:11:"description";s:25:"Refunded ₦0 MTN Airtime";s:10:order_date";s:19:"2023-06-14 09:20:03";}',"2023-06-14 09:20:07","2023-06-14 09:20:07");
INSERT INTO activity_logs VALUES("21","credit","Refunded ₦0 MTN Airtime",'a:8:{s:4:"name";s:22:"TOMIWA KUNLE OLUWADARE";s:5:"email";s:19:"cafeat9ja@gmail.com";s:5:"title";s:47:"[Debit Transaction] Thank you for your purchase";s:7:"balance";d:3898.4;s:9:"reference";s:7:"5523417";s:5:"price";s:1:"0";s:11:"description";s:25:"Refunded ₦0 MTN Airtime";s:10:order_date";s:19:"2023-06-14 09:21:03";}',"2023-06-14 09:21:07","2023-06-14 09:21:07");
INSERT INTO activity_logs VALUES("22","credit","Refunded ₦0 MTN Airtime",'a:8:{s:4:"name";s:22:"TOMIWA KUNLE OLUWADARE";s:5:"email";s:19:"cafeat9ja@gmail.com";s:5:"title";s:47:"[Debit Transaction] Thank you for your purchase";s:7:"balance";d:3898.4;s:9:"reference";s:7:"5523417";s:5:"price";s:1:"0";s:11:"description";s:25:"Refunded ₦0 MTN Airtime";s:10:order_date";s:19:"2023-06-14 09:22:03";}',"2023-06-14 09:22:06","2023-06-14 09:22:06");
INSERT INTO activity_logs VALUES("23","credit","Refunded ₦0 MTN Airtime",'a:8:{s:4:"name";s:22:"TOMIWA KUNLE OLUWADARE";s:5:"email";s:19:"cafeat9ja@gmail.com";s:5:"title";s:47:"[Debit Transaction] Thank you for your purchase";s:7:"balance";d:3898.4;s:9:"reference";s:7:"5523417";s:5:"price";s:1:"0";s:11:"description";s:25:"Refunded ₦0 MTN Airtime";s:10:order_date";s:19:"2023-06-14 09:23:03";}',"2023-06-14 09:23:07","2023-06-14 09:23:07");
INSERT INTO activity_logs VALUES("24","debit","₦0 MTN Airtime",'a:8:{s:4:"name";s:22:"TOMIWA KUNLE OLUWADARE";s:5:"email";s:19:"cafeat9ja@gmail.com";s:5:"title";s:47:"[Debit Transaction] Thank you for your purchase";s:7:"balance";d:3898.4;s:9:"reference";s:13:"SUB1929969443";s:5:"price";s:1:"0";s:11:"description";s:16:"₦0 MTN Airtime";s:10:order_date";s:19:"2023-06-14 09:38:47";}',"2023-06-14 09:38:52","2023-06-14 09:38:52");
INSERT INTO activity_logs VALUES("25","credit","Refunded ₦0 MTN Airtime",'a:8:{s:4:"name";s:22:"TOMIWA KUNLE OLUWADARE";s:5:"email";s:19:"cafeat9ja@gmail.com";s:5:"title";s:47:"[Debit Transaction] Thank you for your purchase";s:7:"balance";d:3898.2000000000003;s:9:"reference";s:7:"5523619";s:5:"price";s:1:"0";s:11:"description";s:25:"Refunded ₦0 MTN Airtime";s:10:order_date";s:19:"2023-06-14 09:39:03";}',"2023-06-14 09:39:07","2023-06-14 09:39:07");
INSERT INTO activity_logs VALUES("26","credit","Refunded ₦0 MTN Airtime",'a:8:{s:4:"name";s:22:"TOMIWA KUNLE OLUWADARE";s:5:"email";s:19:"cafeat9ja@gmail.com";s:5:"title";s:47:"[Debit Transaction] Thank you for your purchase";s:7:"balance";d:3898;s:9:"reference";s:7:"5523619";s:5:"price";s:1:"0";s:11:"description";s:25:"Refunded ₦0 MTN Airtime";s:10:order_date";s:19:"2023-06-14 09:40:03";}',"2023-06-14 09:40:07","2023-06-14 09:40:07");
INSERT INTO activity_logs VALUES("27","credit","Refunded ₦0 MTN Airtime",'a:8:{s:4:"name";s:22:"TOMIWA KUNLE OLUWADARE";s:5:"email";s:19:"cafeat9ja@gmail.com";s:5:"title";s:47:"[Debit Transaction] Thank you for your purchase";s:7:"balance";d:3897.8;s:9:"reference";s:7:"5523619";s:5:"price";s:1:"0";s:11:"description";s:25:"Refunded ₦0 MTN Airtime";s:10:order_date";s:19:"2023-06-14 09:41:03";}',"2023-06-14 09:41:07","2023-06-14 09:41:07");
INSERT INTO activity_logs VALUES("28","credit","Refunded ₦0 MTN Airtime",'a:8:{s:4:"name";s:22:"TOMIWA KUNLE OLUWADARE";s:5:"email";s:19:"cafeat9ja@gmail.com";s:5:"title";s:47:"[Debit Transaction] Thank you for your purchase";s:7:"balance";d:3897.6000000000004;s:9:"reference";s:7:"5523619";s:5:"price";s:1:"0";s:11:"description";s:25:"Refunded ₦0 MTN Airtime";s:10:order_date";s:19:"2023-06-14 09:42:03";}',"2023-06-14 09:42:07","2023-06-14 09:42:07");
INSERT INTO activity_logs VALUES("29","credit","Refunded ₦0 MTN Airtime",'a:8:{s:4:"name";s:22:"TOMIWA KUNLE OLUWADARE";s:5:"email";s:19:"cafeat9ja@gmail.com";s:5:"title";s:47:"[Debit Transaction] Thank you for your purchase";s:7:"balance";d:3897.4;s:9:"reference";s:7:"5523619";s:5:"price";s:1:"0";s:11:"description";s:25:"Refunded ₦0 MTN Airtime";s:10:order_date";s:19:"2023-06-14 09:43:04";}',"2023-06-14 09:43:09","2023-06-14 09:43:09");
INSERT INTO activity_logs VALUES("30","debit","₦16 MTN Corporate Data 50MB",'a:8:{s:4:"name";s:22:"TOMIWA KUNLE OLUWADARE";s:5:"email";s:19:"cafeat9ja@gmail.com";s:5:"title";s:47:"[Debit Transaction] Thank you for your purchase";s:7:"balance";d:3881.4;s:9:"reference";s:12:"SUB815668415";s:5:"price";s:2:"16";s:11:"description";s:29:"₦16 MTN Corporate Data 50MB";s:10:order_date";s:19:"2023-06-14 12:18:08";}',"2023-06-14 12:18:12","2023-06-14 12:18:12");



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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO api VALUES("1","monnify","MK_TEST_URAHPHAT77","78DLT2XQ6KFM2HYVRSAUPSR9LEHHWMAE","https://sandbox.monnify.com","0426346591","1.5","","");
INSERT INTO api VALUES("2","smartrecharge","5yu3wd7jord06w4hvu54cadhju0y6f5bgs1","","https://smartrechargeapi.com/api/v2","","","","");



CREATE TABLE `banks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `bank_name` varchar(191) NOT NULL,
  `account_name` varchar(191) NOT NULL,
  `account_number` varchar(191) NOT NULL,
  `reference` varchar(191) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO banks VALUES("6","9","Wema bank","Ele","5000358118","ELECT1686463044","2023-06-11 05:57:26","2023-06-11 05:57:26");
INSERT INTO banks VALUES("7","10","Wema bank","Rem","5000390667","REMIL1686661296","2023-06-13 13:01:38","2023-06-13 13:01:38");



CREATE TABLE `cart` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(191) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO categories VALUES("5","Airtime Purchase","null","null","airtime","airtime","Airtime","null","uploads/categories/1686016177.svg","1","2023-06-05 18:01:15","2023-06-06 01:49:37");
INSERT INTO categories VALUES("6","Data Purchase","null","null","data","datashare","Data","null","uploads/categories/1686016240.jpg","1","2023-06-06 01:50:40","2023-06-06 02:43:10");
INSERT INTO categories VALUES("7","Bill Payment","","","bill","tv","Bill Payment","","uploads/categories/1686049956.jpg","1","2023-06-06 11:12:36","2023-06-06 11:12:36");
INSERT INTO categories VALUES("8","Electricity Bill","","","electricity","electric","Electricity Bill","","uploads/categories/1686049982.jpg","1","2023-06-06 11:13:02","2023-06-06 11:13:02");



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

INSERT INTO levels VALUES("1","Basic","1","0","1","","2023-06-13 09:02:58");
INSERT INTO levels VALUES("2","Agent","2","2","1","","2023-06-13 08:56:10");



CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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



CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO personal_access_tokens VALUES("17","App\Models\User","8","admin2@gmail.com_Token","5fa0bb6a50e0fa00818c244964072bc77ceb0c456348ce357fecdd34df0f3d45","['*']","","2023-06-11 05:55:35","2023-06-11 05:55:35");
INSERT INTO personal_access_tokens VALUES("33","App\Models\User","2","admin@gmail.com_AdminToken","2e9082cb73dc0e899bee719a98a963bf0daefbfec0637243e86d29d0151e4219","['server:admin']","2023-06-14 12:58:15","2023-06-14 12:58:04","2023-06-14 12:58:15");



CREATE TABLE `pin_resets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) NOT NULL,
  `token` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO pin_resets VALUES("1","cafeat9ja@gmail.com","21436","2023-06-09 14:41:44","2023-06-09 14:41:44");
INSERT INTO pin_resets VALUES("7","cafeat9ja@gmail.com","65775","2023-06-09 14:57:11","2023-06-09 14:57:11");
INSERT INTO pin_resets VALUES("8","cafeat9ja@gmail.com","66265","2023-06-09 15:12:53","2023-06-09 15:12:53");



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

INSERT INTO products VALUES("1","5","mtn_custom","MTN Airtime","3.30","0.00","MTN Airtime","uploads/products/1686017821.png","1","2023-06-06 02:17:01","2023-06-13 08:44:28");
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

INSERT INTO services VALUES("1","5","DATA SHARE 1GB","","220.00","data_share_1gb","1","2023-06-06 10:25:53","2023-06-13 04:24:20");
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
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO transactions VALUES("5","1","debit","6","5","3","1470.00","₦1,470 DATA SHARE 5GB","SUB320862483","","failed","2023-06-07 14:01:33","2023-06-14 08:30:03");
INSERT INTO transactions VALUES("6","1","debit","7","11","51","3565.00","₦3,565 GOTv Max","SUB1680784425","","success","2023-06-07 15:38:20","2023-06-07 15:38:20");
INSERT INTO transactions VALUES("7","1","debit","7","11","55","4704.00","₦4,704 Gotv Super","SUB1665287946","","success","2023-06-07 15:42:00","2023-06-07 15:42:00");
INSERT INTO transactions VALUES("8","1","debit","7","11","53","1654.00","₦1,654 GOTv Jinja","SUB1759074058","","success","2023-06-07 15:48:11","2023-06-07 15:48:11");
INSERT INTO transactions VALUES("9","1","debit","7","11","52","809.00","₦809 GOTv Smallie","SUB502669858","","success","2023-06-07 15:50:18","2023-06-07 15:50:18");
INSERT INTO transactions VALUES("10","1","debit","7","11","54","2426.00","₦2,426 Gotv Jolli","SUB1867490878","","success","2023-06-07 15:53:43","2023-06-07 15:53:43");
INSERT INTO transactions VALUES("11","1","debit","7","11","54","2426.00","₦2,426 Gotv Jolli","SUB214782036","","success","2023-06-07 16:04:56","2023-06-07 16:04:56");
INSERT INTO transactions VALUES("12","1","debit","7","11","54","2426.00","₦2,426 Gotv Jolli","SUB1173775357","","success","2023-06-07 16:08:07","2023-06-07 16:08:07");
INSERT INTO transactions VALUES("13","1","debit","5","1","","74.00","₦74 MTN Airtime","SUB419781863","","success","2023-06-07 20:32:50","2023-06-07 20:32:50");
INSERT INTO transactions VALUES("14","1","debit","5","1","","74.00","₦74 MTN Airtime","SUB543434598","","success","2023-06-07 20:34:01","2023-06-07 20:34:01");
INSERT INTO transactions VALUES("15","1","debit","5","1","","74.00","₦74 MTN Airtime","SUB2135317798","","success","2023-06-07 20:34:50","2023-06-07 20:34:50");
INSERT INTO transactions VALUES("16","1","debit","5","1","","74.00","₦74 MTN Airtime","SUB1553528367","","success","2023-06-07 20:54:05","2023-06-07 20:54:05");
INSERT INTO transactions VALUES("17","1","debit","5","1","","74.00","₦74 MTN Airtime","SUB794662214","","success","2023-06-07 20:56:54","2023-06-07 20:56:54");
INSERT INTO transactions VALUES("18","1","debit","5","1","","74.00","₦74 MTN Airtime","SUB1072577270","","success","2023-06-07 20:57:44","2023-06-07 20:57:44");
INSERT INTO transactions VALUES("19","1","debit","5","1","","74.00","₦74 MTN Airtime","SUB2021222858","","success","2023-06-07 20:59:58","2023-06-07 20:59:58");
INSERT INTO transactions VALUES("20","1","debit","5","4","","74.00","₦74 9mobile Airtime","SUB727853310","","success","2023-06-07 21:00:24","2023-06-07 21:00:24");
INSERT INTO transactions VALUES("21","1","debit","6","5","1","221.00","₦221 DATA SHARE 1GB","SUB118940434","","success","2023-06-07 21:00:56","2023-06-07 21:00:56");
INSERT INTO transactions VALUES("22","1","debit","7","11","52","809.00","₦809 GOTv Smallie","SUB1686242905","","success","2023-06-07 21:06:41","2023-06-07 21:06:41");
INSERT INTO transactions VALUES("23","1","debit","7","11","52","809.00","₦809 GOTv Smallie","SUB227275831","","success","2023-06-07 21:09:45","2023-06-07 21:09:45");
INSERT INTO transactions VALUES("24","1","debit","8","19","","735.00","₦735 Ikeja Distribution Company","SUB538212631","","success","2023-06-07 21:26:54","2023-06-07 21:26:54");
INSERT INTO transactions VALUES("26","1","credit_transfer","","","","100.00","₦100 sent from TOMIWA KUNLE OLUWADARE","TRANS1777863518","","success","2023-06-08 05:56:02","2023-06-08 05:56:02");
INSERT INTO transactions VALUES("27","1","debit_transfer","","","","100.00","₦100 sent to TOMIWA KUNLE OLUWADARE","TRANS1230848976","","success","2023-06-08 05:56:02","2023-06-08 05:56:02");
INSERT INTO transactions VALUES("28","1","credit_transfer","","","","100.00","₦100 sent from ADMIN ACCOUNT","TRANS1023661873","","success","2023-06-08 05:59:09","2023-06-08 05:59:09");
INSERT INTO transactions VALUES("29","1","debit_transfer","","","","100.00","₦100 sent to ADMIN ACCOUNT","TRANS1940454089","","success","2023-06-08 05:59:09","2023-06-08 05:59:09");
INSERT INTO transactions VALUES("30","1","credit_transfer","","","","41.00","₦41 sent from ADMIN ACCOUNT","TRANS591100778","","success","2023-06-08 06:06:02","2023-06-08 06:06:02");
INSERT INTO transactions VALUES("31","1","debit_transfer","","","","41.00","₦41 sent to ADMIN ACCOUNT","TRANS1154970010","","success","2023-06-08 06:06:02","2023-06-08 06:06:02");
INSERT INTO transactions VALUES("32","1","credit_transfer","","","","1.00","₦1 sent from ADMIN ACCOUNT","TRANS771325171","","success","2023-06-08 06:08:40","2023-06-08 06:08:40");
INSERT INTO transactions VALUES("33","1","debit_transfer","","","","1.00","₦1 sent to ADMIN ACCOUNT","TRANS265977364","","success","2023-06-08 06:08:40","2023-06-08 06:08:40");
INSERT INTO transactions VALUES("34","1","credit_transfer","","","","1.00","₦1 sent from ADMIN ACCOUNT","TRANS1618571225","","success","2023-06-08 06:10:50","2023-06-08 06:10:50");
INSERT INTO transactions VALUES("35","1","debit_transfer","","","","1.00","₦1 sent to ADMIN ACCOUNT","TRANS1685972273","","success","2023-06-08 06:10:50","2023-06-08 06:10:50");
INSERT INTO transactions VALUES("36","1","credit_transfer","","","","10.00","₦10 sent from ADMIN ACCOUNT","TRANS325707796","","success","2023-06-08 06:19:38","2023-06-08 06:19:38");
INSERT INTO transactions VALUES("37","1","debit_transfer","","","","10.00","₦10 sent to TOMIWA KUNLE OLUWADARE","TRANS678184350","","success","2023-06-08 06:19:38","2023-06-08 06:19:38");
INSERT INTO transactions VALUES("38","1","credit_transfer","","","","10.00","₦10 sent from ADMIN ACCOUNT","TRANS1390156311","","success","2023-06-08 06:21:26","2023-06-08 06:21:26");
INSERT INTO transactions VALUES("39","1","debit_transfer","","","","10.00","₦10 sent to TOMIWA KUNLE OLUWADARE","TRANS348535001","","success","2023-06-08 06:21:26","2023-06-08 06:21:26");
INSERT INTO transactions VALUES("40","1","credit_transfer","","","","100.00","₦100 sent from ADMIN ACCOUNT","TRANS346121904","","success","2023-06-08 14:42:20","2023-06-08 14:42:20");
INSERT INTO transactions VALUES("41","1","debit_transfer","","","","100.00","₦100 sent to TOMIWA KUNLE OLUWADARE","TRANS703295914","","success","2023-06-08 14:42:20","2023-06-08 14:42:20");
INSERT INTO transactions VALUES("42","1","credit_transfer","","","","10.00","₦10 sent from ADMIN ACCOUNT","TRANS1936523866","","success","2023-06-08 14:57:53","2023-06-08 14:57:53");
INSERT INTO transactions VALUES("43","2","debit_transfer","","","","10.00","₦10 sent to TOMIWA KUNLE OLUWADARE","TRANS1049086391","","success","2023-06-08 14:57:53","2023-06-08 14:57:53");
INSERT INTO transactions VALUES("44","2","credit_transfer","","","","100.00","₦100 sent from TOMIWA KUNLE OLUWADARE","TRANS1796965142","","success","2023-06-08 15:53:11","2023-06-08 15:53:11");
INSERT INTO transactions VALUES("45","1","debit_transfer","","","","100.00","₦100 sent to ADMIN ACCOUNT","TRANS441303389","","success","2023-06-08 15:53:11","2023-06-08 15:53:11");
INSERT INTO transactions VALUES("46","1","debit","7","11","52","809.00","₦809 GOTv Smallie for 7023687567","SUB94171299","","success","2023-06-08 16:38:17","2023-06-08 16:38:17");
INSERT INTO transactions VALUES("47","1","debit","5","1","","74.00","₦74 MTN Airtime","SUB93535641","","success","2023-06-08 16:39:07","2023-06-08 16:39:07");
INSERT INTO transactions VALUES("48","1","debit","5","1","","37.00","₦37 MTN Airtime","SUB1389480312","","success","2023-06-09 11:07:32","2023-06-09 11:07:32");
INSERT INTO transactions VALUES("49","1","debit","5","1","","37.00","₦37 MTN Airtime","SUB1266025134","","success","2023-06-09 11:08:37","2023-06-09 11:08:37");
INSERT INTO transactions VALUES("50","1","debit","5","1","","37.00","₦37 MTN Airtime","SUB1954039700","","success","2023-06-09 11:36:34","2023-06-09 11:36:34");
INSERT INTO transactions VALUES("51","1","debit","5","1","","37.00","₦37 MTN Airtime","SUB989819796","","success","2023-06-09 11:43:10","2023-06-09 11:43:10");
INSERT INTO transactions VALUES("52","1","debit","5","1","","37.00","₦37 MTN Airtime","SUB1127879653","","success","2023-06-09 11:53:12","2023-06-09 11:53:12");
INSERT INTO transactions VALUES("53","1","debit","5","1","","37.00","₦37 MTN Airtime","SUB205980544","","success","2023-06-09 11:55:32","2023-06-09 11:55:32");
INSERT INTO transactions VALUES("54","1","debit","5","1","","37.00","₦37 MTN Airtime","SUB1104603931","","success","2023-06-09 11:58:08","2023-06-09 11:58:08");
INSERT INTO transactions VALUES("55","1","debit","5","1","","37.00","₦37 MTN Airtime","SUB1133595523","","success","2023-06-09 12:09:15","2023-06-09 12:09:15");
INSERT INTO transactions VALUES("57","1","credit","","","","102.00","₦102 Credit to your account via Monnify","SUB1062728829","SUB1291940504?paymentReference=SUB1291940504","unknown","2023-06-11 18:41:49","2023-06-11 18:41:49");
INSERT INTO transactions VALUES("58","1","credit","","","","200.00","₦200 Credit to your account via Monnify","SUB1786012658","SUB615770131?paymentReference=SUB615770131","success","2023-06-11 18:47:33","2023-06-11 18:47:33");
INSERT INTO transactions VALUES("59","1","debit","5","1","","74.00","₦74 MTN Airtime","SUB307451535","","success","2023-06-12 03:18:31","2023-06-12 03:18:31");
INSERT INTO transactions VALUES("60","1","debit","5","1","","74.00","₦74 MTN Airtime","SUB1886656253","","success","2023-06-12 03:23:57","2023-06-12 03:23:57");
INSERT INTO transactions VALUES("61","9","credit","","","","10.00","₦10 Credit to your account via Monnify","SUB1061421106","MNFY|39|20230611200934|000621","PAID","2023-06-12 05:56:22","2023-06-12 05:56:22");
INSERT INTO transactions VALUES("62","10","credit","","","","1000.00","₦1,000 Credit to your account via Monnify","SUB856637233","SUB1517123382?paymentReference=SUB1517123382","success","2023-06-13 13:36:04","2023-06-13 13:36:04");
INSERT INTO transactions VALUES("63","1","credit_transfer","","","","1.00","₦1 sent from Remilekun Amos","TRANS228870174","","success","2023-06-13 13:48:31","2023-06-13 13:48:31");
INSERT INTO transactions VALUES("64","10","debit_transfer","","","","1.00","₦1 sent to TOMIWA KUNLE OLUWADARE","TRANS172685287","","success","2023-06-13 13:48:31","2023-06-13 13:48:31");
INSERT INTO transactions VALUES("65","10","credit","","","","100.00","₦100 Credit to your account via Monnify","SUB1433350825","MNFY|39|20230613160439|000884","PAID","2023-06-13 15:07:04","2023-06-13 15:07:04");
INSERT INTO transactions VALUES("66","1","debit","5","1","","0.00","₦0 MTN Airtime","SUB1558120862","5522646","failed","2023-06-14 08:01:50","2023-06-14 08:30:05");
INSERT INTO transactions VALUES("67","1","debit","5","1","","0.20","₦0 MTN Airtime","SUB1212899814","5523417","failed","2023-06-14 09:17:36","2023-06-14 09:23:03");
INSERT INTO transactions VALUES("68","1","debit","5","1","","0.20","₦0 MTN Airtime","SUB1929969443","5523619","failed","2023-06-14 09:38:52","2023-06-14 09:43:03");
INSERT INTO transactions VALUES("69","1","debit","6","6","40","16.00","₦16 MTN Corporate Data 50MB","SUB815668415","5524764","success","2023-06-14 12:18:12","2023-06-14 12:18:12");



CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `pin` varchar(191) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `role_as` int(1) NOT NULL DEFAULT 0,
  `level` int(1) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1,
  `balance` decimal(10,2) DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users VALUES("1","TOMIWA KUNLE OLUWADARE","cafeat9ja@gmail.com","","$2y$10$TLmZs67yBHt4DuwQDAD9eOh3FB4fyudpWH.8AR45ai98/YAig7ZYW","1111","","0","1","1","3881.40","2023-06-05 15:50:13","2023-06-14 12:18:12");
INSERT INTO users VALUES("2","ADMIN ACCOUNT","admin@gmail.com","","$2y$10$ql3JV963ShkxCSoVMz74e.F3GFYeFZZESfCsle7WXTCEEStkGEPc2","","","1","1","1","227.00","2023-06-05 17:05:00","2023-06-08 15:53:11");
INSERT INTO users VALUES("3","Ayeni Ajayi","oluwadartomiwa@gmail.com","","$2y$10$A6KX7Q1XMRagU2MGsYeeWu7qqBhazEjJsN5on2M/nHJ5j2sk/WujC","1234","","0","1","1","0.00","2023-06-08 17:26:54","2023-06-08 17:29:41");
INSERT INTO users VALUES("4","SME Data","oluwadaretomiwa@gmail.co","","$2y$10$H02aDYwvlcPHX0qmPPnxp.7CTkvaDYlDem19hrf5tjELitCtRsDLa","","","0","1","1","0.00","2023-06-10 09:41:38","2023-06-10 09:41:38");
INSERT INTO users VALUES("9","Electricity Bill","admin2@gmail.com","","$2y$10$ar8Uc5TLkghvidt862tczuVSrH6NCwi21qosj7l4VM05gRQvoXPZy","","","0","1","1","10.00","2023-06-11 05:57:26","2023-06-12 05:56:22");
INSERT INTO users VALUES("10","Remilekun Amos","oluwadaretomiwa@gmail.com","","$2y$10$pdgbvZcAjqWh.EtVZN0W4OwPfRYlinx04ElBeZzTksqqQ9xvZcyPi","1234","","0","1","1","1099.00","2023-06-13 13:01:38","2023-06-13 15:07:04");

