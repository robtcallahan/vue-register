USE `fincal`;

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`
(
    `id`           int         NOT NULL AUTO_INCREMENT,
    `name`         varchar(100) DEFAULT NULL,
    `color`        varchar(45) NOT NULL,
    `column_index` int         NOT NULL,
    `letter`       varchar(45) NOT NULL,
    `is_category`  tinyint     NOT NULL,
    `created_at`   datetime(3)  DEFAULT NULL,
    `updated_at`   datetime(3)  DEFAULT NULL,
    `deleted_at`   datetime(3)  DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `id_UNIQUE` (`id`),
    UNIQUE KEY `category_id_UNIQUE` (`column_index`),
    UNIQUE KEY `name_UNIQUE` (`name`),
    KEY `idx_categories_deleted_at` (`deleted_at`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 56
  DEFAULT CHARSET = utf8;

LOCK TABLES `categories` WRITE;
ALTER TABLE `categories` DISABLE KEYS;
INSERT INTO `categories`
VALUES (11, 'Cash', 'green', 10, 'K', 1, '2020-11-24 00:00:00', '2020-11-24 00:00:00', NULL),
       (12, 'Dining Out', 'green', 11, 'L', 1, '2020-11-24 00:00:00', '2020-11-24 00:00:00', NULL),
       (13, 'Uber', 'green', 12, 'M', 1, '2020-11-24 00:00:00', '2020-11-24 00:00:00', NULL),
       (14, 'Grocery', 'green', 13, 'N', 1, '2020-11-24 00:00:00', '2020-11-24 00:00:00', NULL),
       (15, 'Misc', 'green', 14, 'O', 1, '2020-11-24 00:00:00', '2020-11-24 00:00:00', NULL),
       (16, 'Vape Supplies', 'green', 15, 'P', 1, '2020-11-24 00:00:00', '2020-11-24 00:00:00', NULL),
       (17, 'AT&T', 'yellow', 16, 'Q', 1, '2020-11-24 00:00:00', '2020-11-24 00:00:00', NULL),
       (18, 'Content Subscriptions', 'yellow', 17, 'R', 1, '2020-11-24 00:00:00', '2020-11-24 00:00:00', NULL),
       (19, 'ISP', 'yellow', 18, 'S', 1, '2020-11-24 00:00:00', '2020-11-24 00:00:00', NULL),
       (22, 'Shenandoah Electric', 'yellow', 19, 'T', 1, '2020-11-24 00:00:00', '2020-11-24 00:00:00', NULL),
       (23, 'Hair Cut', 'yellow', 20, 'U', 1, '2020-11-24 00:00:00', '2020-11-24 00:00:00', NULL),
       (25, 'Massage', 'yellow', 22, 'W', 1, '2020-11-24 00:00:00', '2020-11-24 00:00:00', NULL),
       (28, 'Rent', 'yellow', 23, 'X', 1, '2020-11-24 00:00:00', '2020-11-24 00:00:00', NULL),
       (29, 'Renters Insurance', 'yellow', 24, 'Y', 1, '2020-11-24 00:00:00', '2020-11-24 00:00:00', NULL),
       (30, 'Storage Rental', 'yellow', 26, 'AA', 1, '2020-11-24 00:00:00', '2020-11-24 00:00:00', NULL),
       (31, 'Credit Cards', 'yellow', 27, 'AB', 1, '2020-11-24 00:00:00', '2020-11-24 00:00:00', NULL),
       (40, 'Clothing & Household', 'blue', 33, 'AH', 1, '2020-11-24 00:00:00', '2020-11-24 00:00:00', NULL),
       (41, 'Extra', 'blue', 34, 'AI', 1, '2020-11-24 00:00:00', '2020-11-24 00:00:00', NULL),
       (42, 'General Savings', 'blue', 35, 'AJ', 1, '2020-11-24 00:00:00', '2020-11-24 00:00:00', NULL),
       (46, 'Gifts', 'blue', 36, 'AK', 1, '2020-11-24 00:00:00', '2020-11-24 00:00:00', NULL),
       (47, 'Medical', 'blue', 37, 'AL', 1, '2020-11-24 00:00:00', '2020-11-24 00:00:00', NULL),
       (54, 'Vision', 'blue', 39, 'AN', 1, '2020-11-24 00:00:00', '2020-11-24 00:00:00', NULL),
       (58, 'Emergency Fund', 'blue', 40, 'AO', 1, '2021-01-15 00:00:00', '2021-01-15 00:00:00', NULL),
       (59, 'Taxes', 'blue', 41, 'AP', 1, '2021-01-15 00:00:00', '2021-01-15 00:00:00', NULL),
       (61, 'SoberLink', 'yellow', 25, 'Z', 1, '2023-06-22 00:00:00', '2023-06-22 00:00:00', NULL),
       (67, 'Water, Sewer, Trash', 'yellow', 21, 'V', 1, '2023-06-22 00:00:00', '2023-06-22 00:00:00', NULL);
ALTER TABLE `categories` ENABLE KEYS;
UNLOCK TABLES;

DROP TABLE IF EXISTS `merchants`;
CREATE TABLE `merchants`
(
    `id`             int          NOT NULL AUTO_INCREMENT,
    `name`           varchar(100) NOT NULL,
    `bank_name`      varchar(200) NOT NULL,
    `categories_id`  int          NOT NULL,
    `created_at`     datetime(3) DEFAULT NULL,
    `updated_at`     datetime(3) DEFAULT NULL,
    `deleted_at`     datetime(3) DEFAULT NULL,
    `tax_deductible` tinyint(1)   NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `id_UNIQUE` (`id`),
    KEY `bank_name_UNIQUE` (`bank_name`),
    KEY `column_id_fk_idx` (`categories_id`),
    KEY `idx_merchants_deleted_at` (`deleted_at`),
    CONSTRAINT `merchants_categories_id_fk` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 64
  DEFAULT CHARSET = utf8;

LOCK TABLES `merchants` WRITE;
ALTER TABLE `merchants` DISABLE KEYS;
INSERT INTO `merchants`
VALUES (301, 'Martins', 'GIANT MARTINS 6078     800-573-2763  VA', 14, '2023-06-23 12:37:55.651',
        '2023-06-23 12:37:55.651', NULL, 0),
       (302, 'GrubHub', 'GRUBHUBEASTERNCHINA    GRUBHUB.COM   NY', 12, '2023-06-23 12:38:05.610',
        '2023-06-23 12:38:05.610', NULL, 0),
       (303, 'Uber', 'UBER   TRIP            HELP.UBER.COM CA', 13, '2023-06-23 12:38:13.890',
        '2023-06-23 12:38:13.890', NULL, 0),
       (304, 'Jonathan Bishop Winchester', 'SQ *JONATHAN BISHOP    Winchester    VA', 14, '2023-06-23 12:38:50.216',
        '2023-06-23 12:38:50.216', NULL, 0),
       (306, 'Freedom Agway', 'FREEDOM AG & ENERGY CO WINCHESTER    VA', 40, '2023-06-23 12:39:27.863',
        '2023-06-23 12:39:27.863', NULL, 0),
       (307, 'Win Mart', 'WIN MART LLC           WINCHESTER    VA', 14, '2023-06-23 12:39:43.350',
        '2023-06-23 12:39:43.350', NULL, 0),
       (308, 'MJ Hayes', 'MJ HAYES               WINCHESTER    VA', 15, '2023-06-23 12:39:56.854',
        '2023-06-23 12:39:56.854', NULL, 0),
       (311, 'Uber', 'UBER   TRIP            HELP.UBER.COM CA', 13, '2023-06-23 12:40:20.253',
        '2023-06-23 12:40:20.253', NULL, 0),
       (313, 'Bill Payment Return', 'BILL PAY PAYMENT RETURN ON 06-22', 42, '2023-06-23 13:03:34.486',
        '2023-06-23 13:03:34.486', NULL, 0),
       (316, 'Uber', 'UBER TRIP 8005928996 CA', 13, '2023-06-24 13:28:15.821', '2023-06-24 13:28:15.821', NULL, 0),
       (317, 'Fraud Dispute', 'FRAUD DISPUTE', 31, '2023-06-24 13:30:54.493', '2023-06-24 13:30:54.493', NULL, 0),
       (318, 'Interest Returned', 'INTEREST REF PURCHASES FEB 2023', 31, '2023-06-24 13:31:09.154',
        '2023-06-24 13:31:09.154', NULL, 0),
       (319, 'Amazon Marketplace', 'AMZN MKTP US*Y33O45VA3 AMZN.COM/BILLWA', 40, '2023-06-24 13:36:12.050',
        '2023-06-24 13:36:12.050', NULL, 0),
       (320, 'Amazon Marketplace', 'AMZN MKTP US*W110Q99G3 AMZN.COM/BILLWA', 40, '2023-06-24 13:36:22.800',
        '2023-06-24 13:36:22.800', NULL, 0),
       (321, 'Amazon Marketplace', 'AMZN MKTP US*7J8F581I3 AMZN.COM/BILLWA', 40, '2023-06-24 13:36:26.935',
        '2023-06-24 13:36:26.935', '2023-09-02 02:43:51.367', 0),
       (322, 'Spotify', 'SPOTIFY                877-778-1161  NY', 18, '2023-07-02 18:13:13.551',
        '2023-07-02 18:13:13.551', NULL, 0),
       (323, 'AT&T', 'ATT Payment 062323 489186002EPAYY Family Name', 17, '2023-07-02 18:13:28.540',
        '2023-07-02 18:13:28.540', NULL, 0),
       (324, 'Huff and Puffers', 'HUFF AND PUFFERS       657-2335688   CA', 16, '2023-07-02 18:13:44.065',
        '2023-07-02 18:13:44.065', NULL, 0),
       (325, 'Loudoun County', 'NCOURT *VALoudounCount 844-4008880   VA', 61, '2023-07-02 18:14:35.415',
        '2023-07-02 18:14:35.415', NULL, 0),
       (326, 'Sheetz', 'SHEETZ 0207   00002071 WINCHESTER    VA', 12, '2023-07-08 14:28:41.324',
        '2023-07-08 14:28:41.324', NULL, 0),
       (327, 'Glo Fiber', 'GLO FIBER BILLPAY 230702 GLO FIBER ROBERT CALLAHAN', 19, '2023-07-08 14:28:52.834',
        '2023-07-08 14:28:52.834', NULL, 0),
       (328, 'VA Dept of Taxation',
        'BUSINESS TO BUSINESS ACH VA DEPT TAXATION TAX PAYMEN 230630 XXXXX2314 CALLAHAN, ROBERT T.', 42,
        '2023-07-08 14:29:08.270', '2023-07-08 14:29:08.270', NULL, 0),
       (329, 'Olive Tree Properties', 'Olive Tree Prope WEB PMTS 070323 YP2MT7 Robert Callahan', 28,
        '2023-07-08 14:29:26.766', '2023-07-08 14:29:26.766', NULL, 0),
       (330, 'Apple Card', 'APPLECARD GSBANK PAYMENT 063023 XXXXX5844 Robert Callahan', 31, '2023-07-08 14:29:42.698',
        '2023-07-08 14:29:42.698', NULL, 0),
       (331, 'Transfer from Fidelity - points', 'FID BKG SVC LLC MONEYLINE 230705 X15716928 1JK7W ROBERT T CALLAHAN',
        42, '2023-07-08 14:29:59.064', '2023-07-08 14:29:59.064', NULL, 0),
       (332, 'Harland Clarke Checks', 'HARLAND CLARKE CHECK/ACC. 070323 00688487575488 ROBERT T CALLAHAN', 41,
        '2023-07-08 14:30:23.647', '2023-07-08 14:30:23.647', NULL, 0),
       (333, 'Shenandoah Valley Electric', 'SHENANDOAH VALLE UTILITY 230704 3957509 ROBERT T *CALLAHAN', 67,
        '2023-07-08 14:30:39.559', '2023-07-08 14:30:39.559', NULL, 0),
       (334, 'MasterCard', 'BILL PAY MasterCard ON-LINE xxxxxxxxxxxx5189 ON 07-07', 31, '2023-07-08 14:30:52.504',
        '2023-07-08 14:30:52.504', NULL, 0),
       (335, 'MyVaporStore', 'MV STORE INC          718-7287838   NY', 16, '2023-07-16 15:39:55.827',
        '2023-07-16 15:39:55.827', NULL, 0),
       (336, 'Transfer from E*Trade', 'MSPBNA ACH TRNSFR 230712 84178376906 45469742', 42, '2023-07-16 15:45:28.642',
        '2023-07-16 15:45:28.642', NULL, 0),
       (337, 'Mavado', 'SP MAVADO              SUDBURY       GB', 40, '2023-07-16 15:45:49.405',
        '2023-07-16 15:45:49.405', NULL, 0),
       (338, 'Foreign transaction fee', 'FRGN TRANS FEE-SP MAVADO              SU', 40, '2023-07-16 15:46:08.180',
        '2023-07-16 15:46:08.180', NULL, 0),
       (339, 'Refactoring Guru', '2COCOM*REFACTORINGGURU 888-2471614   GA', 41, '2023-07-16 15:46:30.747',
        '2023-07-16 15:46:30.747', NULL, 0),
       (340, 'American Strategic Insurance', 'AMERICAN STRATEG 8662748765 1A55EB86FCFE ROBERT CALLAHAN', 29,
        '2023-07-19 01:20:41.708', '2023-07-19 01:20:41.708', NULL, 0),
       (341, 'CarbonCopyCloner', 'FS *CARBONCOPYCLONE    877-3278914   CA', 40, '2023-07-22 13:03:36.598',
        '2023-07-22 13:03:36.598', NULL, 0),
       (342, 'Babbel', 'Babbel.com Spanish La  Berlin        DE', 41, '2023-07-22 13:03:48.480',
        '2023-07-22 13:03:48.480', NULL, 0),
       (343, 'Foreign Transaction Fee', 'FRGN TRANS FEE-Babbel.com Spanish La  Be', 41, '2023-07-22 13:04:04.145',
        '2023-07-22 13:04:04.145', NULL, 0),
       (344, 'Foreign Transaction Fee', 'FRGN TRANS FEE-TOTALAVCOM             84', 41, '2023-07-30 18:19:53.235',
        '2023-07-30 18:19:53.235', NULL, 0),
       (345, 'Vista Print', 'VISTAPRINT             866-207-4955  MA', 40, '2023-07-30 18:20:08.732',
        '2023-07-30 18:20:08.732', NULL, 0),
       (346, 'Nibblins', 'NIBBLINS.COM           540-535-0787  VA', 41, '2023-07-30 18:20:31.391',
        '2023-07-30 18:20:31.391', NULL, 0),
       (347, 'TotalAV', 'TOTALAVCOM             8443466837    GB', 18, '2023-07-30 18:20:45.079',
        '2023-07-30 18:20:45.079', NULL, 0),
       (348, 'Evernote', 'Evernote               650-2570885   CA', 18, '2023-07-30 18:21:00.174',
        '2023-07-30 18:21:00.174', NULL, 0),
       (349, 'Planet Fitness', '09919 PF WINCHESTER VA WINCHESTER    VA', 18, '2023-07-30 18:21:50.697',
        '2023-07-30 18:21:50.697', NULL, 0),
       (350, 'Hott Hair', 'SQ *HOTT HAIR          Winchester    VA', 23, '2023-07-30 18:21:59.301',
        '2023-07-30 18:21:59.301', NULL, 0),
       (351, 'Straplez', 'ECHST.NET              866-452-5108  WA', 18, '2023-07-30 18:21:59.301',
        '2023-07-30 18:24:51.034', NULL, 0),
       (352, 'eJuice', 'EJUICEDB.COM           631-7773487   NY', 16, '2023-07-30 18:25:02.858',
        '2023-07-30 18:25:02.858', NULL, 0),
       (353, 'AT&T', 'ATT Payment 072323 010474011EPAYI Family Name', 17, '2023-07-30 18:21:59.301',
        '2023-07-30 18:21:59.301', NULL, 0),
       (355, 'Winchester Public Utilities', 'BILL PAY Winchester Public Utilities ON-LINE xx0009 ON 07-24', 67,
        '2023-07-30 18:21:59.301', '2023-07-30 18:21:59.301', NULL, 0),
       (356, 'Martin\'s', 'Martin\'s', 14, '2023-08-05 22:59:59.949', '2023-08-05 22:59:59.949', NULL, 0),
       (357, 'Plex', 'Plex', 18, '2023-08-05 23:00:28.143', '2023-08-05 23:00:28.143', NULL, 0),
       (358, 'CHECK', 'CHECK', 46, '2023-08-05 23:00:54.458', '2023-08-05 23:00:54.458', NULL, 0),
       (359, 'SoberLink', 'nCourt', 61, '2023-08-05 23:01:12.148', '2023-08-05 23:01:12.148', NULL, 0),
       (360, 'Olive Tree Properties', 'Olive Tree Prope WEB PMTS 080123 9FRJZ7 Robert Callahan', 28,
        '2023-08-05 23:01:21.950', '2023-08-05 23:01:21.950', NULL, 0),
       (361, 'AppleCard', 'APPLECARD GSBANK PAYMENT 073123 XXXXX5844 Robert Callahan', 31, '2023-08-05 23:01:37.958',
        '2023-08-05 23:01:37.958', NULL, 0),
       (362, 'GloFiber', 'GLO FIBER BILLPAY 230801 GLO FIBER ROBERT CALLAHAN', 19, '2023-08-05 23:01:49.666',
        '2023-08-05 23:01:49.666', NULL, 0),
       (363, 'Paul Chmielewski Optomitrist', 'Paul Chmielewski Od', 41, '2023-08-05 23:02:17.816',
        '2023-08-05 23:02:17.816', NULL, 0),
       (364, 'Selah Theater Project', 'Www.selahtheatreprojec', 41, '2023-08-05 23:02:34.292',
        '2023-08-05 23:02:34.292', NULL, 0),
       (365, 'Transfer from E*Trade', 'MSPBNA ACH TRNSFR 230802 85756320906 45469742', 42, '2023-08-05 23:02:53.217',
        '2023-08-05 23:02:53.217', NULL, 0),
       (366, 'Piccadilly Grill', 'Piccadilly Grill', 12, '2023-08-05 23:03:03.523', '2023-08-05 23:03:03.523', NULL, 0),
       (367, 'Win Mart', 'Win Mart Llc', 14, '2023-08-05 23:03:12.891', '2023-08-05 23:03:12.891', NULL, 0),
       (368, 'Shenandoah Electric', 'SHENANDOAH VALLE UTILITY 230804 2530462 ROBERT T *CALLAHAN', 22,
        '2023-08-12 11:56:52.944', '2023-08-12 11:56:52.944', NULL, 0),
       (369, 'Winchester Parks & Rec', 'Winchester Parks & Rec Httpswww.winc', 41, '2023-08-12 11:57:08.287',
        '2023-08-12 11:57:08.287', NULL, 0),
       (370, 'Bank of America MasterCard', 'BILL PAY MasterCard ON-LINE xxxxxxxxxxxx5189 ON 08-09', 31,
        '2023-08-12 11:57:28.923', '2023-08-12 11:57:28.923', NULL, 0),
       (371, 'Jetbrains', 'Jetbrains Americas Inc', 41, '2023-08-12 11:57:42.374', '2023-08-12 11:57:42.374', NULL, 0),
       (372, 'JetBrains', 'JetBrains', 18, '2023-08-20 13:18:38.959', '2023-08-20 13:18:38.959', NULL, 0),
       (373, 'eJuice', 'Ejuicedb.com', 16, '2023-08-20 13:18:54.511', '2023-08-20 13:18:54.511', NULL, 0),
       (374, 'Plaid', 'Plaid', 18, '2023-08-20 13:19:19.945', '2023-08-20 13:19:19.945', NULL, 0),
       (375, 'American Strategic Insurance', 'AMERICAN STRATEG 8662748765 13D97E89C102 ROBERT CALLAHAN', 29,
        '2023-08-20 13:19:43.240', '2023-08-20 13:19:43.240', NULL, 0),
       (376, 'Martins', 'Martins', 14, '2023-08-20 13:19:55.703', '2023-08-20 13:19:55.703', NULL, 0),
       (377, 'Planet Fitness', 'PLANET FIT CLUB FEES 2322814358736', 18, '2023-08-20 13:20:25.445',
        '2023-08-20 13:20:25.445', NULL, 0),
       (378, 'Star Spa', 'Star Spa Llc', 25, '2023-08-20 13:20:35.518', '2023-08-20 13:20:35.518', NULL, 0),
       (380, 'Sharp Shopper Grocery', 'Sharp Shopper Groce', 14, '2023-08-26 12:24:57.430', '2023-08-26 12:24:57.430',
        NULL, 0),
       (381, 'AT&T', 'ATT Payment 082323 820487003EPAYH Family Name', 17, '2023-08-26 12:25:08.120',
        '2023-08-26 12:25:08.120', NULL, 0),
       (382, 'The Mediterranean Dish', 'Sp Mediterranean Dish Shop.themedit', 14, '2023-08-26 12:25:35.388',
        '2023-08-26 12:25:35.388', NULL, 0),
       (383, 'Starlink Internet', 'Starlink Internet', 40, '2023-08-26 12:26:10.174', '2023-08-26 12:26:10.174', NULL,
        0),
       (384, 'StarLink', 'Starlink', 31, '2023-09-02 13:54:29.247', '2023-09-02 13:54:29.247', NULL, 0),
       (385, 'NAATW', 'Naatw.org Naatw.org Co', 41, '2023-09-02 13:54:49.116', '2023-09-02 13:54:49.116', NULL, 0),
       (386, 'Planet Fitness', 'PLANET FIT CLUB FEES 232430120541', 18, '2023-09-02 13:55:05.926',
        '2023-09-02 13:55:05.926', NULL, 0),
       (387, 'Olive Tree Property Management', 'Olive Tree Prope WEB PMTS 090123 BXL968', 28, '2023-09-02 13:55:20.728',
        '2023-09-02 13:55:20.728', NULL, 0),
       (388, 'Rent Payment Fee', 'AppFolio, Inc. F WEB PMTS 090123 BYQ968', 28, '2023-09-02 13:56:03.112',
        '2023-09-02 13:56:03.112', NULL, 0);
ALTER TABLE `merchants` ENABLE KEYS;
UNLOCK TABLES;