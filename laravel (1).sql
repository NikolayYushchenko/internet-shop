-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Час створення: Трв 26 2020 р., 15:29
-- Версія сервера: 10.3.13-MariaDB-log
-- Версія PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `laravel`
--

-- --------------------------------------------------------

--
-- Структура таблиці `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name_en` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_en` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `categories`
--

INSERT INTO `categories` (`id`, `name`, `code`, `description`, `image`, `created_at`, `updated_at`, `name_en`, `description_en`) VALUES
(1, 'Мобильные телефоны', 'mobiles', 'В этом разделе вы найдёте самые популярные мобильные телефонамы по отличным ценам!', 'categories/mobile.jpg', '2020-05-01 09:36:33', '2020-05-01 09:36:33', 'Mobile phones', 'Mobile phones section with best prices for best popular phones!'),
(2, 'Портативная техника', 'portable', 'Раздел с портативной техникой.', 'categories/portable.jpg', '2020-05-01 09:36:34', '2020-05-01 09:36:34', 'Portable', 'Section with portables.'),
(3, 'Бытовая техника', 'appliances', 'Раздел с бытовой техникой', 'categories/appliance.jpg', '2020-05-01 09:36:34', '2020-05-01 09:36:34', 'Appliance', 'Section with appliance');

-- --------------------------------------------------------

--
-- Структура таблиці `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_main` tinyint(4) NOT NULL DEFAULT 0,
  `rate` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `currencies`
--

INSERT INTO `currencies` (`id`, `code`, `symbol`, `is_main`, `rate`, `created_at`, `updated_at`) VALUES
(1, 'UAH', ' ₴', 1, 1, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(2, 'USD', '$', 0, 0, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(3, 'EUR', '€', 0, 0, '2020-05-01 09:36:33', '2020-05-01 09:36:33');

-- --------------------------------------------------------

--
-- Структура таблиці `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_11_02_161404_create_products_table', 1),
(3, '2019_11_02_161758_create_categories_table', 1),
(4, '2019_11_06_095115_create_orders_table', 1),
(5, '2019_11_06_095303_create_order_product_table', 1),
(6, '2019_11_06_115820_update_order_product_table', 1),
(7, '2019_11_14_080828_alter_table_users', 1),
(8, '2019_11_14_081710_alter_table_orders', 1),
(9, '2019_11_28_192415_alter_table_products', 1),
(10, '2019_12_21_191204_alter_table_products_count', 1),
(11, '2020_02_07_160146_create_subscriptions_table', 1),
(12, '2020_02_16_182835_localization_products', 1),
(13, '2020_02_16_182908_localization_categories', 1),
(14, '2020_02_28_180947_create_currencies_table', 1),
(15, '2020_03_03_183358_alter_table_orders_add_currency_id_and_sum', 1),
(16, '2020_03_03_183424_alter_order_product_add_price', 1),
(17, '2020_03_28_092334_create_skus_table', 1),
(18, '2020_03_28_092351_create_properties_table', 1),
(19, '2020_03_28_092358_create_property_options_table', 1),
(20, '2020_03_28_092541_create_sku_property_option_table', 1),
(21, '2020_03_28_092617_create_property_product', 1),
(22, '2020_03_30_173754_alter_table_products_drop_columns_count_and_price', 1),
(23, '2020_04_08_174422_alter_subscription_table', 1),
(24, '2020_04_08_175205_order_sku', 1),
(25, '2020_04_08_181123_alter_skus_soft_deletes', 1);

-- --------------------------------------------------------

--
-- Структура таблиці `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `currency_id` int(11) NOT NULL,
  `sum` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `orders`
--

INSERT INTO `orders` (`id`, `status`, `name`, `phone`, `created_at`, `updated_at`, `user_id`, `currency_id`, `sum`) VALUES
(1, 1, 'nik', '+380000', '2020-05-26 08:01:54', '2020-05-26 08:01:54', 2, 1, 46812),
(2, 1, 'nik', '+38999999999', '2020-05-26 08:08:13', '2020-05-26 08:08:13', 2, 1, 46812),
(3, 1, 'nik', '67676767', '2020-05-26 08:14:59', '2020-05-26 08:14:59', NULL, 1, 25990),
(4, 1, 'nik', '67676767', '2020-05-26 08:23:16', '2020-05-26 08:23:16', NULL, 1, 29373),
(5, 1, 'nik', '67676767', '2020-05-26 08:24:11', '2020-05-26 08:24:11', NULL, 1, 20753),
(6, 1, 'nik', '+380979090090', '2020-05-26 09:05:30', '2020-05-26 09:05:30', NULL, 1, 29373),
(7, 1, 'nik', '+380979090090', '2020-05-26 09:06:43', '2020-05-26 09:06:43', NULL, 1, 46812),
(8, 1, 'nik', '+380979090090', '2020-05-26 09:24:52', '2020-05-26 09:24:52', 2, 1, 46812);

-- --------------------------------------------------------

--
-- Структура таблиці `order_sku`
--

CREATE TABLE `order_sku` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `order_sku`
--

INSERT INTO `order_sku` (`id`, `order_id`, `sku_id`, `count`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, 46812, '2020-05-26 08:01:54', '2020-05-26 08:01:54'),
(2, 2, 2, 1, 46812, '2020-05-26 08:08:13', '2020-05-26 08:08:13'),
(3, 3, 5, 1, 25990, '2020-05-26 08:14:59', '2020-05-26 08:14:59'),
(4, 4, 1, 1, 29373, '2020-05-26 08:23:16', '2020-05-26 08:23:16'),
(5, 5, 32, 1, 20753, '2020-05-26 08:24:11', '2020-05-26 08:24:11'),
(6, 6, 1, 1, 29373, '2020-05-26 09:05:30', '2020-05-26 09:05:30'),
(7, 7, 2, 1, 46812, '2020-05-26 09:06:43', '2020-05-26 09:06:43'),
(8, 8, 2, 1, 46812, '2020-05-26 09:24:52', '2020-05-26 09:24:52');

-- --------------------------------------------------------

--
-- Структура таблиці `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `new` tinyint(4) NOT NULL DEFAULT 0,
  `hit` tinyint(4) NOT NULL DEFAULT 0,
  `recommend` tinyint(4) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name_en` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_en` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `code`, `description`, `image`, `created_at`, `updated_at`, `new`, `hit`, `recommend`, `deleted_at`, `name_en`, `description_en`) VALUES
(1, 1, 'iPhone X', 'iphone_x', 'Отличный продвинутый телефон', 'products/iphone_x.jpg', '2020-05-01 09:36:33', '2020-05-01 09:36:33', 1, 1, 1, NULL, 'iPhone X', 'The best phone'),
(2, 1, 'iPhone XL', 'iphone_xl', 'Огромный продвинутый телефон', 'products/iphone_x_silver.jpg', '2020-05-01 09:36:33', '2020-05-01 09:36:33', 0, 1, 1, NULL, 'iPhone XL', 'The best huge phone'),
(3, 1, 'HTC One S', 'htc_one_s', 'Зачем платить за лишнее? Легендарный HTC One S', 'products/htc_one_s.png', '2020-05-01 09:36:33', '2020-05-01 09:36:33', 0, 0, 1, NULL, 'HTC One S', 'Why do you need to pay more? Legendary HTC One S'),
(4, 1, 'iPhone 5SE', 'iphone_5se', 'Отличный классический iPhone', 'products/iphone_5.jpg', '2020-05-01 09:36:33', '2020-05-01 09:36:33', 1, 0, 1, NULL, 'iPhone 5SE', 'The best classic iPhone'),
(5, 1, 'Samsung Galaxy J6', 'samsung_j6', 'Современный телефон начального уровня', 'products/samsung_j6.jpg', '2020-05-01 09:36:33', '2020-05-01 09:36:33', 1, 0, 0, NULL, 'Samsung Galaxy J6', 'Modern phone of basic level'),
(6, 2, 'Наушники Beats Audio', 'beats_audio', 'Отличный звук от Dr. Dre', 'products/beats.jpg', '2020-05-01 09:36:34', '2020-05-01 09:36:34', 1, 0, 0, NULL, 'Headphones Beats Audio', 'Great sound from Dr. Dre'),
(7, 2, 'Камера GoPro', 'gopro', 'Снимай самые яркие моменты с помощью этой камеры', 'products/gopro.jpg', '2020-05-01 09:36:34', '2020-05-01 09:36:34', 0, 1, 0, NULL, 'Camera GoPro', 'Capture the best moments of your life with that camera'),
(8, 2, 'Камера Panasonic HC-V770', 'panasonic_hc-v770', 'Для серьёзной видео съемки нужна серьёзная камера. Panasonic HC-V770 для этих целей лучший выбор!', 'products/video_panasonic.jpg', '2020-05-01 09:36:34', '2020-05-01 09:36:34', 1, 0, 0, NULL, 'Camera Panasonic HC-V770', 'For serious video you need the profession camera. Panasonic HC-V770 is that you need!'),
(9, 3, 'Кофемашина DeLongi', 'delongi', 'Хорошее утро начинается с хорошего кофе!', 'products/delongi.jpg', '2020-05-01 09:36:34', '2020-05-01 09:36:34', 0, 0, 1, NULL, 'Coffee machine DeLongi', 'Good morning starts with a good coffee!'),
(10, 3, 'Холодильник Haier', 'haier', 'Для большой семьи большой холодильник!', 'products/haier.jpg', '2020-05-01 09:36:34', '2020-05-01 09:36:34', 1, 0, 0, NULL, 'Refrigerator Haier', 'The huge refrigerator for a big family!'),
(11, 3, 'Блендер Moulinex', 'moulinex', 'Для самых смелых идей', 'products/moulinex.jpg', '2020-05-01 09:36:34', '2020-05-01 09:36:34', 1, 0, 0, NULL, 'Blender Moulinex', 'For best ideas'),
(12, 3, 'Мясорубка Bosch', 'bosch', 'Любите домашние котлеты? Вам определенно стоит посмотреть на эту мясорубку!', 'products/bosch.jpg', '2020-05-01 09:36:34', '2020-05-01 09:36:34', 0, 0, 1, NULL, 'Food processor Bosch', 'Do you like home cutlets? You need to see that combine!');

-- --------------------------------------------------------

--
-- Структура таблиці `properties`
--

CREATE TABLE `properties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `properties`
--

INSERT INTO `properties` (`id`, `name`, `name_en`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Цвет', 'Color', '2020-05-01 09:36:33', '2020-05-01 09:36:33', NULL),
(2, 'Внутренняя память', 'Memory', '2020-05-01 09:36:33', '2020-05-01 09:36:33', NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `property_options`
--

CREATE TABLE `property_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `property_options`
--

INSERT INTO `property_options` (`id`, `property_id`, `name`, `name_en`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Белый', 'White', '2020-05-01 09:36:33', '2020-05-01 09:36:33', NULL),
(2, 1, 'Черный', 'Black', '2020-05-01 09:36:33', '2020-05-01 09:36:33', NULL),
(3, 1, 'Серебристый', 'Silver', '2020-05-01 09:36:33', '2020-05-01 09:36:33', NULL),
(4, 1, 'Золотой', 'Gold', '2020-05-01 09:36:33', '2020-05-01 09:36:33', NULL),
(5, 1, 'Красный', 'Red', '2020-05-01 09:36:33', '2020-05-01 09:36:33', NULL),
(6, 1, 'Синий', 'Blue', '2020-05-01 09:36:33', '2020-05-01 09:36:33', NULL),
(7, 2, '32гб', '32gb', '2020-05-01 09:36:33', '2020-05-01 09:36:33', NULL),
(8, 2, '64гб', '64gb', '2020-05-01 09:36:33', '2020-05-01 09:36:33', NULL),
(9, 2, '128гб', '128gb', '2020-05-01 09:36:33', '2020-05-01 09:36:33', NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `property_product`
--

CREATE TABLE `property_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `property_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `property_product`
--

INSERT INTO `property_product` (`id`, `product_id`, `property_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(2, 1, 2, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(3, 2, 1, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(4, 2, 2, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(5, 3, 1, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(6, 3, 2, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(7, 4, 1, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(8, 4, 2, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(9, 5, 1, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(10, 5, 2, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(11, 6, 1, '2020-05-01 09:36:34', '2020-05-01 09:36:34'),
(12, 9, 1, '2020-05-01 09:36:34', '2020-05-01 09:36:34'),
(13, 10, 1, '2020-05-01 09:36:34', '2020-05-01 09:36:34');

-- --------------------------------------------------------

--
-- Структура таблиці `skus`
--

CREATE TABLE `skus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `skus`
--

INSERT INTO `skus` (`id`, `product_id`, `count`, `price`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 0, 29373, '2020-05-01 09:36:33', '2020-05-26 09:05:30', NULL),
(2, 1, 40, 46812, '2020-05-01 09:36:33', '2020-05-26 09:24:52', NULL),
(3, 1, 93, 37818, '2020-05-01 09:36:33', '2020-05-01 09:36:33', NULL),
(4, 1, 24, 90844, '2020-05-01 09:36:33', '2020-05-01 09:36:33', NULL),
(5, 1, 23, 25990, '2020-05-01 09:36:33', '2020-05-26 08:14:59', NULL),
(6, 1, 14, 25585, '2020-05-01 09:36:33', '2020-05-01 09:36:33', NULL),
(7, 1, 10, 87875, '2020-05-01 09:36:33', '2020-05-01 09:36:33', NULL),
(8, 1, 7, 37299, '2020-05-01 09:36:33', '2020-05-01 09:36:33', NULL),
(9, 2, 21, 72584, '2020-05-01 09:36:33', '2020-05-01 09:36:33', NULL),
(10, 2, 70, 19792, '2020-05-01 09:36:33', '2020-05-01 09:36:33', NULL),
(11, 2, 59, 69969, '2020-05-01 09:36:33', '2020-05-01 09:36:33', NULL),
(12, 2, 81, 43190, '2020-05-01 09:36:33', '2020-05-01 09:36:33', NULL),
(13, 2, 5, 18566, '2020-05-01 09:36:33', '2020-05-01 09:36:33', NULL),
(14, 2, 28, 44910, '2020-05-01 09:36:33', '2020-05-01 09:36:33', NULL),
(15, 2, 19, 18562, '2020-05-01 09:36:33', '2020-05-01 09:36:33', NULL),
(16, 2, 42, 89598, '2020-05-01 09:36:33', '2020-05-01 09:36:33', NULL),
(17, 3, 22, 60454, '2020-05-01 09:36:33', '2020-05-01 09:36:33', NULL),
(18, 3, 76, 94947, '2020-05-01 09:36:33', '2020-05-01 09:36:33', NULL),
(19, 4, 77, 25640, '2020-05-01 09:36:33', '2020-05-01 09:36:33', NULL),
(20, 4, 33, 15728, '2020-05-01 09:36:33', '2020-05-01 09:36:33', NULL),
(21, 4, 77, 66195, '2020-05-01 09:36:33', '2020-05-01 09:36:33', NULL),
(22, 4, 44, 70680, '2020-05-01 09:36:33', '2020-05-01 09:36:33', NULL),
(23, 4, 33, 14505, '2020-05-01 09:36:33', '2020-05-01 09:36:33', NULL),
(24, 4, 100, 12533, '2020-05-01 09:36:33', '2020-05-01 09:36:33', NULL),
(25, 5, 57, 16986, '2020-05-01 09:36:33', '2020-05-01 09:36:33', NULL),
(26, 6, 86, 68878, '2020-05-01 09:36:34', '2020-05-01 09:36:34', NULL),
(27, 6, 8, 76505, '2020-05-01 09:36:34', '2020-05-01 09:36:34', NULL),
(28, 6, 5, 25794, '2020-05-01 09:36:34', '2020-05-01 09:36:34', NULL),
(29, 7, 89, 8807, '2020-05-01 09:36:34', '2020-05-01 09:36:34', NULL),
(30, 8, 2, 20395, '2020-05-01 09:36:34', '2020-05-01 09:36:34', NULL),
(31, 9, 56, 17818, '2020-05-01 09:36:34', '2020-05-01 09:36:34', NULL),
(32, 9, 68, 20753, '2020-05-01 09:36:34', '2020-05-26 08:24:11', NULL),
(33, 9, 23, 15142, '2020-05-01 09:36:34', '2020-05-01 09:36:34', NULL),
(34, 10, 82, 49165, '2020-05-01 09:36:34', '2020-05-01 09:36:34', NULL),
(35, 10, 5, 34837, '2020-05-01 09:36:34', '2020-05-01 09:36:34', NULL),
(36, 10, 90, 68630, '2020-05-01 09:36:34', '2020-05-01 09:36:34', NULL),
(37, 11, 92, 89631, '2020-05-01 09:36:34', '2020-05-01 09:36:34', NULL),
(38, 12, 45, 56594, '2020-05-01 09:36:34', '2020-05-01 09:36:34', NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `sku_property_option`
--

CREATE TABLE `sku_property_option` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_option_id` int(10) UNSIGNED NOT NULL,
  `sku_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `sku_property_option`
--

INSERT INTO `sku_property_option` (`id`, `property_option_id`, `sku_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(2, 7, 1, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(3, 1, 2, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(4, 8, 2, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(5, 2, 3, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(6, 7, 3, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(7, 2, 4, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(8, 8, 4, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(9, 3, 5, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(10, 7, 5, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(11, 3, 6, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(12, 8, 6, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(13, 4, 7, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(14, 7, 7, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(15, 4, 8, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(16, 8, 8, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(17, 1, 9, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(18, 8, 9, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(19, 1, 10, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(20, 9, 10, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(21, 2, 11, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(22, 8, 11, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(23, 2, 12, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(24, 9, 12, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(25, 3, 13, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(26, 8, 13, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(27, 3, 14, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(28, 9, 14, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(29, 4, 15, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(30, 8, 15, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(31, 4, 16, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(32, 9, 16, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(33, 2, 17, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(34, 7, 17, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(35, 2, 18, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(36, 8, 18, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(37, 1, 19, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(38, 7, 19, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(39, 1, 20, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(40, 8, 20, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(41, 3, 21, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(42, 7, 21, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(43, 3, 22, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(44, 8, 22, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(45, 4, 23, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(46, 7, 23, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(47, 4, 24, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(48, 8, 24, '2020-05-01 09:36:33', '2020-05-01 09:36:33'),
(49, 4, 25, '2020-05-01 09:36:34', '2020-05-01 09:36:34'),
(50, 7, 25, '2020-05-01 09:36:34', '2020-05-01 09:36:34'),
(51, 2, 26, '2020-05-01 09:36:34', '2020-05-01 09:36:34'),
(52, 5, 27, '2020-05-01 09:36:34', '2020-05-01 09:36:34'),
(53, 6, 28, '2020-05-01 09:36:34', '2020-05-01 09:36:34'),
(54, 2, 31, '2020-05-01 09:36:34', '2020-05-01 09:36:34'),
(55, 5, 32, '2020-05-01 09:36:34', '2020-05-01 09:36:34'),
(56, 6, 33, '2020-05-01 09:36:34', '2020-05-01 09:36:34'),
(57, 1, 34, '2020-05-01 09:36:34', '2020-05-01 09:36:34'),
(58, 2, 35, '2020-05-01 09:36:34', '2020-05-01 09:36:34'),
(59, 3, 36, '2020-05-01 09:36:34', '2020-05-01 09:36:34');

-- --------------------------------------------------------

--
-- Структура таблиці `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `sku_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_admin` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `is_admin`) VALUES
(1, 'Администратор', 'admin@example.com', NULL, '$2y$10$ZY9CV6Up9yYjH/u233MqGufC46sW4Z3yc7XOkLvld7nkK/XjScy/S', NULL, NULL, NULL, 1),
(2, 'Пользователь', 'user@gmail.ua', NULL, '$2y$10$ZY9CV6Up9yYjH/u233MqGufC46sW4Z3yc7XOkLvld7nkK/XjScy/S', NULL, NULL, NULL, 0);

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `order_sku`
--
ALTER TABLE `order_sku`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `property_options`
--
ALTER TABLE `property_options`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `property_product`
--
ALTER TABLE `property_product`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `skus`
--
ALTER TABLE `skus`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `sku_property_option`
--
ALTER TABLE `sku_property_option`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT для таблиці `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблиці `order_sku`
--
ALTER TABLE `order_sku`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблиці `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблиці `properties`
--
ALTER TABLE `properties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблиці `property_options`
--
ALTER TABLE `property_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблиці `property_product`
--
ALTER TABLE `property_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблиці `skus`
--
ALTER TABLE `skus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT для таблиці `sku_property_option`
--
ALTER TABLE `sku_property_option`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT для таблиці `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
