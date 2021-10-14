-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 07, 2021 at 04:02 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ponto`
--

-- --------------------------------------------------------

--
-- Table structure for table `enderecos`
--

CREATE TABLE `enderecos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `endereco` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` int(11) NOT NULL,
  `complemento` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cep` int(11) NOT NULL,
  `bairro` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cidade` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uf` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `enderecos`
--

INSERT INTO `enderecos` (`id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'R. do teste', 245, 'Fundos', 11350270, 'Bairro teste', 'São vicente', 'SP', NULL, NULL, 1),
(8, 'Praça do teste', 343, NULL, 11350270, 'Bairro Teste', 'Cidade Teste', 'SP', '2021-10-07 01:41:14', '2021-10-07 01:41:14', 9),
(9, 'Alameda do teste', 343, NULL, 11350270, 'Bairro Teste', 'Cidade Teste', 'SP', '2021-10-07 01:42:36', '2021-10-07 01:42:36', 10),
(10, 'Rua joao do teste', 343, NULL, 11350270, 'Bairro Teste', 'Cidade Teste', 'SP', '2021-10-07 01:44:06', '2021-10-07 01:44:06', 11),
(11, 'Rua testando123', 343, NULL, 11350270, 'Bairro Teste', 'Cidade Teste', 'SP', '2021-10-07 01:45:03', '2021-10-07 01:45:03', 12),
(14, 'Rua teste12', 343, NULL, 11350270, 'Bairro Teste', 'Cidade Teste', 'SP', '2021-10-07 01:53:56', '2021-10-07 01:53:56', 15);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(12, '2014_10_12_000000_create_users_table', 2),
(13, '2021_10_02_015427_create_enderecos_table', 2),
(14, '2021_10_05_212306_ponto', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pontos`
--

CREATE TABLE `pontos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pontoEntrada` datetime NOT NULL,
  `saidaAlmoco` datetime NOT NULL,
  `entradaAlmoco` datetime NOT NULL,
  `pontoSaida` datetime NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pontos`
--

INSERT INTO `pontos` (`id`, `pontoEntrada`, `saidaAlmoco`, `entradaAlmoco`, `pontoSaida`, `user_id`) VALUES
(1, '2021-10-07 08:56:23', '2021-10-07 12:06:23', '2021-10-07 13:07:23', '2021-10-07 18:00:23', 11),
(8, '2021-07-07 09:00:41', '2021-07-07 12:00:41', '2021-07-07 13:00:41', '2021-07-07 19:57:41', 9),
(11, '2020-10-07 07:59:51', '2020-10-07 11:59:51', '2020-10-07 14:30:51', '2020-10-07 17:45:51', 9),
(12, '2021-07-07 04:00:58', '2021-10-07 08:00:58', '2021-10-07 10:00:58', '2021-10-07 15:00:58', 12),
(13, '2021-10-07 08:00:58', '2021-10-07 12:00:58', '2021-10-07 15:00:58', '2021-10-07 18:00:58', 15),
(14, '2021-07-07 04:00:58', '2021-10-07 08:00:58', '2021-10-07 10:00:58', '2021-10-07 15:00:58', 12),
(15, '2021-10-07 08:00:58', '2021-10-07 12:00:58', '2021-10-07 15:00:58', '2021-10-07 18:00:58', 15);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `CPF` char(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cargo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isAdmin` tinyint(1) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id_gestor` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `CPF`, `name`, `cargo`, `email`, `email_verified_at`, `password`, `isAdmin`, `isDeleted`, `remember_token`, `created_at`, `updated_at`, `user_id_gestor`) VALUES
(1, '72492143066', 'Gestor 1', 'Gestor', 'gestor@gestor.com', NULL, '$2y$10$82He7donwW8vrhppcNyXae9wghvQNW9kSJNenBUCYb6606D3Jkz3u', 1, 1, NULL, '2021-10-06 16:01:18', '2021-10-06 16:01:18', 1),
(9, '08474210070', 'Amanda Santos', 'Tester', 'Amanda@ticto.com.br', NULL, '$2y$10$wWO3WSxLBbWHmsRRxw3yfuvWwnVnIPLKiTqNA8j6EUFNPsch99Syu', 0, 1, NULL, '2021-10-07 01:41:14', '2021-10-07 01:41:14', 1),
(10, '39826596043', 'Julia Andrade', 'DevOps', 'Julia@ticto.com.br', NULL, '$2y$10$XfB3ilaHku5FeXMgXwjye.dTyAcoH4Lkt8.ryCqgyB8EOj9G8CC7m', 1, 1, NULL, '2021-10-07 01:42:35', '2021-10-07 01:42:35', 1),
(11, '84647681092', 'Kleber Almeida', 'Desenvolvedor', 'Kleber@ticto.com.br', NULL, '$2y$10$VNH/gfPVvNbBha9ZW36HQ.NCiJTD/3lG5NS.X4nttURWoR63P8XsS', 0, 0, NULL, '2021-10-07 01:44:06', '2021-10-07 01:44:06', 1),
(12, '58135633009', 'Jorge Silva', 'Desenvolvedor', 'Jorge@ticto.com.br', NULL, '$2y$10$QsBVn6Lbe0gY6f41bkYeiufONNIZzt2ir9X/7m9lP7K.ZJoHsN7vq', 0, 1, NULL, '2021-10-07 01:45:03', '2021-10-07 01:45:03', 1),
(15, '95562957043', 'Jose Machado', 'Desenvolvedor', 'Jose@ticto.combr', NULL, '$2y$10$jsx2a98hnVxrCQcXYTUFEuQQ7DbMBChlFBiA489HhVEv86S3KXLfS', 0, 1, NULL, '2021-10-07 01:53:56', '2021-10-07 01:53:56', 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `enderecos`
--
ALTER TABLE `enderecos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enderecos_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pontos`
--
ALTER TABLE `pontos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pontos_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_id_unique` (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_user_id_gestor_foreign` (`user_id_gestor`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `enderecos`
--
ALTER TABLE `enderecos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pontos`
--
ALTER TABLE `pontos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `enderecos`
--
ALTER TABLE `enderecos`
  ADD CONSTRAINT `enderecos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `pontos`
--
ALTER TABLE `pontos`
  ADD CONSTRAINT `pontos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_user_id_gestor_foreign` FOREIGN KEY (`user_id_gestor`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
