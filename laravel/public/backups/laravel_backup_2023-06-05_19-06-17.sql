

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO categories VALUES("1","Airtime Purchase","","","airtime","Airtime","","uploads/categories/1685985355.svg","0","2023-06-05 17:15:55","2023-06-05 17:15:55");
INSERT INTO categories VALUES("2","Airtime Purchase","","","airtime","Airtime","","uploads/categories/1685985720.svg","0","2023-06-05 17:22:00","2023-06-05 17:22:00");
INSERT INTO categories VALUES("3","Airtime Purchase","","","airtime","Airtime","","uploads/categories/1685987807.svg","0","2023-06-05 17:56:47","2023-06-05 17:56:47");
INSERT INTO categories VALUES("4","Airtime Purchase","","","airtime","Airtime","","uploads/categories/1685987935.svg","0","2023-06-05 17:58:55","2023-06-05 17:58:55");
INSERT INTO categories VALUES("5","Airtime Purchase","","","airtime","Airtime","","uploads/categories/1685988075.svg","0","2023-06-05 18:01:15","2023-06-05 18:01:15");



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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO personal_access_tokens VALUES("1","App\Models\User","1","cafeat9ja@gmail.com_Token","b271854da33470418a9008c1237b7aced17d404ecd068bf1550c2344ceb0ec83","["*"]","2023-06-05 15:50:40","2023-06-05 15:50:13","2023-06-05 15:50:40");
INSERT INTO personal_access_tokens VALUES("3","App\Models\User","2","admin@gmail.com_AdminToken","4e29a1d77d6169b89bc9ecbb1d2242ed31280f8be6e9dbeb8575b5f774b001bf","["server:admin"]","2023-06-05 19:17:04","2023-06-05 17:13:42","2023-06-05 19:17:04");



CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `meta_title` varchar(191) NOT NULL,
  `meta_keyword` varchar(191) DEFAULT NULL,
  `meta_description` varchar(191) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `brand` varchar(191) NOT NULL,
  `selling_price` varchar(191) NOT NULL,
  `original_price` varchar(191) NOT NULL,
  `quantity` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `featured` tinyint(4) DEFAULT 0,
  `popular` tinyint(4) DEFAULT 0,
  `status` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `services` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) NOT NULL,
  `price` varchar(191) NOT NULL,
  `api_service_id` varchar(191) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




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

