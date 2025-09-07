/*
 Navicat Premium Dump SQL

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : db_ta

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 27/08/2025 03:11:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cache
-- ----------------------------
DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cache
-- ----------------------------

-- ----------------------------
-- Table structure for cache_locks
-- ----------------------------
DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cache_locks
-- ----------------------------

-- ----------------------------
-- Table structure for diagnoses
-- ----------------------------
DROP TABLE IF EXISTS `diagnoses`;
CREATE TABLE `diagnoses`  (
  `id` char(26) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` char(26) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` char(26) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of diagnoses
-- ----------------------------
INSERT INTO `diagnoses` VALUES ('KD0001', 'Kerusakan pada Power Regulator / IC Power', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 15:01:10', '2025-08-06 15:01:10');
INSERT INTO `diagnoses` VALUES ('KD0002', 'Kerusakan Chipset Utama (Northbridge/Southbridge)', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 15:03:25', '2025-08-06 15:03:25');
INSERT INTO `diagnoses` VALUES ('KD0003', 'BIOS Corrupt atau Rusak', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 15:03:54', '2025-08-06 15:03:54');
INSERT INTO `diagnoses` VALUES ('KD0004', 'Kerusakan Slot RAM atau Kontak RAM Longgar', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 15:04:38', '2025-08-06 15:04:38');
INSERT INTO `diagnoses` VALUES ('KD0005', 'CMOS Battery Lemah atau Rusak', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 15:23:52', '2025-08-06 15:23:52');
INSERT INTO `diagnoses` VALUES ('KD0006', 'Kerusakan Jalur USB atau Controller USB', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 15:24:19', '2025-08-06 15:24:19');
INSERT INTO `diagnoses` VALUES ('KD0007', 'Kerusakan pada Socket CPU atau CPU Tidak Terdeteksi', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 15:24:52', '2025-08-06 15:24:52');
INSERT INTO `diagnoses` VALUES ('KD0008', 'Kerusakan Motherboard Secara Umum (Short / Konslet)', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 15:25:41', '2025-08-06 15:25:41');
INSERT INTO `diagnoses` VALUES ('KD0009', 'Kerusakan pada Slot Ekspansi (PCIe)', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 15:26:15', '2025-08-06 15:26:15');
INSERT INTO `diagnoses` VALUES ('KD0010', 'Kerusakan Port SATA atau Pengontrol SATA', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 15:30:06', '2025-08-06 15:30:06');
INSERT INTO `diagnoses` VALUES ('KD0011', 'Jalur Sirkuit Rusak karena Korosi atau Cairan', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 15:30:41', '2025-08-06 15:30:41');
INSERT INTO `diagnoses` VALUES ('KD0012', 'Motherboard Usang atau Tidak Kompatibel dengan Komponen Baru', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 15:30:58', '2025-08-06 15:30:58');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for histories
-- ----------------------------
DROP TABLE IF EXISTS `histories`;
CREATE TABLE `histories`  (
  `id` char(26) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `diagnose_id` char(26) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` char(26) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` char(26) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `rules_diagnose_id_foreign`(`diagnose_id` ASC) USING BTREE,
  CONSTRAINT `histories_ibfk_1` FOREIGN KEY (`diagnose_id`) REFERENCES `diagnoses` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of histories
-- ----------------------------
INSERT INTO `histories` VALUES ('01k29bmekjbg8f5mb2bnpyvf2t', 'KD0001', '01k298kh8q2vbv3nct4ywer68z', '01k298kh8q2vbv3nct4ywer68z', '2025-08-10 06:45:34', '2025-08-10 06:45:34');
INSERT INTO `histories` VALUES ('01k29bmekne8wkg4f27fc58sad', 'KD0002', '01k298kh8q2vbv3nct4ywer68z', '01k298kh8q2vbv3nct4ywer68z', '2025-08-10 06:45:34', '2025-08-10 06:45:34');
INSERT INTO `histories` VALUES ('01k29bmekrbcz6xtf788jy4ht9', 'KD0004', '01k298kh8q2vbv3nct4ywer68z', '01k298kh8q2vbv3nct4ywer68z', '2025-08-10 06:45:34', '2025-08-10 06:45:34');
INSERT INTO `histories` VALUES ('01k29bmekvb6y45ehvf9xp4twz', 'KD0005', '01k298kh8q2vbv3nct4ywer68z', '01k298kh8q2vbv3nct4ywer68z', '2025-08-10 06:45:34', '2025-08-10 06:45:34');
INSERT INTO `histories` VALUES ('01k29bmekywdzxyz3373fgj72q', 'KD0006', '01k298kh8q2vbv3nct4ywer68z', '01k298kh8q2vbv3nct4ywer68z', '2025-08-10 06:45:34', '2025-08-10 06:45:34');
INSERT INTO `histories` VALUES ('01k29bmem0y8t2tbw82n7xq14w', 'KD0008', '01k298kh8q2vbv3nct4ywer68z', '01k298kh8q2vbv3nct4ywer68z', '2025-08-10 06:45:34', '2025-08-10 06:45:34');
INSERT INTO `histories` VALUES ('01k29bmem34m167xwp809z7nkd', 'KD0009', '01k298kh8q2vbv3nct4ywer68z', '01k298kh8q2vbv3nct4ywer68z', '2025-08-10 06:45:34', '2025-08-10 06:45:34');
INSERT INTO `histories` VALUES ('01k29bmem6qp5rfghmkzgft1x4', 'KD0010', '01k298kh8q2vbv3nct4ywer68z', '01k298kh8q2vbv3nct4ywer68z', '2025-08-10 06:45:34', '2025-08-10 06:45:34');
INSERT INTO `histories` VALUES ('01k29bmem85dp1ng22cfyjnwys', 'KD0011', '01k298kh8q2vbv3nct4ywer68z', '01k298kh8q2vbv3nct4ywer68z', '2025-08-10 06:45:34', '2025-08-10 06:45:34');
INSERT INTO `histories` VALUES ('01k29bmema4tqf0at3q83k1fc8', 'KD0012', '01k298kh8q2vbv3nct4ywer68z', '01k298kh8q2vbv3nct4ywer68z', '2025-08-10 06:45:34', '2025-08-10 06:45:34');
INSERT INTO `histories` VALUES ('01k29c8a55tj7km3syr09d6r3k', 'KD0003', '01k298kh8q2vbv3nct4ywer68z', '01k298kh8q2vbv3nct4ywer68z', '2025-08-10 06:56:25', '2025-08-10 06:56:25');
INSERT INTO `histories` VALUES ('01k29c8a57kf6mdwdw9k9nqn7g', 'KD0004', '01k298kh8q2vbv3nct4ywer68z', '01k298kh8q2vbv3nct4ywer68z', '2025-08-10 06:56:25', '2025-08-10 06:56:25');
INSERT INTO `histories` VALUES ('01k29c8a5ay6jz6h23eqj62v25', 'KD0006', '01k298kh8q2vbv3nct4ywer68z', '01k298kh8q2vbv3nct4ywer68z', '2025-08-10 06:56:25', '2025-08-10 06:56:25');
INSERT INTO `histories` VALUES ('01k29c8a5dzs57d6pyqvzdykqe', 'KD0009', '01k298kh8q2vbv3nct4ywer68z', '01k298kh8q2vbv3nct4ywer68z', '2025-08-10 06:56:25', '2025-08-10 06:56:25');
INSERT INTO `histories` VALUES ('01k29c8a5enanehtft0vtbzyhj', 'KD0011', '01k298kh8q2vbv3nct4ywer68z', '01k298kh8q2vbv3nct4ywer68z', '2025-08-10 06:56:25', '2025-08-10 06:56:25');
INSERT INTO `histories` VALUES ('01k29cqn72qvdd8ymwxh6sgvzh', 'KD0005', '01k298kh8q2vbv3nct4ywer68z', '01k298kh8q2vbv3nct4ywer68z', '2025-08-10 07:04:48', '2025-08-10 07:04:48');
INSERT INTO `histories` VALUES ('01k29cqn75hvf74d9r4jtc37qc', 'KD0006', '01k298kh8q2vbv3nct4ywer68z', '01k298kh8q2vbv3nct4ywer68z', '2025-08-10 07:04:48', '2025-08-10 07:04:48');
INSERT INTO `histories` VALUES ('01k29cqn78ssd3ed5ks5m7dezc', 'KD0009', '01k298kh8q2vbv3nct4ywer68z', '01k298kh8q2vbv3nct4ywer68z', '2025-08-10 07:04:48', '2025-08-10 07:04:48');
INSERT INTO `histories` VALUES ('01k29dqp6h9jfn98607t7j0x9t', 'KD0009', '01k298kh8q2vbv3nct4ywer68z', '01k298kh8q2vbv3nct4ywer68z', '2025-08-10 07:22:18', '2025-08-10 07:22:18');
INSERT INTO `histories` VALUES ('01k29dqp6kz9z8dbkkn8vhnt9b', 'KD0001', '01k298kh8q2vbv3nct4ywer68z', '01k298kh8q2vbv3nct4ywer68z', '2025-08-10 07:22:18', '2025-08-10 07:22:18');
INSERT INTO `histories` VALUES ('01k29dqp6man4yhcff79f581p0', 'KD0004', '01k298kh8q2vbv3nct4ywer68z', '01k298kh8q2vbv3nct4ywer68z', '2025-08-10 07:22:18', '2025-08-10 07:22:18');
INSERT INTO `histories` VALUES ('01k29e5207vghvg5xw5qcse69t', 'KD0006', '01k298kh8q2vbv3nct4ywer68z', '01k298kh8q2vbv3nct4ywer68z', '2025-08-10 07:29:36', '2025-08-10 07:29:36');
INSERT INTO `histories` VALUES ('01k29e5209ham6dpdaf5vs968g', 'KD0009', '01k298kh8q2vbv3nct4ywer68z', '01k298kh8q2vbv3nct4ywer68z', '2025-08-10 07:29:36', '2025-08-10 07:29:36');
INSERT INTO `histories` VALUES ('01k29e520c4wpx6224yrqymrw6', 'KD0001', '01k298kh8q2vbv3nct4ywer68z', '01k298kh8q2vbv3nct4ywer68z', '2025-08-10 07:29:36', '2025-08-10 07:29:36');
INSERT INTO `histories` VALUES ('01k29e6ajvdtm0jwdjj9dzran7', 'KD0004', '01k1tt6yprvb07d0yfnpnfffjj', '01k1tt6yprvb07d0yfnpnfffjj', '2025-08-10 07:30:17', '2025-08-10 07:30:17');
INSERT INTO `histories` VALUES ('01k29e6ajxydynmdd44th67t05', 'KD0003', '01k1tt6yprvb07d0yfnpnfffjj', '01k1tt6yprvb07d0yfnpnfffjj', '2025-08-10 07:30:17', '2025-08-10 07:30:17');
INSERT INTO `histories` VALUES ('01k29e6ajzfrxy2gdmkgayvd8a', 'KD0009', '01k1tt6yprvb07d0yfnpnfffjj', '01k1tt6yprvb07d0yfnpnfffjj', '2025-08-10 07:30:17', '2025-08-10 07:30:17');
INSERT INTO `histories` VALUES ('01k29fzajmp1cp72cfg57naa9t', 'KD0001', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-10 08:01:25', '2025-08-10 08:01:25');
INSERT INTO `histories` VALUES ('01k29fzajqedsfabn6zyx6wj49', 'KD0003', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-10 08:01:25', '2025-08-10 08:01:25');
INSERT INTO `histories` VALUES ('01k29fzajsgfkp7j61p8nsd54n', 'KD0005', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-10 08:01:25', '2025-08-10 08:01:25');
INSERT INTO `histories` VALUES ('01k29fzajtc4fw9bhha3kmvhky', 'KD0006', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-10 08:01:25', '2025-08-10 08:01:25');
INSERT INTO `histories` VALUES ('01k29fzajwv3p4wkvqs0dtwphc', 'KD0007', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-10 08:01:25', '2025-08-10 08:01:25');
INSERT INTO `histories` VALUES ('01k29fzajyb0fkh06srffm4p3v', 'KD0008', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-10 08:01:25', '2025-08-10 08:01:25');
INSERT INTO `histories` VALUES ('01k29fzak1fgjgx25zxr084y33', 'KD0009', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-10 08:01:25', '2025-08-10 08:01:25');
INSERT INTO `histories` VALUES ('01k29fzak36cjnqv72y7nf8mqf', 'KD0011', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-10 08:01:25', '2025-08-10 08:01:25');
INSERT INTO `histories` VALUES ('01k29fzak4g913n6c6d436aymq', 'KD0012', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-10 08:01:25', '2025-08-10 08:01:25');
INSERT INTO `histories` VALUES ('01k2a2gvh9x39fj6haq8nkxedb', 'KD0003', '01k298kh8q2vbv3nct4ywer68z', '01k298kh8q2vbv3nct4ywer68z', '2025-08-10 13:25:34', '2025-08-10 13:25:34');
INSERT INTO `histories` VALUES ('01k2a2gvhc4g03hc09bnqncvjb', 'KD0007', '01k298kh8q2vbv3nct4ywer68z', '01k298kh8q2vbv3nct4ywer68z', '2025-08-10 13:25:34', '2025-08-10 13:25:34');
INSERT INTO `histories` VALUES ('01k2a2gvheb8qz4bt4qsxwywrh', 'KD0006', '01k298kh8q2vbv3nct4ywer68z', '01k298kh8q2vbv3nct4ywer68z', '2025-08-10 13:25:34', '2025-08-10 13:25:34');
INSERT INTO `histories` VALUES ('01k2a2q9tmxxpkvvsshx3g1dbw', 'KD0008', '01k298kh8q2vbv3nct4ywer68z', '01k298kh8q2vbv3nct4ywer68z', '2025-08-10 13:29:05', '2025-08-10 13:29:05');
INSERT INTO `histories` VALUES ('01k2a2q9tpbbtf62gfbpvr6c36', 'KD0001', '01k298kh8q2vbv3nct4ywer68z', '01k298kh8q2vbv3nct4ywer68z', '2025-08-10 13:29:05', '2025-08-10 13:29:05');
INSERT INTO `histories` VALUES ('01k2a2q9tsjghqq6ff3extvtjj', 'KD0007', '01k298kh8q2vbv3nct4ywer68z', '01k298kh8q2vbv3nct4ywer68z', '2025-08-10 13:29:05', '2025-08-10 13:29:05');
INSERT INTO `histories` VALUES ('01k2a3wv6y0ryx4nhc6hgwwb6v', 'KD0001', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-10 13:49:35', '2025-08-10 13:49:35');
INSERT INTO `histories` VALUES ('01k2a3wv71045wa2ery2cs00y3', 'KD0004', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-10 13:49:35', '2025-08-10 13:49:35');
INSERT INTO `histories` VALUES ('01k2a3wv739rxtzbysj2vvrsvx', 'KD0007', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-10 13:49:35', '2025-08-10 13:49:35');
INSERT INTO `histories` VALUES ('01k39ctwshrzatkf72tk8jpdge', 'KD0003', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-22 17:22:16', '2025-08-22 17:22:16');
INSERT INTO `histories` VALUES ('01k39ctwsnc593t9j341ws7qvz', 'KD0007', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-22 17:22:16', '2025-08-22 17:22:16');
INSERT INTO `histories` VALUES ('01k39ctwsq3qj0cdrtp89j5fpt', 'KD0005', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-22 17:22:16', '2025-08-22 17:22:16');
INSERT INTO `histories` VALUES ('01k39d2rqnnf9974segss4y2tm', 'KD0006', '01k2a2sgvv1w8dtm40bzxnaz0f', '01k2a2sgvv1w8dtm40bzxnaz0f', '2025-08-22 17:26:34', '2025-08-22 17:26:34');
INSERT INTO `histories` VALUES ('01k39d2rqrxczyy8sf686568p7', 'KD0009', '01k2a2sgvv1w8dtm40bzxnaz0f', '01k2a2sgvv1w8dtm40bzxnaz0f', '2025-08-22 17:26:34', '2025-08-22 17:26:34');
INSERT INTO `histories` VALUES ('01k39d2rqtgac33p5myz3xsdjk', 'KD0012', '01k2a2sgvv1w8dtm40bzxnaz0f', '01k2a2sgvv1w8dtm40bzxnaz0f', '2025-08-22 17:26:34', '2025-08-22 17:26:34');
INSERT INTO `histories` VALUES ('01k3b35mw9ae28kk9xjp6n63g5', 'KD0001', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-23 09:11:51', '2025-08-23 09:11:51');
INSERT INTO `histories` VALUES ('01k3b82phye5mm7fwwt532f335', 'KD0001', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-23 10:37:38', '2025-08-23 10:37:38');
INSERT INTO `histories` VALUES ('01k3ke04b0cb76d0x80qwfg7ah', 'KD0001', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-26 14:55:00', '2025-08-26 14:55:00');

-- ----------------------------
-- Table structure for job_batches
-- ----------------------------
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `cancelled_at` int NULL DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of job_batches
-- ----------------------------

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED NULL DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `jobs_queue_index`(`queue` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '0001_01_01_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '0001_01_01_000001_create_cache_table', 1);
INSERT INTO `migrations` VALUES (3, '0001_01_01_000002_create_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2025_07_13_041842_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (5, '2025_07_25_160927_create_symptoms_table', 1);
INSERT INTO `migrations` VALUES (6, '2025_07_25_161444_create_diagnoses_table', 1);
INSERT INTO `migrations` VALUES (7, '2025_07_25_161453_create_rules_table', 1);
INSERT INTO `migrations` VALUES (8, '2025_07_25_161513_create_solutions_table', 1);

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` char(26) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token` ASC) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type` ASC, `tokenable_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
INSERT INTO `personal_access_tokens` VALUES (1, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', '5fe9f9d3d493fc35197206f8da2543ba7fc50cdb1690721fdb9d915e72911785', '[]', '2025-07-26 17:51:25', '2025-07-26 17:51:25', '2025-07-26 17:42:28', '2025-07-26 17:51:25');
INSERT INTO `personal_access_tokens` VALUES (2, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', 'f45baaedfca0f462a567a04998c5a733e907e68a94c5cb0fca45b8f016cb20f3', '[]', '2025-07-27 05:28:28', '2025-07-27 05:28:28', '2025-07-26 18:38:33', '2025-07-27 05:28:28');
INSERT INTO `personal_access_tokens` VALUES (3, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', 'cbe88078b48db731d9849a325563f466f2bc9a45786e49760e741c5aa0489c65', '[]', NULL, NULL, '2025-08-04 15:04:42', '2025-08-04 15:04:42');
INSERT INTO `personal_access_tokens` VALUES (4, 'App\\Models\\User', '01k1tt6yprvb07d0yfnpnfffjj', 'web', '310edaafe3136a2e1734445c28d19ac4b7cf348b3e000067cfb86fd7f72cd3f4', '[]', NULL, NULL, '2025-08-04 15:12:44', '2025-08-04 15:12:44');
INSERT INTO `personal_access_tokens` VALUES (5, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', 'b44ba56f58abdb16e7be042e4684331d474fd995345ec7c081f6f35b45715c0d', '[]', NULL, NULL, '2025-08-04 15:16:00', '2025-08-04 15:16:00');
INSERT INTO `personal_access_tokens` VALUES (6, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', '62b1f5845f8fbeacfd03aab213cfbe9c109d95fff006e73beb45eae10d8c35cf', '[]', NULL, NULL, '2025-08-04 15:16:21', '2025-08-04 15:16:21');
INSERT INTO `personal_access_tokens` VALUES (7, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', '214229d8d7bfca4c7bf473ade7ef6627d61c6d58028e3064754077a981c125d5', '[]', NULL, NULL, '2025-08-04 15:17:06', '2025-08-04 15:17:06');
INSERT INTO `personal_access_tokens` VALUES (8, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', 'ed00c9fce3322dba399a35d8c1ebeec6675b04925681fc552ceb2cc218f8a149', '[]', NULL, NULL, '2025-08-04 15:21:26', '2025-08-04 15:21:26');
INSERT INTO `personal_access_tokens` VALUES (9, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', '28d309e7b8c88523b40245159835285ce933e41a8bf726ec45d5f7e94bce2e2f', '[]', NULL, NULL, '2025-08-04 15:21:58', '2025-08-04 15:21:58');
INSERT INTO `personal_access_tokens` VALUES (10, 'App\\Models\\User', '01k1tt6yprvb07d0yfnpnfffjj', 'web', '235645dbec8389709b4715e7a649f29f9402c4d7435b1eb2bd81d54d4301c1c4', '[]', NULL, NULL, '2025-08-04 15:25:16', '2025-08-04 15:25:16');
INSERT INTO `personal_access_tokens` VALUES (11, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', '14b5ae10a284dd85f5cd3b3773c55ae29f81560fada965b6845e089e720f5d29', '[]', NULL, NULL, '2025-08-04 15:27:23', '2025-08-04 15:27:23');
INSERT INTO `personal_access_tokens` VALUES (12, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', '57bcd05abcbfbb160610aba217bc17847ab8d7bfad9b270d66b6640650df8479', '[]', '2025-08-04 15:47:42', '2025-08-04 15:47:42', '2025-08-04 15:36:26', '2025-08-04 15:47:42');
INSERT INTO `personal_access_tokens` VALUES (13, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', 'ff69833e17b6a6a9eea535aea350819f6a8bd3442cd0fd3db846f66da4a55956', '[]', '2025-08-04 16:02:56', '2025-08-04 16:02:56', '2025-08-04 15:48:00', '2025-08-04 16:02:56');
INSERT INTO `personal_access_tokens` VALUES (14, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', '8faf64354ef6d2d909c308f1564df53d94b0555751e8270d0d7c717913086d1e', '[]', '2025-08-04 16:16:51', '2025-08-04 16:16:51', '2025-08-04 16:03:11', '2025-08-04 16:16:51');
INSERT INTO `personal_access_tokens` VALUES (15, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', '0008fb11bfe88b9dc63cf6e64d8c313f27331a8acd17c23b2cc759468439312e', '[]', '2025-08-04 17:07:32', '2025-08-04 17:07:32', '2025-08-04 16:17:00', '2025-08-04 17:07:32');
INSERT INTO `personal_access_tokens` VALUES (16, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', 'd0ab47015154902773d4a47496fab8f889c206451ecf280765290eca8d8ead92', '[]', '2025-08-04 17:58:07', NULL, '2025-08-04 17:07:45', '2025-08-04 17:58:07');
INSERT INTO `personal_access_tokens` VALUES (17, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', '86ec24167947fabcdd88e76aeef2f5848b19e84ed04e4c8d00751baea4c828f1', '[]', '2025-08-05 15:38:44', '2025-08-05 15:38:44', '2025-08-05 14:19:28', '2025-08-05 15:38:44');
INSERT INTO `personal_access_tokens` VALUES (18, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', 'fa741112ee998be149b63a831c42e5f04c430c24b7db8a3725d3b28d33cc45a8', '[]', '2025-08-06 14:15:05', '2025-08-06 14:15:05', '2025-08-05 15:38:57', '2025-08-06 14:15:05');
INSERT INTO `personal_access_tokens` VALUES (19, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', '75619617652b86198cce9e8193a5c924a1660f0b414fd53e5a99821710436fe5', '[]', '2025-08-07 15:30:27', '2025-08-07 15:30:27', '2025-08-06 14:16:01', '2025-08-07 15:30:27');
INSERT INTO `personal_access_tokens` VALUES (20, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', 'c8c4e977bd4053ab919e7e99ca06a80a1f7d80a4ccf3025a0120016e739a8c02', '[]', '2025-08-09 15:13:30', '2025-08-09 15:13:30', '2025-08-07 15:30:38', '2025-08-09 15:13:30');
INSERT INTO `personal_access_tokens` VALUES (21, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', 'cebec6cbd60d368cfc19b902d5f97da8f1385a392d14c036750db2104e9eeff3', '[]', '2025-08-09 15:21:38', NULL, '2025-08-09 15:21:37', '2025-08-09 15:21:38');
INSERT INTO `personal_access_tokens` VALUES (22, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', '270f3385448a85f642d1df5e81256ed481d2e6c3a2b8212ec2ad98f26d48abac', '[]', '2025-08-09 15:29:51', NULL, '2025-08-09 15:29:50', '2025-08-09 15:29:51');
INSERT INTO `personal_access_tokens` VALUES (23, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', '54a7f77fcfd52a74a1f1d08d1d1730b294279ca4f7f95f6a002750bb02b30e22', '[]', '2025-08-09 15:55:08', NULL, '2025-08-09 15:52:34', '2025-08-09 15:55:08');
INSERT INTO `personal_access_tokens` VALUES (24, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', 'a2b47b8dc362c5153ea42fa0649156a137f4505bf3e3ab6714936876a6c883dc', '[]', '2025-08-09 17:02:31', NULL, '2025-08-09 16:03:38', '2025-08-09 17:02:31');
INSERT INTO `personal_access_tokens` VALUES (25, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', '45c4f41c5033313f9b5f217ec1ee4b5975be4dde584065e7e4db5a7fc35cc9d7', '[]', '2025-08-09 20:30:47', NULL, '2025-08-09 17:03:07', '2025-08-09 20:30:47');
INSERT INTO `personal_access_tokens` VALUES (26, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', 'e553f63d4c39901faf66c54ffc42852be59787055cafd5eb451d2fa107ae8ede', '[]', '2025-08-09 19:06:03', NULL, '2025-08-09 17:46:40', '2025-08-09 19:06:03');
INSERT INTO `personal_access_tokens` VALUES (27, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', '9ce0d4d0baaa9f325a8a0904a744e896f311643c02f957b905fe0194b96a2f87', '[]', '2025-08-09 19:09:46', NULL, '2025-08-09 19:06:12', '2025-08-09 19:09:46');
INSERT INTO `personal_access_tokens` VALUES (28, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', '39fb1f2bc67d302209d345af4d35c613bec3ec4fede28382ca563f38b1fb39d3', '[]', '2025-08-09 19:26:47', '2025-08-09 19:26:47', '2025-08-09 19:10:09', '2025-08-09 19:26:47');
INSERT INTO `personal_access_tokens` VALUES (29, 'App\\Models\\User', '01k285vmqs04xzgtxysg1q8kdh', 'web', '5b672c4fb2a045ecff33d80983070eb0fae0eb0aeb39f753de127785a6c08db1', '[]', '2025-08-09 19:59:48', NULL, '2025-08-09 19:45:35', '2025-08-09 19:59:48');
INSERT INTO `personal_access_tokens` VALUES (30, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', '7deaf0b6367ee4575ec3691b66f7c426be39254516dbaa314bd46002bd39c64d', '[]', '2025-08-09 20:01:59', '2025-08-09 20:01:59', '2025-08-09 19:59:58', '2025-08-09 20:01:59');
INSERT INTO `personal_access_tokens` VALUES (31, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', '611f4d6caa114781f856990b08595893e2e0022bf99ac890c11a5eb02217d4a8', '[]', '2025-08-09 20:04:02', '2025-08-09 20:04:02', '2025-08-09 20:03:38', '2025-08-09 20:04:02');
INSERT INTO `personal_access_tokens` VALUES (32, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', '686924d1fd16a951abace2fbb696001f308e024da41602d77bb8f04fcdc07218', '[]', '2025-08-09 20:08:05', '2025-08-09 20:08:05', '2025-08-09 20:06:52', '2025-08-09 20:08:05');
INSERT INTO `personal_access_tokens` VALUES (33, 'App\\Models\\User', '01k285vmqs04xzgtxysg1q8kdh', 'web', 'fbef2efbd7e007539e0a9f649e0b3599fcf31fd81deed5155328d334ff0a960a', '[]', '2025-08-09 20:30:29', NULL, '2025-08-09 20:08:32', '2025-08-09 20:30:29');
INSERT INTO `personal_access_tokens` VALUES (34, 'App\\Models\\User', '01k285vmqs04xzgtxysg1q8kdh', 'web', '32f7ee5fc5c26dfc7e343efee88263a82aee7754eabcc92d28e702a7cd36103b', '[]', '2025-08-09 20:31:57', '2025-08-09 20:31:57', '2025-08-09 20:31:04', '2025-08-09 20:31:57');
INSERT INTO `personal_access_tokens` VALUES (35, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', 'd795b9a228c6e19ffd51994eed502fe5366e5847fe26af213de038069648079b', '[]', '2025-08-09 20:33:00', '2025-08-09 20:33:00', '2025-08-09 20:32:06', '2025-08-09 20:33:00');
INSERT INTO `personal_access_tokens` VALUES (36, 'App\\Models\\User', '01k285qsc79fvmjp89c9crczxz', 'web', '570ee2c2c8cc1445aa4afd53aa8f25dcc0bc19a6fcd1961d38030bb0ef59141f', '[]', '2025-08-10 04:58:30', NULL, '2025-08-09 20:34:52', '2025-08-10 04:58:30');
INSERT INTO `personal_access_tokens` VALUES (37, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', '1ed23e7183cea48b50aef62e6ff25f4d85b984c602307cc2135f311de38b8006', '[]', '2025-08-10 05:07:41', NULL, '2025-08-10 04:58:46', '2025-08-10 05:07:41');
INSERT INTO `personal_access_tokens` VALUES (38, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', 'fded0972562d4641d357b795dc7cb7c915ac41795ad4f0abbe426eee051c3c0b', '[]', '2025-08-10 05:09:08', NULL, '2025-08-10 05:07:50', '2025-08-10 05:09:08');
INSERT INTO `personal_access_tokens` VALUES (39, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', '04b6881213bb8cc78634ba2b9a4f1e7d624e8755ca814b287aa8da7467a676f7', '[]', '2025-08-10 06:01:52', '2025-08-10 06:01:52', '2025-08-10 05:11:03', '2025-08-10 06:01:52');
INSERT INTO `personal_access_tokens` VALUES (40, 'App\\Models\\User', '01k298kh8q2vbv3nct4ywer68z', 'web', 'caa988399fcdf144a7baa6066895165b2184b002df451d727b6d5e70a99513aa', '[]', '2025-08-10 06:07:05', '2025-08-10 06:07:05', '2025-08-10 06:01:58', '2025-08-10 06:07:05');
INSERT INTO `personal_access_tokens` VALUES (41, 'App\\Models\\User', '01k298kh8q2vbv3nct4ywer68z', 'web', '3614a7d035790ae7c29747c2c7f6b3b0f8caeaac6ce67cf2db8167682a6072d5', '[]', '2025-08-10 06:39:57', '2025-08-10 06:39:57', '2025-08-10 06:07:46', '2025-08-10 06:39:57');
INSERT INTO `personal_access_tokens` VALUES (42, 'App\\Models\\User', '01k298kh8q2vbv3nct4ywer68z', 'web', '2fb08afc51fadde23976e170a16c39858941a0b3c876279c99a2fa9be1bec813', '[]', '2025-08-10 07:29:47', '2025-08-10 07:29:47', '2025-08-10 06:40:06', '2025-08-10 07:29:47');
INSERT INTO `personal_access_tokens` VALUES (43, 'App\\Models\\User', '01k1tt6yprvb07d0yfnpnfffjj', 'web', '4af53157f0b6102bf127e6139bebd68aff3676e726a74a3a8f6160875e2414ac', '[]', '2025-08-10 07:30:20', '2025-08-10 07:30:20', '2025-08-10 07:30:06', '2025-08-10 07:30:20');
INSERT INTO `personal_access_tokens` VALUES (44, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', '5abfb41b462d67f862d00d243efa7d4377bb2b68487b176a28057a1050f17e0d', '[]', '2025-08-10 07:34:13', '2025-08-10 07:34:13', '2025-08-10 07:30:27', '2025-08-10 07:34:13');
INSERT INTO `personal_access_tokens` VALUES (45, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', 'f6db8ed6c13bb6899db277856c7176c813b2912af4b62cdc18026e0563a2c60b', '[]', '2025-08-10 07:38:16', '2025-08-10 07:38:16', '2025-08-10 07:34:59', '2025-08-10 07:38:16');
INSERT INTO `personal_access_tokens` VALUES (46, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', '4c0801ff3ca80bdbcc4e2c03f56e6c53632159a8589166f3942d502d9d0fd622', '[]', '2025-08-10 07:40:35', '2025-08-10 07:40:35', '2025-08-10 07:38:26', '2025-08-10 07:40:35');
INSERT INTO `personal_access_tokens` VALUES (47, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', '89161e67022506885602ba0199edec81ac430c62f5f00a49bbe9b52a97e26a35', '[]', '2025-08-10 08:02:14', '2025-08-10 08:02:14', '2025-08-10 07:45:49', '2025-08-10 08:02:14');
INSERT INTO `personal_access_tokens` VALUES (48, 'App\\Models\\User', '01k298kh8q2vbv3nct4ywer68z', 'web', '69a55cc49ed448d40c6482298def0a33d30971006ed650af845181263b32726f', '[]', '2025-08-10 13:29:32', '2025-08-10 13:29:32', '2025-08-10 13:25:11', '2025-08-10 13:29:32');
INSERT INTO `personal_access_tokens` VALUES (49, 'App\\Models\\User', '01k1tt6yprvb07d0yfnpnfffjj', 'web', 'b9132c723dbd747a1d52661d624100e83c09e571c3f3cf33cf4435c5bb5dab6a', '[]', '2025-08-10 13:29:51', '2025-08-10 13:29:51', '2025-08-10 13:29:41', '2025-08-10 13:29:51');
INSERT INTO `personal_access_tokens` VALUES (50, 'App\\Models\\User', '01k2a2sgvv1w8dtm40bzxnaz0f', 'web', '50166d8487f1f76a5f80f5cf43d772218ce828f45dc889bc93bdef41135c85a6', '[]', '2025-08-10 13:31:25', '2025-08-10 13:31:25', '2025-08-10 13:30:33', '2025-08-10 13:31:25');
INSERT INTO `personal_access_tokens` VALUES (51, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', 'c1990bed31a1cbbcf97c6235122986624f0b8559fa65b390c031a50866804055', '[]', '2025-08-10 13:32:04', '2025-08-10 13:32:04', '2025-08-10 13:31:44', '2025-08-10 13:32:04');
INSERT INTO `personal_access_tokens` VALUES (52, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', '59657da82cce131de44b34b3e204d1c30b1075abac5c9c5f3a56015729781b87', '[]', '2025-08-11 16:46:36', '2025-08-11 16:46:36', '2025-08-10 13:49:28', '2025-08-11 16:46:36');
INSERT INTO `personal_access_tokens` VALUES (53, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', '04f017c564886c8d51a7125fff7db36dad60a4fce00e6d3799c6cd86ee424b29', '[]', '2025-08-22 17:21:28', '2025-08-22 17:21:28', '2025-08-11 16:46:47', '2025-08-22 17:21:28');
INSERT INTO `personal_access_tokens` VALUES (54, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', 'de81da95409911ec55cfbb75b493de6605b4d418526c0459e90e7b8f37700daf', '[]', '2025-08-22 17:23:01', '2025-08-22 17:23:01', '2025-08-22 17:21:39', '2025-08-22 17:23:01');
INSERT INTO `personal_access_tokens` VALUES (55, 'App\\Models\\User', '01k1tt6yprvb07d0yfnpnfffjj', 'web', 'bae44d976fd80cf09e7800ed01a388366220f0e450b5798e2cbcbaef5a585a92', '[]', '2025-08-22 17:24:28', '2025-08-22 17:24:28', '2025-08-22 17:23:50', '2025-08-22 17:24:28');
INSERT INTO `personal_access_tokens` VALUES (56, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', '51a0b1cf3f76812353bfe7c222ed666a0a2970a08ee2ddc35169aa1e5f344527', '[]', '2025-08-22 17:25:43', '2025-08-22 17:25:43', '2025-08-22 17:24:42', '2025-08-22 17:25:43');
INSERT INTO `personal_access_tokens` VALUES (57, 'App\\Models\\User', '01k2a2sgvv1w8dtm40bzxnaz0f', 'web', '1e3fed14e98c883713bb84db75e6a0bf5ea94c9ba5768330de36224028192b7e', '[]', '2025-08-22 17:27:12', '2025-08-22 17:27:12', '2025-08-22 17:25:48', '2025-08-22 17:27:12');
INSERT INTO `personal_access_tokens` VALUES (58, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', '08462ba884c5954c776472dae23d5cfd6d186941934af005f0cd56202f89ce64', '[]', '2025-08-22 17:42:23', '2025-08-22 17:42:23', '2025-08-22 17:27:18', '2025-08-22 17:42:23');
INSERT INTO `personal_access_tokens` VALUES (59, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', '1bfad345d20579ecfba1b4b2ec9964c1e0741799661fe848d05c67b69e8c294d', '[]', '2025-08-22 17:48:13', '2025-08-22 17:48:13', '2025-08-22 17:46:01', '2025-08-22 17:48:13');
INSERT INTO `personal_access_tokens` VALUES (60, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', 'de21469ca15bda44334b4ac191b8012e08a13b19033093664cf5405d1118c397', '[]', '2025-08-22 17:49:44', '2025-08-22 17:49:44', '2025-08-22 17:48:24', '2025-08-22 17:49:44');
INSERT INTO `personal_access_tokens` VALUES (61, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', '4822cdadb068ce549b1036890e0ae60b507c117313312bce93e1e668e6f7d670', '[]', '2025-08-22 17:51:02', '2025-08-22 17:51:02', '2025-08-22 17:50:34', '2025-08-22 17:51:02');
INSERT INTO `personal_access_tokens` VALUES (62, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', '406281a3eb3bcdb0518fa784632415afe1eee546051207afc70f89cf09f98f46', '[]', '2025-08-22 17:52:09', '2025-08-22 17:52:09', '2025-08-22 17:51:40', '2025-08-22 17:52:09');
INSERT INTO `personal_access_tokens` VALUES (63, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', '7a9891518fab03eb9da3b4345ceca8975a91c8db859aee6d272f5fcfc1b5ac4e', '[]', '2025-08-22 17:53:15', NULL, '2025-08-22 17:53:03', '2025-08-22 17:53:15');
INSERT INTO `personal_access_tokens` VALUES (64, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', '0ee7cfe015d140abe0e9126195538dc92deb5d5a2165cef2d3f6650da41d9530', '[]', '2025-08-23 10:09:08', '2025-08-23 10:09:08', '2025-08-23 07:24:34', '2025-08-23 10:09:08');
INSERT INTO `personal_access_tokens` VALUES (65, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', '196975e8ac1334cd166fd21d5f13638c58259eac9735da795ba9cb330075923b', '[]', '2025-08-23 18:44:22', '2025-08-23 18:44:22', '2025-08-23 10:24:20', '2025-08-23 18:44:22');
INSERT INTO `personal_access_tokens` VALUES (66, 'App\\Models\\User', '01k13x3q8bmxjb8x77dc4vvc7z', 'web', 'd53f02abc3f5fb35a9a9b9abb9b7678ba683b83bb86814b96cbffd484314c532', '[]', '2025-08-26 15:04:33', NULL, '2025-08-23 18:44:36', '2025-08-26 15:04:33');

-- ----------------------------
-- Table structure for rules
-- ----------------------------
DROP TABLE IF EXISTS `rules`;
CREATE TABLE `rules`  (
  `id` char(26) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `symptom_id` char(26) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `diagnose_id` char(26) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` char(26) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` char(26) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `rules_diagnose_id_foreign`(`diagnose_id` ASC) USING BTREE,
  INDEX `rules_symptom_id_foreign`(`symptom_id` ASC) USING BTREE,
  CONSTRAINT `rules_diagnose_id_foreign` FOREIGN KEY (`diagnose_id`) REFERENCES `diagnoses` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `rules_symptom_id_foreign` FOREIGN KEY (`symptom_id`) REFERENCES `symptoms` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rules
-- ----------------------------
INSERT INTO `rules` VALUES ('KR0001', 'KG0001', 'KD0001', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 15:52:50', '2025-08-07 15:52:50');
INSERT INTO `rules` VALUES ('KR0002', 'KG0006', 'KD0001', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 15:52:50', '2025-08-07 15:52:50');
INSERT INTO `rules` VALUES ('KR0003', 'KG0012', 'KD0001', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 15:52:50', '2025-08-07 15:52:50');
INSERT INTO `rules` VALUES ('KR0004', 'KG0013', 'KD0001', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 15:52:50', '2025-08-07 15:52:50');
INSERT INTO `rules` VALUES ('KR0005', 'KG0007', 'KD0002', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 15:54:38', '2025-08-07 15:54:38');
INSERT INTO `rules` VALUES ('KR0006', 'KG0008', 'KD0002', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 15:54:38', '2025-08-07 15:54:38');
INSERT INTO `rules` VALUES ('KR0007', 'KG0010', 'KD0002', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 15:54:38', '2025-08-07 15:54:38');
INSERT INTO `rules` VALUES ('KR0008', 'KG0011', 'KD0002', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 15:54:38', '2025-08-07 15:54:38');
INSERT INTO `rules` VALUES ('KR0009', 'KG0009', 'KD0002', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 15:54:38', '2025-08-07 15:54:38');
INSERT INTO `rules` VALUES ('KR0010', 'KG0003', 'KD0003', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 15:55:42', '2025-08-07 15:55:42');
INSERT INTO `rules` VALUES ('KR0011', 'KG0002', 'KD0003', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 15:55:42', '2025-08-07 15:55:42');
INSERT INTO `rules` VALUES ('KR0012', 'KG0005', 'KD0003', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 15:55:42', '2025-08-07 15:55:42');
INSERT INTO `rules` VALUES ('KR0013', 'KG0016', 'KD0003', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 15:55:42', '2025-08-07 15:55:42');
INSERT INTO `rules` VALUES ('KR0014', 'KG0020', 'KD0003', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 15:55:42', '2025-08-07 15:55:42');
INSERT INTO `rules` VALUES ('KR0015', 'KG0003', 'KD0004', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 15:56:08', '2025-08-07 15:56:08');
INSERT INTO `rules` VALUES ('KR0016', 'KG0010', 'KD0004', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 15:56:08', '2025-08-07 15:56:08');
INSERT INTO `rules` VALUES ('KR0017', 'KG0008', 'KD0004', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 15:56:08', '2025-08-07 15:56:08');
INSERT INTO `rules` VALUES ('KR0018', 'KG0007', 'KD0004', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 15:56:08', '2025-08-07 15:56:08');
INSERT INTO `rules` VALUES ('KR0019', 'KG0005', 'KD0005', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 15:56:31', '2025-08-07 15:56:31');
INSERT INTO `rules` VALUES ('KR0020', 'KG0017', 'KD0005', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 15:56:31', '2025-08-07 15:56:31');
INSERT INTO `rules` VALUES ('KR0021', 'KG0016', 'KD0005', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 15:56:31', '2025-08-07 15:56:31');
INSERT INTO `rules` VALUES ('KR0022', 'KG0004', 'KD0006', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 15:56:54', '2025-08-07 15:56:54');
INSERT INTO `rules` VALUES ('KR0023', 'KG0019', 'KD0006', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 15:56:54', '2025-08-07 15:56:54');
INSERT INTO `rules` VALUES ('KR0024', 'KG0018', 'KD0006', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 15:56:54', '2025-08-07 15:56:54');
INSERT INTO `rules` VALUES ('KR0025', 'KG0002', 'KD0007', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 15:58:15', '2025-08-07 15:58:15');
INSERT INTO `rules` VALUES ('KR0026', 'KG0006', 'KD0007', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 15:58:15', '2025-08-07 15:58:15');
INSERT INTO `rules` VALUES ('KR0027', 'KG0015', 'KD0007', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 15:58:15', '2025-08-07 15:58:15');
INSERT INTO `rules` VALUES ('KR0028', 'KG0003', 'KD0007', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 15:58:15', '2025-08-07 15:58:15');
INSERT INTO `rules` VALUES ('KR0029', 'KG0001', 'KD0008', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 16:00:42', '2025-08-07 16:00:42');
INSERT INTO `rules` VALUES ('KR0030', 'KG0012', 'KD0008', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 16:00:42', '2025-08-07 16:00:42');
INSERT INTO `rules` VALUES ('KR0031', 'KG0013', 'KD0008', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 16:00:42', '2025-08-07 16:00:42');
INSERT INTO `rules` VALUES ('KR0032', 'KG0014', 'KD0008', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 16:00:42', '2025-08-07 16:00:42');
INSERT INTO `rules` VALUES ('KR0033', 'KG0015', 'KD0008', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 16:00:42', '2025-08-07 16:00:42');
INSERT INTO `rules` VALUES ('KR0034', 'KG0009', 'KD0009', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 16:01:45', '2025-08-07 16:01:45');
INSERT INTO `rules` VALUES ('KR0035', 'KG0020', 'KD0009', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 16:01:45', '2025-08-07 16:01:45');
INSERT INTO `rules` VALUES ('KR0036', 'KG0003', 'KD0009', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 16:01:45', '2025-08-07 16:01:45');
INSERT INTO `rules` VALUES ('KR0037', 'KG0011', 'KD0010', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 16:02:12', '2025-08-07 16:02:12');
INSERT INTO `rules` VALUES ('KR0038', 'KG0008', 'KD0010', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 16:02:12', '2025-08-07 16:02:12');
INSERT INTO `rules` VALUES ('KR0039', 'KG0007', 'KD0010', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 16:02:12', '2025-08-07 16:02:12');
INSERT INTO `rules` VALUES ('KR0040', 'KG0020', 'KD0010', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 16:02:12', '2025-08-07 16:02:12');
INSERT INTO `rules` VALUES ('KR0041', 'KG0018', 'KD0011', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 16:02:34', '2025-08-07 16:02:34');
INSERT INTO `rules` VALUES ('KR0042', 'KG0004', 'KD0011', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 16:02:34', '2025-08-07 16:02:34');
INSERT INTO `rules` VALUES ('KR0043', 'KG0001', 'KD0011', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 16:02:34', '2025-08-07 16:02:34');
INSERT INTO `rules` VALUES ('KR0044', 'KG0014', 'KD0011', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 16:02:34', '2025-08-07 16:02:34');
INSERT INTO `rules` VALUES ('KR0045', 'KG0020', 'KD0012', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 16:02:53', '2025-08-07 16:02:53');
INSERT INTO `rules` VALUES ('KR0046', 'KG0010', 'KD0012', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 16:02:53', '2025-08-07 16:02:53');
INSERT INTO `rules` VALUES ('KR0047', 'KG0009', 'KD0012', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 16:02:53', '2025-08-07 16:02:53');
INSERT INTO `rules` VALUES ('KR0048', 'KG0011', 'KD0012', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-07 16:02:53', '2025-08-07 16:02:53');

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sessions_user_id_index`(`user_id` ASC) USING BTREE,
  INDEX `sessions_last_activity_index`(`last_activity` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('0xFPbSnlumQrXF7PNFfU60HKBFSroDvfvA8xrAx3', NULL, '127.0.0.1', 'PostmanRuntime/7.44.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaHB6VFd2ZXc5c0FkRE1KZ201VFN5c3dkY2g0WHAxc3VzbWJOaW5PdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753552008);

-- ----------------------------
-- Table structure for solutions
-- ----------------------------
DROP TABLE IF EXISTS `solutions`;
CREATE TABLE `solutions`  (
  `id` char(26) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `diagnose_id` char(26) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` char(26) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` char(26) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `solutions_diagnose_id_foreign`(`diagnose_id` ASC) USING BTREE,
  CONSTRAINT `solutions_diagnose_id_foreign` FOREIGN KEY (`diagnose_id`) REFERENCES `diagnoses` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of solutions
-- ----------------------------
INSERT INTO `solutions` VALUES ('01k1zyd1m056fptcxdawv7kr7b', 'KD0001', 'Periksa tegangan dengan multimeter, mengganti IC power jika rusak, atau mengganti motherboard jika kerusakan terlalu parah', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 15:01:10', '2025-08-06 19:20:22');
INSERT INTO `solutions` VALUES ('01k1zyh5exczsavqvyknn8a9rd', 'KD0002', 'Lakukan reflow atau reballing pada chipset (jika memungkinkan), memastikan pendingin chipset berfungsi baik, dan mengganti motherboard jika chipset tidak dapat diperbaiki', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 15:03:25', '2025-08-06 15:03:59');
INSERT INTO `solutions` VALUES ('01k1zyj1rjcqerhnty61c2293j', 'KD0003', 'Lakukan reset BIOS, flashing ulang BIOS dengan versi terbaru, atau mengganti chip BIOS jika diperlukan', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 15:03:54', '2025-08-06 15:03:54');
INSERT INTO `solutions` VALUES ('01k1zykcgmts3jw9dyk7f92zzm', 'KD0004', 'Bersihkan pin dan slot RAM, mencoba slot lain, atau mengganti motherboard bila slot rusak', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 15:04:38', '2025-08-06 15:04:38');
INSERT INTO `solutions` VALUES ('01k1zzpk31m4am3048b4da03w4', 'KD0005', 'Mengganti baterai CMOS dengan yang baru dan memeriksa kondisi soket baterai', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 15:23:52', '2025-08-06 15:23:52');
INSERT INTO `solutions` VALUES ('01k1zzqdy50g99d0nqtpcecyyf', 'KD0006', 'Coba port lain, periksa pengaturan BIOS dan driver, serta mengganti IC USB atau motherboard jika kerusakan bersifat hardware', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 15:24:19', '2025-08-06 15:24:19');
INSERT INTO `solutions` VALUES ('01k1zzrdjny2jrgzpc42j6trd5', 'KD0007', 'Lepas dan pasang ulang CPU dengan benar, membersihkan socket, dan mengganti motherboard jika kerusakan pada soket tidak bisa diperbaiki', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 15:24:52', '2025-08-06 15:24:52');
INSERT INTO `solutions` VALUES ('01k1zzsy5r41gxntpbgvz4xyev', 'KD0008', 'Jika komputer tidak menyala, terdapat bau hangus, LED menyala tapi tidak boot, atau tidak merespon tombol power, kemungkinan terjadi short atau konslet pada motherboard. Solusinya adalah melakukan pemeriksaan fisik, mengganti power supply untuk memastikan, dan mengganti motherboard jika ditemukan kerusakan serius', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 15:25:41', '2025-08-06 15:25:41');
INSERT INTO `solutions` VALUES ('01k1zztzcq6m1x1mrxerjf1v08', 'KD0009', 'Jika VGA tidak terdeteksi, performa sangat lambat, atau terjadi beep tidak normal, bisa jadi slot PCIe rusak. Solusinya adalah membersihkan slot, mencoba slot lain jika tersedia, atau mengganti motherboard', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 15:26:15', '2025-08-06 15:26:15');
INSERT INTO `solutions` VALUES ('01k200204pv7k3yr2c1e0wyvbw', 'KD0010', 'Coba kabel dan port lain, gunakan SATA add-on card', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 15:30:06', '2025-08-06 15:30:06');
INSERT INTO `solutions` VALUES ('01k20032ne479xjdht2nz52mgd', 'KD0011', 'Bersihkan area korosi dengan cairan pembersih PCB', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 15:30:41', '2025-08-06 15:30:41');
INSERT INTO `solutions` VALUES ('01k2003kqb7dh4mzfhqj83xkx4', 'KD0012', 'Jika performa komputer sangat lambat, RAM, VGA, atau harddisk tidak terbaca, kemungkinan motherboard sudah usang. Solusinya adalah memperbarui BIOS jika memungkinkan atau mengganti motherboard dengan yang lebih kompatibel dengan komponen baru', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 15:30:58', '2025-08-06 15:30:58');

-- ----------------------------
-- Table structure for symptoms
-- ----------------------------
DROP TABLE IF EXISTS `symptoms`;
CREATE TABLE `symptoms`  (
  `id` char(26) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `question` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` char(26) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` char(26) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of symptoms
-- ----------------------------
INSERT INTO `symptoms` VALUES ('KG0001', 'Komputer tidak menyala sama sekali', 'Apakah Komputer tidak menyala sama sekali?', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 14:39:12', '2025-08-06 14:39:12');
INSERT INTO `symptoms` VALUES ('KG0002', 'Tidak ada tampilan di layar saat dinyalakan', 'Apakah tidak ada tampilan di layar saat dinyalakan?', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 14:39:27', '2025-08-06 14:39:27');
INSERT INTO `symptoms` VALUES ('KG0003', 'Suara beep yang tidak normal saat startup', 'Apakah terdengar suara beep yang tidak normal saat startup atau nyala pertama kali?', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 14:48:52', '2025-08-06 14:48:52');
INSERT INTO `symptoms` VALUES ('KG0004', 'Port USB tidak berfungsi', 'Apakah port USB tidak berfungsi?', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 14:50:03', '2025-08-06 14:50:03');
INSERT INTO `symptoms` VALUES ('KG0005', 'Waktu BIOS sering kembali ke default', 'Apakah waktu atau tanggal sering kembali ke pengaturan awal?', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 14:50:37', '2025-08-06 14:50:37');
INSERT INTO `symptoms` VALUES ('KG0006', 'Overheating atau panas berlebihan', 'Apakah komputer mengalami overheating atau panas berlebihan?', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 14:53:48', '2025-08-06 14:53:48');
INSERT INTO `symptoms` VALUES ('KG0007', 'Komputer sering restart sendiri', 'Apakah komputer sering restart sendiri?', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 14:55:03', '2025-08-06 14:55:03');
INSERT INTO `symptoms` VALUES ('KG0008', 'Komputer freeze (hang) saat digunakan', 'Apakah komputer sering freeze atau hang saat digunakan?', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 14:55:14', '2025-08-06 14:55:14');
INSERT INTO `symptoms` VALUES ('KG0009', 'VGA Card tidak terdeteksi', 'Apakah VGA Card tidak terdeteksi?', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 14:55:26', '2025-08-06 14:55:26');
INSERT INTO `symptoms` VALUES ('KG0010', 'RAM tidak terbaca', 'Apakah RAM tidak terbaca?', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 14:55:35', '2025-08-06 14:55:35');
INSERT INTO `symptoms` VALUES ('KG0011', 'Harddisk tidak terdeteksi di BIOS', 'Apakah harddisk tidak terdeteksi di BIOS?\n', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 14:55:44', '2025-08-06 14:55:50');
INSERT INTO `symptoms` VALUES ('KG0012', 'Terdapat bekas terbakar atau bau hangus', 'Apakah terdapat bekas terbakar atau bau hangus pada komputer?', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 14:56:26', '2025-08-06 14:56:26');
INSERT INTO `symptoms` VALUES ('KG0013', 'LED power menyala tapi tidak ada aktivitas', 'Apakah LED power menyala tetapi tidak ada aktivitas pada komputer?', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 14:56:42', '2025-08-06 14:56:42');
INSERT INTO `symptoms` VALUES ('KG0014', 'Motherboard tidak merespon tombol power', 'Apakah motherboard tidak merespon saat tombol power ditekan?', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 14:56:51', '2025-08-06 14:56:51');
INSERT INTO `symptoms` VALUES ('KG0015', 'Komponen seperti kipas menyala tapi tidak booting', 'Apakah kipas menyala tetapi komputer tidak booting?', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 14:57:06', '2025-08-06 14:57:06');
INSERT INTO `symptoms` VALUES ('KG0016', 'Tidak dapat masuk BIOS', 'Apakah Anda tidak dapat masuk ke BIOS?', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 14:57:16', '2025-08-06 14:57:16');
INSERT INTO `symptoms` VALUES ('KG0017', 'CMOS Battery cepat habis', 'Apakah baterai CMOS cepat habis?', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 14:57:24', '2025-08-06 14:57:24');
INSERT INTO `symptoms` VALUES ('KG0018', 'Port LAN tidak berfungsi', 'Apakah port LAN tidak berfungsi?', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 14:57:31', '2025-08-06 14:57:31');
INSERT INTO `symptoms` VALUES ('KG0019', 'Keyboard tidak terdeteksi saat booting', 'Apakah keyboard tidak terdeteksi saat proses booting?', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 14:57:38', '2025-08-06 14:57:38');
INSERT INTO `symptoms` VALUES ('KG0020', 'Performa komputer sangat lambat meskipun hardware baik', 'Apakah performa komputer sangat lambat meskipun hardware dalam kondisi baik?', '01k13x3q8bmxjb8x77dc4vvc7z', '01k13x3q8bmxjb8x77dc4vvc7z', '2025-08-06 14:57:59', '2025-08-06 14:57:59');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` char(26) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('admin','user') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('01k13x3q8bmxjb8x77dc4vvc7z', 'admin', 'Admin', 'admin@gmail.com', '2025-07-26 17:39:52', '$2y$12$WG0niovmcJkFBndF3CqBuutLDFTVpE0sc5VD.E0rM.mES21Df5C8e', 'MG5c7VJw6F', '2025-07-26 17:39:52', '2025-07-26 17:39:52');
INSERT INTO `users` VALUES ('01k298kh8q2vbv3nct4ywer68z', 'admin', 'trian', 'trian@gmail.com', NULL, '$2y$12$EJuSkMM18plBkEgfrtRx2uL5q9kw8dKPY6bPlYSsF.1362n9io2wy', NULL, '2025-08-10 05:52:39', '2025-08-10 06:00:45');

SET FOREIGN_KEY_CHECKS = 1;
