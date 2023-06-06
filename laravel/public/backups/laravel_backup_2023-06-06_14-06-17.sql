

CREATE TABLE `banks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(191) NOT NULL,
  `account_name` varchar(191) NOT NULL,
  `account_number` varchar(191) NOT NULL,
  `reference` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




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
  `name` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `image` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO categories VALUES("5","Airtime Purchase","null","null","airtime","Airtime","null","uploads/categories/1686016177.svg","1","2023-06-05 18:01:15","2023-06-06 01:49:37");
INSERT INTO categories VALUES("6","Data Purchase","null","null","data","Data","null","uploads/categories/1686016240.jpg","1","2023-06-06 01:50:40","2023-06-06 02:43:10");
INSERT INTO categories VALUES("7","Bill Payment","","","bill","Bill Payment","","uploads/categories/1686049956.jpg","1","2023-06-06 11:12:36","2023-06-06 11:12:36");
INSERT INTO categories VALUES("8","Electricity Bill","","","electricity","Electricity Bill","","uploads/categories/1686049982.jpg","1","2023-06-06 11:13:02","2023-06-06 11:13:02");



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
  `level` int(11) NOT NULL,
  `percentage` int(11) NOT NULL DEFAULT 99,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO levels VALUES("1","1","99","","");
INSERT INTO levels VALUES("2","2","98","","");



CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO migrations VALUES("35","2014_10_12_000000_create_users_table","1");
INSERT INTO migrations VALUES("36","2014_10_12_100000_create_password_resets_table","1");
INSERT INTO migrations VALUES("37","2019_08_19_000000_create_failed_jobs_table","1");
INSERT INTO migrations VALUES("38","2019_12_14_000001_create_personal_access_tokens_table","1");
INSERT INTO migrations VALUES("39","2022_02_18_142516_create_categories_table","1");
INSERT INTO migrations VALUES("40","2022_02_20_174544_create_products_table","1");
INSERT INTO migrations VALUES("41","2022_03_02_190454_create_cart_table","1");
INSERT INTO migrations VALUES("42","2022_03_05_175831_create_orders_table","1");
INSERT INTO migrations VALUES("43","2022_03_05_180122_create_order_items_table","1");
INSERT INTO migrations VALUES("44","2023_06_03_101104_create_services_table","1");
INSERT INTO migrations VALUES("45","2023_06_04_152425_create_levels_table","2");
INSERT INTO migrations VALUES("46","2023_06_05_151410_create_banks_table","3");



CREATE TABLE `order_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `firstname` varchar(191) NOT NULL,
  `lastname` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `city` varchar(191) NOT NULL,
  `state` varchar(191) NOT NULL,
  `zipcode` varchar(191) NOT NULL,
  `payment_id` varchar(191) DEFAULT NULL,
  `payment_mode` varchar(191) NOT NULL,
  `tracking_no` varchar(191) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `remark` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO personal_access_tokens VALUES("19","App\Models\User","2","admin@gmail.com_AdminToken","db8ee9a13391a616df2a159ec28a617f209b202c792b7cb35b9bd01509e24cfe","["server:admin"]","2023-06-06 14:17:31","2023-06-06 12:08:42","2023-06-06 14:17:31");



CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `meta_title` varchar(191) NOT NULL,
  `meta_keyword` varchar(191) DEFAULT NULL,
  `meta_description` varchar(191) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO products VALUES("1","5","mtn-airtime","MTN Airtime","MTN Airtime","","","","uploads/products/1686017821.png","1","2023-06-06 02:17:01","2023-06-06 02:17:01");
INSERT INTO products VALUES("2","5","airtel-airtime","Airtel Airtime","Airtel Airtime","","","","uploads/products/1686018013.png","1","2023-06-06 02:20:13","2023-06-06 02:20:13");
INSERT INTO products VALUES("3","5","glo-airtime","Glo Airtime","GLO Corporate Data","","","","uploads/products/1686018059.png","1","2023-06-06 02:20:59","2023-06-06 02:20:59");
INSERT INTO products VALUES("4","5","9mobile-airtime","9mobile Airtime","9mobile Airtime","","","","uploads/products/1686018091.png","1","2023-06-06 02:21:31","2023-06-06 02:21:31");
INSERT INTO products VALUES("5","6","mtn-data-sme","MTN SME Data","MTN SME Data","","","","uploads/products/1686019467.png","1","2023-06-06 02:44:27","2023-06-06 02:44:27");
INSERT INTO products VALUES("6","6","mtn-data-corporate","MTN Corporate Data","MTN Corporate Data","","","","uploads/products/1686019527.jpg","1","2023-06-06 02:45:27","2023-06-06 02:45:27");
INSERT INTO products VALUES("7","6","glo-data-sme","GLO SME Data","GLO SME Data","","","","uploads/products/1686019577.png","1","2023-06-06 02:46:17","2023-06-06 02:46:17");
INSERT INTO products VALUES("8","6","glo_corporate_data","GLO Corporate Data","GLO Corporate Data","","","","uploads/products/1686019630.jpg","1","2023-06-06 02:47:10","2023-06-06 02:47:10");
INSERT INTO products VALUES("9","6","airtel-data-sme","AIRTEL SME Data","AIRTEL SME Data","","","","uploads/products/1686019666.png","1","2023-06-06 02:47:46","2023-06-06 02:47:46");
INSERT INTO products VALUES("10","6","9mobile-data","9mobile SME Data","9mobile SME","","","","uploads/products/1686019756.png","1","2023-06-06 02:49:16","2023-06-06 02:49:16");
INSERT INTO products VALUES("11","7","gotv","Gotv","Gotv","","","","uploads/products/1686050089.png","1","2023-06-06 11:14:49","2023-06-06 11:14:49");
INSERT INTO products VALUES("12","7","dstv","Dstv","Dstv","","","","uploads/products/1686050130.png","1","2023-06-06 11:15:30","2023-06-06 11:15:30");
INSERT INTO products VALUES("13","7","startimes","Startimes","Startimes","","","","uploads/products/1686050243.png","1","2023-06-06 11:17:23","2023-06-06 11:17:23");
INSERT INTO products VALUES("14","8","abuja_distribution_company","Abuja Distribution Company","Abuja Distribution Company","","","","uploads/products/1686051298.jpg","1","2023-06-06 11:34:58","2023-06-06 11:34:58");
INSERT INTO products VALUES("15","8","kaduna_distribution_company","Kaduna Distribution Company","Kaduna Distribution Company","","","","uploads/products/1686051345.jpg","1","2023-06-06 11:35:45","2023-06-06 11:35:45");
INSERT INTO products VALUES("16","8","kano_distribution_company","Kano Distribution Company","Kano Distribution Company","","","","uploads/products/1686051379.jpg","1","2023-06-06 11:36:19","2023-06-06 11:36:19");
INSERT INTO products VALUES("17","8","jos_distribution_company","Jos Distribution Company","Jos Distribution Company","","","","uploads/products/1686051418.jpg","1","2023-06-06 11:36:58","2023-06-06 11:36:58");
INSERT INTO products VALUES("18","8","ibadan_distribution_company","Ibadan Distribution Company","Ibadan Distribution Company","","","","uploads/products/1686051446.jpg","1","2023-06-06 11:37:26","2023-06-06 11:37:26");
INSERT INTO products VALUES("19","8","ikeja_distribution_company","Ikeja Distribution Company","Ikeja Distribution Company","","","","uploads/products/1686051476.jpg","1","2023-06-06 11:37:56","2023-06-06 11:37:56");
INSERT INTO products VALUES("20","8","eko_distribution_company","Eko Distribution Company","Eko Distribution Company","","","","uploads/products/1686051500.jpg","1","2023-06-06 11:38:20","2023-06-06 11:38:20");
INSERT INTO products VALUES("21","8","enugu_distribution_company","Enugu Distribution Company","Enugu Distribution Company","","","","uploads/products/1686051529.jpg","1","2023-06-06 11:38:49","2023-06-06 11:38:49");
INSERT INTO products VALUES("22","8","port_harcourt_distribution_company","Port Harcourt Distribution Company","Port Harcourt Distribution Company","","","","uploads/products/1686051553.jpg","1","2023-06-06 11:39:13","2023-06-06 11:39:13");



CREATE TABLE `services` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `price` varchar(191) NOT NULL,
  `api_servie_id` varchar(191) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO services VALUES("1","5","DATA SHARE 1GB","","300","data_share_1gb","1","2023-06-06 10:25:53","2023-06-06 10:25:53");
INSERT INTO services VALUES("2","5","DATA SHARE 2GB","","600","data_share_2gb","1","2023-06-06 10:26:30","2023-06-06 10:26:30");
INSERT INTO services VALUES("3","5","DATA SHARE 5GB","","1500","data_share_5gb","1","2023-06-06 10:28:48","2023-06-06 10:28:48");
INSERT INTO services VALUES("4","5","DATA SHARE 3GB","","900","data_share_3gb","1","2023-06-06 10:30:46","2023-06-06 10:30:46");
INSERT INTO services VALUES("5","5","DATA SHARE 500MB","","150","data_share_500mb","1","2023-06-06 10:31:15","2023-06-06 10:31:15");
INSERT INTO services VALUES("6","5","DATA SHARE 10GB","","3000","data_share_10gb","1","2023-06-06 10:31:54","2023-06-06 10:31:54");
INSERT INTO services VALUES("7","9","Data Share Airtel 100MB 7Days","","35","data_share_airtel_100mb_7days","1","2023-06-06 10:41:46","2023-06-06 10:41:46");
INSERT INTO services VALUES("8","9","Data Share Airtel 500MB 30Days","","175","data_share_airtel_500mb_30days","1","2023-06-06 10:42:12","2023-06-06 10:42:12");
INSERT INTO services VALUES("9","9","Data Share Airtel 1GB 30Days","","350","data_share_airtel_1gb_30days","1","2023-06-06 10:42:41","2023-06-06 10:42:41");
INSERT INTO services VALUES("10","9","Data Share Airtel 2GB 30Days","","700","data_share_airtel_2gb_30days","1","2023-06-06 10:43:10","2023-06-06 10:43:10");
INSERT INTO services VALUES("11","9","Data Share Airtel 5GB 30Days","","1750","data_share_airtel_5gb_30days","1","2023-06-06 10:44:28","2023-06-06 10:44:28");
INSERT INTO services VALUES("12","9","Data Share Airtel 10GB 30Days","","3500","data_share_airtel_10gb_30days","1","2023-06-06 10:44:54","2023-06-06 10:44:54");
INSERT INTO services VALUES("13","9","Data Share Airtel 15GB 30Days","","5250","data_share_airtel_15gb_30days","1","2023-06-06 10:45:20","2023-06-06 10:45:20");
INSERT INTO services VALUES("14","9","Data Share Airtel 20GB 30Days","","7000","data_share_airtel_20gb_30days","1","2023-06-06 10:45:44","2023-06-06 10:45:44");
INSERT INTO services VALUES("15","9","Data Share Airtel 300MB 7Days","","105","data_share_airtel_300mb_7days","1","2023-06-06 10:46:07","2023-06-06 10:46:07");
INSERT INTO services VALUES("16","10","9mobile SME 1GB","","500","9mobile_sme_1gb","1","2023-06-06 10:47:11","2023-06-06 10:47:11");
INSERT INTO services VALUES("17","10","9mobile SME 1.5GB","","750","9mobile_sme_1_5gb","1","2023-06-06 10:47:36","2023-06-06 10:47:36");
INSERT INTO services VALUES("18","10","9mobile SME 2GB","","1000","9mobile_sme_2gb","1","2023-06-06 10:48:07","2023-06-06 10:48:07");
INSERT INTO services VALUES("19","10","9mobile SME 3GB","","1500","9mobile_sme_3gb","1","2023-06-06 10:48:40","2023-06-06 10:48:40");
INSERT INTO services VALUES("20","10","9mobile SME 5GB","","2500","9mobile_sme_5gb","1","2023-06-06 10:49:27","2023-06-06 10:49:27");
INSERT INTO services VALUES("21","10","9mobile SME 10GB","","5000","9mobile_sme_10gb","1","2023-06-06 10:50:05","2023-06-06 10:50:05");
INSERT INTO services VALUES("22","10","9mobile SME 4GB","","2000","9mobile_sme_4gb","1","2023-06-06 10:50:41","2023-06-06 10:50:41");
INSERT INTO services VALUES("23","10","9mobile SME 40GB","","20000","9mobile_sme_40gb","1","2023-06-06 10:51:08","2023-06-06 10:51:08");
INSERT INTO services VALUES("24","10","9mobile SME 7.5GB","","3750","9mobile_sme_7_5gb","1","2023-06-06 10:51:37","2023-06-06 10:51:37");
INSERT INTO services VALUES("25","10","9mobile SME 500MB","","250","9mobile_sme_500mb","1","2023-06-06 10:52:08","2023-06-06 10:52:08");
INSERT INTO services VALUES("26","10","9mobile SME 300MB","","150","9mobile_sme_300mb","1","2023-06-06 10:52:36","2023-06-06 10:53:08");
INSERT INTO services VALUES("27","10","9mobile SME 100MB","","50","9mobile_sme_100mb","1","2023-06-06 10:53:39","2023-06-06 10:53:39");
INSERT INTO services VALUES("28","10","9mobile SME 11GB","","5500","9mobile_sme_11gb","1","2023-06-06 10:54:11","2023-06-06 10:54:11");
INSERT INTO services VALUES("29","6",""MTN Corporate Data 500MB","","175","mtn_corporate_data_500mb","1","2023-06-06 10:57:35","2023-06-06 10:57:35");
INSERT INTO services VALUES("30","6","MTN Corporate Data 1GB","","350","mtn_corporate_data_1gb","1","2023-06-06 10:58:02","2023-06-06 10:58:02");
INSERT INTO services VALUES("31","6","MTN Corporate Data 2GB","","700","mtn_corporate_data_2gb","1","2023-06-06 10:58:36","2023-06-06 10:58:36");
INSERT INTO services VALUES("32","6","MTN Corporate Data 3GB","","1050","mtn_corporate_data_3gb","1","2023-06-06 10:59:08","2023-06-06 10:59:08");
INSERT INTO services VALUES("33","6","MTN Corporate Data 5GB","","1750","mtn_corporate_data_5gb","1","2023-06-06 10:59:54","2023-06-06 10:59:54");
INSERT INTO services VALUES("34","6","MTN Corporate Data 10GB","","3500","mtn_corporate_data_10gb","1","2023-06-06 11:00:29","2023-06-06 11:00:29");
INSERT INTO services VALUES("35","6","MTN Corporate Data 15GB","","5250","mtn_corporate_data_15gb","1","2023-06-06 11:01:01","2023-06-06 11:01:01");
INSERT INTO services VALUES("36","6","MTN Corporate Data 20GB","","7000","mtn_corporate_data_20gb","1","2023-06-06 11:01:26","2023-06-06 11:01:26");
INSERT INTO services VALUES("37","6","MTN Corporate Data 40GB","","14000","mtn_corporate_data_40gb","1","2023-06-06 11:01:58","2023-06-06 11:01:58");
INSERT INTO services VALUES("38","6","MTN Corporate Data 250MB","","87.50","mtn_corporate_data_250mb","1","2023-06-06 11:02:33","2023-06-06 11:02:33");
INSERT INTO services VALUES("39","6","MTN Corporate Data 150MB","","52.50","mtn_corporate_data_150mb","1","2023-06-06 11:03:09","2023-06-06 11:03:09");
INSERT INTO services VALUES("40","6","MTN Corporate Data 50MB","","17.50","mtn_corporate_data_50mb","1","2023-06-06 11:03:43","2023-06-06 11:03:43");
INSERT INTO services VALUES("41","6","MTN Corporate Data 25GB","","8750","mtn_corporate_data_25gb","1","2023-06-06 11:04:28","2023-06-06 11:04:28");
INSERT INTO services VALUES("42","6","MTN Corporate Data 75GB","","26250","mtn_corporate_data_75gb","1","2023-06-06 11:05:00","2023-06-06 11:05:00");
INSERT INTO services VALUES("43","6","MTN Corporate Data 100GB","","35000","mtn_corporate_data_100gb","1","2023-06-06 11:05:34","2023-06-06 11:05:34");
INSERT INTO services VALUES("44","8","GLO CG 200MB","","70","glo_cg_200mb","1","2023-06-06 11:07:18","2023-06-06 11:07:18");
INSERT INTO services VALUES("45","8","GLO CG 500MB","","175","glo_cg_500mb","1","2023-06-06 11:07:50","2023-06-06 11:07:50");
INSERT INTO services VALUES("46","8","GLO CG 1GB","","350","glo_cg_1gb","1","2023-06-06 11:08:30","2023-06-06 11:08:30");
INSERT INTO services VALUES("47","8","GLO CG 2GB","","700","glo_cg_2gb","1","2023-06-06 11:09:09","2023-06-06 11:09:09");
INSERT INTO services VALUES("48","8","GLO CG 3GB","","1050","glo_cg_3gb","1","2023-06-06 11:09:45","2023-06-06 11:09:45");
INSERT INTO services VALUES("49","8","GLO CG 5GB","","1750","glo_cg_5gb","1","2023-06-06 11:10:14","2023-06-06 11:10:14");
INSERT INTO services VALUES("50","8","GLO CG 10GB","","3500","glo_cg_10gb","1","2023-06-06 11:10:39","2023-06-06 11:10:39");
INSERT INTO services VALUES("51","11","GOTv Max","","4850","gotv_max","1","2023-06-06 11:21:00","2023-06-06 11:21:00");
INSERT INTO services VALUES("52","11","GOTv Smallie","","1100","gotv_smallie","1","2023-06-06 11:21:24","2023-06-06 11:21:24");
INSERT INTO services VALUES("53","11","GOTv Jinja","","2250","gotv_jinja","1","2023-06-06 11:21:49","2023-06-06 11:21:49");
INSERT INTO services VALUES("54","11","Gotv Jolli","","3300","gotv_jolli","1","2023-06-06 11:22:12","2023-06-06 11:22:12");
INSERT INTO services VALUES("55","11","Gotv Super","","6400","gotv_super","1","2023-06-06 11:22:44","2023-06-06 11:22:44");
INSERT INTO services VALUES("56","12","DSTv Compact","","10500","dstv_compact","1","2023-06-06 11:23:30","2023-06-06 11:23:30");
INSERT INTO services VALUES("57","12","DsTv Compact Plus","","16600","dstv_compact_plus","1","2023-06-06 11:23:52","2023-06-06 11:23:52");
INSERT INTO services VALUES("58","12","DSTv Premium","","24500","dstv_premium","1","2023-06-06 11:24:15","2023-06-06 11:24:15");
INSERT INTO services VALUES("59","12","DSTv Confam","","6200","dstv_confam","1","2023-06-06 11:24:35","2023-06-06 11:24:35");
INSERT INTO services VALUES("60","12","Dstv Padi","","2500","dstv_padi","1","2023-06-06 11:24:55","2023-06-06 11:24:55");
INSERT INTO services VALUES("61","12","DSTv Yanga","","2500","dstv_yanga","1","2023-06-06 11:25:27","2023-06-06 11:25:27");
INSERT INTO services VALUES("62","13","StarTimes Nova","","1200","startimes_nova","1","2023-06-06 11:26:17","2023-06-06 11:26:17");
INSERT INTO services VALUES("63","13","StarTimes Basic","","2100","startimes_basic","1","2023-06-06 11:26:40","2023-06-06 11:26:40");
INSERT INTO services VALUES("64","13","StarTimes Smart","","2800","startimes_smart","1","2023-06-06 11:27:03","2023-06-06 11:27:03");
INSERT INTO services VALUES("65","13","StarTimes Classic","","3100","startimes_classic","1","2023-06-06 11:27:25","2023-06-06 11:27:25");
INSERT INTO services VALUES("66","13","StarTimes Super","","5300","startimes_super","1","2023-06-06 11:27:48","2023-06-06 11:27:48");
INSERT INTO services VALUES("67","14","Abuja Distribution Company Postpaid","","0","aedc_postpaid_custom","1","2023-06-06 11:45:57","2023-06-06 11:46:44");
INSERT INTO services VALUES("68","14","Abuja Distribution Company Prepaid","","0","aedc_prepaid_custom","1","2023-06-06 11:47:07","2023-06-06 11:47:07");
INSERT INTO services VALUES("69","15","Kaduna Distribution Company Postpaid","","0","kedco_postpaid_custom","1","2023-06-06 11:47:59","2023-06-06 11:48:22");
INSERT INTO services VALUES("70","15","Kaduna Distribution Company Prepaid","","0","kedco_prepaid_custom","1","2023-06-06 11:48:52","2023-06-06 11:48:52");
INSERT INTO services VALUES("71","16","Kano Distribution Company PostPaid","","0","kedc_postpaid_custom","1","2023-06-06 11:49:24","2023-06-06 11:49:24");
INSERT INTO services VALUES("72","16","Kano Distribution Company PrePaid","","0","kedc_prepaid_custom","1","2023-06-06 11:49:49","2023-06-06 11:49:49");
INSERT INTO services VALUES("73","17","Jos Distribution Company Postpaid","","0","jedc_postpaid_custom","1","2023-06-06 11:50:58","2023-06-06 11:50:58");
INSERT INTO services VALUES("74","17","Jos Distribution Company Prepaid","","0","jedc_prepaid_custom","1","2023-06-06 11:51:33","2023-06-06 11:51:33");
INSERT INTO services VALUES("75","18","Ibadan Distribution Company Postpaid","","0","ibedc_postpaid_custom","1","2023-06-06 11:52:24","2023-06-06 11:52:24");
INSERT INTO services VALUES("76","18","Ibadan Distribution Company Prepaid","","0","ibedc_pretpaid_custom","1","2023-06-06 11:53:07","2023-06-06 11:53:07");
INSERT INTO services VALUES("77","19","Ikeja Distribution Company Postpaid","","0","ikedc_postpaid_custom","1","2023-06-06 11:53:45","2023-06-06 11:53:45");
INSERT INTO services VALUES("78","19","Ikeja Distribution Company Prepaid","","0","ikedc_prepaid_custom","1","2023-06-06 11:54:06","2023-06-06 11:54:06");
INSERT INTO services VALUES("79","20","Eko Distribution Company Postpaid","","0","ekedc_postpaid_custom","1","2023-06-06 11:55:10","2023-06-06 11:55:10");
INSERT INTO services VALUES("80","20","Eko Distribution Company Prepaid","","0","ekedc_prepaid_custom","1","2023-06-06 11:55:34","2023-06-06 11:55:34");
INSERT INTO services VALUES("81","21","Enugu Distribution Company Postpaid","","0","eedc_postpaid_custom","1","2023-06-06 11:56:13","2023-06-06 11:56:13");
INSERT INTO services VALUES("82","21","Enugu Distribution Company Prepaid","","0","eedc_prepaid_custom","1","2023-06-06 11:56:34","2023-06-06 11:56:34");
INSERT INTO services VALUES("83","22","Port Harcourt Distribution Company Postpaid","","0","phed_postpaid_custom","1","2023-06-06 11:57:25","2023-06-06 11:57:25");
INSERT INTO services VALUES("84","22","Port Harcourt Distribution Company Postpaid","","0","phed_prepaid_custom","1","2023-06-06 11:57:52","2023-06-06 11:57:52");



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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users VALUES("1","TOMIWA KUNLE OLUWADARE","cafeat9ja@gmail.com","","$2y$10$ys8OcRuGt.ZgumfoI7/EEedwVsONicLlqHSNg24S27oBJqklMAZ/6","","","0","1","1","2023-06-05 15:50:13","2023-06-05 15:50:13");
INSERT INTO users VALUES("2","TOMIWA KUNLE OLUWADARE","admin@gmail.com","","$2y$10$ql3JV963ShkxCSoVMz74e.F3GFYeFZZESfCsle7WXTCEEStkGEPc2","","","1","1","1","2023-06-05 17:05:00","2023-06-05 17:05:00");

