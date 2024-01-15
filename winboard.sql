-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 17, 2023 at 12:46 PM
-- Server version: 8.0.33-0ubuntu0.20.04.2
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `winboard`
--

-- --------------------------------------------------------

--
-- Table structure for table `b5651_action_logs`
--

CREATE TABLE `b5651_action_logs` (
  `id` int UNSIGNED NOT NULL,
  `message_language_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `log_date` datetime NOT NULL,
  `extension` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_id` int NOT NULL DEFAULT '0',
  `item_id` int NOT NULL DEFAULT '0',
  `ip_address` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.0.0.0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `b5651_action_logs`
--

INSERT INTO `b5651_action_logs` (`id`, `message_language_key`, `message`, `log_date`, `extension`, `user_id`, `item_id`, `ip_address`) VALUES
(449, 'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN', '{\"action\":\"login\",\"userid\":135,\"username\":\"winboard\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=135\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_ADMINISTRATOR\"}', '2023-05-09 04:54:37', 'com_users', 135, 0, 'COM_ACTIONLOGS_DISABLED');

-- --------------------------------------------------------

--
-- Table structure for table `b5651_action_logs_extensions`
--

CREATE TABLE `b5651_action_logs_extensions` (
  `id` int UNSIGNED NOT NULL,
  `extension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `b5651_action_logs_extensions`
--

INSERT INTO `b5651_action_logs_extensions` (`id`, `extension`) VALUES
(1, 'com_banners'),
(2, 'com_cache'),
(3, 'com_categories'),
(4, 'com_config'),
(5, 'com_contact'),
(6, 'com_content'),
(7, 'com_installer'),
(8, 'com_media'),
(9, 'com_menus'),
(10, 'com_messages'),
(11, 'com_modules'),
(12, 'com_newsfeeds'),
(13, 'com_plugins'),
(14, 'com_redirect'),
(15, 'com_tags'),
(16, 'com_templates'),
(17, 'com_users'),
(18, 'com_checkin'),
(19, 'com_scheduler');

-- --------------------------------------------------------

--
-- Table structure for table `b5651_action_logs_users`
--

CREATE TABLE `b5651_action_logs_users` (
  `user_id` int UNSIGNED NOT NULL,
  `notify` tinyint UNSIGNED NOT NULL,
  `extensions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `b5651_action_logs_users`
--

INSERT INTO `b5651_action_logs_users` (`user_id`, `notify`, `extensions`) VALUES
(132, 0, '[\"com_content\"]');

-- --------------------------------------------------------

--
-- Table structure for table `b5651_action_log_config`
--

CREATE TABLE `b5651_action_log_config` (
  `id` int UNSIGNED NOT NULL,
  `type_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type_alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `id_holder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_holder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_prefix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `b5651_action_log_config`
--

INSERT INTO `b5651_action_log_config` (`id`, `type_title`, `type_alias`, `id_holder`, `title_holder`, `table_name`, `text_prefix`) VALUES
(1, 'article', 'com_content.article', 'id', 'title', '#__content', 'PLG_ACTIONLOG_JOOMLA'),
(2, 'article', 'com_content.form', 'id', 'title', '#__content', 'PLG_ACTIONLOG_JOOMLA'),
(3, 'banner', 'com_banners.banner', 'id', 'name', '#__banners', 'PLG_ACTIONLOG_JOOMLA'),
(4, 'user_note', 'com_users.note', 'id', 'subject', '#__user_notes', 'PLG_ACTIONLOG_JOOMLA'),
(5, 'media', 'com_media.file', '', 'name', '', 'PLG_ACTIONLOG_JOOMLA'),
(6, 'category', 'com_categories.category', 'id', 'title', '#__categories', 'PLG_ACTIONLOG_JOOMLA'),
(7, 'menu', 'com_menus.menu', 'id', 'title', '#__menu_types', 'PLG_ACTIONLOG_JOOMLA'),
(8, 'menu_item', 'com_menus.item', 'id', 'title', '#__menu', 'PLG_ACTIONLOG_JOOMLA'),
(9, 'newsfeed', 'com_newsfeeds.newsfeed', 'id', 'name', '#__newsfeeds', 'PLG_ACTIONLOG_JOOMLA'),
(10, 'link', 'com_redirect.link', 'id', 'old_url', '#__redirect_links', 'PLG_ACTIONLOG_JOOMLA'),
(11, 'tag', 'com_tags.tag', 'id', 'title', '#__tags', 'PLG_ACTIONLOG_JOOMLA'),
(12, 'style', 'com_templates.style', 'id', 'title', '#__template_styles', 'PLG_ACTIONLOG_JOOMLA'),
(13, 'plugin', 'com_plugins.plugin', 'extension_id', 'name', '#__extensions', 'PLG_ACTIONLOG_JOOMLA'),
(14, 'component_config', 'com_config.component', 'extension_id', 'name', '', 'PLG_ACTIONLOG_JOOMLA'),
(15, 'contact', 'com_contact.contact', 'id', 'name', '#__contact_details', 'PLG_ACTIONLOG_JOOMLA'),
(16, 'module', 'com_modules.module', 'id', 'title', '#__modules', 'PLG_ACTIONLOG_JOOMLA'),
(17, 'access_level', 'com_users.level', 'id', 'title', '#__viewlevels', 'PLG_ACTIONLOG_JOOMLA'),
(18, 'banner_client', 'com_banners.client', 'id', 'name', '#__banner_clients', 'PLG_ACTIONLOG_JOOMLA'),
(19, 'application_config', 'com_config.application', '', 'name', '', 'PLG_ACTIONLOG_JOOMLA'),
(20, 'task', 'com_scheduler.task', 'id', 'title', '#__scheduler_tasks', 'PLG_ACTIONLOG_JOOMLA');

-- --------------------------------------------------------

--
-- Table structure for table `b5651_akeebabackup_backups`
--

CREATE TABLE `b5651_akeebabackup_backups` (
  `id` bigint UNSIGNED NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `backupstart` timestamp NULL DEFAULT NULL,
  `backupend` timestamp NULL DEFAULT NULL,
  `status` enum('run','fail','complete') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'run',
  `origin` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'backend',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'full',
  `profile_id` bigint NOT NULL DEFAULT '1',
  `archivename` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `absolute_path` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `multipart` int NOT NULL DEFAULT '0',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `backupid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filesexist` tinyint NOT NULL DEFAULT '1',
  `remote_filename` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_size` bigint NOT NULL DEFAULT '0',
  `frozen` tinyint(1) NOT NULL DEFAULT '0',
  `instep` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `b5651_akeebabackup_backups`
--

INSERT INTO `b5651_akeebabackup_backups` (`id`, `description`, `comment`, `backupstart`, `backupend`, `status`, `origin`, `type`, `profile_id`, `archivename`, `absolute_path`, `multipart`, `tag`, `backupid`, `filesexist`, `remote_filename`, `total_size`, `frozen`, `instep`) VALUES
(2, 'Backup taken on Friday, 17 February 2023 14:44 AEDT', '', '2023-02-16 22:14:46', '2023-02-16 22:15:46', 'complete', 'backend', 'full', 1, 'site-winboard.joomstore.com.au-20230217-144446aedt-LLJaMql_bVachKs0.zip', '/home/winboardjoomstor/public_html/administrator/components/com_akeebabackup/backup/site-winboard.joomstore.com.au-20230217-144446aedt-LLJaMql_bVachKs0.zip', 1, 'backend', 'id-20230217-034446-279522', 1, NULL, 122796446, 0, 1),
(3, 'Backup taken on Friday, 17 February 2023 17:40 AEDT', '', '2023-02-17 01:10:46', '2023-02-17 01:12:16', 'complete', 'backend', 'full', 1, 'site-winboard.joomstore.com.au-20230217-174046aedt-AtKf-bDWoKd67M55.zip', '/home/winboardjoomstor/public_html/administrator/components/com_akeebabackup/backup/site-winboard.joomstore.com.au-20230217-174046aedt-AtKf-bDWoKd67M55.zip', 1, 'backend', 'id-20230217-064046-847887', 1, NULL, 122796479, 0, 1),
(4, 'Backup taken on Tuesday, 09 May 2023 12:37 AWST', '', '2023-05-08 23:07:36', '2023-05-08 23:12:58', 'fail', 'backend', 'full', 1, 'site-winboard.joomstore.com.au-20230509-123736awst-yCXSHwkR7FECncNX.zip', '/home/winboardjoomstor/public_html/administrator/components/com_akeebabackup/backup/site-winboard.joomstore.com.au-20230509-123736awst-yCXSHwkR7FECncNX.zip', 0, 'backend', 'id-20230509-043736-703087', 1, 'NULL', 378180147, 0, 0),
(5, 'Backup taken on Tuesday, 09 May 2023 12:43 AWST', '', '2023-05-08 23:13:54', '2023-05-08 23:13:57', 'complete', 'backend', 'full', 1, 'site-winboard.joomstore.com.au-20230509-124354awst-OQQnp_jJxLpVR4CD.zip', '/home/winboardjoomstor/public_html/administrator/components/com_akeebabackup/backup/site-winboard.joomstore.com.au-20230509-124354awst-OQQnp_jJxLpVR4CD.zip', 0, 'backend', 'id-20230509-044354-786816', 1, NULL, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `b5651_akeebabackup_profiles`
--

CREATE TABLE `b5651_akeebabackup_profiles` (
  `id` int UNSIGNED NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `configuration` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `filters` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `quickicon` tinyint NOT NULL DEFAULT '1',
  `access` int DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `b5651_akeebabackup_profiles`
--

INSERT INTO `b5651_akeebabackup_profiles` (`id`, `description`, `configuration`, `filters`, `quickicon`, `access`) VALUES
(1, 'Default Backup Profile', '###AES128###GJ3dtrownlpcvGKwRnzTxHLV2JpSksPuX7dJ0jQtOPsYrJ/2k7IfUVHdSK64c2YZOFOP7YRDwNsVxcbIH6gRLkJsi2lwo+Hh8qbFnVmsVH7jBF9HrvWfL0y9iLXSUpFtmOMIYJo+y31LMsTAkMxeelqa6QPJTTuQtMkyfRDG1egsSN80eNLqSqmlBtA47nQaE/NTHMPd9VNFdk0JGQeGICr/9SrbdKvlfeHnSEIlo+YAjXDWg/B0tj9BzTwpXXH4gxU1foWiegqE+S4f4YPXsSAV3/P+LSIx/SeCfpC7S7FG7W6SeiOd8Luzq/SXEKY5rJp+0oP6Ba9wMaBGSey/+Suw0xyfm9XEjwDj8d/L5kxunp2NX9u1GwhioPRofZJ1V7K9oc3mxzOUJcrG0Tv0QFjNqwkFwgKoSXBOa7fyVTvXyEfyIdFkMfr6jYaZiDRSu2zovkm0wmHE7c8ikSzXlxFbLe/5eAgKs4hmxrlRp3rDX1HH1HMVuq//g6ODnrp+xvpkE1ubr4xyUtaJ6+nsETXt9+YcTzfgK0E/JIZfBakts7sr7UU1kQ5IjoRgraCY4hX6scqYs1vOGyXfJzTXPWBwh3eCyx6+F+qWBC4uEjhz9Y88PmrbZQPFBRhhvXHaNUIaHTLYVHH6zpMF+sbmKVVSj1pdRjoHWZhQbtvYfjO/F9rjBK3RgDP5VKG9gLMkzKwQBFVm6CPt1NEPcxlvwbTVEzBM9ZizRoabzM8GwGp93vIoM7NWxzNkyB/52zkb8t4xfQdVMPMCFRNmv+b30q+Grz4iFvVi8RfnQPDisspMRqszV+ztrO/4cTn5zGecwksGYWOo8sHe2B+erWqKACg7a8SqRWcFz1aFGLzIVLtAtwvzHObdDGl65Tk307wZndm+nXE4qVq0bcXUOAIqWND88ICGpmooAHMt5zjKDWjoAPxRaDS9D1stVxVCojyGRq5adWkThaliBlxozTJsVEyKRhFUFXLWHb885s9vo1bkN49mVyEAVW1oYPlmFjB9DeJrKo9ZkZaV58UduxCtuaI3MMOhnSyYm2H0gE+c2S2jFe2ajuIEa2ko6k7anE3NCK1PL/66V2Zmj2kFUBN0fJNDHLdvHVGQykkDPhHqmwFPuOBqtOpclV5HT5iW02tHIgWjvYHepiMcW9gZOc6nWcmkuowfu10YHKiNMlJAh4FjBlRsxOXvhQwA6i2+jDxBTCNOCO94uNHk3ZW3y/UWwprIlB2MpjcZruGzarDzo5MHbwhPDR6uc4TubrG9bQkqWuzwcftOLIWK+Cy7NX4HrSdj7jNTIRj0Y8WRRyZhKpf8NzEeSyr0RMq04UTegnOwzTZUjvV7NBE17QFQ6AjuWjnOWeHz56DArEtAAjaXcjuH+OhojKQidI+hruyda/DDH7fVAGgPsZBL/LRtuwI8RXmv3RGnKiSSUtBRcWex9fuEOB/EfSIdwEc+rNp+QVLvoBTRlKwWMJ2JvK/94lJwAdVTn6tnu1vXppau9BPtR4O60U0snK0/3m2ai59n561dw2uZFLHiJhQS2d/283ijYuaG90xSPHcn9h0raRjV81z1B0HO9UcC3vw5yPl/4lClYCbeaQ+Z8jFffGNbAEMoYD4+S8pOpsW9400BpQQstUUGLYggB5TrBsvN5SpvihV1yXEiEOY9HY3uAxQ+82+lKjtjpSnf+nQ/Klqws5d9CPzGkhysrYidKGuzjk9E9q38awpSqw/m0Njt9Ierf50tlSJQ9x4bLh/CyDv4bFK7ZpuQCnKwgrs5xT68Nkyg0uYIcCnpbTcsmveglZT3X9EjLMDgQO0I1OpizhXF/IcRtOjEZsiaOe1S2vl/vclRS88Q5148p++R6ArlPJlCXXAoCabBOMgcIbrk9vop4PCjb7/N2dHmhSYOpwBEULTHat58/lE+7x4u9RBQOGaS7Shpc3z0g1BdCqdtTZ9zeH2NiVVM3wR3p72FBq5mIagQPgxVq803532Chxr//QDTcrDW3dq88AMqc382P92ovWmE8gnIQAQxPkaXW7Q7o8gOAkNgojc4bas1vI1gujGCmBkvyJswZcpa2rGZgvm/i2dFdVIvikKwodpVNBxpbJ1sE41HFynzo7UnLPFkK3p0a7l20R15DqJ6PXac+LYfvcz6jTxwB/H5jTBMQXrHxzlg5ujEJgsP7T98tqaQF3qlelmgvd4aZIrjTJTc+EUi7FJNj64Fxat5DF9y6b62pCqdZL8UeozNvdne1THvPoIJz57Al7QGPb5kGzW4oUq4JJkzIZic8uBpmiSqavtYrtX1XuCZTUShEQvNNrAdgAEFCtRtkG9ZSDS6l4O2q8HbvIm+Hob2zqqG2YPE5ioHlioMIuX/uqbXAfG+nfKJcwtQJ/lemppeeFkoFOvp8l577cW5hwSaUmmhCUZD4Rv/xnKZ4UyDm/2cxmFTZhstmOYomlCptwWEn9Kzh2cXdKqcBzi0JZjNFSmndP+OMCcZ6UXevqHVy/g+MhcSnjZ9RthDtUj/OXRDB5YnEVaexsC/JO+fC1M4iEX2OVPik1dDdnN1Ym72Zpn4phAUgkDmnmphLIicVLcgaexyNZkXU+uk9fpCkjBs1syRiJ0QNorqPNw3cs9qwyYsaAiFAyrMk+20qkm3MEn7lCtCiPIYJubhSh8wedo2MBjF/xcSejBSpq7tgctFxQLRkMH0vBGcyOVTU0FaxZOA2vaJArZ1VbmJl5/jDuJMnI2SFaEe7O0yGBfFsPVtPhL2iUfmMRMcfs47N+rWxplRIEHA0/ZMDHbDR0O6jvg+lKnUcCQ7G7NroPK7e0SkylfiQinlwKYTEfhPYa8sw5c2r/Ap9LHQ7B5kq1trYkq/LAwj6v41Evr/ycx7He1I6rzxyjONZRtG80sRxdesSCosV0rmA4ATXWbv33gn8auO0yLjoz4EO20SUe/l4wcGL4t4bWiWacZeDLuBnsqN5O1eHr+RyQDlHlA3yTpZbPA0lseauhHEV6Llu/KQfmFk7F/6mxzYQeAYn0HDcxT6hGs6noRZL7feVVeEL3bgnUPkxos4vqpnHHG7KfhUje+wvKW2axfkbG/9vKs3KN2QolpiCi/SlK1U4huGidyuGMB5AdqA+5ZYTbYlawu8SghrtP6NgX9MwaYnTqxrkrZ/X0Iw8d5gzxyki89gS8D8J0Xpq2P7DEXdaCJqoEesY7G9yRKa3a/7QnmTRcdV1E6YcvKAVDlotE4h/cHDKy159SapEk/AtH3cbD5z7J+uMLfOPY9t6T//dZARzdO6lL9XAOE1qXWBjaXrqdFDNxariJHxuP97pAgn09NR6Jor7Mkuyi0A2vhI/4wWIdCXD7h4PvAT4FxP8wJr0t316bcXp9b0LuG24i9ret3Hga1fVJ6A6DPweKrT/0DIW1E0siCzEMyXHwEYDuNmgwVE9XnNdAkkk78VUPfMxJmtnhasWhRVdTDEy6vgwR3qomc9f3ukICxOjWYRP+KUdGvpGrnmRosxe/4nsD6scc2phdShOZSFPvbSvItMhAthM5f5hm3DBjsxe7VVn3NmPiqPaNSAYwv5ZojPIbV9xBxbRv3EzPVYOkhNNZpinIuv9gx3urzItyDMVSc5qpy/eQwwhJ5FptWcQD2V2E00qtAAz9xecDScabV6nwK/z0L3Fu8gwEvdxQjZ+S5Z6j4LOXSrZ5MNTJvhOwm07jlV/wuLJ1tQlz5577LHbGv+y0wYC8Jy3mSfV4GnYsr8XAWiZSF5rvXJA3CphOrM7KCtYRbnozyXoezgH+nOvVP8bXTyvPWDKZw+hVw+wS/rVLJztIXTxoBFdwSQbHIOGpgv7bgFcnAELHY+ahFSClhYArtx9Uh0PUWjIQDRAJsz0245q8tO0YPVDhNTv97HYXzi2zEtZrQfa5e+g3C1qLb9DnsnkyL9HtnldrmhqKurVIIlnTc5wdqociTuncWH+ngi10NT5gIn7UtvVFxqinqxHmvyiPfrUrxnXWRKDwGtEj5SAUyocMTZqNG8zp3RNUBm9jaIOQjkVjEGd2KHBPK0WbtV1U2V882PBeozR8v23KTllaBZm+PfbrjT+Pu0t3nTCbUVgvVuZrQViHDOiLndYh5Fa3qJIFNOYKfqs+YPq5uHdBANETRPREZp5lBUnWl+gNOjKbsiC4zJhdilN43FUlyoQwirEQaxLdbPW2H6d7LJq6G5GR9OrkpKUFNUheO3EO/Iegn+rtkntDnBmB0fdh6isE3L0kr2CjrWEvijik4Ob+1NkAUkAehypEMDwVB3MIBrKAPuE32u4QiBIEpQSVY6ZQqeFG16nz+JfEr4bMV/TAwAAA==', '{\n    \"files\": {\n        \"[SITEROOT]\": {\n            \"0\": \"_dbdump.zip\"\n        }\n    },\n    \"directories\": {\n        \"[SITEROOT]\": {\n            \"0\": \"_dbdump\"\n        }\n    }\n}', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `b5651_akeebabackup_storage`
--

CREATE TABLE `b5651_akeebabackup_storage` (
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `b5651_akeeba_common`
--

CREATE TABLE `b5651_akeeba_common` (
  `key` varchar(190) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `b5651_akeeba_common`
--

INSERT INTO `b5651_akeeba_common` (`key`, `value`) VALUES
('file_fef', '[\"com_akeeba\"]'),
('fof40', '[\"com_akeeba\",\"plg_console_akeebabackup\",\"plg_quickicon_akeebabackup\",\"plg_system_backuponupdate\",\"plg_actionlog_akeebabackup\"]'),
('stats_lastrun', '1683606916'),
('stats_siteid', '88d0d7c6b3eb6604d4fdc4a45bb67b9add86b083'),
('stats_siteurl', '16b6d6a6543b6884f4e4d0c8e63321d9');

-- --------------------------------------------------------

--
-- Table structure for table `b5651_ak_profiles`
--

CREATE TABLE `b5651_ak_profiles` (
  `id` int UNSIGNED NOT NULL,
  `description` varchar(255) NOT NULL,
  `configuration` longtext,
  `filters` longtext,
  `quickicon` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `b5651_ak_profiles`
--

INSERT INTO `b5651_ak_profiles` (`id`, `description`, `configuration`, `filters`, `quickicon`) VALUES
(1, 'Default Backup Profile', '###AES128###mDVYYcTxVEwHhtvhy/IdU+2buQjVDhL9ifkfW2rHLsD375vY+ork8mHhg/gs9fNXGLIfvB0QEcKHs1YBhY7KlI206Pvu0S9q/dfXm1iLDS5QB5JVOkoGcjT5OhwjefSiuyTRxzXwZlgPwfaB6bSXjcro2b/U2TETAuwADuVHXtFJy1PsylLQV9GOgyKcbSEptxhLsQzp3gfUiAwyU9AsuIfiChrkDNvGNZuNOMkIRPKUwLhxKlCfgc5q849cOeKXJwIvsOVt7eHHWoW+YYmS/hUw9TnrAVnAuXzfvn6+LnsUHx7BcMMe+0ARDTjQL19Z0UUvLjWdNUpXbGCYdNWKmN9YgcBFH9q+YZaRcis2ApRVzxUxwWSzu+pbH8kS+c4E38Ns3lTNG4hlj+u56AVYudRmZkA4r38M1tI0p41KVrjuqJxfwZLVvQ7aG+2W6b9col5g0Hccrzqb3drYPGGWgubBUJOs10G1vlX7ak6PxSSWHDcbOQtp1cUbfG6VXey9C41LHt9aMbxn+7xtBZCrdSKhwFf9JGJvwRS2W1TCAaukmWSNR6zhDsfuuQkXc8U+FhSV+1iTvLCjrpZNxtlLNDaKmKKjPAddRsaiHeM/XdY/MOTvz1J4MoDqpzmPwuj/Lk9v7FmBSw0M/zwr8JD26FRsuMqlUp0SRDGOZvULvUQ2BgPghqrsRC99mil8I7qemvOaZAcNWA6bW82Potq77q9oUGKK369KWYSqzVsvV4eT++OHkdJG5KhVwKntXmPAhLSSRz8kVNeArAQCYnK+k9VdTQ+N7MsQuVC7MOZz2Z+NVPfT24TSKoFhcHbvbtY2Q1UMKaMiTKeQ5D0qHL/3qfYAqVNOJ3Ewua2IRNOQSZS2ETUCjL4SJdv7o+UTHCbWIIziC2iKAZgbdboHWF6y7i+idfTmr+uT1KzkaX2yDOo/PBM0pmhcMyoUWYwKVIg2np37GB791JeKvsgsl6Vpt92oSzkg0O68oOPLk65HC/YiUYsWQsXLTAkvVet8YbwmrTr2CMsBVq6S5ip//LpF6Oqcm9fr+1Cw/+Kp4BecFnjCl/J9ro1A0Rxt+qX1GaHHDx1DR1WRu9/9VkBNGAAxE+LfWgh6H6NLfy5fSaPoF9XAl/q8xS8HbJ2hZcoi7Tw8FDJb7HDUZNxd2+XdacNmBTnBGDc0PwYrJloy3nyMFuWJiBt0yylDKqe2+JYrawIdcJ9XNkdWbtLxvyu0X6xJ+zgKcm7Ndnx/MDHU1JEeRaYfx112ccXfsJWKlmZ59N1RUasC23sfbVeoNCNw9OmYnRXhQyiFNAvkaD3bbgmDsCXFsJXJZno05bbQh38julO44bVM5QhTeO/3KSGPM5AMYQDvyJtSTPDeOjNaQeB4HyBpOB31Q4suUD2OO2NkEY82tMUprFjbTIKvCRgbn835hQGGYA8gsP9rPWgH0jXv1DUK0BoKkLNkKks9sfC3UGi/jL7zUsbp3+y0wMbGO27S982vvQ+1rx+1MZjEv8ByIl/Q3bu2xbndxajV14sawjCBBAp1y2OJpGzTWUOqk2bgGlObRWYd7xUMB6JkygZcgAiWJn6XykuvEhEsM6CZL7wkp4RFFN/xvlABFUTTI0iRnrrf8BpMLvSEtv621obsXu3ilD50BNwLU4h7af0OEp5dQ+uPuL9n1fF+w+1w8oHms4hSIiNFPepBQmHZhhbX8gi8GJOs1CNExktSqUk1cC/3M76AiFUe1jJ5eDuKZtFw7eNkwLbKZpxxx7w2V4iFEgQ6yaSbHaemOtT1xXLUpoP3Yrs/B2+grIi3pkih7StTpG3NUrFRjC1Uv7QkDLrGJxqu6CUXDEPFzjgrVzhfm5ULSUr40G2l2JokiMDAdzsEJoiz2ejo9sdm6ZM4kPRQaVtIOMetJzLDoX9aBgEIPR5rraNkUzB9rAgCZTv3UQAJvcV7q6gw9jrM1dQMIgDjm1Z9RPtes1+2UbTn3L89IebivtaxJY7PKVFRGc9ZIBEV8TouBOII0cse592IdMRQd+R9rzTYHnDM8xywA+wu/O2fogweG8g/ZAyT3kSq738dKn3Cjg2nHMHcCyOeuSTw1WsSwuJIyxKBa38ANwIozjOYeo/cg3P/U0fwPmNaCaHGlQsN7RnzIVO0kSyLMPDQo4cYTY1lh5Gshfr+4ccEy7yKT9c96sYh4G3lEYl9qRxyjl7tnmD/zLQW/HCNpPPj6somoIzrrFiK7axDL/0gI8lrD1pgrjrwx3cFMQIvMgCuPD9KLJVqvLXAkUozEH6CNHXWnKp5fvMSig3xv7mIaPu+jmqZi040T8l0bARl4uWgItXBcVd8PAVHwHnggmNM4VJcyV+FMHsk3cETNJpA9j9OY4aBjC6fwZ1/Q+p7IhewOKqAYthqrAFU3GgrGNh7wg9g3Umv9K2OJ0Wf9JnZOByPcYuQBkMmYGrmd9VDhJWIeXFSAw2rz/GCoW3Zp8kjEIaDD57TQvL8zXZlfp9lqdFWdl53caZOSJd2cDnS0aapCI6RXtVlQiOfUiW9QWBgN0z7DgMMUWAB7YI8Y1GIiKQiIGS0mWBMO33XoqqIPaNMngk2vpQW0IR9BurDKzsATczD6V478t5+Y/uBmOSBSmQIuqrjvQdzy9Gkn1EKo4raNVrUosUND04+cIdMo36tQUJTZ6OozOXbhylHhRs8KFAZQN13ODYpo8PZqu8Hv27KyQqguO45QAobCMLGWGgUgg2gMUmD92da73NMvlXuJCy5NYHVeQXCzfG1unbgJcOmvquvTFaUrC3dkd4SQMtLFF5qCFdIxzf1oIH7rDWww/J1HyB+vzQJZvE+y1f0OL0D/S7NyEVL8cC3qUoXsXNUCg3ir82jSrwi3PeFa3J5pur+h4R8meUbBIAW5e58UJ7gv9ZW/zYCEAB0YTJdyUeB6E6E77OLQPBjoik1uWXXzDq6lDl9gPlSnHh9tpJBPU2lcSAD/9IFXvbMiNxbiL08/agxIJy47y4oABFS7JV1S+UdyXqahCAWHnZskU9Y773j1gHhPJtKzZcqFD3JCjQVT0VTL32qZK52jeq+3nSoNaOTKnWfUvmP7bd7+xEBfwZQRaYF0LHHkLiQXeJgX9I/b5C9up0GUIDslxrGd7nMkdBkCMxhVSrcd1v7r3r7KlYHUFxhr4ad0a7f4Un3HLUTAvdFFaJQket3tpu1/QNkpNDpVQv/HFilgf0LeNm6tR1fETxxxhFOPuEAck7Tr1dlL+2ci4lUF10Apu7kMOhjJTkhu0rXzRweS9X5MKhqW2RigltY8Q9jDN76auVPzgEWbmiL/Qqvkm5CdssK67V/db/InldXZiuGyNe1ofDWng6IDvkinzL+ZI03PR1J9vpIDgk7AFlHMFatKNHBKxhSzx/KlKdTZ/nnk00IKp1hk1Lt49FLlILPuyDhd1XU2WR+2ZHpDDALOWE4KLiE8KOelCuIDb4EdTAkcWUztIsYRVGCFIYDDHJ9HB38AktGIxq4eV8DgrZaTDtdJGlJUfYftoS1SO2miks23WQy8ikKkwhG4u51kkEqKip+lxVOYMS6RXfHe5hl5Xo19QLtFNwV4aaFX+ouXBxo82VZ2dvSiJ9FBFb9SwJIraC0ZLsO8STBbQZQLImL6znpH+im2kkXgCtwYmJpOrQaAEbJ4gS+V7EB50tjkFxouyKrcyk1ngxRn8VN8pnNwXt45TBjS6D5LPsPPNi/o4ltGMfBD7Lp9BtJRCVovivCOPZHSXzRWYbFmCNIoUFbaih6uZHQjThZOrg/lq9EPIfLL83WiET43ylx2qEViRnd1qB35aBzSSyQJMZU9l3gkWfrO7zuuibncJSF09p0mfaiL1nspr+kKKhoQUPOXeW1VIlZ/TYlm6xh6V087SUZJLrGjFsTcDNzmONNBdUG0UWZs1In6HN9nl5APsmeRxEJxKF8+qZfD+URVvMrW6TnFuPRcouiB3ZM+cIJBugslpkr72X+JrEAZJWg+SHCU0peFOAvKSILNhfjCW0GKaWx8a7qGRi6tjaA+j8mfotFbq4nP2UbIReb2CjjrlDkwvI7vAkLK6C8OZY604WD8dTT0F2uuu2+k6FPZArCSlBTVIN58rIsZiM6AWJtaVU5qomTtWp1ESesgsG0rWRGsJu7fUXAwlNTlovcDe8zLBXJ1g/cPUmZGq2473DmZLyHDG9KUElWwQ730I/duZ97OG9FiDaXo/wLAAA=', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `b5651_ak_stats`
--

CREATE TABLE `b5651_ak_stats` (
  `id` bigint UNSIGNED NOT NULL,
  `description` varchar(255) NOT NULL,
  `comment` longtext,
  `backupstart` timestamp NULL DEFAULT NULL,
  `backupend` timestamp NULL DEFAULT NULL,
  `status` enum('run','fail','complete') NOT NULL DEFAULT 'run',
  `origin` varchar(30) NOT NULL DEFAULT 'backend',
  `type` varchar(30) NOT NULL DEFAULT 'full',
  `profile_id` bigint NOT NULL DEFAULT '1',
  `archivename` longtext,
  `absolute_path` longtext,
  `multipart` int NOT NULL DEFAULT '0',
  `tag` varchar(255) DEFAULT NULL,
  `backupid` varchar(255) DEFAULT NULL,
  `filesexist` tinyint NOT NULL DEFAULT '1',
  `remote_filename` varchar(1000) DEFAULT NULL,
  `total_size` bigint NOT NULL DEFAULT '0',
  `frozen` tinyint(1) NOT NULL DEFAULT '0',
  `instep` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `b5651_ak_storage`
--

CREATE TABLE `b5651_ak_storage` (
  `tag` varchar(255) NOT NULL,
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `b5651_assets`
--

CREATE TABLE `b5651_assets` (
  `id` int UNSIGNED NOT NULL COMMENT 'Primary Key',
  `parent_id` int NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int UNSIGNED NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `b5651_assets`
--

INSERT INTO `b5651_assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
(1, 0, 0, 201, 0, 'root.1', 'Root Asset', '{\"core.login.site\":{\"6\":1,\"2\":1},\"core.login.admin\":{\"6\":1},\"core.login.api\":{\"8\":1},\"core.login.offline\":{\"6\":1},\"core.admin\":{\"8\":1},\"core.manage\":{\"7\":1},\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}'),
(2, 1, 1, 2, 1, 'com_admin', 'com_admin', '{}'),
(3, 1, 3, 6, 1, 'com_banners', 'com_banners', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),
(4, 1, 7, 8, 1, 'com_cache', 'com_cache', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),
(5, 1, 9, 10, 1, 'com_checkin', 'com_checkin', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),
(6, 1, 11, 12, 1, 'com_config', 'com_config', '{}'),
(7, 1, 13, 16, 1, 'com_contact', 'com_contact', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),
(8, 1, 17, 46, 1, 'com_content', 'com_content', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.execute.transition\":{\"6\":1,\"5\":1}}'),
(9, 1, 47, 48, 1, 'com_cpanel', 'com_cpanel', '{}'),
(10, 1, 49, 50, 1, 'com_installer', 'com_installer', '{\"core.manage\":{\"7\":0},\"core.delete\":{\"7\":0},\"core.edit.state\":{\"7\":0}}'),
(11, 1, 51, 52, 1, 'com_languages', 'com_languages', '{\"core.admin\":{\"7\":1}}'),
(12, 1, 53, 54, 1, 'com_login', 'com_login', '{}'),
(14, 1, 55, 56, 1, 'com_massmail', 'com_massmail', '{}'),
(15, 1, 57, 58, 1, 'com_media', 'com_media', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":{\"5\":1}}'),
(16, 1, 59, 66, 1, 'com_menus', 'com_menus', '{\"core.admin\":{\"7\":1}}'),
(17, 1, 67, 68, 1, 'com_messages', 'com_messages', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),
(18, 1, 69, 160, 1, 'com_modules', 'com_modules', '{\"core.admin\":{\"7\":1}}'),
(19, 1, 161, 164, 1, 'com_newsfeeds', 'com_newsfeeds', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),
(20, 1, 165, 166, 1, 'com_plugins', 'com_plugins', '{\"core.admin\":{\"7\":1}}'),
(21, 1, 167, 168, 1, 'com_redirect', 'com_redirect', '{\"core.admin\":{\"7\":1}}'),
(23, 1, 169, 170, 1, 'com_templates', 'com_templates', '{\"core.admin\":{\"7\":1}}'),
(24, 1, 175, 178, 1, 'com_users', 'com_users', '{\"core.admin\":{\"7\":1}}'),
(26, 1, 179, 180, 1, 'com_wrapper', 'com_wrapper', '{}'),
(27, 8, 18, 27, 2, 'com_content.category.2', 'Uncategorised', '{}'),
(28, 3, 4, 5, 2, 'com_banners.category.3', 'Uncategorised', '{}'),
(29, 7, 14, 15, 2, 'com_contact.category.4', 'Uncategorised', '{}'),
(30, 19, 162, 163, 2, 'com_newsfeeds.category.5', 'Uncategorised', '{}'),
(32, 24, 176, 177, 2, 'com_users.category.7', 'Uncategorised', '{}'),
(33, 1, 181, 182, 1, 'com_finder', 'com_finder', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),
(34, 1, 183, 184, 1, 'com_joomlaupdate', 'com_joomlaupdate', '{}'),
(35, 1, 185, 186, 1, 'com_tags', 'com_tags', '{}'),
(36, 1, 187, 188, 1, 'com_contenthistory', 'com_contenthistory', '{}'),
(37, 1, 189, 190, 1, 'com_ajax', 'com_ajax', '{}'),
(38, 1, 191, 192, 1, 'com_postinstall', 'com_postinstall', '{}'),
(39, 18, 70, 71, 2, 'com_modules.module.1', 'Footer menu left', '{}'),
(40, 18, 72, 73, 2, 'com_modules.module.2', 'Login', '{}'),
(41, 18, 74, 75, 2, 'com_modules.module.3', 'Popular Articles', '{}'),
(42, 18, 76, 77, 2, 'com_modules.module.4', 'Recently Added Articles', '{}'),
(43, 18, 78, 79, 2, 'com_modules.module.8', 'Toolbar', '{}'),
(44, 18, 80, 81, 2, 'com_modules.module.9', 'Notifications', '{}'),
(45, 18, 82, 83, 2, 'com_modules.module.10', 'Logged-in Users', '{}'),
(46, 18, 84, 85, 2, 'com_modules.module.12', 'Admin Menu', '{}'),
(48, 18, 90, 91, 2, 'com_modules.module.14', 'User Status', '{}'),
(49, 18, 92, 93, 2, 'com_modules.module.15', 'Title', '{}'),
(50, 18, 94, 95, 2, 'com_modules.module.16', 'Login Form', '{}'),
(51, 18, 96, 97, 2, 'com_modules.module.17', 'Breadcrumbs', '{}'),
(52, 18, 98, 99, 2, 'com_modules.module.79', 'Multilanguage status', '{}'),
(53, 18, 102, 103, 2, 'com_modules.module.86', 'Joomla Version', '{}'),
(54, 16, 60, 61, 2, 'com_menus.menu.1', 'Footer left', '{}'),
(55, 18, 106, 107, 2, 'com_modules.module.87', 'Sample Data', '{}'),
(56, 8, 28, 45, 2, 'com_content.workflow.1', 'COM_WORKFLOW_BASIC_WORKFLOW', '{}'),
(57, 56, 29, 30, 3, 'com_content.stage.1', 'COM_WORKFLOW_BASIC_STAGE', '{}'),
(58, 56, 31, 32, 3, 'com_content.transition.1', 'Unpublish', '{}'),
(59, 56, 33, 34, 3, 'com_content.transition.2', 'Publish', '{}'),
(60, 56, 35, 36, 3, 'com_content.transition.3', 'Trash', '{}'),
(61, 56, 37, 38, 3, 'com_content.transition.4', 'Archive', '{}'),
(62, 56, 39, 40, 3, 'com_content.transition.5', 'Feature', '{}'),
(63, 56, 41, 42, 3, 'com_content.transition.6', 'Unfeature', '{}'),
(64, 56, 43, 44, 3, 'com_content.transition.7', 'Publish & Feature', '{}'),
(65, 1, 171, 172, 1, 'com_privacy', 'com_privacy', '{}'),
(66, 1, 173, 174, 1, 'com_actionlogs', 'com_actionlogs', '{}'),
(67, 18, 86, 87, 2, 'com_modules.module.88', 'Latest Actions', '{}'),
(68, 18, 88, 89, 2, 'com_modules.module.89', 'Privacy Dashboard', '{}'),
(70, 18, 100, 101, 2, 'com_modules.module.103', 'Site', '{}'),
(71, 18, 104, 105, 2, 'com_modules.module.104', 'System', '{}'),
(72, 18, 108, 109, 2, 'com_modules.module.91', 'System Dashboard', '{}'),
(73, 18, 110, 111, 2, 'com_modules.module.92', 'Content Dashboard', '{}'),
(74, 18, 112, 113, 2, 'com_modules.module.93', 'Menus Dashboard', '{}'),
(75, 18, 114, 115, 2, 'com_modules.module.94', 'Components Dashboard', '{}'),
(76, 18, 116, 117, 2, 'com_modules.module.95', 'Users Dashboard', '{}'),
(77, 18, 118, 119, 2, 'com_modules.module.99', 'Frontend Link', '{}'),
(78, 18, 120, 121, 2, 'com_modules.module.100', 'Messages', '{}'),
(79, 18, 122, 123, 2, 'com_modules.module.101', 'Post Install Messages', '{}'),
(80, 18, 124, 125, 2, 'com_modules.module.102', 'User Status', '{}'),
(82, 18, 126, 127, 2, 'com_modules.module.105', '3rd Party', '{}'),
(83, 18, 128, 129, 2, 'com_modules.module.106', 'Help Dashboard', '{}'),
(84, 18, 130, 131, 2, 'com_modules.module.107', 'Privacy Requests', '{}'),
(85, 18, 132, 133, 2, 'com_modules.module.108', 'Privacy Status', '{}'),
(86, 18, 134, 135, 2, 'com_modules.module.96', 'Popular Articles', '{}'),
(87, 18, 136, 137, 2, 'com_modules.module.97', 'Recently Added Articles', '{}'),
(88, 18, 138, 139, 2, 'com_modules.module.98', 'Logged-in Users', '{}'),
(89, 18, 140, 141, 2, 'com_modules.module.90', 'Login Support', '{}'),
(90, 1, 193, 194, 1, 'com_scheduler', 'com_scheduler', '{}'),
(91, 1, 195, 196, 1, 'com_winboard', 'Winboard', '{}'),
(92, 18, 142, 143, 2, 'com_modules.module.109', 'Builder', '{}'),
(93, 18, 144, 145, 2, 'com_modules.module.110', 'Login buttons', '{}'),
(94, 18, 146, 147, 2, 'com_modules.module.111', 'Winboard When/Where', '{}'),
(95, 16, 62, 63, 2, 'com_menus.menu.2', 'Hidden menu', '{}'),
(96, 16, 64, 65, 2, 'com_menus.menu.3', 'Footer right', '{}'),
(97, 27, 19, 20, 3, 'com_content.article.1', 'About', '{}'),
(98, 27, 21, 22, 3, 'com_content.article.2', 'Terms', '{}'),
(99, 27, 23, 24, 3, 'com_content.article.3', 'Privacy', '{}'),
(100, 18, 148, 149, 2, 'com_modules.module.112', 'Footer menu right', '{}'),
(101, 18, 150, 151, 2, 'com_modules.module.113', 'Winboard Login/Register buttons', '{}'),
(102, 18, 152, 153, 2, 'com_modules.module.114', 'Winboard Login/Register buttons Mobile', '{}'),
(103, 18, 154, 155, 2, 'com_modules.module.115', 'Winboard When/Where Mobile', '{}'),
(104, 18, 156, 157, 2, 'com_modules.module.116', 'Home Banner + Slider', '{}'),
(105, 18, 158, 159, 2, 'com_modules.module.117', 'Winboard Frontpage Listing', '{}'),
(106, 27, 25, 26, 3, 'com_content.article.4', 'Homepage', '{}'),
(107, 1, 197, 198, 1, 'com_fwsyncmanager', 'FW Sync Manager', '{}'),
(108, 1, 199, 200, 1, 'com_akeeba', 'Akeeba', '{}');

-- --------------------------------------------------------

--
-- Table structure for table `b5651_associations`
--

CREATE TABLE `b5651_associations` (
  `id` int NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `b5651_banners`
--

CREATE TABLE `b5651_banners` (
  `id` int NOT NULL,
  `cid` int NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `imptotal` int NOT NULL DEFAULT '0',
  `impmade` int NOT NULL DEFAULT '0',
  `clicks` int NOT NULL DEFAULT '0',
  `clickurl` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint NOT NULL DEFAULT '0',
  `catid` int UNSIGNED NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `custombannercode` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sticky` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `ordering` int NOT NULL DEFAULT '0',
  `metakey` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint NOT NULL DEFAULT '-1',
  `track_clicks` tinyint NOT NULL DEFAULT '-1',
  `track_impressions` tinyint NOT NULL DEFAULT '-1',
  `checked_out` int UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `reset` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `language` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_by` int UNSIGNED NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL,
  `modified_by` int UNSIGNED NOT NULL DEFAULT '0',
  `version` int UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `b5651_banner_clients`
--

CREATE TABLE `b5651_banner_clients` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extrainfo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint NOT NULL DEFAULT '0',
  `checked_out` int UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `metakey` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `own_prefix` tinyint NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint NOT NULL DEFAULT '-1',
  `track_clicks` tinyint NOT NULL DEFAULT '-1',
  `track_impressions` tinyint NOT NULL DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `b5651_banner_tracks`
--

CREATE TABLE `b5651_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int UNSIGNED NOT NULL,
  `banner_id` int UNSIGNED NOT NULL,
  `count` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `b5651_categories`
--

CREATE TABLE `b5651_categories` (
  `id` int NOT NULL,
  `asset_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int UNSIGNED NOT NULL DEFAULT '0',
  `lft` int NOT NULL DEFAULT '0',
  `rgt` int NOT NULL DEFAULT '0',
  `level` int UNSIGNED NOT NULL DEFAULT '0',
  `path` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `published` tinyint NOT NULL DEFAULT '0',
  `checked_out` int UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `access` int UNSIGNED NOT NULL DEFAULT '0',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `metadesc` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'The keywords for the page.',
  `metadata` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL,
  `modified_user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL,
  `hits` int UNSIGNED NOT NULL DEFAULT '0',
  `language` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `version` int UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `b5651_categories`
--

INSERT INTO `b5651_categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `extension`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`, `version`) VALUES
(1, 0, 0, 0, 11, 0, '', 'system', 'ROOT', 'root', '', '', 1, NULL, NULL, 1, '{}', '', '', '{}', 120, '2022-10-25 09:18:39', 120, '2022-10-25 09:18:39', 0, '*', 1),
(2, 27, 1, 1, 2, 1, 'uncategorised', 'com_content', 'Uncategorised', 'uncategorised', '', '', 1, NULL, NULL, 1, '{\"category_layout\":\"\",\"image\":\"\",\"workflow_id\":\"use_default\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 120, '2022-10-25 09:18:39', 120, '2022-10-25 09:18:39', 0, '*', 1),
(3, 28, 1, 3, 4, 1, 'uncategorised', 'com_banners', 'Uncategorised', 'uncategorised', '', '', 1, NULL, NULL, 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 120, '2022-10-25 09:18:39', 120, '2022-10-25 09:18:39', 0, '*', 1),
(4, 29, 1, 5, 6, 1, 'uncategorised', 'com_contact', 'Uncategorised', 'uncategorised', '', '', 1, NULL, NULL, 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 120, '2022-10-25 09:18:39', 120, '2022-10-25 09:18:39', 0, '*', 1),
(5, 30, 1, 7, 8, 1, 'uncategorised', 'com_newsfeeds', 'Uncategorised', 'uncategorised', '', '', 1, NULL, NULL, 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 120, '2022-10-25 09:18:39', 120, '2022-10-25 09:18:39', 0, '*', 1),
(7, 32, 1, 9, 10, 1, 'uncategorised', 'com_users', 'Uncategorised', 'uncategorised', '', '', 1, NULL, NULL, 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 120, '2022-10-25 09:18:39', 120, '2022-10-25 09:18:39', 0, '*', 1);

-- --------------------------------------------------------

--
-- Table structure for table `b5651_contact_details`
--

CREATE TABLE `b5651_contact_details` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `con_position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `suburb` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `misc` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_to` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_con` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `published` tinyint NOT NULL DEFAULT '0',
  `checked_out` int UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `ordering` int NOT NULL DEFAULT '0',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `catid` int NOT NULL DEFAULT '0',
  `access` int UNSIGNED NOT NULL DEFAULT '0',
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `webpage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int UNSIGNED NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL,
  `modified_by` int UNSIGNED NOT NULL DEFAULT '0',
  `metakey` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `metadesc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Set if contact is featured.',
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `version` int UNSIGNED NOT NULL DEFAULT '1',
  `hits` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `b5651_content`
--

CREATE TABLE `b5651_content` (
  `id` int UNSIGNED NOT NULL,
  `asset_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `introtext` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fulltext` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint NOT NULL DEFAULT '0',
  `catid` int UNSIGNED NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `created_by` int UNSIGNED NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL,
  `modified_by` int UNSIGNED NOT NULL DEFAULT '0',
  `checked_out` int UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribs` varchar(5120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int UNSIGNED NOT NULL DEFAULT '1',
  `ordering` int NOT NULL DEFAULT '0',
  `metakey` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `metadesc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access` int UNSIGNED NOT NULL DEFAULT '0',
  `hits` int UNSIGNED NOT NULL DEFAULT '0',
  `metadata` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The language code for the article.',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `b5651_content`
--

INSERT INTO `b5651_content` (`id`, `asset_id`, `title`, `alias`, `introtext`, `fulltext`, `state`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `note`) VALUES
(1, 97, 'About', 'about', '', '', 1, 2, '2022-12-06 20:54:07', 120, '', '2022-12-06 20:54:07', 120, NULL, NULL, '2022-12-06 20:54:07', NULL, '{\"image_intro\":\"\",\"image_intro_alt\":\"\",\"float_intro\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"float_fulltext\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":\"\",\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":\"\",\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":\"\",\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 1, 3, '', '', 1, 16, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\"}', 0, '*', ''),
(2, 98, 'Terms', 'terms', '', '', 1, 2, '2022-12-06 20:55:24', 120, '', '2022-12-06 20:55:24', 120, NULL, NULL, '2022-12-06 20:55:24', NULL, '{\"image_intro\":\"\",\"image_intro_alt\":\"\",\"float_intro\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"float_fulltext\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":\"\",\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":\"\",\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":\"\",\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 1, 2, '', '', 1, 8, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\"}', 0, '*', ''),
(3, 99, 'Privacy', 'privacy', '', '', 1, 2, '2022-12-06 20:57:00', 120, '', '2022-12-06 20:57:00', 120, NULL, NULL, '2022-12-06 20:57:00', NULL, '{\"image_intro\":\"\",\"image_intro_alt\":\"\",\"float_intro\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"float_fulltext\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":\"\",\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":\"\",\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":\"\",\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 1, 1, '', '', 1, 9, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\"}', 0, '*', ''),
(4, 106, 'Homepage', 'homepage', '', '<!-- {\"type\":\"layout\",\"children\":[{\"type\":\"section\",\"props\":{\"image_position\":\"center-center\",\"style\":\"default\",\"title_breakpoint\":\"xl\",\"title_position\":\"top-left\",\"title_rotation\":\"left\",\"vertical_align\":\"middle\",\"width\":\"default\"},\"children\":[{\"type\":\"row\",\"children\":[{\"type\":\"column\",\"props\":{\"image_position\":\"center-center\",\"media_overlay_gradient\":\"\",\"position_sticky_breakpoint\":\"m\"},\"children\":[{\"type\":\"module\",\"props\":{\"menu_image_align\":\"center\",\"menu_image_margin\":true,\"menu_style\":\"default\",\"menu_type\":\"nav\",\"module\":\"117\",\"type\":\"mod_winboard\"}}]}]}]}],\"version\":\"3.0.18\"} -->', 1, 2, '2023-01-05 17:20:31', 120, '', '2023-01-05 17:23:24', 120, 132, '2023-02-27 05:11:05', '2023-01-05 17:20:31', NULL, '{\"image_intro\":\"\",\"image_intro_alt\":\"\",\"float_intro\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"float_fulltext\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":\"\",\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":\"\",\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":\"\",\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 2, 0, '', '', 1, 715, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\"}', 0, '*', '');

-- --------------------------------------------------------

--
-- Table structure for table `b5651_contentitem_tag_map`
--

CREATE TABLE `b5651_contentitem_tag_map` (
  `type_alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_content_id` int UNSIGNED NOT NULL COMMENT 'PK from the core content table',
  `content_item_id` int NOT NULL COMMENT 'PK from the content type table',
  `tag_id` int UNSIGNED NOT NULL COMMENT 'PK from the tag table',
  `tag_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of most recent save for this tag-item',
  `type_id` mediumint NOT NULL COMMENT 'PK from the content_type table'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Maps items from content tables to tags';

-- --------------------------------------------------------

--
-- Table structure for table `b5651_content_frontpage`
--

CREATE TABLE `b5651_content_frontpage` (
  `content_id` int NOT NULL DEFAULT '0',
  `ordering` int NOT NULL DEFAULT '0',
  `featured_up` datetime DEFAULT NULL,
  `featured_down` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `b5651_content_rating`
--

CREATE TABLE `b5651_content_rating` (
  `content_id` int NOT NULL DEFAULT '0',
  `rating_sum` int UNSIGNED NOT NULL DEFAULT '0',
  `rating_count` int UNSIGNED NOT NULL DEFAULT '0',
  `lastip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `b5651_content_types`
--

CREATE TABLE `b5651_content_types` (
  `type_id` int UNSIGNED NOT NULL,
  `type_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type_alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `table` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_mappings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `router` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content_history_options` varchar(5120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JSON string for com_contenthistory options'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `b5651_content_types`
--

INSERT INTO `b5651_content_types` (`type_id`, `type_title`, `type_alias`, `table`, `rules`, `field_mappings`, `router`, `content_history_options`) VALUES
(1, 'Article', 'com_content.article', '{\"special\":{\"dbtable\":\"#__content\",\"key\":\"id\",\"type\":\"ArticleTable\",\"prefix\":\"Joomla\\\\Component\\\\Content\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"state\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"introtext\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"attribs\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"urls\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"asset_id\":\"asset_id\", \"note\":\"note\"}, \"special\":{\"fulltext\":\"fulltext\"}}', 'ContentHelperRoute::getArticleRoute', '{\"formFile\":\"administrator\\/components\\/com_content\\/forms\\/article.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"ordering\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}'),
(2, 'Contact', 'com_contact.contact', '{\"special\":{\"dbtable\":\"#__contact_details\",\"key\":\"id\",\"type\":\"ContactTable\",\"prefix\":\"Joomla\\\\Component\\\\Contact\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"address\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"image\", \"core_urls\":\"webpage\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"asset_id\":\"null\"}, \"special\":{\"con_position\":\"con_position\",\"suburb\":\"suburb\",\"state\":\"state\",\"country\":\"country\",\"postcode\":\"postcode\",\"telephone\":\"telephone\",\"fax\":\"fax\",\"misc\":\"misc\",\"email_to\":\"email_to\",\"default_con\":\"default_con\",\"user_id\":\"user_id\",\"mobile\":\"mobile\",\"sortname1\":\"sortname1\",\"sortname2\":\"sortname2\",\"sortname3\":\"sortname3\"}}', 'ContactHelperRoute::getContactRoute', '{\"formFile\":\"administrator\\/components\\/com_contact\\/forms\\/contact.xml\",\"hideFields\":[\"default_con\",\"checked_out\",\"checked_out_time\",\"version\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"], \"displayLookup\":[ {\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ] }'),
(3, 'Newsfeed', 'com_newsfeeds.newsfeed', '{\"special\":{\"dbtable\":\"#__newsfeeds\",\"key\":\"id\",\"type\":\"NewsfeedTable\",\"prefix\":\"Joomla\\\\Component\\\\Newsfeeds\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"link\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"asset_id\":\"null\"}, \"special\":{\"numarticles\":\"numarticles\",\"cache_time\":\"cache_time\",\"rtl\":\"rtl\"}}', 'NewsfeedsHelperRoute::getNewsfeedRoute', '{\"formFile\":\"administrator\\/components\\/com_newsfeeds\\/forms\\/newsfeed.xml\",\"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}'),
(4, 'User', 'com_users.user', '{\"special\":{\"dbtable\":\"#__users\",\"key\":\"id\",\"type\":\"User\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"null\",\"core_alias\":\"username\",\"core_created_time\":\"registerDate\",\"core_modified_time\":\"lastvisitDate\",\"core_body\":\"null\", \"core_hits\":\"null\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"access\":\"null\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"null\", \"core_language\":\"null\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"null\", \"core_ordering\":\"null\", \"core_metakey\":\"null\", \"core_metadesc\":\"null\", \"core_catid\":\"null\", \"asset_id\":\"null\"}, \"special\":{}}', '', ''),
(5, 'Article Category', 'com_content.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"CategoryTable\",\"prefix\":\"Joomla\\\\Component\\\\Categories\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', 'ContentHelperRoute::getCategoryRoute', '{\"formFile\":\"administrator\\/components\\/com_categories\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),
(6, 'Contact Category', 'com_contact.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"CategoryTable\",\"prefix\":\"Joomla\\\\Component\\\\Categories\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', 'ContactHelperRoute::getCategoryRoute', '{\"formFile\":\"administrator\\/components\\/com_categories\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),
(7, 'Newsfeeds Category', 'com_newsfeeds.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"CategoryTable\",\"prefix\":\"Joomla\\\\Component\\\\Categories\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', 'NewsfeedsHelperRoute::getCategoryRoute', '{\"formFile\":\"administrator\\/components\\/com_categories\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),
(8, 'Tag', 'com_tags.tag', '{\"special\":{\"dbtable\":\"#__tags\",\"key\":\"tag_id\",\"type\":\"TagTable\",\"prefix\":\"Joomla\\\\Component\\\\Tags\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"urls\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"null\", \"asset_id\":\"null\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\"}}', 'TagsHelperRoute::getTagRoute', '{\"formFile\":\"administrator\\/components\\/com_tags\\/forms\\/tag.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\", \"lft\", \"rgt\", \"level\", \"path\", \"urls\", \"publish_up\", \"publish_down\"],\"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}]}'),
(9, 'Banner', 'com_banners.banner', '{\"special\":{\"dbtable\":\"#__banners\",\"key\":\"id\",\"type\":\"BannerTable\",\"prefix\":\"Joomla\\\\Component\\\\Banners\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"description\", \"core_hits\":\"null\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"link\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"asset_id\":\"null\"}, \"special\":{\"imptotal\":\"imptotal\", \"impmade\":\"impmade\", \"clicks\":\"clicks\", \"clickurl\":\"clickurl\", \"custombannercode\":\"custombannercode\", \"cid\":\"cid\", \"purchase_type\":\"purchase_type\", \"track_impressions\":\"track_impressions\", \"track_clicks\":\"track_clicks\"}}', '', '{\"formFile\":\"administrator\\/components\\/com_banners\\/forms\\/banner.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\", \"reset\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"imptotal\", \"impmade\", \"reset\"], \"convertToInt\":[\"publish_up\", \"publish_down\", \"ordering\"], \"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"cid\",\"targetTable\":\"#__banner_clients\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}'),
(10, 'Banners Category', 'com_banners.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"CategoryTable\",\"prefix\":\"Joomla\\\\Component\\\\Categories\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"asset_id\":\"asset_id\"}, \"special\": {\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', '', '{\"formFile\":\"administrator\\/components\\/com_categories\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"], \"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),
(11, 'Banner Client', 'com_banners.client', '{\"special\":{\"dbtable\":\"#__banner_clients\",\"key\":\"id\",\"type\":\"ClientTable\",\"prefix\":\"Joomla\\\\Component\\\\Banners\\\\Administrator\\\\Table\\\\\"}}', '', '', '', '{\"formFile\":\"administrator\\/components\\/com_banners\\/forms\\/client.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\"], \"ignoreChanges\":[\"checked_out\", \"checked_out_time\"], \"convertToInt\":[], \"displayLookup\":[]}'),
(12, 'User Notes', 'com_users.note', '{\"special\":{\"dbtable\":\"#__user_notes\",\"key\":\"id\",\"type\":\"NoteTable\",\"prefix\":\"Joomla\\\\Component\\\\Users\\\\Administrator\\\\Table\\\\\"}}', '', '', '', '{\"formFile\":\"administrator\\/components\\/com_users\\/forms\\/note.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\", \"publish_up\", \"publish_down\"],\"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\"], \"convertToInt\":[\"publish_up\", \"publish_down\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}]}'),
(13, 'User Notes Category', 'com_users.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"CategoryTable\",\"prefix\":\"Joomla\\\\Component\\\\Categories\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', '', '{\"formFile\":\"administrator\\/components\\/com_categories\\/forms\\/category.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"], \"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}');

-- --------------------------------------------------------

--
-- Table structure for table `b5651_extensions`
--

CREATE TABLE `b5651_extensions` (
  `extension_id` int NOT NULL,
  `package_id` int NOT NULL DEFAULT '0' COMMENT 'Parent package ID for extensions installed as a package.',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `changelogurl` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `folder` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint NOT NULL,
  `enabled` tinyint NOT NULL DEFAULT '0',
  `access` int UNSIGNED NOT NULL DEFAULT '1',
  `protected` tinyint NOT NULL DEFAULT '0' COMMENT 'Flag to indicate if the extension is protected. Protected extensions cannot be disabled.',
  `locked` tinyint NOT NULL DEFAULT '0' COMMENT 'Flag to indicate if the extension is locked. Locked extensions cannot be uninstalled.',
  `manifest_cache` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `checked_out` int UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `ordering` int DEFAULT '0',
  `state` int DEFAULT '0',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `b5651_extensions`
--

INSERT INTO `b5651_extensions` (`extension_id`, `package_id`, `name`, `type`, `element`, `changelogurl`, `folder`, `client_id`, `enabled`, `access`, `protected`, `locked`, `manifest_cache`, `params`, `custom_data`, `checked_out`, `checked_out_time`, `ordering`, `state`, `note`) VALUES
(1, 0, 'com_wrapper', 'component', 'com_wrapper', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"com_wrapper\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_WRAPPER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"wrapper\"}', '', '', NULL, NULL, 0, 0, NULL),
(2, 0, 'com_admin', 'component', 'com_admin', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_admin\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_ADMIN_XML_DESCRIPTION\",\"group\":\"\"}', '', '', NULL, NULL, 0, 0, NULL),
(3, 0, 'com_banners', 'component', 'com_banners', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"com_banners\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_BANNERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"banners\"}', '{\"purchase_type\":\"3\",\"track_impressions\":\"0\",\"track_clicks\":\"0\",\"metakey_prefix\":\"\",\"save_history\":\"1\",\"history_limit\":10}', '', NULL, NULL, 0, 0, NULL),
(4, 0, 'com_cache', 'component', 'com_cache', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_cache\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CACHE_XML_DESCRIPTION\",\"group\":\"\"}', '', '', NULL, NULL, 0, 0, NULL),
(5, 0, 'com_categories', 'component', 'com_categories', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_categories\",\"type\":\"component\",\"creationDate\":\"2007-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\"}', '', '', NULL, NULL, 0, 0, NULL),
(6, 0, 'com_checkin', 'component', 'com_checkin', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_checkin\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CHECKIN_XML_DESCRIPTION\",\"group\":\"\"}', '', '', NULL, NULL, 0, 0, NULL),
(7, 0, 'com_contact', 'component', 'com_contact', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"com_contact\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}', '{\"contact_layout\":\"_:default\",\"show_contact_category\":\"hide\",\"save_history\":\"1\",\"history_limit\":10,\"show_contact_list\":\"0\",\"presentation_style\":\"sliders\",\"show_tags\":\"1\",\"show_info\":\"1\",\"show_name\":\"1\",\"show_position\":\"1\",\"show_email\":\"0\",\"show_street_address\":\"1\",\"show_suburb\":\"1\",\"show_state\":\"1\",\"show_postcode\":\"1\",\"show_country\":\"1\",\"show_telephone\":\"1\",\"show_mobile\":\"1\",\"show_fax\":\"1\",\"show_webpage\":\"1\",\"show_image\":\"1\",\"show_misc\":\"1\",\"image\":\"\",\"allow_vcard\":\"0\",\"show_articles\":\"0\",\"articles_display_num\":\"10\",\"show_profile\":\"0\",\"show_user_custom_fields\":[\"-1\"],\"show_links\":\"0\",\"linka_name\":\"\",\"linkb_name\":\"\",\"linkc_name\":\"\",\"linkd_name\":\"\",\"linke_name\":\"\",\"contact_icons\":\"0\",\"icon_address\":\"\",\"icon_email\":\"\",\"icon_telephone\":\"\",\"icon_mobile\":\"\",\"icon_fax\":\"\",\"icon_misc\":\"\",\"category_layout\":\"_:default\",\"show_category_title\":\"1\",\"show_description\":\"1\",\"show_description_image\":\"0\",\"maxLevel\":\"-1\",\"show_subcat_desc\":\"1\",\"show_empty_categories\":\"0\",\"show_cat_items\":\"1\",\"show_cat_tags\":\"1\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_subcat_desc_cat\":\"1\",\"show_empty_categories_cat\":\"0\",\"show_cat_items_cat\":\"1\",\"filter_field\":\"0\",\"show_pagination_limit\":\"0\",\"show_headings\":\"1\",\"show_image_heading\":\"0\",\"show_position_headings\":\"1\",\"show_email_headings\":\"0\",\"show_telephone_headings\":\"1\",\"show_mobile_headings\":\"0\",\"show_fax_headings\":\"0\",\"show_suburb_headings\":\"1\",\"show_state_headings\":\"1\",\"show_country_headings\":\"1\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"initial_sort\":\"ordering\",\"captcha\":\"\",\"show_email_form\":\"1\",\"show_email_copy\":\"0\",\"banned_email\":\"\",\"banned_subject\":\"\",\"banned_text\":\"\",\"validate_session\":\"1\",\"custom_reply\":\"0\",\"redirect\":\"\",\"show_feed_link\":\"1\",\"sef_ids\":1,\"custom_fields_enable\":\"1\"}', '', NULL, NULL, 0, 0, NULL),
(8, 0, 'com_cpanel', 'component', 'com_cpanel', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_cpanel\",\"type\":\"component\",\"creationDate\":\"2007-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CPANEL_XML_DESCRIPTION\",\"group\":\"\"}', '', '', NULL, NULL, 0, 0, NULL),
(9, 0, 'com_installer', 'component', 'com_installer', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_installer\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_INSTALLER_XML_DESCRIPTION\",\"group\":\"\"}', '{\"cachetimeout\":\"6\",\"minimum_stability\":\"4\"}', '', NULL, NULL, 0, 0, NULL),
(10, 0, 'com_languages', 'component', 'com_languages', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_languages\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\"}', '{\"administrator\":\"en-GB\",\"site\":\"en-GB\"}', '', NULL, NULL, 0, 0, NULL),
(11, 0, 'com_login', 'component', 'com_login', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_login\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_LOGIN_XML_DESCRIPTION\",\"group\":\"\"}', '', '', NULL, NULL, 0, 0, NULL),
(12, 0, 'com_media', 'component', 'com_media', NULL, '', 1, 1, 0, 1, 1, '{\"name\":\"com_media\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MEDIA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"media\"}', '{\"upload_maxsize\":\"10\",\"file_path\":\"images\",\"image_path\":\"images\",\"restrict_uploads\":\"1\",\"allowed_media_usergroup\":\"3\",\"restrict_uploads_extensions\":\"bmp,gif,jpg,jpeg,png,webp,ico,mp3,m4a,mp4a,ogg,mp4,mp4v,mpeg,mov,odg,odp,ods,odt,pdf,png,ppt,txt,xcf,xls,csv\",\"check_mime\":\"1\",\"image_extensions\":\"bmp,gif,jpg,png,jpeg,webp\",\"audio_extensions\":\"mp3,m4a,mp4a,ogg\",\"video_extensions\":\"mp4,mp4v,mpeg,mov,webm\",\"doc_extensions\":\"odg,odp,ods,odt,pdf,ppt,txt,xcf,xls,csv\",\"ignore_extensions\":\"\",\"upload_mime\":\"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,image\\/webp,audio\\/ogg,audio\\/mpeg,audio\\/mp4,video\\/mp4,video\\/webm,video\\/mpeg,video\\/quicktime,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip\"}', '', NULL, NULL, 0, 0, NULL),
(13, 0, 'com_menus', 'component', 'com_menus', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_menus\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_MENUS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"menus\"}', '{\"page_title\":\"\",\"show_page_heading\":1,\"page_heading\":\"\",\"pageclass_sfx\":\"\"}', '', NULL, NULL, 0, 0, NULL),
(14, 0, 'com_messages', 'component', 'com_messages', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_messages\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_MESSAGES_XML_DESCRIPTION\",\"group\":\"\"}', '', '', NULL, NULL, 0, 0, NULL),
(15, 0, 'com_modules', 'component', 'com_modules', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_modules\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_MODULES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"modules\"}', '', '', NULL, NULL, 0, 0, NULL),
(16, 0, 'com_newsfeeds', 'component', 'com_newsfeeds', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"com_newsfeeds\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}', '{\"newsfeed_layout\":\"_:default\",\"save_history\":\"1\",\"history_limit\":5,\"show_feed_image\":\"1\",\"show_feed_description\":\"1\",\"show_item_description\":\"1\",\"feed_character_count\":\"0\",\"feed_display_order\":\"des\",\"float_first\":\"right\",\"float_second\":\"right\",\"show_tags\":\"1\",\"category_layout\":\"_:default\",\"show_category_title\":\"1\",\"show_description\":\"1\",\"show_description_image\":\"1\",\"maxLevel\":\"-1\",\"show_empty_categories\":\"0\",\"show_subcat_desc\":\"1\",\"show_cat_items\":\"1\",\"show_cat_tags\":\"1\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"1\",\"show_cat_items_cat\":\"1\",\"filter_field\":\"1\",\"show_pagination_limit\":\"1\",\"show_headings\":\"1\",\"show_articles\":\"0\",\"show_link\":\"1\",\"show_pagination\":\"1\",\"show_pagination_results\":\"1\",\"sef_ids\":1}', '', NULL, NULL, 0, 0, NULL),
(17, 0, 'com_plugins', 'component', 'com_plugins', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_plugins\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_PLUGINS_XML_DESCRIPTION\",\"group\":\"\"}', '', '', NULL, NULL, 0, 0, NULL),
(18, 0, 'com_templates', 'component', 'com_templates', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_templates\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_TEMPLATES_XML_DESCRIPTION\",\"group\":\"\"}', '{\"template_positions_display\":\"0\",\"upload_limit\":\"10\",\"image_formats\":\"gif,bmp,jpg,jpeg,png,webp\",\"source_formats\":\"txt,less,ini,xml,js,php,css,scss,sass,json\",\"font_formats\":\"woff,ttf,otf\",\"compressed_formats\":\"zip\"}', '', NULL, NULL, 0, 0, NULL),
(19, 0, 'com_content', 'component', 'com_content', NULL, '', 1, 1, 0, 1, 1, '{\"name\":\"com_content\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}', '{\"article_layout\":\"_:default\",\"show_title\":\"1\",\"link_titles\":\"1\",\"show_intro\":\"1\",\"info_block_position\":\"0\",\"info_block_show_title\":\"1\",\"show_category\":\"1\",\"link_category\":\"1\",\"show_parent_category\":\"0\",\"link_parent_category\":\"0\",\"show_associations\":\"0\",\"flags\":\"1\",\"show_author\":\"1\",\"link_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_publish_date\":\"1\",\"show_item_navigation\":\"1\",\"show_readmore\":\"1\",\"show_readmore_title\":\"1\",\"readmore_limit\":100,\"show_tags\":\"1\",\"record_hits\":\"1\",\"show_hits\":\"1\",\"show_noauth\":\"0\",\"urls_position\":0,\"captcha\":\"\",\"show_publishing_options\":\"1\",\"show_article_options\":\"1\",\"show_configure_edit_options\":\"1\",\"show_permissions\":\"1\",\"show_associations_edit\":\"1\",\"save_history\":\"1\",\"history_limit\":10,\"show_urls_images_frontend\":\"0\",\"show_urls_images_backend\":\"1\",\"targeta\":0,\"targetb\":0,\"targetc\":0,\"float_intro\":\"left\",\"float_fulltext\":\"left\",\"category_layout\":\"_:blog\",\"show_category_title\":\"0\",\"show_description\":\"0\",\"show_description_image\":\"0\",\"maxLevel\":\"1\",\"show_empty_categories\":\"0\",\"show_no_articles\":\"1\",\"show_category_heading_title_text\":\"1\",\"show_subcat_desc\":\"1\",\"show_cat_num_articles\":\"0\",\"show_cat_tags\":\"1\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"1\",\"show_cat_num_articles_cat\":\"1\",\"num_leading_articles\":1,\"blog_class_leading\":\"\",\"num_intro_articles\":4,\"blog_class\":\"\",\"num_columns\":1,\"multi_column_order\":\"0\",\"num_links\":4,\"show_subcategory_content\":\"0\",\"link_intro_image\":\"0\",\"show_pagination_limit\":\"1\",\"filter_field\":\"hide\",\"show_headings\":\"1\",\"list_show_date\":\"0\",\"date_format\":\"\",\"list_show_hits\":\"1\",\"list_show_author\":\"1\",\"display_num\":\"10\",\"orderby_pri\":\"order\",\"orderby_sec\":\"rdate\",\"order_date\":\"published\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"show_featured\":\"show\",\"show_feed_link\":\"1\",\"feed_summary\":\"0\",\"feed_show_readmore\":\"0\",\"sef_ids\":1,\"custom_fields_enable\":\"1\",\"workflow_enabled\":\"0\"}', '', NULL, NULL, 0, 0, NULL),
(20, 0, 'com_config', 'component', 'com_config', NULL, '', 1, 1, 0, 1, 1, '{\"name\":\"com_config\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CONFIG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"config\"}', '{\"filters\":{\"1\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"9\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"6\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"7\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"2\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"11\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"3\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"4\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"5\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"10\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"8\":{\"filter_type\":\"NONE\",\"filter_tags\":\"\",\"filter_attributes\":\"\"}}}', '', NULL, NULL, 0, 0, NULL),
(21, 0, 'com_redirect', 'component', 'com_redirect', NULL, '', 1, 1, 0, 0, 1, '{\"name\":\"com_redirect\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_REDIRECT_XML_DESCRIPTION\",\"group\":\"\"}', '', '', NULL, NULL, 0, 0, NULL),
(22, 0, 'com_users', 'component', 'com_users', NULL, '', 1, 1, 0, 1, 1, '{\"name\":\"com_users\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_USERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"users\"}', '{\"allowUserRegistration\":\"0\",\"new_usertype\":\"2\",\"guest_usergroup\":\"9\",\"sendpassword\":\"0\",\"useractivation\":\"2\",\"mail_to_admin\":\"1\",\"captcha\":\"\",\"frontend_userparams\":\"1\",\"site_language\":\"0\",\"change_login_name\":\"0\",\"reset_count\":\"10\",\"reset_time\":\"1\",\"minimum_length\":\"12\",\"minimum_integers\":\"0\",\"minimum_symbols\":\"0\",\"minimum_uppercase\":\"0\",\"save_history\":\"1\",\"history_limit\":5,\"mailSubjectPrefix\":\"\",\"mailBodySuffix\":\"\"}', '', NULL, NULL, 0, 0, NULL),
(23, 0, 'com_finder', 'component', 'com_finder', NULL, '', 1, 1, 0, 0, 1, '{\"name\":\"com_finder\",\"type\":\"component\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"finder\"}', '{\"enabled\":\"0\",\"show_description\":\"1\",\"description_length\":255,\"allow_empty_query\":\"0\",\"show_url\":\"1\",\"show_autosuggest\":\"1\",\"show_suggested_query\":\"1\",\"show_explained_query\":\"1\",\"show_advanced\":\"1\",\"show_advanced_tips\":\"1\",\"expand_advanced\":\"0\",\"show_date_filters\":\"0\",\"sort_order\":\"relevance\",\"sort_direction\":\"desc\",\"highlight_terms\":\"1\",\"opensearch_name\":\"\",\"opensearch_description\":\"\",\"batch_size\":\"50\",\"memory_table_limit\":30000,\"title_multiplier\":\"1.7\",\"text_multiplier\":\"0.7\",\"meta_multiplier\":\"1.2\",\"path_multiplier\":\"2.0\",\"misc_multiplier\":\"0.3\",\"stem\":\"1\",\"stemmer\":\"snowball\",\"enable_logging\":\"0\"}', '', NULL, NULL, 0, 0, NULL),
(24, 0, 'com_joomlaupdate', 'component', 'com_joomlaupdate', NULL, '', 1, 1, 0, 1, 1, '{\"name\":\"com_joomlaupdate\",\"type\":\"component\",\"creationDate\":\"2021-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2012 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.3\",\"description\":\"COM_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\"}', '{\"updatesource\":\"default\",\"customurl\":\"\"}', '', NULL, NULL, 0, 0, NULL),
(25, 0, 'com_tags', 'component', 'com_tags', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"com_tags\",\"type\":\"component\",\"creationDate\":\"2013-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}', '{\"tag_layout\":\"_:default\",\"save_history\":\"1\",\"history_limit\":5,\"show_tag_title\":\"0\",\"tag_list_show_tag_image\":\"0\",\"tag_list_show_tag_description\":\"0\",\"tag_list_image\":\"\",\"tag_list_orderby\":\"title\",\"tag_list_orderby_direction\":\"ASC\",\"show_headings\":\"0\",\"tag_list_show_date\":\"0\",\"tag_list_show_item_image\":\"0\",\"tag_list_show_item_description\":\"0\",\"tag_list_item_maximum_characters\":0,\"return_any_or_all\":\"1\",\"include_children\":\"0\",\"maximum\":200,\"tag_list_language_filter\":\"all\",\"tags_layout\":\"_:default\",\"all_tags_orderby\":\"title\",\"all_tags_orderby_direction\":\"ASC\",\"all_tags_show_tag_image\":\"0\",\"all_tags_show_tag_description\":\"0\",\"all_tags_tag_maximum_characters\":20,\"all_tags_show_tag_hits\":\"0\",\"filter_field\":\"1\",\"show_pagination_limit\":\"1\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"tag_field_ajax_mode\":\"1\",\"show_feed_link\":\"1\"}', '', NULL, NULL, 0, 0, NULL),
(26, 0, 'com_contenthistory', 'component', 'com_contenthistory', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"com_contenthistory\",\"type\":\"component\",\"creationDate\":\"2013-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CONTENTHISTORY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contenthistory\"}', '', '', NULL, NULL, 0, 0, NULL),
(27, 0, 'com_ajax', 'component', 'com_ajax', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_ajax\",\"type\":\"component\",\"creationDate\":\"2013-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_AJAX_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"ajax\"}', '', '', NULL, NULL, 0, 0, NULL),
(28, 0, 'com_postinstall', 'component', 'com_postinstall', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_postinstall\",\"type\":\"component\",\"creationDate\":\"2013-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_POSTINSTALL_XML_DESCRIPTION\",\"group\":\"\"}', '', '', NULL, NULL, 0, 0, NULL),
(29, 0, 'com_fields', 'component', 'com_fields', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"com_fields\",\"type\":\"component\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}', '', '', NULL, NULL, 0, 0, NULL),
(30, 0, 'com_associations', 'component', 'com_associations', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"com_associations\",\"type\":\"component\",\"creationDate\":\"2017-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_ASSOCIATIONS_XML_DESCRIPTION\",\"group\":\"\"}', '', '', NULL, NULL, 0, 0, NULL),
(31, 0, 'com_privacy', 'component', 'com_privacy', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"com_privacy\",\"type\":\"component\",\"creationDate\":\"2018-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"COM_PRIVACY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"privacy\"}', '', '', NULL, NULL, 0, 0, NULL),
(32, 0, 'com_actionlogs', 'component', 'com_actionlogs', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"com_actionlogs\",\"type\":\"component\",\"creationDate\":\"2018-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"COM_ACTIONLOGS_XML_DESCRIPTION\",\"group\":\"\"}', '{\"ip_logging\":0,\"csv_delimiter\":\",\",\"loggable_extensions\":[\"com_banners\",\"com_cache\",\"com_categories\",\"com_checkin\",\"com_config\",\"com_contact\",\"com_content\",\"com_installer\",\"com_media\",\"com_menus\",\"com_messages\",\"com_modules\",\"com_newsfeeds\",\"com_plugins\",\"com_redirect\",\"com_scheduler\",\"com_tags\",\"com_templates\",\"com_users\"]}', '', NULL, NULL, 0, 0, NULL),
(33, 0, 'com_workflow', 'component', 'com_workflow', NULL, '', 1, 1, 0, 1, 1, '{\"name\":\"com_workflow\",\"type\":\"component\",\"creationDate\":\"2017-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_WORKFLOW_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', NULL, NULL, 0, 0, NULL),
(34, 0, 'com_mails', 'component', 'com_mails', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_mails\",\"type\":\"component\",\"creationDate\":\"2019-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_MAILS_XML_DESCRIPTION\",\"group\":\"\"}', '', '', NULL, NULL, 0, 0, NULL),
(35, 0, 'com_scheduler', 'component', 'com_scheduler', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"com_scheduler\",\"type\":\"component\",\"creationDate\":\"2021-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.1.0\",\"description\":\"COM_SCHEDULER_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', NULL, NULL, 0, 0, NULL),
(36, 0, 'lib_joomla', 'library', 'joomla', NULL, '', 0, 1, 1, 1, 1, '{\"name\":\"lib_joomla\",\"type\":\"library\",\"creationDate\":\"2008-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2008 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"https:\\/\\/www.joomla.org\",\"version\":\"13.1\",\"description\":\"LIB_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}', '{\"mediaversion\":\"c9b1c0981a634e7c9c089ab363d73d74\"}', '', NULL, NULL, 0, 0, NULL),
(37, 0, 'lib_phpass', 'library', 'phpass', NULL, '', 0, 1, 1, 1, 1, '{\"name\":\"lib_phpass\",\"type\":\"library\",\"creationDate\":\"2004-01\",\"author\":\"Solar Designer\",\"copyright\":\"\",\"authorEmail\":\"solar@openwall.com\",\"authorUrl\":\"https:\\/\\/www.openwall.com\\/phpass\\/\",\"version\":\"0.3\",\"description\":\"LIB_PHPASS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"phpass\"}', '', '', NULL, NULL, 0, 0, NULL),
(38, 0, 'mod_articles_archive', 'module', 'mod_articles_archive', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_articles_archive\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_archive\"}', '', '', NULL, NULL, 0, 0, NULL),
(39, 0, 'mod_articles_latest', 'module', 'mod_articles_latest', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_articles_latest\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LATEST_NEWS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_latest\"}', '', '', NULL, NULL, 0, 0, NULL),
(40, 0, 'mod_articles_popular', 'module', 'mod_articles_popular', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_articles_popular\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_popular\"}', '', '', NULL, NULL, 0, 0, NULL),
(41, 0, 'mod_banners', 'module', 'mod_banners', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_banners\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_BANNERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_banners\"}', '', '', NULL, NULL, 0, 0, NULL),
(42, 0, 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_breadcrumbs\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_BREADCRUMBS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_breadcrumbs\"}', '', '', NULL, NULL, 0, 0, NULL),
(43, 0, 'mod_custom', 'module', 'mod_custom', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_custom\"}', '', '', NULL, NULL, 0, 0, NULL),
(44, 0, 'mod_feed', 'module', 'mod_feed', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"2005-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_feed\"}', '', '', NULL, NULL, 0, 0, NULL),
(45, 0, 'mod_footer', 'module', 'mod_footer', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_footer\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FOOTER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_footer\"}', '', '', NULL, NULL, 0, 0, NULL),
(46, 0, 'mod_login', 'module', 'mod_login', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_login\"}', '', '', NULL, NULL, 0, 0, NULL),
(47, 0, 'mod_menu', 'module', 'mod_menu', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_menu\"}', '', '', NULL, NULL, 0, 0, NULL),
(48, 0, 'mod_articles_news', 'module', 'mod_articles_news', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_articles_news\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_NEWS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_news\"}', '', '', NULL, NULL, 0, 0, NULL),
(49, 0, 'mod_random_image', 'module', 'mod_random_image', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_random_image\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_RANDOM_IMAGE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_random_image\"}', '', '', NULL, NULL, 0, 0, NULL),
(50, 0, 'mod_related_items', 'module', 'mod_related_items', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_related_items\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_RELATED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_related_items\"}', '', '', NULL, NULL, 0, 0, NULL),
(51, 0, 'mod_stats', 'module', 'mod_stats', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_stats\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_stats\"}', '', '', NULL, NULL, 0, 0, NULL),
(52, 0, 'mod_syndicate', 'module', 'mod_syndicate', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_syndicate\",\"type\":\"module\",\"creationDate\":\"2006-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SYNDICATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_syndicate\"}', '', '', NULL, NULL, 0, 0, NULL),
(53, 0, 'mod_users_latest', 'module', 'mod_users_latest', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_users_latest\",\"type\":\"module\",\"creationDate\":\"2009-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2009 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_USERS_LATEST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_users_latest\"}', '', '', NULL, NULL, 0, 0, NULL),
(54, 0, 'mod_whosonline', 'module', 'mod_whosonline', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_whosonline\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_WHOSONLINE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_whosonline\"}', '', '', NULL, NULL, 0, 0, NULL),
(55, 0, 'mod_wrapper', 'module', 'mod_wrapper', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_wrapper\",\"type\":\"module\",\"creationDate\":\"2004-10\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_WRAPPER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_wrapper\"}', '', '', NULL, NULL, 0, 0, NULL),
(56, 0, 'mod_articles_category', 'module', 'mod_articles_category', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_articles_category\",\"type\":\"module\",\"creationDate\":\"2010-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_category\"}', '', '', NULL, NULL, 0, 0, NULL),
(57, 0, 'mod_articles_categories', 'module', 'mod_articles_categories', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_articles_categories\",\"type\":\"module\",\"creationDate\":\"2010-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_categories\"}', '', '', NULL, NULL, 0, 0, NULL),
(58, 0, 'mod_languages', 'module', 'mod_languages', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_languages\",\"type\":\"module\",\"creationDate\":\"2010-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"MOD_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_languages\"}', '', '', NULL, NULL, 0, 0, NULL),
(59, 0, 'mod_finder', 'module', 'mod_finder', NULL, '', 0, 1, 0, 0, 1, '{\"name\":\"mod_finder\",\"type\":\"module\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_finder\"}', '', '', NULL, NULL, 0, 0, NULL),
(60, 0, 'mod_custom', 'module', 'mod_custom', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_custom\"}', '', '', NULL, NULL, 0, 0, NULL),
(61, 0, 'mod_feed', 'module', 'mod_feed', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"2005-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_feed\"}', '', '', NULL, NULL, 0, 0, NULL),
(62, 0, 'mod_latest', 'module', 'mod_latest', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_latest\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LATEST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_latest\"}', '', '', NULL, NULL, 0, 0, NULL),
(63, 0, 'mod_logged', 'module', 'mod_logged', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_logged\",\"type\":\"module\",\"creationDate\":\"2005-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGGED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_logged\"}', '', '', NULL, NULL, 0, 0, NULL),
(64, 0, 'mod_login', 'module', 'mod_login', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"2005-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_login\"}', '', '', NULL, NULL, 0, 0, NULL),
(65, 0, 'mod_loginsupport', 'module', 'mod_loginsupport', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_loginsupport\",\"type\":\"module\",\"creationDate\":\"2019-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"MOD_LOGINSUPPORT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_loginsupport\"}', '', '', NULL, NULL, 0, 0, NULL),
(66, 0, 'mod_menu', 'module', 'mod_menu', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"2006-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_menu\"}', '', '', NULL, NULL, 0, 0, NULL),
(67, 0, 'mod_popular', 'module', 'mod_popular', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_popular\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_popular\"}', '', '', NULL, NULL, 0, 0, NULL),
(68, 0, 'mod_quickicon', 'module', 'mod_quickicon', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_quickicon\",\"type\":\"module\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_QUICKICON_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_quickicon\"}', '', '', NULL, NULL, 0, 0, NULL),
(69, 0, 'mod_frontend', 'module', 'mod_frontend', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_frontend\",\"type\":\"module\",\"creationDate\":\"2019-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"MOD_FRONTEND_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_frontend\"}', '', '', NULL, NULL, 0, 0, NULL),
(70, 0, 'mod_messages', 'module', 'mod_messages', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_messages\",\"type\":\"module\",\"creationDate\":\"2019-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"MOD_MESSAGES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_messages\"}', '', '', NULL, NULL, 0, 0, NULL),
(71, 0, 'mod_post_installation_messages', 'module', 'mod_post_installation_messages', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_post_installation_messages\",\"type\":\"module\",\"creationDate\":\"2019-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"MOD_POST_INSTALLATION_MESSAGES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_post_installation_messages\"}', '', '', NULL, NULL, 0, 0, NULL),
(72, 0, 'mod_user', 'module', 'mod_user', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_user\",\"type\":\"module\",\"creationDate\":\"2019-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"MOD_USER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_user\"}', '', '', NULL, NULL, 0, 0, NULL),
(73, 0, 'mod_title', 'module', 'mod_title', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_title\",\"type\":\"module\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_TITLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_title\"}', '', '', NULL, NULL, 0, 0, NULL),
(74, 0, 'mod_toolbar', 'module', 'mod_toolbar', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_toolbar\",\"type\":\"module\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_TOOLBAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_toolbar\"}', '', '', NULL, NULL, 0, 0, NULL),
(75, 0, 'mod_multilangstatus', 'module', 'mod_multilangstatus', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_multilangstatus\",\"type\":\"module\",\"creationDate\":\"2011-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MULTILANGSTATUS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_multilangstatus\"}', '{\"cache\":\"0\"}', '', NULL, NULL, 0, 0, NULL),
(76, 0, 'mod_version', 'module', 'mod_version', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_version\",\"type\":\"module\",\"creationDate\":\"2012-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2012 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_VERSION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_version\"}', '{\"cache\":\"0\"}', '', NULL, NULL, 0, 0, NULL),
(77, 0, 'mod_stats_admin', 'module', 'mod_stats_admin', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_stats_admin\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_stats_admin\"}', '{\"serverinfo\":\"0\",\"siteinfo\":\"0\",\"counter\":\"0\",\"increase\":\"0\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}', '', NULL, NULL, 0, 0, NULL),
(78, 0, 'mod_tags_popular', 'module', 'mod_tags_popular', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_tags_popular\",\"type\":\"module\",\"creationDate\":\"2013-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"MOD_TAGS_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_tags_popular\"}', '{\"maximum\":\"5\",\"timeframe\":\"alltime\",\"owncache\":\"1\"}', '', NULL, NULL, 0, 0, NULL),
(79, 0, 'mod_tags_similar', 'module', 'mod_tags_similar', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_tags_similar\",\"type\":\"module\",\"creationDate\":\"2013-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"MOD_TAGS_SIMILAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_tags_similar\"}', '{\"maximum\":\"5\",\"matchtype\":\"any\",\"owncache\":\"1\"}', '', NULL, NULL, 0, 0, NULL),
(80, 0, 'mod_sampledata', 'module', 'mod_sampledata', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_sampledata\",\"type\":\"module\",\"creationDate\":\"2017-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8.0\",\"description\":\"MOD_SAMPLEDATA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_sampledata\"}', '{}', '', NULL, NULL, 0, 0, NULL),
(81, 0, 'mod_latestactions', 'module', 'mod_latestactions', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_latestactions\",\"type\":\"module\",\"creationDate\":\"2018-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"MOD_LATESTACTIONS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_latestactions\"}', '{}', '', NULL, NULL, 0, 0, NULL),
(82, 0, 'mod_privacy_dashboard', 'module', 'mod_privacy_dashboard', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_privacy_dashboard\",\"type\":\"module\",\"creationDate\":\"2018-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"MOD_PRIVACY_DASHBOARD_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_privacy_dashboard\"}', '{}', '', NULL, NULL, 0, 0, NULL),
(83, 0, 'mod_submenu', 'module', 'mod_submenu', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_submenu\",\"type\":\"module\",\"creationDate\":\"2006-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SUBMENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_submenu\"}', '{}', '', NULL, NULL, 0, 0, NULL),
(84, 0, 'mod_privacy_status', 'module', 'mod_privacy_status', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_privacy_status\",\"type\":\"module\",\"creationDate\":\"2019-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"MOD_PRIVACY_STATUS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_privacy_status\"}', '{}', '', NULL, NULL, 0, 0, NULL),
(85, 0, 'plg_actionlog_joomla', 'plugin', 'joomla', NULL, 'actionlog', 0, 1, 1, 0, 1, '{\"name\":\"plg_actionlog_joomla\",\"type\":\"plugin\",\"creationDate\":\"2018-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_ACTIONLOG_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}', '{}', '', NULL, NULL, 1, 0, NULL),
(86, 0, 'plg_api-authentication_basic', 'plugin', 'basic', NULL, 'api-authentication', 0, 0, 1, 0, 1, '{\"name\":\"plg_api-authentication_basic\",\"type\":\"plugin\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_API-AUTHENTICATION_BASIC_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"basic\"}', '{}', '', NULL, NULL, 1, 0, NULL);
INSERT INTO `b5651_extensions` (`extension_id`, `package_id`, `name`, `type`, `element`, `changelogurl`, `folder`, `client_id`, `enabled`, `access`, `protected`, `locked`, `manifest_cache`, `params`, `custom_data`, `checked_out`, `checked_out_time`, `ordering`, `state`, `note`) VALUES
(87, 0, 'plg_api-authentication_token', 'plugin', 'token', NULL, 'api-authentication', 0, 1, 1, 0, 1, '{\"name\":\"plg_api-authentication_token\",\"type\":\"plugin\",\"creationDate\":\"2019-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_API-AUTHENTICATION_TOKEN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"token\"}', '{}', '', NULL, NULL, 2, 0, NULL),
(88, 0, 'plg_authentication_cookie', 'plugin', 'cookie', NULL, 'authentication', 0, 1, 1, 0, 1, '{\"name\":\"plg_authentication_cookie\",\"type\":\"plugin\",\"creationDate\":\"2013-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_AUTHENTICATION_COOKIE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"cookie\"}', '', '', NULL, NULL, 1, 0, NULL),
(89, 0, 'plg_authentication_joomla', 'plugin', 'joomla', NULL, 'authentication', 0, 1, 1, 1, 1, '{\"name\":\"plg_authentication_joomla\",\"type\":\"plugin\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_AUTHENTICATION_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}', '', '', NULL, NULL, 2, 0, NULL),
(90, 0, 'plg_authentication_ldap', 'plugin', 'ldap', NULL, 'authentication', 0, 0, 1, 0, 1, '{\"name\":\"plg_authentication_ldap\",\"type\":\"plugin\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LDAP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"ldap\"}', '{\"host\":\"\",\"port\":\"389\",\"use_ldapV3\":\"0\",\"negotiate_tls\":\"0\",\"no_referrals\":\"0\",\"auth_method\":\"bind\",\"base_dn\":\"\",\"search_string\":\"\",\"users_dn\":\"\",\"username\":\"admin\",\"password\":\"bobby7\",\"ldap_fullname\":\"fullName\",\"ldap_email\":\"mail\",\"ldap_uid\":\"uid\"}', '', NULL, NULL, 3, 0, NULL),
(91, 0, 'plg_behaviour_taggable', 'plugin', 'taggable', NULL, 'behaviour', 0, 1, 1, 0, 1, '{\"name\":\"plg_behaviour_taggable\",\"type\":\"plugin\",\"creationDate\":\"2015-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_BEHAVIOUR_TAGGABLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"taggable\"}', '{}', '', NULL, NULL, 1, 0, NULL),
(92, 0, 'plg_behaviour_versionable', 'plugin', 'versionable', NULL, 'behaviour', 0, 1, 1, 0, 1, '{\"name\":\"plg_behaviour_versionable\",\"type\":\"plugin\",\"creationDate\":\"2015-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_BEHAVIOUR_VERSIONABLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"versionable\"}', '{}', '', NULL, NULL, 2, 0, NULL),
(93, 0, 'plg_captcha_recaptcha', 'plugin', 'recaptcha', NULL, 'captcha', 0, 0, 1, 0, 1, '{\"name\":\"plg_captcha_recaptcha\",\"type\":\"plugin\",\"creationDate\":\"2011-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.4.0\",\"description\":\"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"recaptcha\"}', '{\"public_key\":\"\",\"private_key\":\"\",\"theme\":\"clean\"}', '', NULL, NULL, 1, 0, NULL),
(94, 0, 'plg_captcha_recaptcha_invisible', 'plugin', 'recaptcha_invisible', NULL, 'captcha', 0, 0, 1, 0, 1, '{\"name\":\"plg_captcha_recaptcha_invisible\",\"type\":\"plugin\",\"creationDate\":\"2017-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8\",\"description\":\"PLG_CAPTCHA_RECAPTCHA_INVISIBLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"recaptcha_invisible\"}', '{\"public_key\":\"\",\"private_key\":\"\",\"theme\":\"clean\"}', '', NULL, NULL, 2, 0, NULL),
(95, 0, 'plg_content_confirmconsent', 'plugin', 'confirmconsent', NULL, 'content', 0, 0, 1, 0, 1, '{\"name\":\"plg_content_confirmconsent\",\"type\":\"plugin\",\"creationDate\":\"2018-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_CONTENT_CONFIRMCONSENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"confirmconsent\"}', '{}', '', NULL, NULL, 1, 0, NULL),
(96, 0, 'plg_content_contact', 'plugin', 'contact', NULL, 'content', 0, 1, 1, 0, 1, '{\"name\":\"plg_content_contact\",\"type\":\"plugin\",\"creationDate\":\"2014-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2014 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.2\",\"description\":\"PLG_CONTENT_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}', '', '', NULL, NULL, 2, 0, NULL),
(97, 0, 'plg_content_emailcloak', 'plugin', 'emailcloak', NULL, 'content', 0, 1, 1, 0, 1, '{\"name\":\"plg_content_emailcloak\",\"type\":\"plugin\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"emailcloak\"}', '{\"mode\":\"1\"}', '', NULL, NULL, 3, 0, NULL),
(98, 0, 'plg_content_fields', 'plugin', 'fields', NULL, 'content', 0, 1, 1, 0, 1, '{\"name\":\"plg_content_fields\",\"type\":\"plugin\",\"creationDate\":\"2017-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_CONTENT_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}', '', '', NULL, NULL, 4, 0, NULL),
(99, 0, 'plg_content_finder', 'plugin', 'finder', NULL, 'content', 0, 1, 1, 0, 1, '{\"name\":\"plg_content_finder\",\"type\":\"plugin\",\"creationDate\":\"2011-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"finder\"}', '', '', NULL, NULL, 5, 0, NULL),
(100, 0, 'plg_content_joomla', 'plugin', 'joomla', NULL, 'content', 0, 1, 1, 0, 1, '{\"name\":\"plg_content_joomla\",\"type\":\"plugin\",\"creationDate\":\"2010-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}', '', '', NULL, NULL, 6, 0, NULL),
(101, 0, 'plg_content_loadmodule', 'plugin', 'loadmodule', NULL, 'content', 0, 1, 1, 0, 1, '{\"name\":\"plg_content_loadmodule\",\"type\":\"plugin\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LOADMODULE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"loadmodule\"}', '{\"style\":\"xhtml\"}', '', NULL, NULL, 7, 0, NULL),
(102, 0, 'plg_content_pagebreak', 'plugin', 'pagebreak', NULL, 'content', 0, 1, 1, 0, 1, '{\"name\":\"plg_content_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagebreak\"}', '{\"title\":\"1\",\"multipage_toc\":\"1\",\"showall\":\"1\"}', '', NULL, NULL, 8, 0, NULL),
(103, 0, 'plg_content_pagenavigation', 'plugin', 'pagenavigation', NULL, 'content', 0, 1, 1, 0, 1, '{\"name\":\"plg_content_pagenavigation\",\"type\":\"plugin\",\"creationDate\":\"2006-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_PAGENAVIGATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagenavigation\"}', '{\"position\":\"1\"}', '', NULL, NULL, 9, 0, NULL),
(104, 0, 'plg_content_vote', 'plugin', 'vote', NULL, 'content', 0, 0, 1, 0, 1, '{\"name\":\"plg_content_vote\",\"type\":\"plugin\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_VOTE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"vote\"}', '', '', NULL, NULL, 10, 0, NULL),
(105, 0, 'plg_editors-xtd_article', 'plugin', 'article', NULL, 'editors-xtd', 0, 1, 1, 0, 1, '{\"name\":\"plg_editors-xtd_article\",\"type\":\"plugin\",\"creationDate\":\"2009-10\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2009 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_ARTICLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"article\"}', '', '', NULL, NULL, 1, 0, NULL),
(106, 0, 'plg_editors-xtd_contact', 'plugin', 'contact', NULL, 'editors-xtd', 0, 1, 1, 0, 1, '{\"name\":\"plg_editors-xtd_contact\",\"type\":\"plugin\",\"creationDate\":\"2016-10\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_EDITORS-XTD_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}', '', '', NULL, NULL, 2, 0, NULL),
(107, 0, 'plg_editors-xtd_fields', 'plugin', 'fields', NULL, 'editors-xtd', 0, 1, 1, 0, 1, '{\"name\":\"plg_editors-xtd_fields\",\"type\":\"plugin\",\"creationDate\":\"2017-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_EDITORS-XTD_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}', '', '', NULL, NULL, 3, 0, NULL),
(108, 0, 'plg_editors-xtd_image', 'plugin', 'image', NULL, 'editors-xtd', 0, 1, 1, 0, 1, '{\"name\":\"plg_editors-xtd_image\",\"type\":\"plugin\",\"creationDate\":\"2004-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_IMAGE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"image\"}', '', '', NULL, NULL, 4, 0, NULL),
(109, 0, 'plg_editors-xtd_menu', 'plugin', 'menu', NULL, 'editors-xtd', 0, 1, 1, 0, 1, '{\"name\":\"plg_editors-xtd_menu\",\"type\":\"plugin\",\"creationDate\":\"2016-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_EDITORS-XTD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"menu\"}', '', '', NULL, NULL, 5, 0, NULL),
(110, 0, 'plg_editors-xtd_module', 'plugin', 'module', NULL, 'editors-xtd', 0, 1, 1, 0, 1, '{\"name\":\"plg_editors-xtd_module\",\"type\":\"plugin\",\"creationDate\":\"2015-10\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2015 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_MODULE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"module\"}', '', '', NULL, NULL, 6, 0, NULL),
(111, 0, 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', NULL, 'editors-xtd', 0, 1, 1, 0, 1, '{\"name\":\"plg_editors-xtd_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"2004-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagebreak\"}', '', '', NULL, NULL, 7, 0, NULL),
(112, 0, 'plg_editors-xtd_readmore', 'plugin', 'readmore', NULL, 'editors-xtd', 0, 1, 1, 0, 1, '{\"name\":\"plg_editors-xtd_readmore\",\"type\":\"plugin\",\"creationDate\":\"2006-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_READMORE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"readmore\"}', '', '', NULL, NULL, 8, 0, NULL),
(113, 0, 'plg_editors_codemirror', 'plugin', 'codemirror', NULL, 'editors', 0, 1, 1, 0, 1, '{\"name\":\"plg_editors_codemirror\",\"type\":\"plugin\",\"creationDate\":\"28 March 2011\",\"author\":\"Marijn Haverbeke\",\"copyright\":\"Copyright (C) 2014 - 2021 by Marijn Haverbeke <marijnh@gmail.com> and others\",\"authorEmail\":\"marijnh@gmail.com\",\"authorUrl\":\"https:\\/\\/codemirror.net\\/\",\"version\":\"5.65.6\",\"description\":\"PLG_CODEMIRROR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"codemirror\"}', '{\"lineNumbers\":\"1\",\"lineWrapping\":\"1\",\"matchTags\":\"1\",\"matchBrackets\":\"1\",\"marker-gutter\":\"1\",\"autoCloseTags\":\"1\",\"autoCloseBrackets\":\"1\",\"autoFocus\":\"1\",\"theme\":\"default\",\"tabmode\":\"indent\"}', '', NULL, NULL, 1, 0, NULL),
(114, 0, 'plg_editors_none', 'plugin', 'none', NULL, 'editors', 0, 1, 1, 1, 1, '{\"name\":\"plg_editors_none\",\"type\":\"plugin\",\"creationDate\":\"2005-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_NONE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"none\"}', '', '', NULL, NULL, 2, 0, NULL),
(115, 0, 'plg_editors_tinymce', 'plugin', 'tinymce', NULL, 'editors', 0, 1, 1, 0, 1, '{\"name\":\"plg_editors_tinymce\",\"type\":\"plugin\",\"creationDate\":\"2005-08\",\"author\":\"Tiny Technologies, Inc\",\"copyright\":\"Tiny Technologies, Inc\",\"authorEmail\":\"N\\/A\",\"authorUrl\":\"https:\\/\\/www.tiny.cloud\",\"version\":\"5.10.5\",\"description\":\"PLG_TINY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tinymce\"}', '{\"configuration\":{\"toolbars\":{\"2\":{\"toolbar1\":[\"bold\",\"underline\",\"strikethrough\",\"|\",\"undo\",\"redo\",\"|\",\"bullist\",\"numlist\",\"|\",\"pastetext\"]},\"1\":{\"menu\":[\"edit\",\"insert\",\"view\",\"format\",\"table\",\"tools\"],\"toolbar1\":[\"bold\",\"italic\",\"underline\",\"strikethrough\",\"|\",\"alignleft\",\"aligncenter\",\"alignright\",\"alignjustify\",\"|\",\"formatselect\",\"|\",\"bullist\",\"numlist\",\"|\",\"outdent\",\"indent\",\"|\",\"undo\",\"redo\",\"|\",\"link\",\"unlink\",\"anchor\",\"code\",\"|\",\"hr\",\"table\",\"|\",\"subscript\",\"superscript\",\"|\",\"charmap\",\"pastetext\",\"preview\"]},\"0\":{\"menu\":[\"edit\",\"insert\",\"view\",\"format\",\"table\",\"tools\"],\"toolbar1\":[\"bold\",\"italic\",\"underline\",\"strikethrough\",\"|\",\"alignleft\",\"aligncenter\",\"alignright\",\"alignjustify\",\"|\",\"styleselect\",\"|\",\"formatselect\",\"fontselect\",\"fontsizeselect\",\"|\",\"searchreplace\",\"|\",\"bullist\",\"numlist\",\"|\",\"outdent\",\"indent\",\"|\",\"undo\",\"redo\",\"|\",\"link\",\"unlink\",\"anchor\",\"image\",\"|\",\"code\",\"|\",\"forecolor\",\"backcolor\",\"|\",\"fullscreen\",\"|\",\"table\",\"|\",\"subscript\",\"superscript\",\"|\",\"charmap\",\"emoticons\",\"media\",\"hr\",\"ltr\",\"rtl\",\"|\",\"cut\",\"copy\",\"paste\",\"pastetext\",\"|\",\"visualchars\",\"visualblocks\",\"nonbreaking\",\"blockquote\",\"template\",\"|\",\"print\",\"preview\",\"codesample\",\"insertdatetime\",\"removeformat\"]}},\"setoptions\":{\"2\":{\"access\":[\"1\"],\"skin\":\"0\",\"skin_admin\":\"0\",\"mobile\":\"0\",\"drag_drop\":\"1\",\"path\":\"\",\"entity_encoding\":\"raw\",\"lang_mode\":\"1\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"use_config_textfilters\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"valid_elements\":\"\",\"extended_elements\":\"\",\"resizing\":\"1\",\"resize_horizontal\":\"1\",\"element_path\":\"1\",\"wordcount\":\"1\",\"image_advtab\":\"0\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"},\"1\":{\"access\":[\"6\",\"2\"],\"skin\":\"0\",\"skin_admin\":\"0\",\"mobile\":\"0\",\"drag_drop\":\"1\",\"path\":\"\",\"entity_encoding\":\"raw\",\"lang_mode\":\"1\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"use_config_textfilters\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"valid_elements\":\"\",\"extended_elements\":\"\",\"resizing\":\"1\",\"resize_horizontal\":\"1\",\"element_path\":\"1\",\"wordcount\":\"1\",\"image_advtab\":\"0\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"},\"0\":{\"access\":[\"7\",\"4\",\"8\"],\"skin\":\"0\",\"skin_admin\":\"0\",\"mobile\":\"0\",\"drag_drop\":\"1\",\"path\":\"\",\"entity_encoding\":\"raw\",\"lang_mode\":\"1\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"use_config_textfilters\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"valid_elements\":\"\",\"extended_elements\":\"\",\"resizing\":\"1\",\"resize_horizontal\":\"1\",\"element_path\":\"1\",\"wordcount\":\"1\",\"image_advtab\":\"1\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"}}},\"sets_amount\":3,\"html_height\":\"550\",\"html_width\":\"750\"}', '', NULL, NULL, 3, 0, NULL),
(116, 0, 'plg_extension_finder', 'plugin', 'finder', NULL, 'extension', 0, 1, 1, 0, 1, '{\"name\":\"plg_extension_finder\",\"type\":\"plugin\",\"creationDate\":\"2018-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_EXTENSION_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"finder\"}', '', '', NULL, NULL, 1, 0, NULL),
(117, 0, 'plg_extension_joomla', 'plugin', 'joomla', NULL, 'extension', 0, 1, 1, 0, 1, '{\"name\":\"plg_extension_joomla\",\"type\":\"plugin\",\"creationDate\":\"2010-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}', '', '', NULL, NULL, 2, 0, NULL),
(118, 0, 'plg_extension_namespacemap', 'plugin', 'namespacemap', NULL, 'extension', 0, 1, 1, 1, 1, '{\"name\":\"plg_extension_namespacemap\",\"type\":\"plugin\",\"creationDate\":\"2017-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_EXTENSION_NAMESPACEMAP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"namespacemap\"}', '{}', '', NULL, NULL, 3, 0, NULL),
(119, 0, 'plg_fields_calendar', 'plugin', 'calendar', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_calendar\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_CALENDAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"calendar\"}', '', '', NULL, NULL, 1, 0, NULL),
(120, 0, 'plg_fields_checkboxes', 'plugin', 'checkboxes', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_checkboxes\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_CHECKBOXES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"checkboxes\"}', '', '', NULL, NULL, 2, 0, NULL),
(121, 0, 'plg_fields_color', 'plugin', 'color', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_color\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_COLOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"color\"}', '', '', NULL, NULL, 3, 0, NULL),
(122, 0, 'plg_fields_editor', 'plugin', 'editor', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_editor\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_EDITOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"editor\"}', '', '', NULL, NULL, 4, 0, NULL),
(123, 0, 'plg_fields_imagelist', 'plugin', 'imagelist', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_imagelist\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_IMAGELIST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"imagelist\"}', '', '', NULL, NULL, 5, 0, NULL),
(124, 0, 'plg_fields_integer', 'plugin', 'integer', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_integer\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_INTEGER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"integer\"}', '{\"multiple\":\"0\",\"first\":\"1\",\"last\":\"100\",\"step\":\"1\"}', '', NULL, NULL, 6, 0, NULL),
(125, 0, 'plg_fields_list', 'plugin', 'list', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_list\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_LIST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"list\"}', '', '', NULL, NULL, 7, 0, NULL),
(126, 0, 'plg_fields_media', 'plugin', 'media', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_media\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_MEDIA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"media\"}', '', '', NULL, NULL, 8, 0, NULL),
(127, 0, 'plg_fields_radio', 'plugin', 'radio', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_radio\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_RADIO_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"radio\"}', '', '', NULL, NULL, 9, 0, NULL),
(128, 0, 'plg_fields_sql', 'plugin', 'sql', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_sql\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_SQL_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"sql\"}', '', '', NULL, NULL, 10, 0, NULL),
(129, 0, 'plg_fields_subform', 'plugin', 'subform', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_subform\",\"type\":\"plugin\",\"creationDate\":\"2017-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_FIELDS_SUBFORM_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"subform\"}', '', '', NULL, NULL, 11, 0, NULL),
(130, 0, 'plg_fields_text', 'plugin', 'text', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_text\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_TEXT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"text\"}', '', '', NULL, NULL, 12, 0, NULL),
(131, 0, 'plg_fields_textarea', 'plugin', 'textarea', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_textarea\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_TEXTAREA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"textarea\"}', '', '', NULL, NULL, 13, 0, NULL),
(132, 0, 'plg_fields_url', 'plugin', 'url', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_url\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_URL_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"url\"}', '', '', NULL, NULL, 14, 0, NULL),
(133, 0, 'plg_fields_user', 'plugin', 'user', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_user\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_USER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"user\"}', '', '', NULL, NULL, 15, 0, NULL),
(134, 0, 'plg_fields_usergrouplist', 'plugin', 'usergrouplist', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_usergrouplist\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_USERGROUPLIST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"usergrouplist\"}', '', '', NULL, NULL, 16, 0, NULL),
(135, 0, 'plg_filesystem_local', 'plugin', 'local', NULL, 'filesystem', 0, 1, 1, 0, 1, '{\"name\":\"plg_filesystem_local\",\"type\":\"plugin\",\"creationDate\":\"2017-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_FILESYSTEM_LOCAL_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"local\"}', '{}', '', NULL, NULL, 1, 0, NULL),
(136, 0, 'plg_finder_categories', 'plugin', 'categories', NULL, 'finder', 0, 1, 1, 0, 1, '{\"name\":\"plg_finder_categories\",\"type\":\"plugin\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"categories\"}', '', '', NULL, NULL, 1, 0, NULL),
(137, 0, 'plg_finder_contacts', 'plugin', 'contacts', NULL, 'finder', 0, 1, 1, 0, 1, '{\"name\":\"plg_finder_contacts\",\"type\":\"plugin\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CONTACTS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contacts\"}', '', '', NULL, NULL, 2, 0, NULL),
(138, 0, 'plg_finder_content', 'plugin', 'content', NULL, 'finder', 0, 1, 1, 0, 1, '{\"name\":\"plg_finder_content\",\"type\":\"plugin\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}', '', '', NULL, NULL, 3, 0, NULL),
(139, 0, 'plg_finder_newsfeeds', 'plugin', 'newsfeeds', NULL, 'finder', 0, 1, 1, 0, 1, '{\"name\":\"plg_finder_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}', '', '', NULL, NULL, 4, 0, NULL),
(140, 0, 'plg_finder_tags', 'plugin', 'tags', NULL, 'finder', 0, 1, 1, 0, 1, '{\"name\":\"plg_finder_tags\",\"type\":\"plugin\",\"creationDate\":\"2013-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}', '', '', NULL, NULL, 5, 0, NULL),
(141, 0, 'plg_installer_folderinstaller', 'plugin', 'folderinstaller', NULL, 'installer', 0, 1, 1, 0, 1, '{\"name\":\"plg_installer_folderinstaller\",\"type\":\"plugin\",\"creationDate\":\"2016-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_FOLDERINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"folderinstaller\"}', '', '', NULL, NULL, 2, 0, NULL),
(142, 0, 'plg_installer_override', 'plugin', 'override', NULL, 'installer', 0, 1, 1, 0, 1, '{\"name\":\"plg_installer_override\",\"type\":\"plugin\",\"creationDate\":\"2018-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_INSTALLER_OVERRIDE_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"override\"}', '', '', NULL, NULL, 4, 0, NULL),
(143, 0, 'plg_installer_packageinstaller', 'plugin', 'packageinstaller', NULL, 'installer', 0, 1, 1, 0, 1, '{\"name\":\"plg_installer_packageinstaller\",\"type\":\"plugin\",\"creationDate\":\"2016-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_PACKAGEINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"packageinstaller\"}', '', '', NULL, NULL, 1, 0, NULL),
(144, 0, 'plg_installer_urlinstaller', 'plugin', 'urlinstaller', NULL, 'installer', 0, 1, 1, 0, 1, '{\"name\":\"plg_installer_urlinstaller\",\"type\":\"plugin\",\"creationDate\":\"2016-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_URLINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"urlinstaller\"}', '', '', NULL, NULL, 3, 0, NULL),
(145, 0, 'plg_installer_webinstaller', 'plugin', 'webinstaller', NULL, 'installer', 0, 1, 1, 0, 1, '{\"name\":\"plg_installer_webinstaller\",\"type\":\"plugin\",\"creationDate\":\"2017-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_INSTALLER_WEBINSTALLER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"webinstaller\"}', '{\"tab_position\":\"1\"}', '', NULL, NULL, 5, 0, NULL),
(146, 0, 'plg_media-action_crop', 'plugin', 'crop', NULL, 'media-action', 0, 1, 1, 0, 1, '{\"name\":\"plg_media-action_crop\",\"type\":\"plugin\",\"creationDate\":\"2017-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_MEDIA-ACTION_CROP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"crop\"}', '{}', '', NULL, NULL, 1, 0, NULL),
(147, 0, 'plg_media-action_resize', 'plugin', 'resize', NULL, 'media-action', 0, 1, 1, 0, 1, '{\"name\":\"plg_media-action_resize\",\"type\":\"plugin\",\"creationDate\":\"2017-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_MEDIA-ACTION_RESIZE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"resize\"}', '{}', '', NULL, NULL, 2, 0, NULL),
(148, 0, 'plg_media-action_rotate', 'plugin', 'rotate', NULL, 'media-action', 0, 1, 1, 0, 1, '{\"name\":\"plg_media-action_rotate\",\"type\":\"plugin\",\"creationDate\":\"2017-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_MEDIA-ACTION_ROTATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"rotate\"}', '{}', '', NULL, NULL, 3, 0, NULL),
(149, 0, 'plg_privacy_actionlogs', 'plugin', 'actionlogs', NULL, 'privacy', 0, 1, 1, 0, 1, '{\"name\":\"plg_privacy_actionlogs\",\"type\":\"plugin\",\"creationDate\":\"2018-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_ACTIONLOGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"actionlogs\"}', '{}', '', NULL, NULL, 1, 0, NULL),
(150, 0, 'plg_privacy_consents', 'plugin', 'consents', NULL, 'privacy', 0, 1, 1, 0, 1, '{\"name\":\"plg_privacy_consents\",\"type\":\"plugin\",\"creationDate\":\"2018-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_CONSENTS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"consents\"}', '{}', '', NULL, NULL, 2, 0, NULL),
(151, 0, 'plg_privacy_contact', 'plugin', 'contact', NULL, 'privacy', 0, 1, 1, 0, 1, '{\"name\":\"plg_privacy_contact\",\"type\":\"plugin\",\"creationDate\":\"2018-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}', '{}', '', NULL, NULL, 3, 0, NULL),
(152, 0, 'plg_privacy_content', 'plugin', 'content', NULL, 'privacy', 0, 1, 1, 0, 1, '{\"name\":\"plg_privacy_content\",\"type\":\"plugin\",\"creationDate\":\"2018-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}', '{}', '', NULL, NULL, 4, 0, NULL),
(153, 0, 'plg_privacy_message', 'plugin', 'message', NULL, 'privacy', 0, 1, 1, 0, 1, '{\"name\":\"plg_privacy_message\",\"type\":\"plugin\",\"creationDate\":\"2018-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_MESSAGE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"message\"}', '{}', '', NULL, NULL, 5, 0, NULL),
(154, 0, 'plg_privacy_user', 'plugin', 'user', NULL, 'privacy', 0, 1, 1, 0, 1, '{\"name\":\"plg_privacy_user\",\"type\":\"plugin\",\"creationDate\":\"2018-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_USER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"user\"}', '{}', '', NULL, NULL, 6, 0, NULL),
(155, 0, 'plg_quickicon_joomlaupdate', 'plugin', 'joomlaupdate', NULL, 'quickicon', 0, 1, 1, 0, 1, '{\"name\":\"plg_quickicon_joomlaupdate\",\"type\":\"plugin\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomlaupdate\"}', '', '', NULL, NULL, 1, 0, NULL),
(156, 0, 'plg_quickicon_extensionupdate', 'plugin', 'extensionupdate', NULL, 'quickicon', 0, 1, 1, 0, 1, '{\"name\":\"plg_quickicon_extensionupdate\",\"type\":\"plugin\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"extensionupdate\"}', '', '', NULL, NULL, 2, 0, NULL),
(157, 0, 'plg_quickicon_overridecheck', 'plugin', 'overridecheck', NULL, 'quickicon', 0, 1, 1, 0, 1, '{\"name\":\"plg_quickicon_overridecheck\",\"type\":\"plugin\",\"creationDate\":\"2018-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_QUICKICON_OVERRIDECHECK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"overridecheck\"}', '', '', NULL, NULL, 3, 0, NULL),
(158, 0, 'plg_quickicon_downloadkey', 'plugin', 'downloadkey', NULL, 'quickicon', 0, 1, 1, 0, 1, '{\"name\":\"plg_quickicon_downloadkey\",\"type\":\"plugin\",\"creationDate\":\"2019-10\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_QUICKICON_DOWNLOADKEY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"downloadkey\"}', '', '', NULL, NULL, 4, 0, NULL),
(159, 0, 'plg_quickicon_privacycheck', 'plugin', 'privacycheck', NULL, 'quickicon', 0, 1, 1, 0, 1, '{\"name\":\"plg_quickicon_privacycheck\",\"type\":\"plugin\",\"creationDate\":\"2018-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_QUICKICON_PRIVACYCHECK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"privacycheck\"}', '{}', '', NULL, NULL, 5, 0, NULL),
(160, 0, 'plg_quickicon_phpversioncheck', 'plugin', 'phpversioncheck', NULL, 'quickicon', 0, 1, 1, 0, 1, '{\"name\":\"plg_quickicon_phpversioncheck\",\"type\":\"plugin\",\"creationDate\":\"2016-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_QUICKICON_PHPVERSIONCHECK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"phpversioncheck\"}', '', '', NULL, NULL, 6, 0, NULL),
(161, 0, 'plg_sampledata_blog', 'plugin', 'blog', NULL, 'sampledata', 0, 1, 1, 0, 1, '{\"name\":\"plg_sampledata_blog\",\"type\":\"plugin\",\"creationDate\":\"2017-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8.0\",\"description\":\"PLG_SAMPLEDATA_BLOG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"blog\"}', '', '', NULL, NULL, 1, 0, NULL),
(162, 0, 'plg_sampledata_multilang', 'plugin', 'multilang', NULL, 'sampledata', 0, 1, 1, 0, 1, '{\"name\":\"plg_sampledata_multilang\",\"type\":\"plugin\",\"creationDate\":\"2018-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_SAMPLEDATA_MULTILANG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"multilang\"}', '', '', NULL, NULL, 2, 0, NULL),
(163, 0, 'plg_system_accessibility', 'plugin', 'accessibility', NULL, 'system', 0, 0, 1, 0, 1, '{\"name\":\"plg_system_accessibility\",\"type\":\"plugin\",\"creationDate\":\"2020-02-15\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_SYSTEM_ACCESSIBILITY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"accessibility\"}', '{}', '', NULL, NULL, 1, 0, NULL),
(164, 0, 'plg_system_actionlogs', 'plugin', 'actionlogs', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_actionlogs\",\"type\":\"plugin\",\"creationDate\":\"2018-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_SYSTEM_ACTIONLOGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"actionlogs\"}', '{}', '', NULL, NULL, 2, 0, NULL),
(165, 0, 'plg_system_cache', 'plugin', 'cache', NULL, 'system', 0, 0, 1, 0, 1, '{\"name\":\"plg_system_cache\",\"type\":\"plugin\",\"creationDate\":\"2007-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CACHE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"cache\"}', '{\"browsercache\":\"0\",\"cachetime\":\"15\"}', '', NULL, NULL, 3, 0, NULL),
(166, 0, 'plg_system_debug', 'plugin', 'debug', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_debug\",\"type\":\"plugin\",\"creationDate\":\"2006-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_DEBUG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"debug\"}', '{\"profile\":\"1\",\"queries\":\"1\",\"memory\":\"1\",\"language_files\":\"1\",\"language_strings\":\"1\",\"strip-first\":\"1\",\"strip-prefix\":\"\",\"strip-suffix\":\"\"}', '', NULL, NULL, 4, 0, NULL),
(167, 0, 'plg_system_fields', 'plugin', 'fields', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_fields\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_SYSTEM_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}', '', '', NULL, NULL, 5, 0, NULL),
(168, 0, 'plg_system_highlight', 'plugin', 'highlight', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_highlight\",\"type\":\"plugin\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"highlight\"}', '', '', NULL, NULL, 6, 0, NULL),
(169, 0, 'plg_system_httpheaders', 'plugin', 'httpheaders', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_httpheaders\",\"type\":\"plugin\",\"creationDate\":\"2017-10\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_SYSTEM_HTTPHEADERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"httpheaders\"}', '{}', '', NULL, NULL, 7, 0, NULL),
(170, 0, 'plg_system_jooa11y', 'plugin', 'jooa11y', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_jooa11y\",\"type\":\"plugin\",\"creationDate\":\"2022-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.0\",\"description\":\"PLG_SYSTEM_JOOA11Y_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"jooa11y\"}', '', '', NULL, NULL, 8, 0, NULL),
(171, 0, 'plg_system_languagecode', 'plugin', 'languagecode', NULL, 'system', 0, 0, 1, 0, 1, '{\"name\":\"plg_system_languagecode\",\"type\":\"plugin\",\"creationDate\":\"2011-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"languagecode\"}', '', '', NULL, NULL, 9, 0, NULL),
(172, 0, 'plg_system_languagefilter', 'plugin', 'languagefilter', NULL, 'system', 0, 0, 1, 0, 1, '{\"name\":\"plg_system_languagefilter\",\"type\":\"plugin\",\"creationDate\":\"2010-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"languagefilter\"}', '', '', NULL, NULL, 10, 0, NULL),
(173, 0, 'plg_system_log', 'plugin', 'log', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_log\",\"type\":\"plugin\",\"creationDate\":\"2007-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LOG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"log\"}', '', '', NULL, NULL, 11, 0, NULL),
(174, 0, 'plg_system_logout', 'plugin', 'logout', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_logout\",\"type\":\"plugin\",\"creationDate\":\"2009-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2009 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"logout\"}', '', '', NULL, NULL, 12, 0, NULL),
(175, 0, 'plg_system_logrotation', 'plugin', 'logrotation', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_logrotation\",\"type\":\"plugin\",\"creationDate\":\"2018-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_SYSTEM_LOGROTATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"logrotation\"}', '{\"lastrun\":1681195336}', '', NULL, NULL, 13, 0, NULL),
(176, 0, 'plg_system_privacyconsent', 'plugin', 'privacyconsent', NULL, 'system', 0, 0, 1, 0, 1, '{\"name\":\"plg_system_privacyconsent\",\"type\":\"plugin\",\"creationDate\":\"2018-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_SYSTEM_PRIVACYCONSENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"privacyconsent\"}', '{}', '', NULL, NULL, 14, 0, NULL),
(177, 0, 'plg_system_redirect', 'plugin', 'redirect', NULL, 'system', 0, 0, 1, 0, 1, '{\"name\":\"plg_system_redirect\",\"type\":\"plugin\",\"creationDate\":\"2009-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2009 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_REDIRECT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"redirect\"}', '', '', NULL, NULL, 15, 0, NULL),
(178, 0, 'plg_system_remember', 'plugin', 'remember', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_remember\",\"type\":\"plugin\",\"creationDate\":\"2007-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_REMEMBER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"remember\"}', '', '', NULL, NULL, 16, 0, NULL),
(179, 0, 'plg_system_schedulerunner', 'plugin', 'schedulerunner', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_schedulerunner\",\"type\":\"plugin\",\"creationDate\":\"2021-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.1\",\"description\":\"PLG_SYSTEM_SCHEDULERUNNER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"schedulerunner\"}', '{}', '', NULL, NULL, 17, 0, NULL);
INSERT INTO `b5651_extensions` (`extension_id`, `package_id`, `name`, `type`, `element`, `changelogurl`, `folder`, `client_id`, `enabled`, `access`, `protected`, `locked`, `manifest_cache`, `params`, `custom_data`, `checked_out`, `checked_out_time`, `ordering`, `state`, `note`) VALUES
(180, 0, 'plg_system_sef', 'plugin', 'sef', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_sef\",\"type\":\"plugin\",\"creationDate\":\"2007-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEF_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"sef\"}', '', '', NULL, NULL, 18, 0, NULL),
(181, 0, 'plg_system_sessiongc', 'plugin', 'sessiongc', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_sessiongc\",\"type\":\"plugin\",\"creationDate\":\"2018-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8.6\",\"description\":\"PLG_SYSTEM_SESSIONGC_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"sessiongc\"}', '', '', NULL, NULL, 19, 0, NULL),
(182, 0, 'plg_system_skipto', 'plugin', 'skipto', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_skipto\",\"type\":\"plugin\",\"creationDate\":\"2020-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_SYSTEM_SKIPTO_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"skipto\"}', '{}', '', NULL, NULL, 20, 0, NULL),
(183, 0, 'plg_system_stats', 'plugin', 'stats', NULL, 'system', 0, 0, 1, 0, 1, '{\"name\":\"plg_system_stats\",\"type\":\"plugin\",\"creationDate\":\"2013-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_SYSTEM_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"stats\"}', '{\"mode\":3,\"lastrun\":\"\",\"unique_id\":\"ce5d6268e9ee2a012e6c36a19593124aea2a4435\",\"interval\":12}', '', NULL, NULL, 21, 0, NULL),
(184, 0, 'plg_system_task_notification', 'plugin', 'tasknotification', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_task_notification\",\"type\":\"plugin\",\"creationDate\":\"2021-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.1\",\"description\":\"PLG_SYSTEM_TASK_NOTIFICATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tasknotification\"}', '', '', NULL, NULL, 22, 0, NULL),
(185, 0, 'plg_system_updatenotification', 'plugin', 'updatenotification', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_updatenotification\",\"type\":\"plugin\",\"creationDate\":\"2015-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2015 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_SYSTEM_UPDATENOTIFICATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"updatenotification\"}', '{\"lastrun\":1683592374}', '', NULL, NULL, 23, 0, NULL),
(186, 0, 'plg_system_webauthn', 'plugin', 'webauthn', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_webauthn\",\"type\":\"plugin\",\"creationDate\":\"2019-07-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_SYSTEM_WEBAUTHN_DESCRIPTION\",\"group\":\"\",\"filename\":\"webauthn\"}', '{}', '', NULL, NULL, 23, 0, NULL),
(187, 0, 'plg_task_check_files', 'plugin', 'checkfiles', NULL, 'task', 0, 1, 1, 0, 1, '{\"name\":\"plg_task_check_files\",\"type\":\"plugin\",\"creationDate\":\"2021-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.1\",\"description\":\"PLG_TASK_CHECK_FILES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"checkfiles\"}', '{}', '', NULL, NULL, 1, 0, NULL),
(188, 0, 'plg_task_demo_tasks', 'plugin', 'demotasks', NULL, 'task', 0, 1, 1, 0, 1, '{\"name\":\"plg_task_demo_tasks\",\"type\":\"plugin\",\"creationDate\":\"2021-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.1\",\"description\":\"PLG_TASK_DEMO_TASKS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"demotasks\"}', '{}', '', NULL, NULL, 2, 0, NULL),
(189, 0, 'plg_task_requests', 'plugin', 'requests', NULL, 'task', 0, 1, 1, 0, 1, '{\"name\":\"plg_task_requests\",\"type\":\"plugin\",\"creationDate\":\"2021-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.1\",\"description\":\"PLG_TASK_REQUESTS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"requests\"}', '{}', '', NULL, NULL, 3, 0, NULL),
(190, 0, 'plg_task_site_status', 'plugin', 'sitestatus', NULL, 'task', 0, 1, 1, 0, 1, '{\"name\":\"plg_task_site_status\",\"type\":\"plugin\",\"creationDate\":\"2021-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.1\",\"description\":\"PLG_TASK_SITE_STATUS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"sitestatus\"}', '{}', '', NULL, NULL, 4, 0, NULL),
(193, 0, 'plg_user_contactcreator', 'plugin', 'contactcreator', NULL, 'user', 0, 0, 1, 0, 1, '{\"name\":\"plg_user_contactcreator\",\"type\":\"plugin\",\"creationDate\":\"2009-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2009 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTACTCREATOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contactcreator\"}', '{\"autowebpage\":\"\",\"category\":\"4\",\"autopublish\":\"0\"}', '', NULL, NULL, 1, 0, NULL),
(194, 0, 'plg_user_joomla', 'plugin', 'joomla', NULL, 'user', 0, 1, 1, 0, 1, '{\"name\":\"plg_user_joomla\",\"type\":\"plugin\",\"creationDate\":\"2006-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_USER_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}', '{\"autoregister\":\"1\",\"mail_to_user\":\"1\",\"forceLogout\":\"1\"}', '', NULL, NULL, 2, 0, NULL),
(195, 0, 'plg_user_profile', 'plugin', 'profile', NULL, 'user', 0, 0, 1, 0, 1, '{\"name\":\"plg_user_profile\",\"type\":\"plugin\",\"creationDate\":\"2008-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2008 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_USER_PROFILE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"profile\"}', '{\"register-require_address1\":\"1\",\"register-require_address2\":\"1\",\"register-require_city\":\"1\",\"register-require_region\":\"1\",\"register-require_country\":\"1\",\"register-require_postal_code\":\"1\",\"register-require_phone\":\"1\",\"register-require_website\":\"1\",\"register-require_favoritebook\":\"1\",\"register-require_aboutme\":\"1\",\"register-require_tos\":\"1\",\"register-require_dob\":\"1\",\"profile-require_address1\":\"1\",\"profile-require_address2\":\"1\",\"profile-require_city\":\"1\",\"profile-require_region\":\"1\",\"profile-require_country\":\"1\",\"profile-require_postal_code\":\"1\",\"profile-require_phone\":\"1\",\"profile-require_website\":\"1\",\"profile-require_favoritebook\":\"1\",\"profile-require_aboutme\":\"1\",\"profile-require_tos\":\"1\",\"profile-require_dob\":\"1\"}', '', NULL, NULL, 3, 0, NULL),
(196, 0, 'plg_user_terms', 'plugin', 'terms', NULL, 'user', 0, 0, 1, 0, 1, '{\"name\":\"plg_user_terms\",\"type\":\"plugin\",\"creationDate\":\"2018-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_USER_TERMS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"terms\"}', '{}', '', NULL, NULL, 4, 0, NULL),
(197, 0, 'plg_user_token', 'plugin', 'token', NULL, 'user', 0, 1, 1, 0, 1, '{\"name\":\"plg_user_token\",\"type\":\"plugin\",\"creationDate\":\"2019-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_USER_TOKEN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"token\"}', '{}', '', NULL, NULL, 5, 0, NULL),
(198, 0, 'plg_webservices_banners', 'plugin', 'banners', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_banners\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_BANNERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"banners\"}', '{}', '', NULL, NULL, 1, 0, NULL),
(199, 0, 'plg_webservices_config', 'plugin', 'config', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_config\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_CONFIG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"config\"}', '{}', '', NULL, NULL, 2, 0, NULL),
(200, 0, 'plg_webservices_contact', 'plugin', 'contact', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_contact\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}', '{}', '', NULL, NULL, 3, 0, NULL),
(201, 0, 'plg_webservices_content', 'plugin', 'content', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_content\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}', '{}', '', NULL, NULL, 4, 0, NULL),
(202, 0, 'plg_webservices_installer', 'plugin', 'installer', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_installer\",\"type\":\"plugin\",\"creationDate\":\"2020-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_INSTALLER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"installer\"}', '{}', '', NULL, NULL, 5, 0, NULL),
(203, 0, 'plg_webservices_languages', 'plugin', 'languages', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_languages\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"languages\"}', '{}', '', NULL, NULL, 6, 0, NULL),
(204, 0, 'plg_webservices_media', 'plugin', 'media', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_media\",\"type\":\"plugin\",\"creationDate\":\"2021-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.1.0\",\"description\":\"PLG_WEBSERVICES_MEDIA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"media\"}', '{}', '', NULL, NULL, 7, 0, NULL),
(205, 0, 'plg_webservices_menus', 'plugin', 'menus', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_menus\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_MENUS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"menus\"}', '{}', '', NULL, NULL, 7, 0, NULL),
(206, 0, 'plg_webservices_messages', 'plugin', 'messages', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_messages\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_MESSAGES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"messages\"}', '{}', '', NULL, NULL, 8, 0, NULL),
(207, 0, 'plg_webservices_modules', 'plugin', 'modules', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_modules\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_MODULES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"modules\"}', '{}', '', NULL, NULL, 9, 0, NULL),
(208, 0, 'plg_webservices_newsfeeds', 'plugin', 'newsfeeds', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}', '{}', '', NULL, NULL, 10, 0, NULL),
(209, 0, 'plg_webservices_plugins', 'plugin', 'plugins', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_plugins\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_PLUGINS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"plugins\"}', '{}', '', NULL, NULL, 11, 0, NULL),
(210, 0, 'plg_webservices_privacy', 'plugin', 'privacy', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_privacy\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_PRIVACY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"privacy\"}', '{}', '', NULL, NULL, 12, 0, NULL),
(211, 0, 'plg_webservices_redirect', 'plugin', 'redirect', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_redirect\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_REDIRECT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"redirect\"}', '{}', '', NULL, NULL, 13, 0, NULL),
(212, 0, 'plg_webservices_tags', 'plugin', 'tags', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_tags\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}', '{}', '', NULL, NULL, 14, 0, NULL),
(213, 0, 'plg_webservices_templates', 'plugin', 'templates', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_templates\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_TEMPLATES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templates\"}', '{}', '', NULL, NULL, 15, 0, NULL),
(214, 0, 'plg_webservices_users', 'plugin', 'users', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_users\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_USERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"users\"}', '{}', '', NULL, NULL, 16, 0, NULL),
(215, 0, 'plg_workflow_featuring', 'plugin', 'featuring', NULL, 'workflow', 0, 1, 1, 0, 1, '{\"name\":\"plg_workflow_featuring\",\"type\":\"plugin\",\"creationDate\":\"2020-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WORKFLOW_FEATURING_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"featuring\"}', '{}', '', NULL, NULL, 1, 0, NULL),
(216, 0, 'plg_workflow_notification', 'plugin', 'notification', NULL, 'workflow', 0, 1, 1, 0, 1, '{\"name\":\"plg_workflow_notification\",\"type\":\"plugin\",\"creationDate\":\"2020-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WORKFLOW_NOTIFICATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"notification\"}', '{}', '', NULL, NULL, 2, 0, NULL),
(217, 0, 'plg_workflow_publishing', 'plugin', 'publishing', NULL, 'workflow', 0, 1, 1, 0, 1, '{\"name\":\"plg_workflow_publishing\",\"type\":\"plugin\",\"creationDate\":\"2020-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WORKFLOW_PUBLISHING_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"publishing\"}', '{}', '', NULL, NULL, 3, 0, NULL),
(218, 0, 'atum', 'template', 'atum', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"atum\",\"type\":\"template\",\"creationDate\":\"2016-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"TPL_ATUM_XML_DESCRIPTION\",\"group\":\"\",\"inheritable\":true,\"filename\":\"templateDetails\"}', '', '', NULL, NULL, 0, 0, NULL),
(219, 0, 'cassiopeia', 'template', 'cassiopeia', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"cassiopeia\",\"type\":\"template\",\"creationDate\":\"2017-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"TPL_CASSIOPEIA_XML_DESCRIPTION\",\"group\":\"\",\"inheritable\":true,\"filename\":\"templateDetails\"}', '{\"logoFile\":\"\",\"fluidContainer\":\"0\",\"sidebarLeftWidth\":\"3\",\"sidebarRightWidth\":\"3\"}', '', NULL, NULL, 0, 0, NULL),
(220, 0, 'files_joomla', 'file', 'joomla', NULL, '', 0, 1, 1, 1, 1, '{\"name\":\"files_joomla\",\"type\":\"file\",\"creationDate\":\"2022-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.6\",\"description\":\"FILES_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}', '', '', NULL, NULL, 0, 0, NULL),
(221, 0, 'English (en-GB) Language Pack', 'package', 'pkg_en-GB', NULL, '', 0, 1, 1, 1, 1, '{\"name\":\"English (en-GB) Language Pack\",\"type\":\"package\",\"creationDate\":\"2022-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.6.1\",\"description\":\"en-GB language pack\",\"group\":\"\",\"filename\":\"pkg_en-GB\"}', '', '', NULL, NULL, 0, 0, NULL),
(222, 221, 'English (en-GB)', 'language', 'en-GB', NULL, '', 0, 1, 1, 1, 1, '{\"name\":\"English (en-GB)\",\"type\":\"language\",\"creationDate\":\"2022-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.6\",\"description\":\"en-GB site language\",\"group\":\"\"}', '', '', NULL, NULL, 0, 0, NULL),
(223, 221, 'English (en-GB)', 'language', 'en-GB', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"English (en-GB)\",\"type\":\"language\",\"creationDate\":\"2022-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.6\",\"description\":\"en-GB administrator language\",\"group\":\"\"}', '', '', NULL, NULL, 0, 0, NULL),
(224, 221, 'English (en-GB)', 'language', 'en-GB', NULL, '', 3, 1, 1, 1, 1, '{\"name\":\"English (en-GB)\",\"type\":\"language\",\"creationDate\":\"2022-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.6\",\"description\":\"en-GB api language\",\"group\":\"\"}', '', '', NULL, NULL, 0, 0, NULL),
(225, 0, 'plg_multifactorauth_totp', 'plugin', 'totp', NULL, 'multifactorauth', 0, 0, 1, 0, 1, '{\"name\":\"plg_multifactorauth_totp\",\"type\":\"plugin\",\"creationDate\":\"2013-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"PLG_MULTIFACTORAUTH_TOTP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"totp\"}', '', '', NULL, NULL, 1, 0, NULL),
(226, 0, 'plg_multifactorauth_yubikey', 'plugin', 'yubikey', NULL, 'multifactorauth', 0, 0, 1, 0, 1, '{\"name\":\"plg_multifactorauth_yubikey\",\"type\":\"plugin\",\"creationDate\":\"2013-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"PLG_MULTIFACTORAUTH_YUBIKEY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"yubikey\"}', '', '', NULL, NULL, 2, 0, NULL),
(227, 0, 'plg_multifactorauth_webauthn', 'plugin', 'webauthn', NULL, 'multifactorauth', 0, 0, 1, 0, 1, '{\"name\":\"plg_multifactorauth_webauthn\",\"type\":\"plugin\",\"creationDate\":\"2022-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2022 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.0\",\"description\":\"PLG_MULTIFACTORAUTH_WEBAUTHN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"webauthn\"}', '', '', NULL, NULL, 3, 0, NULL),
(228, 0, 'plg_multifactorauth_email', 'plugin', 'email', NULL, 'multifactorauth', 0, 0, 1, 0, 1, '{\"name\":\"plg_multifactorauth_email\",\"type\":\"plugin\",\"creationDate\":\"2022-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2022 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.0\",\"description\":\"PLG_MULTIFACTORAUTH_EMAIL_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"email\"}', '', '', NULL, NULL, 4, 0, NULL),
(229, 0, 'plg_multifactorauth_fixed', 'plugin', 'fixed', NULL, 'multifactorauth', 0, 0, 1, 0, 1, '{\"name\":\"plg_multifactorauth_fixed\",\"type\":\"plugin\",\"creationDate\":\"2022-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2022 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.0\",\"description\":\"PLG_MULTIFACTORAUTH_FIXED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fixed\"}', '', '', NULL, NULL, 5, 0, NULL),
(230, 0, 'plg_system_shortcut', 'plugin', 'shortcut', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_shortcut\",\"type\":\"plugin\",\"creationDate\":\"2022-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2022 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.0\",\"description\":\"PLG_SYSTEM_SHORTCUT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"shortcut\"}', '', '', NULL, NULL, 0, 0, NULL),
(231, 0, 'Winboard', 'component', 'com_winboard', NULL, '', 1, 1, 1, 0, 0, '{\"name\":\"Winboard\",\"type\":\"component\",\"creationDate\":\"25 Oct 2022\",\"author\":\"Fastw3b - Effective Web Solutions\",\"copyright\":\"Copyright (C) 2021 Fastw3b. All rights reserved.\",\"authorEmail\":\"manager@fastw3b.net\",\"authorUrl\":\"http:\\/\\/www.fastw3b.net\",\"version\":\"1.0.0\",\"description\":\"Winboard Joomla! component\",\"group\":\"\",\"filename\":\"winboard\"}', '{\"admin_email\":\"manager@fastw3b.com\",\"owner_verification_email\":\"\",\"owner_group\":\"10\",\"advertiser_group\":\"11\",\"admin_fee\":\"10\",\"country_code\":\"AU\",\"registration_article_id\":\"1\",\"agree_terms_article_id\":\"1\",\"stripe_public_key\":\"pk_test_51KberAAaqmQsEp3TfESzHI0Uo9Goib8TxGImRbk650jBb8rwvaWzJujwVekQdQL960L5BtrOq0ej9oYHSX2Daa3H009XqCwaDe\",\"stripe_private_key\":\"sk_test_51KberAAaqmQsEp3TZ39sb6F19KasW6qEFvZKCc19c9G1PtGqixfIfI6wJthCIJl0rEsJLkGJA8VmHRHWKpXycoT700nceXU6ST\",\"stripe_signing_key\":\"\",\"stripe_currency\":\"aud\",\"recaptcha_public_key\":\"6LfZeNUSAAAAADoaqUQdbvCKWIyaQxk6wICGhj8l\",\"recaptcha_private_key\":\"6LfZeNUSAAAAAJoZMUVLK70DsF9LLmYf3KDX-c2H\",\"google_map_key\":\"AIzaSyAUh-fRp7pe4vUJpa-Sf-jT8cbw4J3jdCo\",\"tmpl_subj_owner_reg\":\"[first_name] [surname] registered on winboard as an owner\",\"tmpl_body_owner_reg\":\"<p>owner registration first name: [first_name] surname: [surname] phone: [phone] email: [email] password: [password]<\\/p>\",\"tmpl_subj_owner_property_verification\":\"Hello [owner_name], property [property_title] has been verified by an administrator\",\"tmpl_body_owner_property_verification\":\"<p><small class=\\\"form-text\\\"><small class=\\\"form-text\\\">property_title: <\\/small>[property_title]<\\/small><\\/p>\\r\\n<p><small class=\\\"form-text\\\"><small class=\\\"form-text\\\">owner_name: <\\/small>[owner_name]<\\/small><\\/p>\\r\\n<p><small class=\\\"form-text\\\"><small class=\\\"form-text\\\">property_link<\\/small>: [property_link]<\\/small><\\/p>\\r\\n<p><small class=\\\"form-text\\\"><small class=\\\"form-text\\\">uploaded_images<\\/small>: [uploaded_images] <\\/small><\\/p>\",\"tmpl_subj_owner_booking_request\":\"new booking - [advertiser_name] booked [winboard_name]\",\"tmpl_body_owner_booking_request\":\"<p><small class=\\\"form-text\\\"><small class=\\\"form-text\\\">property_title: <\\/small>[property_title]<\\/small><\\/p>\\r\\n<p><small class=\\\"form-text\\\"><small class=\\\"form-text\\\">winboard_name<\\/small>: [winboard_name]<\\/small><\\/p>\\r\\n<p><small class=\\\"form-text\\\"><small class=\\\"form-text\\\">advertiser_name<\\/small>: [advertiser_name]<\\/small><\\/p>\\r\\n<p><small class=\\\"form-text\\\"><small class=\\\"form-text\\\">booking_link<\\/small>: [booking_link]<\\/small><\\/p>\\r\\n<p><small class=\\\"form-text\\\"><small class=\\\"form-text\\\">uploaded_artwork<\\/small>: [uploaded_artwork] <\\/small><\\/p>\",\"tmpl_subj_owner_booking_payment\":\"booking payment - [advertiser_name] booked [winboard_name]\",\"tmpl_body_owner_booking_payment\":\"<p><small class=\\\"form-text\\\"><small class=\\\"form-text\\\">property_title: <\\/small>[property_title]<\\/small><\\/p>\\r\\n<p><small class=\\\"form-text\\\"><small class=\\\"form-text\\\">winboard_name<\\/small>: [winboard_name]<\\/small><\\/p>\\r\\n<p><small class=\\\"form-text\\\"><small class=\\\"form-text\\\">advertiser_name<\\/small>: [advertiser_name]<\\/small><\\/p>\\r\\n<p><small class=\\\"form-text\\\"><small class=\\\"form-text\\\">booking_link<\\/small>: [booking_link]<\\/small><\\/p>\\r\\n<p><small class=\\\"form-text\\\"><small class=\\\"form-text\\\">uploaded_artwork<\\/small>: [uploaded_artwork] <\\/small><\\/p>\",\"tmpl_subj_owner_chat_request\":\"\",\"tmpl_body_owner_chat_request\":\"\",\"tmpl_subj_owner_booking_reminder\":\"\",\"tmpl_body_owner_booking_reminder\":\"\",\"tmpl_subj_advertiser_reg\":\"[first_name] [surname] registered on winboard as an advertiser\",\"tmpl_body_advertiser_reg\":\"<p>advertiser registration first name: [first_name] surname: [surname] phone: [phone] email: [email] password: [password]<\\/p>\",\"tmpl_subj_advertiser_booking_request\":\"new booking - [advertiser_name] booked [winboard_name]\",\"tmpl_body_advertiser_booking_request\":\"<p><small class=\\\"form-text\\\"><small class=\\\"form-text\\\">property_title: <\\/small>[property_title]<\\/small><\\/p>\\r\\n<p><small class=\\\"form-text\\\"><small class=\\\"form-text\\\">winboard_name<\\/small>: [winboard_name]<\\/small><\\/p>\\r\\n<p><small class=\\\"form-text\\\"><small class=\\\"form-text\\\">advertiser_name<\\/small>: [advertiser_name]<\\/small><\\/p>\\r\\n<p><small class=\\\"form-text\\\"><small class=\\\"form-text\\\">booking_link<\\/small>: [booking_link]<\\/small><\\/p>\\r\\n<p><small class=\\\"form-text\\\"><small class=\\\"form-text\\\">uploaded_artwork<\\/small>: [uploaded_artwork] <\\/small><\\/p>\",\"tmpl_subj_advertiser_booking_confirmation\":\"booking confirmation of [winboard_name]\",\"tmpl_body_advertiser_booking_confirmation\":\"<p><small class=\\\"form-text\\\"><small class=\\\"form-text\\\">property_title<\\/small>: [property_title]<\\/small><\\/p>\\r\\n<p><small class=\\\"form-text\\\"><small class=\\\"form-text\\\">winboard_name:<\\/small> [winboard_name]<\\/small><\\/p>\\r\\n<p><small class=\\\"form-text\\\"><small class=\\\"form-text\\\">advertiser_name<\\/small>: [advertiser_name]<\\/small><\\/p>\\r\\n<p><small class=\\\"form-text\\\"><small class=\\\"form-text\\\">booking_link<\\/small>: [booking_link]<\\/small><\\/p>\\r\\n<p><small class=\\\"form-text\\\"><small class=\\\"form-text\\\">uploaded_artwork<\\/small>: [uploaded_artwork] <\\/small><\\/p>\",\"tmpl_subj_advertiser_booking_cancel\":\"booking canellation of [winboard_name]\",\"tmpl_body_advertiser_booking_cancel\":\"<p><small class=\\\"form-text\\\"><small class=\\\"form-text\\\">property_title<\\/small>: [property_title]<\\/small><\\/p>\\r\\n<p><small class=\\\"form-text\\\"><small class=\\\"form-text\\\">winboard_name:<\\/small> [winboard_name]<\\/small><\\/p>\\r\\n<p><small class=\\\"form-text\\\"><small class=\\\"form-text\\\">advertiser_name<\\/small>: [advertiser_name]<\\/small><\\/p>\\r\\n<p><small class=\\\"form-text\\\"><small class=\\\"form-text\\\">booking_link<\\/small>: [booking_link]<\\/small><\\/p>\\r\\n<p><small class=\\\"form-text\\\"><small class=\\\"form-text\\\">uploaded_artwork<\\/small>: [uploaded_artwork] <\\/small><\\/p>\",\"tmpl_subj_advertiser_invoice\":\"\",\"tmpl_body_advertiser_invoice\":\"\",\"tmpl_subj_advertiser_booking_reminder\":\"\",\"tmpl_body_advertiser_booking_reminder\":\"\",\"tmpl_subj_admin_property_verification\":\"request for the property [property_title] verification from [owner_name]\",\"tmpl_body_admin_property_verification\":\"<p><small class=\\\"form-text\\\"><small class=\\\"form-text\\\">property_title<\\/small>: [property_title]<\\/small><\\/p>\\r\\n<p><small class=\\\"form-text\\\"><small class=\\\"form-text\\\">owner_name<\\/small>: [owner_name]<\\/small><\\/p>\\r\\n<p><small class=\\\"form-text\\\"><small class=\\\"form-text\\\">property_link:<\\/small> [property_link]<\\/small><\\/p>\\r\\n<p><small class=\\\"form-text\\\"><small class=\\\"form-text\\\">uploaded_images: <\\/small>[uploaded_images] <\\/small><\\/p>\",\"tmpl_subj_admin_booking_payment\":\"\",\"tmpl_body_admin_booking_payment\":\"\"}', '', NULL, NULL, 0, 0, NULL),
(232, 237, 'YOOtheme', 'template', 'yootheme', '', '', 0, 1, 1, 0, 0, '{\"name\":\"YOOtheme\",\"type\":\"template\",\"creationDate\":\"January 2023\",\"author\":\"YOOtheme\",\"copyright\":\"Copyright (C) YOOtheme GmbH\",\"authorEmail\":\"info@yootheme.com\",\"authorUrl\":\"https:\\/\\/yootheme.com\",\"version\":\"3.0.22\",\"description\":\"\\n        \\n            <div id=\\\"tmpl-description\\\">A powerful, flexible and elegant website builder that allows you to create complex pages within minutes and customize every aspect of the theme.<\\/div>\\n            <script src=\\\"..\\/templates\\/yootheme\\/templateDetails.min.js\\\" defer><\\/script>\\n        \\n    \",\"group\":\"\",\"filename\":\"templateDetails\"}', '{\"yootheme\":\"true\",\"uikit3\":\"true\",\"widgetkit\":\"noconflict\"}', '', NULL, NULL, 0, 0, NULL),
(233, 237, 'System - YOOtheme Framework', 'plugin', 'yootheme', '', 'system', 0, 1, 1, 0, 0, '{\"name\":\"System - YOOtheme Framework\",\"type\":\"plugin\",\"creationDate\":\"January 2023\",\"author\":\"YOOtheme\",\"copyright\":\"Copyright (C) YOOtheme GmbH\",\"authorEmail\":\"info@yootheme.com\",\"authorUrl\":\"https:\\/\\/yootheme.com\",\"version\":\"3.0.22\",\"description\":\"System Plugin for YOOtheme Pro.\",\"group\":\"\",\"filename\":\"yootheme\"}', '{}', '{\"news\":\"4eeec5f6\"}', NULL, NULL, 0, 0, NULL),
(234, 237, 'Installer - YOOtheme', 'plugin', 'yootheme', '', 'installer', 0, 1, 1, 0, 0, '{\"name\":\"Installer - YOOtheme\",\"type\":\"plugin\",\"creationDate\":\"Oktober 2021\",\"author\":\"YOOtheme\",\"copyright\":\"Copyright (C) YOOtheme GmbH\",\"authorEmail\":\"info@yootheme.com\",\"authorUrl\":\"http:\\/\\/yootheme.com\",\"version\":\"1.0.6\",\"description\":\"PLG_INSTALLER_YOOTHEME_DESCRIPTION\",\"group\":\"\",\"filename\":\"yootheme\"}', '{\"apikey\":\"Vb2fpKxL0NrXH1Gttr1VAGZDKZqTsu7GsrHOXp8V\"}', '', NULL, NULL, 0, 0, ''),
(235, 237, 'Fields - YOOtheme Location', 'plugin', 'location', '', 'fields', 0, 1, 1, 0, 0, '{\"name\":\"Fields - YOOtheme Location\",\"type\":\"plugin\",\"creationDate\":\"January 2023\",\"author\":\"YOOtheme\",\"copyright\":\"Copyright (C) YOOtheme GmbH\",\"authorEmail\":\"info@yootheme.com\",\"authorUrl\":\"https:\\/\\/yootheme.com\",\"version\":\"3.0.22\",\"description\":\"Fields Location Plugin for YOOtheme Pro.\",\"group\":\"\",\"filename\":\"location\"}', '[]', '', NULL, NULL, 0, 0, NULL),
(236, 237, 'MOD_YOOTHEME_BUILDER', 'module', 'mod_yootheme_builder', '', '', 0, 1, 0, 0, 0, '{\"name\":\"MOD_YOOTHEME_BUILDER\",\"type\":\"module\",\"creationDate\":\"January 2023\",\"author\":\"YOOtheme\",\"copyright\":\"Copyright (C) YOOtheme GmbH\",\"authorEmail\":\"info@yootheme.com\",\"authorUrl\":\"https:\\/\\/yootheme.com\",\"version\":\"3.0.22\",\"description\":\"MOD_YOOTHEME_BUILDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_yootheme_builder\"}', '[]', '', NULL, NULL, 0, 0, NULL),
(237, 0, 'YOOtheme', 'package', 'pkg_yootheme', '', '', 0, 1, 1, 0, 0, '{\"name\":\"YOOtheme\",\"type\":\"package\",\"creationDate\":\"January 2023\",\"author\":\"YOOtheme\",\"copyright\":\"Copyright (C) YOOtheme GmbH\",\"authorEmail\":\"info@yootheme.com\",\"authorUrl\":\"https:\\/\\/yootheme.com\",\"version\":\"3.0.22\",\"description\":\"A powerful, flexible and elegant website builder that allows you to create complex pages within minutes and customize every aspect of the theme.\",\"group\":\"\",\"filename\":\"pkg_yootheme\"}', '{}', '', NULL, NULL, 0, 0, NULL),
(238, 0, 'MOD_WINBOARDWHERE', 'module', 'mod_winboardwhere', '', '', 0, 1, 1, 0, 0, '{\"name\":\"MOD_WINBOARDWHERE\",\"type\":\"module\",\"creationDate\":\"16 Nov 2022\",\"author\":\"Fastw3b - Effective web solutions\",\"copyright\":\"Copyright (C) 2012 Fastw3b. All rights reserved.\",\"authorEmail\":\"manager@fastw3b.net\",\"authorUrl\":\"http:\\/\\/www.fastw3b.net\",\"version\":\"1.0.0\",\"description\":\"\",\"group\":\"\",\"filename\":\"mod_winboardwhere\"}', '{}', '', NULL, NULL, 0, 0, NULL),
(239, 0, 'MOD_WINBOARDLOGIN', 'module', 'mod_winboardlogin', '', '', 0, 1, 1, 0, 0, '{\"name\":\"MOD_WINBOARDLOGIN\",\"type\":\"module\",\"creationDate\":\"07 Dec 2022\",\"author\":\"Fastw3b - Effective web solutions\",\"copyright\":\"Copyright (C) 2012 Fastw3b. All rights reserved.\",\"authorEmail\":\"manager@fastw3b.net\",\"authorUrl\":\"http:\\/\\/www.fastw3b.net\",\"version\":\"1.0.0\",\"description\":\"\",\"group\":\"\",\"filename\":\"mod_winboardlogin\"}', '[]', '', NULL, NULL, 0, 0, NULL),
(240, 0, 'User - Winboard', 'plugin', 'winboard', '', 'user', 0, 1, 1, 0, 0, '{\"name\":\"User - Winboard\",\"type\":\"plugin\",\"creationDate\":\"07 Dec 2022\",\"author\":\"Fastw3b\",\"copyright\":\"(C) 2022 copyright Fastw3b. All rights reserved.\",\"authorEmail\":\"manager@fastw3b.net\",\"authorUrl\":\"www.fastw3b.net\",\"version\":\"1.0.0\",\"description\":\"Winboard User plugin\",\"group\":\"\",\"filename\":\"winboard\"}', '{}', '', NULL, NULL, 0, 0, NULL),
(241, 0, 'MOD_WINBOARD', 'module', 'mod_winboard', '', '', 0, 1, 1, 0, 0, '{\"name\":\"MOD_WINBOARD\",\"type\":\"module\",\"creationDate\":\"05 Jan 2023\",\"author\":\"Fastw3b - Effective web solutions\",\"copyright\":\"Copyright (C) 2012 Fastw3b. All rights reserved.\",\"authorEmail\":\"manager@fastw3b.net\",\"authorUrl\":\"http:\\/\\/www.fastw3b.net\",\"version\":\"1.0.0\",\"description\":\"\",\"group\":\"\",\"filename\":\"mod_winboard\"}', '{}', '', NULL, NULL, 0, 0, NULL),
(242, 0, 'FW Sync Manager', 'component', 'com_fwsyncmanager', NULL, '', 1, 1, 1, 0, 0, '{\"name\":\"FW Sync Manager\",\"type\":\"component\",\"creationDate\":\"8 Jun 2017\",\"author\":\"Fastw3b - effective web solutions\",\"copyright\":\"Copyright (C) 2017 Fastw3b. All rights reserved.\",\"authorEmail\":\"manager@fastw3b.net\",\"authorUrl\":\"http:\\/\\/www.fastw3b.net\",\"version\":\"1.0.0\",\"description\":\"\",\"group\":\"\",\"filename\":\"fwsyncmanager\"}', '{\"link\":\"http:\\/\\/winboard.joomstore.com.au\",\"skip_folders\":\"cache,logs,tmp,administrator\\/cache,templates\\/yootheme\\/cache,media\\/com_fwsyncmanager,administrator\\/tmp,administrator\\/logs\",\"key\":\"KcB=FAv;D)%P)8K.\",\"skip_tables\":\"#__session\"}', '', NULL, NULL, 0, 0, NULL),
(243, 0, 'PLG_SOCIALLOGIN_APPLE', 'plugin', 'apple', '', 'sociallogin', 0, 1, 1, 0, 0, '{\"name\":\"PLG_SOCIALLOGIN_APPLE\",\"type\":\"plugin\",\"creationDate\":\"2023-01-17\",\"author\":\"Akeeba Ltd\",\"copyright\":\"Copyright (c)2016-2023 Akeeba Ltd\",\"authorEmail\":\"no-reply@akeeba.com\",\"authorUrl\":\"https:\\/\\/www.akeeba.com\",\"version\":\"4.4.0\",\"description\":\"PLG_SOCIALLOGIN_APPLE_DESCRIPTION\",\"group\":\"\",\"filename\":\"apple\"}', '{\"appid\":\"test\",\"teamID\":\"test\",\"keyID\":\"test\",\"keyMaterial\":\"test\",\"loginunlinked\":\"1\",\"createnew\":\"0\",\"forcenew\":\"0\",\"bypassvalidation\":\"1\",\"customcss\":\"1\",\"fgcolor\":\"#ffffff\",\"bgcolor\":\"#000000\"}', '', NULL, NULL, 0, 0, ''),
(244, 0, 'PLG_SOCIALLOGIN_DISCORD', 'plugin', 'discord', '', 'sociallogin', 0, 0, 1, 0, 0, '{\"name\":\"PLG_SOCIALLOGIN_DISCORD\",\"type\":\"plugin\",\"creationDate\":\"2023-01-17\",\"author\":\"Akeeba Ltd\",\"copyright\":\"Copyright (c)2016-2023 Akeeba Ltd\",\"authorEmail\":\"no-reply@akeeba.com\",\"authorUrl\":\"https:\\/\\/www.akeeba.com\",\"version\":\"4.4.0\",\"description\":\"PLG_SOCIALLOGIN_DISCORD_DESCRIPTION\",\"group\":\"\",\"filename\":\"discord\"}', '{\"appid\":\"\",\"appsecret\":\"\",\"loginunlinked\":\"0\",\"createnew\":\"0\",\"forcenew\":\"0\",\"bypassvalidation\":\"1\",\"customcss\":\"1\",\"fgcolor\":\"#ffffff\",\"bgcolor\":\"#5865F2\"}', '', NULL, NULL, 0, 0, NULL),
(245, 0, 'PLG_SOCIALLOGIN_FACEBOOK', 'plugin', 'facebook', '', 'sociallogin', 0, 0, 1, 0, 0, '{\"name\":\"PLG_SOCIALLOGIN_FACEBOOK\",\"type\":\"plugin\",\"creationDate\":\"2023-01-17\",\"author\":\"Akeeba Ltd\",\"copyright\":\"Copyright (c)2016-2023 Akeeba Ltd\",\"authorEmail\":\"no-reply@akeeba.com\",\"authorUrl\":\"https:\\/\\/www.akeeba.com\",\"version\":\"4.4.0\",\"description\":\"PLG_SOCIALLOGIN_FACEBOOK_DESCRIPTION\",\"group\":\"\",\"filename\":\"facebook\"}', '{\"appid\":\"\",\"appsecret\":\"\",\"loginunlinked\":\"0\",\"createnew\":\"0\",\"forcenew\":\"0\",\"bypassvalidation\":\"1\",\"customcss\":\"1\",\"fgcolor\":\"#ffffff\",\"bgcolor\":\"#1877F2\"}', '', NULL, NULL, 0, 0, NULL),
(246, 0, 'PLG_SOCIALLOGIN_GITHUB', 'plugin', 'github', '', 'sociallogin', 0, 0, 1, 0, 0, '{\"name\":\"PLG_SOCIALLOGIN_GITHUB\",\"type\":\"plugin\",\"creationDate\":\"2023-01-17\",\"author\":\"Akeeba Ltd\",\"copyright\":\"Copyright (c)2016-2023 Akeeba Ltd\",\"authorEmail\":\"no-reply@akeeba.com\",\"authorUrl\":\"https:\\/\\/www.akeeba.com\",\"version\":\"4.4.0\",\"description\":\"PLG_SOCIALLOGIN_GITHUB_DESCRIPTION\",\"group\":\"\",\"filename\":\"github\"}', '{\"appid\":\"\",\"appsecret\":\"\",\"loginunlinked\":\"0\",\"createnew\":\"0\",\"forcenew\":\"0\",\"bypassvalidation\":\"1\",\"customcss\":\"1\",\"fgcolor\":\"#ffffff\",\"bgcolor\":\"#000000\"}', '', NULL, NULL, 0, 0, NULL),
(247, 0, 'PLG_SOCIALLOGIN_GOOGLE', 'plugin', 'google', '', 'sociallogin', 0, 1, 1, 0, 0, '{\"name\":\"PLG_SOCIALLOGIN_GOOGLE\",\"type\":\"plugin\",\"creationDate\":\"2023-01-17\",\"author\":\"Akeeba Ltd\",\"copyright\":\"Copyright (c)2016-2023 Akeeba Ltd\",\"authorEmail\":\"no-reply@akeeba.com\",\"authorUrl\":\"https:\\/\\/www.akeeba.com\",\"version\":\"4.4.0\",\"description\":\"PLG_SOCIALLOGIN_GOOGLE_DESCRIPTION\",\"group\":\"\",\"filename\":\"google\"}', '{\"appid\":\"test\",\"appsecret\":\"test\",\"loginunlinked\":\"1\",\"createnew\":\"0\",\"forcenew\":\"0\",\"bypassvalidation\":\"1\",\"customcss\":\"1\",\"fgcolor\":\"#ffffff\",\"bgcolor\":\"#4285f4\"}', '', NULL, NULL, 0, 0, ''),
(248, 0, 'PLG_SOCIALLOGIN_LINKEDIN', 'plugin', 'linkedin', '', 'sociallogin', 0, 0, 1, 0, 0, '{\"name\":\"PLG_SOCIALLOGIN_LINKEDIN\",\"type\":\"plugin\",\"creationDate\":\"2023-01-17\",\"author\":\"Akeeba Ltd\",\"copyright\":\"Copyright (c)2016-2023 Akeeba Ltd\",\"authorEmail\":\"no-reply@akeeba.com\",\"authorUrl\":\"https:\\/\\/www.akeeba.com\",\"version\":\"4.4.0\",\"description\":\"PLG_SOCIALLOGIN_LINKEDIN_DESCRIPTION\",\"group\":\"\",\"filename\":\"linkedin\"}', '{\"appid\":\"\",\"appsecret\":\"\",\"loginunlinked\":\"0\",\"createnew\":\"0\",\"forcenew\":\"0\",\"bypassvalidation\":\"1\",\"customcss\":\"1\",\"fgcolor\":\"#ffffff\",\"bgcolor\":\"#3077B0\"}', '', NULL, NULL, 0, 0, NULL),
(249, 0, 'PLG_SOCIALLOGIN_MICROSOFT', 'plugin', 'microsoft', '', 'sociallogin', 0, 0, 1, 0, 0, '{\"name\":\"PLG_SOCIALLOGIN_MICROSOFT\",\"type\":\"plugin\",\"creationDate\":\"2023-01-17\",\"author\":\"Akeeba Ltd\",\"copyright\":\"Copyright (c)2016-2023 Akeeba Ltd\",\"authorEmail\":\"no-reply@akeeba.com\",\"authorUrl\":\"https:\\/\\/www.akeeba.com\",\"version\":\"4.4.0\",\"description\":\"PLG_SOCIALLOGIN_MICROSOFT_DESCRIPTION\",\"group\":\"\",\"filename\":\"microsoft\"}', '{\"apptype\":\"live\",\"azappid\":\"\",\"azappsecret\":\"\",\"appid\":\"\",\"appsecret\":\"\",\"loginunlinked\":\"0\",\"createnew\":\"0\",\"forcenew\":\"0\",\"bypassvalidation\":\"1\",\"customcss\":\"1\",\"fgcolor\":\"#FFFFFF\",\"bgcolor\":\"#2F2F2F\"}', '', NULL, NULL, 0, 0, NULL),
(250, 0, 'PLG_SYSTEM_SOCIALLOGIN', 'plugin', 'sociallogin', '', 'system', 0, 1, 1, 0, 0, '{\"name\":\"PLG_SYSTEM_SOCIALLOGIN\",\"type\":\"plugin\",\"creationDate\":\"2023-01-17\",\"author\":\"Akeeba Ltd\",\"copyright\":\"Copyright (c)2016-2023 Akeeba Ltd\",\"authorEmail\":\"no-reply@akeeba.com\",\"authorUrl\":\"https:\\/\\/www.akeeba.com\",\"version\":\"4.4.0\",\"description\":\"PLG_SYSTEM_SOCIALLOGIN_DESCRIPTION\",\"group\":\"\",\"filename\":\"sociallogin\"}', '{\"linkunlinkbuttons\":\"1\",\"show_dontremind\":\"0\",\"linkedAccountUserGroup\":\"\",\"noLinkedAccountUserGroup\":\"\"}', '', NULL, NULL, 0, 0, NULL),
(251, 0, 'System - Winboard', 'plugin', 'winboard', '', 'system', 0, 1, 1, 0, 0, '{\"name\":\"System - Winboard\",\"type\":\"plugin\",\"creationDate\":\"30 Jan 2023\",\"author\":\"Fastw3b\",\"copyright\":\"(C) 2022 copyright Fastw3b. All rights reserved.\",\"authorEmail\":\"manager@fastw3b.net\",\"authorUrl\":\"www.fastw3b.net\",\"version\":\"1.0.0\",\"description\":\"Winboard system plugin\",\"group\":\"\",\"filename\":\"winboard\"}', '{}', '', NULL, NULL, 0, 0, NULL),
(252, 261, 'com_akeebabackup', 'component', 'com_akeebabackup', '', '', 1, 1, 0, 0, 0, '{\"name\":\"com_akeebabackup\",\"type\":\"component\",\"creationDate\":\"2023-03-09\",\"author\":\"Akeeba Ltd\",\"copyright\":\"(C) 2006-2021 Nicholas K. Dionysopoulos \\/ Akeeba Ltd\",\"authorEmail\":\"no-reply@akeeba.com\",\"authorUrl\":\"www.akeeba.com\",\"version\":\"9.5.1\",\"description\":\"COM_AKEEBABACKUP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"akeebabackup\"}', '{\"frontend_secret_word\":\"###AES128###Zr8xRN0+Zv1VwZN5NFquy0pQU1Sc+J1gW6KrtrzUwViGyKmb5Lr\\/joKgOwUWnGdimHA+TstduElNBjo+5HFHXLDLFDELg2A9CCXd8Jm\\/g+dRHVB7SlBJVsxvK4uEHJy\\/nCemr9IcSs4AAAAA\",\"confwiz_upgrade\":1,\"siteurl\":\"https:\\/\\/winboard.joomstore.com.au\\/\",\"jlibrariesdir\":\"\\/home\\/winboardjoomstor\\/public_html\\/libraries\"}', '', NULL, NULL, 0, 0, NULL),
(253, 0, 'file_fof40', 'file', 'file_fof40', '', '', 0, 1, 0, 0, 0, '{\"name\":\"file_fof40\",\"type\":\"file\",\"creationDate\":\"2022-10-24\",\"author\":\"Nicholas K. Dionysopoulos \\/ Akeeba Ltd\",\"copyright\":\"Copyright (c)2010-2019 Nicholas K. Dionysopoulos \\/ Akeeba Ltd\",\"authorEmail\":\"nicholas@akeeba.com\",\"authorUrl\":\"https:\\/\\/www.akeeba.com\",\"version\":\"4.1.4\",\"description\":\"\\n\\t\\t\\n\\t\\tFramework-on-Framework (FOF) 4.x - The rapid application development framework for Joomla!.<br\\/>\\n\\t\\t<b>WARNING<\\/b>: This is NOT a duplicate of the FOF library already installed with Joomla! 3. It is a different version used by other extensions on your site. Do NOT uninstall either FOF package. If you do you will break your site.\\n\\t\\t\\n\\t\",\"group\":\"\"}', '', '', NULL, NULL, 0, 0, NULL),
(254, 259, 'Akeeba', 'component', 'com_akeeba', '', '', 1, 1, 0, 0, 0, '{\"name\":\"Akeeba\",\"type\":\"component\",\"creationDate\":\"2023-05-02\",\"author\":\"Nicholas K. Dionysopoulos\",\"copyright\":\"Copyright (c)2006-2019 Akeeba Ltd \\/ Nicholas K. Dionysopoulos\",\"authorEmail\":\"nicholas@dionysopoulos.me\",\"authorUrl\":\"https:\\/\\/www.akeeba.com\",\"version\":\"8.2.8\",\"description\":\"Akeeba Backup Core - Full Joomla! site backup solution, Core Edition.\",\"group\":\"\",\"filename\":\"akeeba\"}', '{\"frontend_secret_word\":\"###AES128###VvZPxoqy2b9afKwzwTSNpUpQU1R86CSscfIcBOhH7H0gVmOt8YLAR1NtJdPBP0p7qnObpeZ6T1TJ97Sp\\/3189l2PObmANnUM\\/C5HKDV2yPVXk38eSlBJVltrYvfxRWZTppBsBYR+4IYAAAAA\",\"updatedb\":null,\"confwiz_upgrade\":1,\"siteurl\":\"https:\\/\\/winboard.joomstore.com.au\\/\",\"jlibrariesdir\":\"\\/home\\/winboardjoomstor\\/public_html\\/libraries\"}', '', NULL, NULL, 0, 0, NULL),
(255, 259, 'PLG_CONSOLE_AKEEBABACKUP', 'plugin', 'akeebabackup', '', 'console', 0, 1, 1, 0, 0, '{\"name\":\"PLG_CONSOLE_AKEEBABACKUP\",\"type\":\"plugin\",\"creationDate\":\"2023-05-02\",\"author\":\"Nicholas K. Dionysopoulos\",\"copyright\":\"Copyright (c)2006-2023 Nicholas K. Dionysopoulos\",\"authorEmail\":\"nicholas@dionysopoulos.me\",\"authorUrl\":\"https:\\/\\/www.akeeba.com\",\"version\":\"8.2.8\",\"description\":\"PLG_CONSOLE_AKEEBABACKUP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"akeebabackup\"}', '{}', '', NULL, NULL, 0, 0, NULL),
(256, 261, 'plg_quickicon_akeebabackup', 'plugin', 'akeebabackup', '', 'quickicon', 0, 1, 1, 0, 0, '{\"name\":\"plg_quickicon_akeebabackup\",\"type\":\"plugin\",\"creationDate\":\"2023-05-02\",\"author\":\"Nicholas K. Dionysopoulos\",\"copyright\":\"Copyright (c)2006-2023 Nicholas K. Dionysopoulos\",\"authorEmail\":\"nicholas@akeeba.com\",\"authorUrl\":\"https:\\/\\/www.akeeba.com\",\"version\":\"8.2.8\",\"description\":\"PLG_QUICKICON_AKEEBABACKUP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"akeebabackup\"}', '{\"enablewarning\":\"1\",\"warnfailed\":\"1\",\"maxbackupperiod\":\"24\",\"profileid\":\"1\"}', '', NULL, NULL, 0, 0, NULL),
(257, 259, 'PLG_SYSTEM_BACKUPONUPDATE', 'plugin', 'backuponupdate', '', 'system', 0, 0, 1, 0, 0, '{\"name\":\"PLG_SYSTEM_BACKUPONUPDATE\",\"type\":\"plugin\",\"creationDate\":\"2023-05-02\",\"author\":\"Nicholas K. Dionysopoulos\",\"copyright\":\"Copyright (c)2006-2023 Nicholas K. Dionysopoulos\",\"authorEmail\":\"nicholas@dionysopoulos.me\",\"authorUrl\":\"https:\\/\\/www.akeeba.com\",\"version\":\"8.2.8\",\"description\":\"PLG_SYSTEM_BACKUPONUPDATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"backuponupdate\"}', '{\"profileid\":\"1\",\"description\":\"\"}', '', NULL, NULL, 0, 0, NULL),
(258, 259, 'PLG_ACTIONLOG_AKEEBABACKUP', 'plugin', 'akeebabackup', '', 'actionlog', 0, 0, 1, 0, 0, '{\"name\":\"PLG_ACTIONLOG_AKEEBABACKUP\",\"type\":\"plugin\",\"creationDate\":\"2023-05-02\",\"author\":\"Nicholas K. Dionysopoulos\",\"copyright\":\"Copyright (c)2006-2023 Nicholas K. Dionysopoulos\",\"authorEmail\":\"nicholas@dionysopoulos.me\",\"authorUrl\":\"https:\\/\\/www.akeeba.com\",\"version\":\"8.2.8\",\"description\":\"PLG_ACTIONLOG_AKEEBABACKUP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"akeebabackup\"}', '{}', '', NULL, NULL, 0, 0, NULL);
INSERT INTO `b5651_extensions` (`extension_id`, `package_id`, `name`, `type`, `element`, `changelogurl`, `folder`, `client_id`, `enabled`, `access`, `protected`, `locked`, `manifest_cache`, `params`, `custom_data`, `checked_out`, `checked_out_time`, `ordering`, `state`, `note`) VALUES
(259, 0, 'Akeeba Backup package', 'package', 'pkg_akeeba', '', '', 0, 1, 1, 0, 0, '{\"name\":\"Akeeba Backup package\",\"type\":\"package\",\"creationDate\":\"2023-05-02\",\"author\":\"Nicholas K. Dionysopoulos\",\"copyright\":\"Copyright (c)2006-2019 Akeeba Ltd \\/ Nicholas K. Dionysopoulos\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"8.2.8\",\"description\":\"Akeeba Backup installation package v.8.2.8\",\"group\":\"\",\"filename\":\"pkg_akeeba\"}', '{}', '', NULL, NULL, 0, 0, NULL),
(260, 0, 'file_fef', 'file', 'file_fef', '', '', 0, 1, 0, 0, 0, '{\"name\":\"file_fef\",\"type\":\"file\",\"creationDate\":\"2022-10-24\",\"author\":\"Nicholas K. Dionysopoulos\",\"copyright\":\"(C) 2017-2021 Akeeba Ltd.\",\"authorEmail\":\"nicholas@dionysopoulos.me\",\"authorUrl\":\"https:\\/\\/www.akeeba.com\",\"version\":\"2.1.1\",\"description\":\"Akeeba Frontend Framework - The CSS framework for Akeeba Ltd extensions.\",\"group\":\"\"}', '', '', NULL, NULL, 0, 0, NULL),
(261, 0, 'Akeeba Backup for Joomla! package', 'package', 'pkg_akeebabackup', NULL, '', 0, 1, 1, 0, 0, '{\"name\":\"Akeeba Backup for Joomla! package\",\"type\":\"package\",\"creationDate\":\"2023-05-09\",\"author\":\"Nicholas K. Dionysopoulos\",\"copyright\":\"Copyright (c)2006-2023 Akeeba Ltd \\/ Nicholas K. Dionysopoulos\",\"authorEmail\":\"\",\"authorUrl\":\"https:\\/\\/www.akeeba.com\",\"version\":\"9.5.1\",\"description\":\"Akeeba Backup for Joomla! installation package v.9.5.1\",\"group\":\"\",\"filename\":\"pkg_akeebabackup\"}', '{}', '', NULL, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `b5651_fields`
--

CREATE TABLE `b5651_fields` (
  `id` int UNSIGNED NOT NULL,
  `asset_id` int UNSIGNED NOT NULL DEFAULT '0',
  `context` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `group_id` int UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `default_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint NOT NULL DEFAULT '0',
  `required` tinyint NOT NULL DEFAULT '0',
  `only_use_in_subform` tinyint NOT NULL DEFAULT '0',
  `checked_out` int UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `ordering` int NOT NULL DEFAULT '0',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldparams` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_time` datetime NOT NULL,
  `created_user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL,
  `modified_by` int UNSIGNED NOT NULL DEFAULT '0',
  `access` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `b5651_fields_categories`
--

CREATE TABLE `b5651_fields_categories` (
  `field_id` int NOT NULL DEFAULT '0',
  `category_id` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `b5651_fields_groups`
--

CREATE TABLE `b5651_fields_groups` (
  `id` int UNSIGNED NOT NULL,
  `asset_id` int UNSIGNED NOT NULL DEFAULT '0',
  `context` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint NOT NULL DEFAULT '0',
  `checked_out` int UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `ordering` int NOT NULL DEFAULT '0',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `created_by` int UNSIGNED NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL,
  `modified_by` int UNSIGNED NOT NULL DEFAULT '0',
  `access` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `b5651_fields_values`
--

CREATE TABLE `b5651_fields_values` (
  `field_id` int UNSIGNED NOT NULL,
  `item_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Allow references to items which have strings as ids, eg. none db systems.',
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `b5651_finder_filters`
--

CREATE TABLE `b5651_finder_filters` (
  `filter_id` int UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `created_by` int UNSIGNED NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL,
  `modified_by` int UNSIGNED NOT NULL DEFAULT '0',
  `checked_out` int UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `map_count` int UNSIGNED NOT NULL DEFAULT '0',
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `params` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `b5651_finder_links`
--

CREATE TABLE `b5651_finder_links` (
  `link_id` int UNSIGNED NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `indexdate` datetime NOT NULL,
  `md5sum` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` tinyint NOT NULL DEFAULT '1',
  `state` int NOT NULL DEFAULT '1',
  `access` int NOT NULL DEFAULT '0',
  `language` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `publish_start_date` datetime DEFAULT NULL,
  `publish_end_date` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `list_price` double UNSIGNED NOT NULL DEFAULT '0',
  `sale_price` double UNSIGNED NOT NULL DEFAULT '0',
  `type_id` int NOT NULL,
  `object` mediumblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `b5651_finder_links`
--

INSERT INTO `b5651_finder_links` (`link_id`, `url`, `route`, `title`, `description`, `indexdate`, `md5sum`, `published`, `state`, `access`, `language`, `publish_start_date`, `publish_end_date`, `start_date`, `end_date`, `list_price`, `sale_price`, `type_id`, `object`) VALUES
(1, 'index.php?option=com_content&view=article&id=1', 'index.php?option=com_content&view=article&id=1:about&catid=2', 'About', '', '2022-12-06 20:54:07', 'e1cd8089da8fab1d9753e012d5547d55', 1, 1, 1, '*', '2022-12-06 20:54:07', NULL, '2022-12-06 20:54:07', NULL, 0, 0, 3, 0x4f3a35323a224a6f6f6d6c615c436f6d706f6e656e745c46696e6465725c41646d696e6973747261746f725c496e64657865725c526573756c74223a31393a7b693a303b693a313b693a313b733a353a22656e2d4742223b693a323b733a303a22223b693a333b613a32353a7b733a323a226964223b693a313b733a353a22616c696173223b733a353a2261626f7574223b733a373a2273756d6d617279223b733a303a22223b733a343a22626f6479223b733a303a22223b733a363a22696d61676573223b733a3137333a227b22696d6167655f696e74726f223a22222c22696d6167655f696e74726f5f616c74223a22222c22666c6f61745f696e74726f223a22222c22696d6167655f696e74726f5f63617074696f6e223a22222c22696d6167655f66756c6c74657874223a22222c22696d6167655f66756c6c746578745f616c74223a22222c22666c6f61745f66756c6c74657874223a22222c22696d6167655f66756c6c746578745f63617074696f6e223a22227d223b733a353a226361746964223b693a323b733a31303a22637265617465645f6279223b693a3132303b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323032322d31322d30362032303a35343a3037223b733a31313a226d6f6469666965645f6279223b693a3132303b733a363a22706172616d73223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a38363a7b733a31343a2261727469636c655f6c61796f7574223b733a393a225f3a64656661756c74223b733a31303a2273686f775f7469746c65223b733a313a2231223b733a31313a226c696e6b5f7469746c6573223b733a313a2231223b733a31303a2273686f775f696e74726f223b733a313a2231223b733a31393a22696e666f5f626c6f636b5f706f736974696f6e223b733a313a2230223b733a32313a22696e666f5f626c6f636b5f73686f775f7469746c65223b733a313a2231223b733a31333a2273686f775f63617465676f7279223b733a313a2231223b733a31333a226c696e6b5f63617465676f7279223b733a313a2231223b733a32303a2273686f775f706172656e745f63617465676f7279223b733a313a2230223b733a32303a226c696e6b5f706172656e745f63617465676f7279223b733a313a2230223b733a31373a2273686f775f6173736f63696174696f6e73223b733a313a2230223b733a353a22666c616773223b733a313a2231223b733a31313a2273686f775f617574686f72223b733a313a2231223b733a31313a226c696e6b5f617574686f72223b733a313a2230223b733a31363a2273686f775f6372656174655f64617465223b733a313a2230223b733a31363a2273686f775f6d6f646966795f64617465223b733a313a2230223b733a31373a2273686f775f7075626c6973685f64617465223b733a313a2231223b733a32303a2273686f775f6974656d5f6e617669676174696f6e223b733a313a2231223b733a31333a2273686f775f726561646d6f7265223b733a313a2231223b733a31393a2273686f775f726561646d6f72655f7469746c65223b733a313a2231223b733a31343a22726561646d6f72655f6c696d6974223b693a3130303b733a393a2273686f775f74616773223b733a313a2231223b733a31313a227265636f72645f68697473223b733a313a2231223b733a393a2273686f775f68697473223b733a313a2231223b733a31313a2273686f775f6e6f61757468223b733a313a2230223b733a31333a2275726c735f706f736974696f6e223b693a303b733a373a2263617074636861223b733a303a22223b733a32333a2273686f775f7075626c697368696e675f6f7074696f6e73223b733a313a2231223b733a32303a2273686f775f61727469636c655f6f7074696f6e73223b733a313a2231223b733a32373a2273686f775f636f6e6669677572655f656469745f6f7074696f6e73223b733a313a2231223b733a31363a2273686f775f7065726d697373696f6e73223b733a313a2231223b733a32323a2273686f775f6173736f63696174696f6e735f65646974223b733a313a2231223b733a31323a22736176655f686973746f7279223b733a313a2231223b733a31333a22686973746f72795f6c696d6974223b693a31303b733a32353a2273686f775f75726c735f696d616765735f66726f6e74656e64223b733a313a2230223b733a32343a2273686f775f75726c735f696d616765735f6261636b656e64223b733a313a2231223b733a373a2274617267657461223b693a303b733a373a2274617267657462223b693a303b733a373a2274617267657463223b693a303b733a31313a22666c6f61745f696e74726f223b733a343a226c656674223b733a31343a22666c6f61745f66756c6c74657874223b733a343a226c656674223b733a31353a2263617465676f72795f6c61796f7574223b733a363a225f3a626c6f67223b733a31393a2273686f775f63617465676f72795f7469746c65223b733a313a2230223b733a31363a2273686f775f6465736372697074696f6e223b733a313a2230223b733a32323a2273686f775f6465736372697074696f6e5f696d616765223b733a313a2230223b733a383a226d61784c6576656c223b733a313a2231223b733a32313a2273686f775f656d7074795f63617465676f72696573223b733a313a2230223b733a31363a2273686f775f6e6f5f61727469636c6573223b733a313a2231223b733a33323a2273686f775f63617465676f72795f68656164696e675f7469746c655f74657874223b733a313a2231223b733a31363a2273686f775f7375626361745f64657363223b733a313a2231223b733a32313a2273686f775f6361745f6e756d5f61727469636c6573223b733a313a2230223b733a31333a2273686f775f6361745f74616773223b733a313a2231223b733a32313a2273686f775f626173655f6465736372697074696f6e223b733a313a2231223b733a31313a226d61784c6576656c636174223b733a323a222d31223b733a32353a2273686f775f656d7074795f63617465676f726965735f636174223b733a313a2230223b733a32303a2273686f775f7375626361745f646573635f636174223b733a313a2231223b733a32353a2273686f775f6361745f6e756d5f61727469636c65735f636174223b733a313a2231223b733a32303a226e756d5f6c656164696e675f61727469636c6573223b693a313b733a31383a22626c6f675f636c6173735f6c656164696e67223b733a303a22223b733a31383a226e756d5f696e74726f5f61727469636c6573223b693a343b733a31303a22626c6f675f636c617373223b733a303a22223b733a31313a226e756d5f636f6c756d6e73223b693a313b733a31383a226d756c74695f636f6c756d6e5f6f72646572223b733a313a2230223b733a393a226e756d5f6c696e6b73223b693a343b733a32343a2273686f775f73756263617465676f72795f636f6e74656e74223b733a313a2230223b733a31363a226c696e6b5f696e74726f5f696d616765223b733a313a2230223b733a32313a2273686f775f706167696e6174696f6e5f6c696d6974223b733a313a2231223b733a31323a2266696c7465725f6669656c64223b733a343a2268696465223b733a31333a2273686f775f68656164696e6773223b733a313a2231223b733a31343a226c6973745f73686f775f64617465223b733a313a2230223b733a31313a22646174655f666f726d6174223b733a303a22223b733a31343a226c6973745f73686f775f68697473223b733a313a2231223b733a31363a226c6973745f73686f775f617574686f72223b733a313a2231223b733a31313a22646973706c61795f6e756d223b733a323a223130223b733a31313a226f7264657262795f707269223b733a353a226f72646572223b733a31313a226f7264657262795f736563223b733a353a227264617465223b733a31303a226f726465725f64617465223b733a393a227075626c6973686564223b733a31353a2273686f775f706167696e6174696f6e223b733a313a2232223b733a32333a2273686f775f706167696e6174696f6e5f726573756c7473223b733a313a2231223b733a31333a2273686f775f6665617475726564223b733a343a2273686f77223b733a31343a2273686f775f666565645f6c696e6b223b733a313a2231223b733a31323a22666565645f73756d6d617279223b733a313a2230223b733a31383a22666565645f73686f775f726561646d6f7265223b733a313a2230223b733a373a227365665f696473223b693a313b733a32303a22637573746f6d5f6669656c64735f656e61626c65223b733a313a2231223b733a31363a22776f726b666c6f775f656e61626c6564223b733a313a2230223b7d733a31343a22002a00696e697469616c697a6564223b623a313b733a393a22736570617261746f72223b733a313a222e223b7d733a373a226d6574616b6579223b733a303a22223b733a383a226d65746164657363223b733a303a22223b733a383a226d65746164617461223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a333a7b733a363a22726f626f7473223b733a303a22223b733a363a22617574686f72223b733a303a22223b733a363a22726967687473223b733a303a22223b7d733a31343a22002a00696e697469616c697a6564223b623a313b733a393a22736570617261746f72223b733a313a222e223b7d733a373a2276657273696f6e223b693a313b733a383a226f72646572696e67223b693a303b733a383a2263617465676f7279223b733a31333a22556e63617465676f7269736564223b733a393a226361745f7374617465223b693a313b733a31303a226361745f616363657373223b693a313b733a343a22736c7567223b733a373a22313a61626f7574223b733a373a22636174736c7567223b733a31353a22323a756e63617465676f7269736564223b733a363a22617574686f72223b733a373a2266617374773362223b733a363a226c61796f7574223b733a373a2261727469636c65223b733a373a22636f6e74657874223b733a31393a22636f6d5f636f6e74656e742e61727469636c65223b733a31303a226d657461617574686f72223b4e3b7d693a343b4e3b693a353b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a383a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a373a226d6574616b6579223b693a343b733a383a226d65746164657363223b693a353b733a31303a226d657461617574686f72223b693a363b733a363a22617574686f72223b693a373b733a31363a22637265617465645f62795f616c696173223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d693a363b733a313a222a223b693a373b4e3b693a383b4e3b693a393b733a31393a22323032322d31322d30362032303a35343a3037223b693a31303b4e3b693a31313b733a36303a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d61727469636c652669643d313a61626f75742663617469643d32223b693a31323b4e3b693a31333b733a31393a22323032322d31322d30362032303a35343a3037223b693a31343b693a313b693a31353b613a343a7b733a343a2254797065223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a373a2241727469636c65223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a333b7d7d733a363a22417574686f72223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a373a2266617374773362223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a353b7d7d733a383a2243617465676f7279223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a31333a22556e63617465676f7269736564223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a313a222a223b733a363a226e6573746564223b623a313b733a323a226964223b693a373b7d7d733a383a224c616e6775616765223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a313a222a223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a393b7d7d7d693a31363b733a353a2241626f7574223b693a31373b693a333b693a31383b733a34363a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d61727469636c652669643d31223b7d),
(2, 'index.php?option=com_content&view=article&id=2', 'index.php?option=com_content&view=article&id=2:terms&catid=2', 'Terms', '', '2022-12-06 20:55:24', '4679a081c2ed11fdaab11588b4c40bbb', 1, 1, 1, '*', '2022-12-06 20:55:24', NULL, '2022-12-06 20:55:24', NULL, 0, 0, 3, 0x4f3a35323a224a6f6f6d6c615c436f6d706f6e656e745c46696e6465725c41646d696e6973747261746f725c496e64657865725c526573756c74223a31393a7b693a303b693a313b693a313b733a353a22656e2d4742223b693a323b733a303a22223b693a333b613a32353a7b733a323a226964223b693a323b733a353a22616c696173223b733a353a227465726d73223b733a373a2273756d6d617279223b733a303a22223b733a343a22626f6479223b733a303a22223b733a363a22696d61676573223b733a3137333a227b22696d6167655f696e74726f223a22222c22696d6167655f696e74726f5f616c74223a22222c22666c6f61745f696e74726f223a22222c22696d6167655f696e74726f5f63617074696f6e223a22222c22696d6167655f66756c6c74657874223a22222c22696d6167655f66756c6c746578745f616c74223a22222c22666c6f61745f66756c6c74657874223a22222c22696d6167655f66756c6c746578745f63617074696f6e223a22227d223b733a353a226361746964223b693a323b733a31303a22637265617465645f6279223b693a3132303b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323032322d31322d30362032303a35353a3234223b733a31313a226d6f6469666965645f6279223b693a3132303b733a363a22706172616d73223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a38363a7b733a31343a2261727469636c655f6c61796f7574223b733a393a225f3a64656661756c74223b733a31303a2273686f775f7469746c65223b733a313a2231223b733a31313a226c696e6b5f7469746c6573223b733a313a2231223b733a31303a2273686f775f696e74726f223b733a313a2231223b733a31393a22696e666f5f626c6f636b5f706f736974696f6e223b733a313a2230223b733a32313a22696e666f5f626c6f636b5f73686f775f7469746c65223b733a313a2231223b733a31333a2273686f775f63617465676f7279223b733a313a2231223b733a31333a226c696e6b5f63617465676f7279223b733a313a2231223b733a32303a2273686f775f706172656e745f63617465676f7279223b733a313a2230223b733a32303a226c696e6b5f706172656e745f63617465676f7279223b733a313a2230223b733a31373a2273686f775f6173736f63696174696f6e73223b733a313a2230223b733a353a22666c616773223b733a313a2231223b733a31313a2273686f775f617574686f72223b733a313a2231223b733a31313a226c696e6b5f617574686f72223b733a313a2230223b733a31363a2273686f775f6372656174655f64617465223b733a313a2230223b733a31363a2273686f775f6d6f646966795f64617465223b733a313a2230223b733a31373a2273686f775f7075626c6973685f64617465223b733a313a2231223b733a32303a2273686f775f6974656d5f6e617669676174696f6e223b733a313a2231223b733a31333a2273686f775f726561646d6f7265223b733a313a2231223b733a31393a2273686f775f726561646d6f72655f7469746c65223b733a313a2231223b733a31343a22726561646d6f72655f6c696d6974223b693a3130303b733a393a2273686f775f74616773223b733a313a2231223b733a31313a227265636f72645f68697473223b733a313a2231223b733a393a2273686f775f68697473223b733a313a2231223b733a31313a2273686f775f6e6f61757468223b733a313a2230223b733a31333a2275726c735f706f736974696f6e223b693a303b733a373a2263617074636861223b733a303a22223b733a32333a2273686f775f7075626c697368696e675f6f7074696f6e73223b733a313a2231223b733a32303a2273686f775f61727469636c655f6f7074696f6e73223b733a313a2231223b733a32373a2273686f775f636f6e6669677572655f656469745f6f7074696f6e73223b733a313a2231223b733a31363a2273686f775f7065726d697373696f6e73223b733a313a2231223b733a32323a2273686f775f6173736f63696174696f6e735f65646974223b733a313a2231223b733a31323a22736176655f686973746f7279223b733a313a2231223b733a31333a22686973746f72795f6c696d6974223b693a31303b733a32353a2273686f775f75726c735f696d616765735f66726f6e74656e64223b733a313a2230223b733a32343a2273686f775f75726c735f696d616765735f6261636b656e64223b733a313a2231223b733a373a2274617267657461223b693a303b733a373a2274617267657462223b693a303b733a373a2274617267657463223b693a303b733a31313a22666c6f61745f696e74726f223b733a343a226c656674223b733a31343a22666c6f61745f66756c6c74657874223b733a343a226c656674223b733a31353a2263617465676f72795f6c61796f7574223b733a363a225f3a626c6f67223b733a31393a2273686f775f63617465676f72795f7469746c65223b733a313a2230223b733a31363a2273686f775f6465736372697074696f6e223b733a313a2230223b733a32323a2273686f775f6465736372697074696f6e5f696d616765223b733a313a2230223b733a383a226d61784c6576656c223b733a313a2231223b733a32313a2273686f775f656d7074795f63617465676f72696573223b733a313a2230223b733a31363a2273686f775f6e6f5f61727469636c6573223b733a313a2231223b733a33323a2273686f775f63617465676f72795f68656164696e675f7469746c655f74657874223b733a313a2231223b733a31363a2273686f775f7375626361745f64657363223b733a313a2231223b733a32313a2273686f775f6361745f6e756d5f61727469636c6573223b733a313a2230223b733a31333a2273686f775f6361745f74616773223b733a313a2231223b733a32313a2273686f775f626173655f6465736372697074696f6e223b733a313a2231223b733a31313a226d61784c6576656c636174223b733a323a222d31223b733a32353a2273686f775f656d7074795f63617465676f726965735f636174223b733a313a2230223b733a32303a2273686f775f7375626361745f646573635f636174223b733a313a2231223b733a32353a2273686f775f6361745f6e756d5f61727469636c65735f636174223b733a313a2231223b733a32303a226e756d5f6c656164696e675f61727469636c6573223b693a313b733a31383a22626c6f675f636c6173735f6c656164696e67223b733a303a22223b733a31383a226e756d5f696e74726f5f61727469636c6573223b693a343b733a31303a22626c6f675f636c617373223b733a303a22223b733a31313a226e756d5f636f6c756d6e73223b693a313b733a31383a226d756c74695f636f6c756d6e5f6f72646572223b733a313a2230223b733a393a226e756d5f6c696e6b73223b693a343b733a32343a2273686f775f73756263617465676f72795f636f6e74656e74223b733a313a2230223b733a31363a226c696e6b5f696e74726f5f696d616765223b733a313a2230223b733a32313a2273686f775f706167696e6174696f6e5f6c696d6974223b733a313a2231223b733a31323a2266696c7465725f6669656c64223b733a343a2268696465223b733a31333a2273686f775f68656164696e6773223b733a313a2231223b733a31343a226c6973745f73686f775f64617465223b733a313a2230223b733a31313a22646174655f666f726d6174223b733a303a22223b733a31343a226c6973745f73686f775f68697473223b733a313a2231223b733a31363a226c6973745f73686f775f617574686f72223b733a313a2231223b733a31313a22646973706c61795f6e756d223b733a323a223130223b733a31313a226f7264657262795f707269223b733a353a226f72646572223b733a31313a226f7264657262795f736563223b733a353a227264617465223b733a31303a226f726465725f64617465223b733a393a227075626c6973686564223b733a31353a2273686f775f706167696e6174696f6e223b733a313a2232223b733a32333a2273686f775f706167696e6174696f6e5f726573756c7473223b733a313a2231223b733a31333a2273686f775f6665617475726564223b733a343a2273686f77223b733a31343a2273686f775f666565645f6c696e6b223b733a313a2231223b733a31323a22666565645f73756d6d617279223b733a313a2230223b733a31383a22666565645f73686f775f726561646d6f7265223b733a313a2230223b733a373a227365665f696473223b693a313b733a32303a22637573746f6d5f6669656c64735f656e61626c65223b733a313a2231223b733a31363a22776f726b666c6f775f656e61626c6564223b733a313a2230223b7d733a31343a22002a00696e697469616c697a6564223b623a313b733a393a22736570617261746f72223b733a313a222e223b7d733a373a226d6574616b6579223b733a303a22223b733a383a226d65746164657363223b733a303a22223b733a383a226d65746164617461223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a333a7b733a363a22726f626f7473223b733a303a22223b733a363a22617574686f72223b733a303a22223b733a363a22726967687473223b733a303a22223b7d733a31343a22002a00696e697469616c697a6564223b623a313b733a393a22736570617261746f72223b733a313a222e223b7d733a373a2276657273696f6e223b693a313b733a383a226f72646572696e67223b693a303b733a383a2263617465676f7279223b733a31333a22556e63617465676f7269736564223b733a393a226361745f7374617465223b693a313b733a31303a226361745f616363657373223b693a313b733a343a22736c7567223b733a373a22323a7465726d73223b733a373a22636174736c7567223b733a31353a22323a756e63617465676f7269736564223b733a363a22617574686f72223b733a373a2266617374773362223b733a363a226c61796f7574223b733a373a2261727469636c65223b733a373a22636f6e74657874223b733a31393a22636f6d5f636f6e74656e742e61727469636c65223b733a31303a226d657461617574686f72223b4e3b7d693a343b4e3b693a353b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a383a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a373a226d6574616b6579223b693a343b733a383a226d65746164657363223b693a353b733a31303a226d657461617574686f72223b693a363b733a363a22617574686f72223b693a373b733a31363a22637265617465645f62795f616c696173223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d693a363b733a313a222a223b693a373b4e3b693a383b4e3b693a393b733a31393a22323032322d31322d30362032303a35353a3234223b693a31303b4e3b693a31313b733a36303a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d61727469636c652669643d323a7465726d732663617469643d32223b693a31323b4e3b693a31333b733a31393a22323032322d31322d30362032303a35353a3234223b693a31343b693a313b693a31353b613a343a7b733a343a2254797065223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a373a2241727469636c65223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a333b7d7d733a363a22417574686f72223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a373a2266617374773362223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a353b7d7d733a383a2243617465676f7279223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a31333a22556e63617465676f7269736564223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a313a222a223b733a363a226e6573746564223b623a313b733a323a226964223b693a373b7d7d733a383a224c616e6775616765223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a313a222a223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a393b7d7d7d693a31363b733a353a225465726d73223b693a31373b693a333b693a31383b733a34363a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d61727469636c652669643d32223b7d),
(3, 'index.php?option=com_content&view=article&id=3', 'index.php?option=com_content&view=article&id=3:privacy&catid=2', 'Privacy', '', '2022-12-06 20:57:00', '79757f58e9745f896bda5cb2ea48e44f', 1, 1, 1, '*', '2022-12-06 20:57:00', NULL, '2022-12-06 20:57:00', NULL, 0, 0, 3, 0x4f3a35323a224a6f6f6d6c615c436f6d706f6e656e745c46696e6465725c41646d696e6973747261746f725c496e64657865725c526573756c74223a31393a7b693a303b693a313b693a313b733a353a22656e2d4742223b693a323b733a303a22223b693a333b613a32353a7b733a323a226964223b693a333b733a353a22616c696173223b733a373a2270726976616379223b733a373a2273756d6d617279223b733a303a22223b733a343a22626f6479223b733a303a22223b733a363a22696d61676573223b733a3137333a227b22696d6167655f696e74726f223a22222c22696d6167655f696e74726f5f616c74223a22222c22666c6f61745f696e74726f223a22222c22696d6167655f696e74726f5f63617074696f6e223a22222c22696d6167655f66756c6c74657874223a22222c22696d6167655f66756c6c746578745f616c74223a22222c22666c6f61745f66756c6c74657874223a22222c22696d6167655f66756c6c746578745f63617074696f6e223a22227d223b733a353a226361746964223b693a323b733a31303a22637265617465645f6279223b693a3132303b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323032322d31322d30362032303a35373a3030223b733a31313a226d6f6469666965645f6279223b693a3132303b733a363a22706172616d73223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a38363a7b733a31343a2261727469636c655f6c61796f7574223b733a393a225f3a64656661756c74223b733a31303a2273686f775f7469746c65223b733a313a2231223b733a31313a226c696e6b5f7469746c6573223b733a313a2231223b733a31303a2273686f775f696e74726f223b733a313a2231223b733a31393a22696e666f5f626c6f636b5f706f736974696f6e223b733a313a2230223b733a32313a22696e666f5f626c6f636b5f73686f775f7469746c65223b733a313a2231223b733a31333a2273686f775f63617465676f7279223b733a313a2231223b733a31333a226c696e6b5f63617465676f7279223b733a313a2231223b733a32303a2273686f775f706172656e745f63617465676f7279223b733a313a2230223b733a32303a226c696e6b5f706172656e745f63617465676f7279223b733a313a2230223b733a31373a2273686f775f6173736f63696174696f6e73223b733a313a2230223b733a353a22666c616773223b733a313a2231223b733a31313a2273686f775f617574686f72223b733a313a2231223b733a31313a226c696e6b5f617574686f72223b733a313a2230223b733a31363a2273686f775f6372656174655f64617465223b733a313a2230223b733a31363a2273686f775f6d6f646966795f64617465223b733a313a2230223b733a31373a2273686f775f7075626c6973685f64617465223b733a313a2231223b733a32303a2273686f775f6974656d5f6e617669676174696f6e223b733a313a2231223b733a31333a2273686f775f726561646d6f7265223b733a313a2231223b733a31393a2273686f775f726561646d6f72655f7469746c65223b733a313a2231223b733a31343a22726561646d6f72655f6c696d6974223b693a3130303b733a393a2273686f775f74616773223b733a313a2231223b733a31313a227265636f72645f68697473223b733a313a2231223b733a393a2273686f775f68697473223b733a313a2231223b733a31313a2273686f775f6e6f61757468223b733a313a2230223b733a31333a2275726c735f706f736974696f6e223b693a303b733a373a2263617074636861223b733a303a22223b733a32333a2273686f775f7075626c697368696e675f6f7074696f6e73223b733a313a2231223b733a32303a2273686f775f61727469636c655f6f7074696f6e73223b733a313a2231223b733a32373a2273686f775f636f6e6669677572655f656469745f6f7074696f6e73223b733a313a2231223b733a31363a2273686f775f7065726d697373696f6e73223b733a313a2231223b733a32323a2273686f775f6173736f63696174696f6e735f65646974223b733a313a2231223b733a31323a22736176655f686973746f7279223b733a313a2231223b733a31333a22686973746f72795f6c696d6974223b693a31303b733a32353a2273686f775f75726c735f696d616765735f66726f6e74656e64223b733a313a2230223b733a32343a2273686f775f75726c735f696d616765735f6261636b656e64223b733a313a2231223b733a373a2274617267657461223b693a303b733a373a2274617267657462223b693a303b733a373a2274617267657463223b693a303b733a31313a22666c6f61745f696e74726f223b733a343a226c656674223b733a31343a22666c6f61745f66756c6c74657874223b733a343a226c656674223b733a31353a2263617465676f72795f6c61796f7574223b733a363a225f3a626c6f67223b733a31393a2273686f775f63617465676f72795f7469746c65223b733a313a2230223b733a31363a2273686f775f6465736372697074696f6e223b733a313a2230223b733a32323a2273686f775f6465736372697074696f6e5f696d616765223b733a313a2230223b733a383a226d61784c6576656c223b733a313a2231223b733a32313a2273686f775f656d7074795f63617465676f72696573223b733a313a2230223b733a31363a2273686f775f6e6f5f61727469636c6573223b733a313a2231223b733a33323a2273686f775f63617465676f72795f68656164696e675f7469746c655f74657874223b733a313a2231223b733a31363a2273686f775f7375626361745f64657363223b733a313a2231223b733a32313a2273686f775f6361745f6e756d5f61727469636c6573223b733a313a2230223b733a31333a2273686f775f6361745f74616773223b733a313a2231223b733a32313a2273686f775f626173655f6465736372697074696f6e223b733a313a2231223b733a31313a226d61784c6576656c636174223b733a323a222d31223b733a32353a2273686f775f656d7074795f63617465676f726965735f636174223b733a313a2230223b733a32303a2273686f775f7375626361745f646573635f636174223b733a313a2231223b733a32353a2273686f775f6361745f6e756d5f61727469636c65735f636174223b733a313a2231223b733a32303a226e756d5f6c656164696e675f61727469636c6573223b693a313b733a31383a22626c6f675f636c6173735f6c656164696e67223b733a303a22223b733a31383a226e756d5f696e74726f5f61727469636c6573223b693a343b733a31303a22626c6f675f636c617373223b733a303a22223b733a31313a226e756d5f636f6c756d6e73223b693a313b733a31383a226d756c74695f636f6c756d6e5f6f72646572223b733a313a2230223b733a393a226e756d5f6c696e6b73223b693a343b733a32343a2273686f775f73756263617465676f72795f636f6e74656e74223b733a313a2230223b733a31363a226c696e6b5f696e74726f5f696d616765223b733a313a2230223b733a32313a2273686f775f706167696e6174696f6e5f6c696d6974223b733a313a2231223b733a31323a2266696c7465725f6669656c64223b733a343a2268696465223b733a31333a2273686f775f68656164696e6773223b733a313a2231223b733a31343a226c6973745f73686f775f64617465223b733a313a2230223b733a31313a22646174655f666f726d6174223b733a303a22223b733a31343a226c6973745f73686f775f68697473223b733a313a2231223b733a31363a226c6973745f73686f775f617574686f72223b733a313a2231223b733a31313a22646973706c61795f6e756d223b733a323a223130223b733a31313a226f7264657262795f707269223b733a353a226f72646572223b733a31313a226f7264657262795f736563223b733a353a227264617465223b733a31303a226f726465725f64617465223b733a393a227075626c6973686564223b733a31353a2273686f775f706167696e6174696f6e223b733a313a2232223b733a32333a2273686f775f706167696e6174696f6e5f726573756c7473223b733a313a2231223b733a31333a2273686f775f6665617475726564223b733a343a2273686f77223b733a31343a2273686f775f666565645f6c696e6b223b733a313a2231223b733a31323a22666565645f73756d6d617279223b733a313a2230223b733a31383a22666565645f73686f775f726561646d6f7265223b733a313a2230223b733a373a227365665f696473223b693a313b733a32303a22637573746f6d5f6669656c64735f656e61626c65223b733a313a2231223b733a31363a22776f726b666c6f775f656e61626c6564223b733a313a2230223b7d733a31343a22002a00696e697469616c697a6564223b623a313b733a393a22736570617261746f72223b733a313a222e223b7d733a373a226d6574616b6579223b733a303a22223b733a383a226d65746164657363223b733a303a22223b733a383a226d65746164617461223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a333a7b733a363a22726f626f7473223b733a303a22223b733a363a22617574686f72223b733a303a22223b733a363a22726967687473223b733a303a22223b7d733a31343a22002a00696e697469616c697a6564223b623a313b733a393a22736570617261746f72223b733a313a222e223b7d733a373a2276657273696f6e223b693a313b733a383a226f72646572696e67223b693a303b733a383a2263617465676f7279223b733a31333a22556e63617465676f7269736564223b733a393a226361745f7374617465223b693a313b733a31303a226361745f616363657373223b693a313b733a343a22736c7567223b733a393a22333a70726976616379223b733a373a22636174736c7567223b733a31353a22323a756e63617465676f7269736564223b733a363a22617574686f72223b733a373a2266617374773362223b733a363a226c61796f7574223b733a373a2261727469636c65223b733a373a22636f6e74657874223b733a31393a22636f6d5f636f6e74656e742e61727469636c65223b733a31303a226d657461617574686f72223b4e3b7d693a343b4e3b693a353b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a383a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a373a226d6574616b6579223b693a343b733a383a226d65746164657363223b693a353b733a31303a226d657461617574686f72223b693a363b733a363a22617574686f72223b693a373b733a31363a22637265617465645f62795f616c696173223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d693a363b733a313a222a223b693a373b4e3b693a383b4e3b693a393b733a31393a22323032322d31322d30362032303a35373a3030223b693a31303b4e3b693a31313b733a36323a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d61727469636c652669643d333a707269766163792663617469643d32223b693a31323b4e3b693a31333b733a31393a22323032322d31322d30362032303a35373a3030223b693a31343b693a313b693a31353b613a343a7b733a343a2254797065223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a373a2241727469636c65223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a333b7d7d733a363a22417574686f72223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a373a2266617374773362223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a353b7d7d733a383a2243617465676f7279223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a31333a22556e63617465676f7269736564223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a313a222a223b733a363a226e6573746564223b623a313b733a323a226964223b693a373b7d7d733a383a224c616e6775616765223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a313a222a223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a393b7d7d7d693a31363b733a373a2250726976616379223b693a31373b693a333b693a31383b733a34363a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d61727469636c652669643d33223b7d),
(5, 'index.php?option=com_content&view=article&id=4', 'index.php?option=com_content&view=article&id=4:homepage&catid=2', 'Homepage', '', '2023-01-05 17:23:24', 'bfe2bb346a0494945c82e2fb4f40347e', 1, 1, 1, '*', '2023-01-05 17:20:31', NULL, '2023-01-05 17:20:31', NULL, 0, 0, 3, 0x4f3a35323a224a6f6f6d6c615c436f6d706f6e656e745c46696e6465725c41646d696e6973747261746f725c496e64657865725c526573756c74223a31393a7b693a303b693a313b693a313b733a353a22656e2d4742223b693a323b733a303a22223b693a333b613a32353a7b733a323a226964223b693a343b733a353a22616c696173223b733a383a22686f6d6570616765223b733a373a2273756d6d617279223b733a303a22223b733a343a22626f6479223b733a3539333a223c212d2d207b2274797065223a226c61796f7574222c226368696c6472656e223a5b7b2274797065223a2273656374696f6e222c2270726f7073223a7b22696d6167655f706f736974696f6e223a2263656e7465722d63656e746572222c227374796c65223a2264656661756c74222c227469746c655f627265616b706f696e74223a22786c222c227469746c655f706f736974696f6e223a22746f702d6c656674222c227469746c655f726f746174696f6e223a226c656674222c22766572746963616c5f616c69676e223a226d6964646c65222c227769647468223a2264656661756c74227d2c226368696c6472656e223a5b7b2274797065223a22726f77222c226368696c6472656e223a5b7b2274797065223a22636f6c756d6e222c2270726f7073223a7b22696d6167655f706f736974696f6e223a2263656e7465722d63656e746572222c226d656469615f6f7665726c61795f6772616469656e74223a22222c22706f736974696f6e5f737469636b795f627265616b706f696e74223a226d227d2c226368696c6472656e223a5b7b2274797065223a226d6f64756c65222c2270726f7073223a7b226d656e755f696d6167655f616c69676e223a2263656e746572222c226d656e755f696d6167655f6d617267696e223a747275652c226d656e755f7374796c65223a2264656661756c74222c226d656e755f74797065223a226e6176222c226d6f64756c65223a22313137222c2274797065223a226d6f645f77696e626f617264227d7d5d7d5d7d5d7d5d2c2276657273696f6e223a22332e302e3138227d202d2d3e223b733a363a22696d61676573223b733a3137333a227b22696d6167655f696e74726f223a22222c22696d6167655f696e74726f5f616c74223a22222c22666c6f61745f696e74726f223a22222c22696d6167655f696e74726f5f63617074696f6e223a22222c22696d6167655f66756c6c74657874223a22222c22696d6167655f66756c6c746578745f616c74223a22222c22666c6f61745f66756c6c74657874223a22222c22696d6167655f66756c6c746578745f63617074696f6e223a22227d223b733a353a226361746964223b693a323b733a31303a22637265617465645f6279223b693a3132303b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323032332d30312d30352031373a32333a3234223b733a31313a226d6f6469666965645f6279223b693a3132303b733a363a22706172616d73223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a38363a7b733a31343a2261727469636c655f6c61796f7574223b733a393a225f3a64656661756c74223b733a31303a2273686f775f7469746c65223b733a313a2231223b733a31313a226c696e6b5f7469746c6573223b733a313a2231223b733a31303a2273686f775f696e74726f223b733a313a2231223b733a31393a22696e666f5f626c6f636b5f706f736974696f6e223b733a313a2230223b733a32313a22696e666f5f626c6f636b5f73686f775f7469746c65223b733a313a2231223b733a31333a2273686f775f63617465676f7279223b733a313a2231223b733a31333a226c696e6b5f63617465676f7279223b733a313a2231223b733a32303a2273686f775f706172656e745f63617465676f7279223b733a313a2230223b733a32303a226c696e6b5f706172656e745f63617465676f7279223b733a313a2230223b733a31373a2273686f775f6173736f63696174696f6e73223b733a313a2230223b733a353a22666c616773223b733a313a2231223b733a31313a2273686f775f617574686f72223b733a313a2231223b733a31313a226c696e6b5f617574686f72223b733a313a2230223b733a31363a2273686f775f6372656174655f64617465223b733a313a2230223b733a31363a2273686f775f6d6f646966795f64617465223b733a313a2230223b733a31373a2273686f775f7075626c6973685f64617465223b733a313a2231223b733a32303a2273686f775f6974656d5f6e617669676174696f6e223b733a313a2231223b733a31333a2273686f775f726561646d6f7265223b733a313a2231223b733a31393a2273686f775f726561646d6f72655f7469746c65223b733a313a2231223b733a31343a22726561646d6f72655f6c696d6974223b693a3130303b733a393a2273686f775f74616773223b733a313a2231223b733a31313a227265636f72645f68697473223b733a313a2231223b733a393a2273686f775f68697473223b733a313a2231223b733a31313a2273686f775f6e6f61757468223b733a313a2230223b733a31333a2275726c735f706f736974696f6e223b693a303b733a373a2263617074636861223b733a303a22223b733a32333a2273686f775f7075626c697368696e675f6f7074696f6e73223b733a313a2231223b733a32303a2273686f775f61727469636c655f6f7074696f6e73223b733a313a2231223b733a32373a2273686f775f636f6e6669677572655f656469745f6f7074696f6e73223b733a313a2231223b733a31363a2273686f775f7065726d697373696f6e73223b733a313a2231223b733a32323a2273686f775f6173736f63696174696f6e735f65646974223b733a313a2231223b733a31323a22736176655f686973746f7279223b733a313a2231223b733a31333a22686973746f72795f6c696d6974223b693a31303b733a32353a2273686f775f75726c735f696d616765735f66726f6e74656e64223b733a313a2230223b733a32343a2273686f775f75726c735f696d616765735f6261636b656e64223b733a313a2231223b733a373a2274617267657461223b693a303b733a373a2274617267657462223b693a303b733a373a2274617267657463223b693a303b733a31313a22666c6f61745f696e74726f223b733a343a226c656674223b733a31343a22666c6f61745f66756c6c74657874223b733a343a226c656674223b733a31353a2263617465676f72795f6c61796f7574223b733a363a225f3a626c6f67223b733a31393a2273686f775f63617465676f72795f7469746c65223b733a313a2230223b733a31363a2273686f775f6465736372697074696f6e223b733a313a2230223b733a32323a2273686f775f6465736372697074696f6e5f696d616765223b733a313a2230223b733a383a226d61784c6576656c223b733a313a2231223b733a32313a2273686f775f656d7074795f63617465676f72696573223b733a313a2230223b733a31363a2273686f775f6e6f5f61727469636c6573223b733a313a2231223b733a33323a2273686f775f63617465676f72795f68656164696e675f7469746c655f74657874223b733a313a2231223b733a31363a2273686f775f7375626361745f64657363223b733a313a2231223b733a32313a2273686f775f6361745f6e756d5f61727469636c6573223b733a313a2230223b733a31333a2273686f775f6361745f74616773223b733a313a2231223b733a32313a2273686f775f626173655f6465736372697074696f6e223b733a313a2231223b733a31313a226d61784c6576656c636174223b733a323a222d31223b733a32353a2273686f775f656d7074795f63617465676f726965735f636174223b733a313a2230223b733a32303a2273686f775f7375626361745f646573635f636174223b733a313a2231223b733a32353a2273686f775f6361745f6e756d5f61727469636c65735f636174223b733a313a2231223b733a32303a226e756d5f6c656164696e675f61727469636c6573223b693a313b733a31383a22626c6f675f636c6173735f6c656164696e67223b733a303a22223b733a31383a226e756d5f696e74726f5f61727469636c6573223b693a343b733a31303a22626c6f675f636c617373223b733a303a22223b733a31313a226e756d5f636f6c756d6e73223b693a313b733a31383a226d756c74695f636f6c756d6e5f6f72646572223b733a313a2230223b733a393a226e756d5f6c696e6b73223b693a343b733a32343a2273686f775f73756263617465676f72795f636f6e74656e74223b733a313a2230223b733a31363a226c696e6b5f696e74726f5f696d616765223b733a313a2230223b733a32313a2273686f775f706167696e6174696f6e5f6c696d6974223b733a313a2231223b733a31323a2266696c7465725f6669656c64223b733a343a2268696465223b733a31333a2273686f775f68656164696e6773223b733a313a2231223b733a31343a226c6973745f73686f775f64617465223b733a313a2230223b733a31313a22646174655f666f726d6174223b733a303a22223b733a31343a226c6973745f73686f775f68697473223b733a313a2231223b733a31363a226c6973745f73686f775f617574686f72223b733a313a2231223b733a31313a22646973706c61795f6e756d223b733a323a223130223b733a31313a226f7264657262795f707269223b733a353a226f72646572223b733a31313a226f7264657262795f736563223b733a353a227264617465223b733a31303a226f726465725f64617465223b733a393a227075626c6973686564223b733a31353a2273686f775f706167696e6174696f6e223b733a313a2232223b733a32333a2273686f775f706167696e6174696f6e5f726573756c7473223b733a313a2231223b733a31333a2273686f775f6665617475726564223b733a343a2273686f77223b733a31343a2273686f775f666565645f6c696e6b223b733a313a2231223b733a31323a22666565645f73756d6d617279223b733a313a2230223b733a31383a22666565645f73686f775f726561646d6f7265223b733a313a2230223b733a373a227365665f696473223b693a313b733a32303a22637573746f6d5f6669656c64735f656e61626c65223b733a313a2231223b733a31363a22776f726b666c6f775f656e61626c6564223b733a313a2230223b7d733a31343a22002a00696e697469616c697a6564223b623a313b733a393a22736570617261746f72223b733a313a222e223b7d733a373a226d6574616b6579223b733a303a22223b733a383a226d65746164657363223b733a303a22223b733a383a226d65746164617461223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a333a7b733a363a22726f626f7473223b733a303a22223b733a363a22617574686f72223b733a303a22223b733a363a22726967687473223b733a303a22223b7d733a31343a22002a00696e697469616c697a6564223b623a313b733a393a22736570617261746f72223b733a313a222e223b7d733a373a2276657273696f6e223b693a323b733a383a226f72646572696e67223b693a303b733a383a2263617465676f7279223b733a31333a22556e63617465676f7269736564223b733a393a226361745f7374617465223b693a313b733a31303a226361745f616363657373223b693a313b733a343a22736c7567223b733a31303a22343a686f6d6570616765223b733a373a22636174736c7567223b733a31353a22323a756e63617465676f7269736564223b733a363a22617574686f72223b733a373a2266617374773362223b733a363a226c61796f7574223b733a373a2261727469636c65223b733a373a22636f6e74657874223b733a31393a22636f6d5f636f6e74656e742e61727469636c65223b733a31303a226d657461617574686f72223b4e3b7d693a343b4e3b693a353b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a383a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a373a226d6574616b6579223b693a343b733a383a226d65746164657363223b693a353b733a31303a226d657461617574686f72223b693a363b733a363a22617574686f72223b693a373b733a31363a22637265617465645f62795f616c696173223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d693a363b733a313a222a223b693a373b4e3b693a383b4e3b693a393b733a31393a22323032332d30312d30352031373a32303a3331223b693a31303b4e3b693a31313b733a36333a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d61727469636c652669643d343a686f6d65706167652663617469643d32223b693a31323b4e3b693a31333b733a31393a22323032332d30312d30352031373a32303a3331223b693a31343b693a313b693a31353b613a343a7b733a343a2254797065223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a373a2241727469636c65223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a333b7d7d733a363a22417574686f72223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a373a2266617374773362223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a353b7d7d733a383a2243617465676f7279223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a31333a22556e63617465676f7269736564223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a313a222a223b733a363a226e6573746564223b623a313b733a323a226964223b693a373b7d7d733a383a224c616e6775616765223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a313a222a223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a393b7d7d7d693a31363b733a383a22486f6d6570616765223b693a31373b693a333b693a31383b733a34363a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d61727469636c652669643d34223b7d);

-- --------------------------------------------------------

--
-- Table structure for table `b5651_finder_links_terms`
--

CREATE TABLE `b5651_finder_links_terms` (
  `link_id` int UNSIGNED NOT NULL,
  `term_id` int UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `b5651_finder_logging`
--

CREATE TABLE `b5651_finder_logging` (
  `searchterm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `md5sum` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `query` blob NOT NULL,
  `hits` int NOT NULL DEFAULT '1',
  `results` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `b5651_finder_taxonomy`
--

CREATE TABLE `b5651_finder_taxonomy` (
  `id` int UNSIGNED NOT NULL,
  `parent_id` int UNSIGNED NOT NULL DEFAULT '0',
  `lft` int NOT NULL DEFAULT '0',
  `rgt` int NOT NULL DEFAULT '0',
  `level` int UNSIGNED NOT NULL DEFAULT '0',
  `path` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `access` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `language` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `b5651_finder_taxonomy`
--

INSERT INTO `b5651_finder_taxonomy` (`id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `title`, `alias`, `state`, `access`, `language`) VALUES
(1, 0, 0, 17, 0, '', 'ROOT', 'root', 1, 1, '*'),
(2, 1, 1, 4, 1, 'type', 'Type', 'type', 1, 1, ''),
(3, 2, 2, 3, 2, 'type/article', 'Article', 'article', 1, 1, ''),
(4, 1, 5, 8, 1, 'author', 'Author', 'author', 1, 1, ''),
(5, 4, 6, 7, 2, 'author/fastw3b', 'fastw3b', 'fastw3b', 1, 1, ''),
(6, 1, 9, 12, 1, 'category', 'Category', 'category', 1, 1, ''),
(7, 6, 10, 11, 2, 'category/uncategorised', 'Uncategorised', 'uncategorised', 1, 1, '*'),
(8, 1, 13, 16, 1, 'language', 'Language', 'language', 1, 1, ''),
(9, 8, 14, 15, 2, 'language/779103c53079431d1af01ce15b36e61f', '*', '779103c53079431d1af01ce15b36e61f', 1, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `b5651_finder_taxonomy_map`
--

CREATE TABLE `b5651_finder_taxonomy_map` (
  `link_id` int UNSIGNED NOT NULL,
  `node_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `b5651_finder_taxonomy_map`
--

INSERT INTO `b5651_finder_taxonomy_map` (`link_id`, `node_id`) VALUES
(1, 3),
(1, 5),
(1, 7),
(1, 9),
(2, 3),
(2, 5),
(2, 7),
(2, 9),
(3, 3),
(3, 5),
(3, 7),
(3, 9),
(5, 3),
(5, 5),
(5, 7),
(5, 9);

-- --------------------------------------------------------

--
-- Table structure for table `b5651_finder_terms`
--

CREATE TABLE `b5651_finder_terms` (
  `term_id` int UNSIGNED NOT NULL,
  `term` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `stem` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `common` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `phrase` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `weight` float UNSIGNED NOT NULL DEFAULT '0',
  `soundex` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `links` int NOT NULL DEFAULT '0',
  `language` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `b5651_finder_terms_common`
--

CREATE TABLE `b5651_finder_terms_common` (
  `term` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `language` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `custom` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `b5651_finder_terms_common`
--

INSERT INTO `b5651_finder_terms_common` (`term`, `language`, `custom`) VALUES
('a', 'en', 0),
('about', 'en', 0),
('above', 'en', 0),
('after', 'en', 0),
('again', 'en', 0),
('against', 'en', 0),
('all', 'en', 0),
('am', 'en', 0),
('an', 'en', 0),
('and', 'en', 0),
('any', 'en', 0),
('are', 'en', 0),
('aren\'t', 'en', 0),
('as', 'en', 0),
('at', 'en', 0),
('be', 'en', 0),
('because', 'en', 0),
('been', 'en', 0),
('before', 'en', 0),
('being', 'en', 0),
('below', 'en', 0),
('between', 'en', 0),
('both', 'en', 0),
('but', 'en', 0),
('by', 'en', 0),
('can\'t', 'en', 0),
('cannot', 'en', 0),
('could', 'en', 0),
('couldn\'t', 'en', 0),
('did', 'en', 0),
('didn\'t', 'en', 0),
('do', 'en', 0),
('does', 'en', 0),
('doesn\'t', 'en', 0),
('doing', 'en', 0),
('don\'t', 'en', 0),
('down', 'en', 0),
('during', 'en', 0),
('each', 'en', 0),
('few', 'en', 0),
('for', 'en', 0),
('from', 'en', 0),
('further', 'en', 0),
('had', 'en', 0),
('hadn\'t', 'en', 0),
('has', 'en', 0),
('hasn\'t', 'en', 0),
('have', 'en', 0),
('haven\'t', 'en', 0),
('having', 'en', 0),
('he', 'en', 0),
('he\'d', 'en', 0),
('he\'ll', 'en', 0),
('he\'s', 'en', 0),
('her', 'en', 0),
('here', 'en', 0),
('here\'s', 'en', 0),
('hers', 'en', 0),
('herself', 'en', 0),
('him', 'en', 0),
('himself', 'en', 0),
('his', 'en', 0),
('how', 'en', 0),
('how\'s', 'en', 0),
('i', 'en', 0),
('i\'d', 'en', 0),
('i\'ll', 'en', 0),
('i\'m', 'en', 0),
('i\'ve', 'en', 0),
('if', 'en', 0),
('in', 'en', 0),
('into', 'en', 0),
('is', 'en', 0),
('isn\'t', 'en', 0),
('it', 'en', 0),
('it\'s', 'en', 0),
('its', 'en', 0),
('itself', 'en', 0),
('let\'s', 'en', 0),
('me', 'en', 0),
('more', 'en', 0),
('most', 'en', 0),
('mustn\'t', 'en', 0),
('my', 'en', 0),
('myself', 'en', 0),
('no', 'en', 0),
('nor', 'en', 0),
('not', 'en', 0),
('of', 'en', 0),
('off', 'en', 0),
('on', 'en', 0),
('once', 'en', 0),
('only', 'en', 0),
('or', 'en', 0),
('other', 'en', 0),
('ought', 'en', 0),
('our', 'en', 0),
('ours', 'en', 0),
('ourselves', 'en', 0),
('out', 'en', 0),
('over', 'en', 0),
('own', 'en', 0),
('same', 'en', 0),
('shan\'t', 'en', 0),
('she', 'en', 0),
('she\'d', 'en', 0),
('she\'ll', 'en', 0),
('she\'s', 'en', 0),
('should', 'en', 0),
('shouldn\'t', 'en', 0),
('so', 'en', 0),
('some', 'en', 0),
('such', 'en', 0),
('than', 'en', 0),
('that', 'en', 0),
('that\'s', 'en', 0),
('the', 'en', 0),
('their', 'en', 0),
('theirs', 'en', 0),
('them', 'en', 0),
('themselves', 'en', 0),
('then', 'en', 0),
('there', 'en', 0),
('there\'s', 'en', 0),
('these', 'en', 0),
('they', 'en', 0),
('they\'d', 'en', 0),
('they\'ll', 'en', 0),
('they\'re', 'en', 0),
('they\'ve', 'en', 0),
('this', 'en', 0),
('those', 'en', 0),
('through', 'en', 0),
('to', 'en', 0),
('too', 'en', 0),
('under', 'en', 0),
('until', 'en', 0),
('up', 'en', 0),
('very', 'en', 0),
('was', 'en', 0),
('wasn\'t', 'en', 0),
('we', 'en', 0),
('we\'d', 'en', 0),
('we\'ll', 'en', 0),
('we\'re', 'en', 0),
('we\'ve', 'en', 0),
('were', 'en', 0),
('weren\'t', 'en', 0),
('what', 'en', 0),
('what\'s', 'en', 0),
('when', 'en', 0),
('when\'s', 'en', 0),
('where', 'en', 0),
('where\'s', 'en', 0),
('which', 'en', 0),
('while', 'en', 0),
('who', 'en', 0),
('who\'s', 'en', 0),
('whom', 'en', 0),
('why', 'en', 0),
('why\'s', 'en', 0),
('with', 'en', 0),
('won\'t', 'en', 0),
('would', 'en', 0),
('wouldn\'t', 'en', 0),
('you', 'en', 0),
('you\'d', 'en', 0),
('you\'ll', 'en', 0),
('you\'re', 'en', 0),
('you\'ve', 'en', 0),
('your', 'en', 0),
('yours', 'en', 0),
('yourself', 'en', 0),
('yourselves', 'en', 0);

-- --------------------------------------------------------

--
-- Table structure for table `b5651_finder_tokens`
--

CREATE TABLE `b5651_finder_tokens` (
  `term` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `stem` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `common` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `phrase` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `weight` float UNSIGNED NOT NULL DEFAULT '1',
  `context` tinyint UNSIGNED NOT NULL DEFAULT '2',
  `language` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `b5651_finder_tokens_aggregate`
--

CREATE TABLE `b5651_finder_tokens_aggregate` (
  `term_id` int UNSIGNED NOT NULL,
  `term` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `stem` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `common` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `phrase` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `term_weight` float UNSIGNED NOT NULL DEFAULT '0',
  `context` tinyint UNSIGNED NOT NULL DEFAULT '2',
  `context_weight` float UNSIGNED NOT NULL DEFAULT '0',
  `total_weight` float UNSIGNED NOT NULL DEFAULT '0',
  `language` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `b5651_finder_types`
--

CREATE TABLE `b5651_finder_types` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `b5651_finder_types`
--

INSERT INTO `b5651_finder_types` (`id`, `title`, `mime`) VALUES
(1, 'Category', ''),
(2, 'Contact', ''),
(3, 'Article', ''),
(4, 'News Feed', ''),
(5, 'Tag', '');

-- --------------------------------------------------------

--
-- Table structure for table `b5651_fwsync_sync`
--

CREATE TABLE `b5651_fwsync_sync` (
  `id` int UNSIGNED NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` enum('files','struct','data') NOT NULL,
  `changes` int UNSIGNED NOT NULL DEFAULT '0',
  `remote_host` varchar(250) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `comments` text,
  `changes_filename` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `b5651_fwsync_sync`
--

INSERT INTO `b5651_fwsync_sync` (`id`, `created`, `type`, `changes`, `remote_host`, `title`, `comments`, `changes_filename`) VALUES
(1, '2023-02-08 07:56:25', 'data', 2, 'http://winboard.joomstore.com.au', NULL, NULL, 'fwsync_winboardjoomstorecomau_data_020823_1126.zip'),
(2, '2023-02-08 07:59:54', 'files', 5, 'http://winboard.joomstore.com.au', NULL, NULL, 'fwsync_winboardjoomstorecomau_files_020823_1129.zip');

-- --------------------------------------------------------

--
-- Table structure for table `b5651_history`
--

CREATE TABLE `b5651_history` (
  `version_id` int UNSIGNED NOT NULL,
  `item_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `version_note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Optional version name',
  `save_date` datetime NOT NULL,
  `editor_user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `character_count` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Number of characters in this version.',
  `sha1_hash` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'SHA1 hash of the version_data column.',
  `version_data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'json-encoded string of version data',
  `keep_forever` tinyint NOT NULL DEFAULT '0' COMMENT '0=auto delete; 1=keep'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `b5651_history`
--

INSERT INTO `b5651_history` (`version_id`, `item_id`, `version_note`, `save_date`, `editor_user_id`, `character_count`, `sha1_hash`, `version_data`, `keep_forever`) VALUES
(1, 'com_content.article.1', '', '2022-12-06 20:54:07', 120, 1568, 'ab49cd9e2908b5838a018102b141ef4351b99ad4', '{\"id\":1,\"asset_id\":97,\"title\":\"About\",\"alias\":\"about\",\"introtext\":\"\",\"fulltext\":\"\",\"state\":\"1\",\"catid\":2,\"created\":\"2022-12-06 20:54:07\",\"created_by\":120,\"created_by_alias\":\"\",\"modified\":\"2022-12-06 20:54:07\",\"modified_by\":120,\"checked_out\":null,\"checked_out_time\":null,\"publish_up\":\"2022-12-06 20:54:07\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":\"1\",\"ordering\":null,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":0,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}', 0),
(2, 'com_content.article.2', '', '2022-12-06 20:55:24', 120, 1568, '35d05c60ad307a694d23ecbacf25b52a482444d2', '{\"id\":2,\"asset_id\":98,\"title\":\"Terms\",\"alias\":\"terms\",\"introtext\":\"\",\"fulltext\":\"\",\"state\":\"1\",\"catid\":2,\"created\":\"2022-12-06 20:55:24\",\"created_by\":120,\"created_by_alias\":\"\",\"modified\":\"2022-12-06 20:55:24\",\"modified_by\":120,\"checked_out\":null,\"checked_out_time\":null,\"publish_up\":\"2022-12-06 20:55:24\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":\"1\",\"ordering\":null,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":0,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}', 0),
(3, 'com_content.article.3', '', '2022-12-06 20:57:00', 120, 1572, '7f21aee7e93bf89f17287deb1ba4377d2d814c34', '{\"id\":3,\"asset_id\":99,\"title\":\"Privacy\",\"alias\":\"privacy\",\"introtext\":\"\",\"fulltext\":\"\",\"state\":\"1\",\"catid\":2,\"created\":\"2022-12-06 20:57:00\",\"created_by\":120,\"created_by_alias\":\"\",\"modified\":\"2022-12-06 20:57:00\",\"modified_by\":120,\"checked_out\":null,\"checked_out_time\":null,\"publish_up\":\"2022-12-06 20:57:00\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":\"1\",\"ordering\":null,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":0,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}', 0),
(4, 'com_content.article.4', '', '2023-01-05 17:20:31', 120, 1575, '94d5beba2adea7f2025fbd50477ee137e96f0693', '{\"id\":4,\"asset_id\":106,\"title\":\"Homepage\",\"alias\":\"homepage\",\"introtext\":\"\",\"fulltext\":\"\",\"state\":\"1\",\"catid\":2,\"created\":\"2023-01-05 17:20:31\",\"created_by\":120,\"created_by_alias\":\"\",\"modified\":\"2023-01-05 17:20:31\",\"modified_by\":120,\"checked_out\":null,\"checked_out_time\":null,\"publish_up\":\"2023-01-05 17:20:31\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":\"1\",\"ordering\":null,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":0,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}', 0),
(5, 'com_content.article.4', '', '2023-01-05 17:23:24', 120, 2275, '93b0c211d8e735ffc0e682d93aa3cd723301f513', '{\"id\":4,\"asset_id\":106,\"title\":\"Homepage\",\"alias\":\"homepage\",\"introtext\":\"\",\"fulltext\":\"<!-- {\\\"type\\\":\\\"layout\\\",\\\"children\\\":[{\\\"type\\\":\\\"section\\\",\\\"props\\\":{\\\"image_position\\\":\\\"center-center\\\",\\\"style\\\":\\\"default\\\",\\\"title_breakpoint\\\":\\\"xl\\\",\\\"title_position\\\":\\\"top-left\\\",\\\"title_rotation\\\":\\\"left\\\",\\\"vertical_align\\\":\\\"middle\\\",\\\"width\\\":\\\"default\\\"},\\\"children\\\":[{\\\"type\\\":\\\"row\\\",\\\"children\\\":[{\\\"type\\\":\\\"column\\\",\\\"props\\\":{\\\"image_position\\\":\\\"center-center\\\",\\\"media_overlay_gradient\\\":\\\"\\\",\\\"position_sticky_breakpoint\\\":\\\"m\\\"},\\\"children\\\":[{\\\"type\\\":\\\"module\\\",\\\"props\\\":{\\\"menu_image_align\\\":\\\"center\\\",\\\"menu_image_margin\\\":true,\\\"menu_style\\\":\\\"default\\\",\\\"menu_type\\\":\\\"nav\\\",\\\"module\\\":\\\"117\\\",\\\"type\\\":\\\"mod_winboard\\\"}}]}]}]}],\\\"version\\\":\\\"3.0.18\\\"} -->\",\"state\":1,\"catid\":2,\"created\":\"2023-01-05 17:20:31\",\"created_by\":120,\"created_by_alias\":\"\",\"modified\":\"2023-01-05 17:23:24\",\"modified_by\":120,\"checked_out\":120,\"checked_out_time\":\"2023-01-05 17:22:42\",\"publish_up\":\"2023-01-05 17:20:31\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":2,\"ordering\":0,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":5,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":0,\"language\":\"*\",\"note\":\"\"}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `b5651_languages`
--

CREATE TABLE `b5651_languages` (
  `lang_id` int UNSIGNED NOT NULL,
  `asset_id` int UNSIGNED NOT NULL DEFAULT '0',
  `lang_code` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_native` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sef` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `metakey` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `metadesc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sitename` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` int NOT NULL DEFAULT '0',
  `access` int UNSIGNED NOT NULL DEFAULT '0',
  `ordering` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `b5651_languages`
--

INSERT INTO `b5651_languages` (`lang_id`, `asset_id`, `lang_code`, `title`, `title_native`, `sef`, `image`, `description`, `metakey`, `metadesc`, `sitename`, `published`, `access`, `ordering`) VALUES
(1, 0, 'en-GB', 'English (en-GB)', 'English (United Kingdom)', 'en', 'en_gb', '', '', '', '', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `b5651_mail_templates`
--

CREATE TABLE `b5651_mail_templates` (
  `template_id` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `htmlbody` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `b5651_mail_templates`
--

INSERT INTO `b5651_mail_templates` (`template_id`, `extension`, `language`, `subject`, `body`, `htmlbody`, `attachments`, `params`) VALUES
('com_actionlogs.notification', 'com_actionlogs', '', 'COM_ACTIONLOGS_EMAIL_SUBJECT', 'COM_ACTIONLOGS_EMAIL_BODY', 'COM_ACTIONLOGS_EMAIL_HTMLBODY', '', '{\"tags\":[\"message\",\"date\",\"extension\",\"username\"]}'),
('com_config.test_mail', 'com_config', '', 'COM_CONFIG_SENDMAIL_SUBJECT', 'COM_CONFIG_SENDMAIL_BODY', '', '', '{\"tags\":[\"sitename\",\"method\"]}'),
('com_contact.mail', 'com_contact', '', 'COM_CONTACT_ENQUIRY_SUBJECT', 'COM_CONTACT_ENQUIRY_TEXT', '', '', '{\"tags\":[\"sitename\",\"name\",\"email\",\"subject\",\"body\",\"url\",\"customfields\"]}'),
('com_contact.mail.copy', 'com_contact', '', 'COM_CONTACT_COPYSUBJECT_OF', 'COM_CONTACT_COPYTEXT_OF', '', '', '{\"tags\":[\"sitename\",\"name\",\"email\",\"subject\",\"body\",\"url\",\"customfields\",\"contactname\"]}'),
('com_messages.new_message', 'com_messages', '', 'COM_MESSAGES_NEW_MESSAGE', 'COM_MESSAGES_NEW_MESSAGE_BODY', '', '', '{\"tags\":[\"subject\",\"message\",\"fromname\",\"sitename\",\"siteurl\",\"fromemail\",\"toname\",\"toemail\"]}'),
('com_privacy.notification.admin.export', 'com_privacy', '', 'COM_PRIVACY_EMAIL_ADMIN_REQUEST_SUBJECT_EXPORT_REQUEST', 'COM_PRIVACY_EMAIL_ADMIN_REQUEST_BODY_EXPORT_REQUEST', '', '', '{\"tags\":[\"sitename\",\"url\",\"tokenurl\",\"formurl\",\"token\"]}'),
('com_privacy.notification.admin.remove', 'com_privacy', '', 'COM_PRIVACY_EMAIL_ADMIN_REQUEST_SUBJECT_REMOVE_REQUEST', 'COM_PRIVACY_EMAIL_ADMIN_REQUEST_BODY_REMOVE_REQUEST', '', '', '{\"tags\":[\"sitename\",\"url\",\"tokenurl\",\"formurl\",\"token\"]}'),
('com_privacy.notification.export', 'com_privacy', '', 'COM_PRIVACY_EMAIL_REQUEST_SUBJECT_EXPORT_REQUEST', 'COM_PRIVACY_EMAIL_REQUEST_BODY_EXPORT_REQUEST', '', '', '{\"tags\":[\"sitename\",\"url\",\"tokenurl\",\"formurl\",\"token\"]}'),
('com_privacy.notification.remove', 'com_privacy', '', 'COM_PRIVACY_EMAIL_REQUEST_SUBJECT_REMOVE_REQUEST', 'COM_PRIVACY_EMAIL_REQUEST_BODY_REMOVE_REQUEST', '', '', '{\"tags\":[\"sitename\",\"url\",\"tokenurl\",\"formurl\",\"token\"]}'),
('com_privacy.userdataexport', 'com_privacy', '', 'COM_PRIVACY_EMAIL_DATA_EXPORT_COMPLETED_SUBJECT', 'COM_PRIVACY_EMAIL_DATA_EXPORT_COMPLETED_BODY', '', '', '{\"tags\":[\"sitename\",\"url\"]}'),
('com_users.massmail.mail', 'com_users', '', 'COM_USERS_MASSMAIL_MAIL_SUBJECT', 'COM_USERS_MASSMAIL_MAIL_BODY', '', '', '{\"tags\":[\"subject\",\"body\",\"subjectprefix\",\"bodysuffix\"]}'),
('com_users.password_reset', 'com_users', '', 'COM_USERS_EMAIL_PASSWORD_RESET_SUBJECT', 'COM_USERS_EMAIL_PASSWORD_RESET_BODY', '', '', '{\"tags\":[\"name\",\"email\",\"sitename\",\"link_text\",\"link_html\",\"token\"]}'),
('com_users.registration.admin.new_notification', 'com_users', '', 'COM_USERS_EMAIL_ACCOUNT_DETAILS', 'COM_USERS_EMAIL_REGISTERED_NOTIFICATION_TO_ADMIN_BODY', '', '', '{\"tags\":[\"name\",\"sitename\",\"siteurl\",\"username\"]}'),
('com_users.registration.admin.verification_request', 'com_users', '', 'COM_USERS_EMAIL_ACTIVATE_WITH_ADMIN_ACTIVATION_SUBJECT', 'COM_USERS_EMAIL_ACTIVATE_WITH_ADMIN_ACTIVATION_BODY', '', '', '{\"tags\":[\"name\",\"sitename\",\"email\",\"username\",\"activate\"]}'),
('com_users.registration.user.admin_activated', 'com_users', '', 'COM_USERS_EMAIL_ACTIVATED_BY_ADMIN_ACTIVATION_SUBJECT', 'COM_USERS_EMAIL_ACTIVATED_BY_ADMIN_ACTIVATION_BODY', '', '', '{\"tags\":[\"name\",\"sitename\",\"siteurl\",\"username\"]}'),
('com_users.registration.user.admin_activation', 'com_users', '', 'COM_USERS_EMAIL_ACCOUNT_DETAILS', 'COM_USERS_EMAIL_REGISTERED_WITH_ADMIN_ACTIVATION_BODY_NOPW', '', '', '{\"tags\":[\"name\",\"sitename\",\"activate\",\"siteurl\",\"username\"]}'),
('com_users.registration.user.admin_activation_w_pw', 'com_users', '', 'COM_USERS_EMAIL_ACCOUNT_DETAILS', 'COM_USERS_EMAIL_REGISTERED_WITH_ADMIN_ACTIVATION_BODY', '', '', '{\"tags\":[\"name\",\"sitename\",\"activate\",\"siteurl\",\"username\",\"password_clear\"]}'),
('com_users.registration.user.registration_mail', 'com_users', '', 'COM_USERS_EMAIL_ACCOUNT_DETAILS', 'COM_USERS_EMAIL_REGISTERED_BODY_NOPW', '', '', '{\"tags\":[\"name\",\"sitename\",\"activate\",\"siteurl\",\"username\"]}'),
('com_users.registration.user.registration_mail_w_pw', 'com_users', '', 'COM_USERS_EMAIL_ACCOUNT_DETAILS', 'COM_USERS_EMAIL_REGISTERED_BODY', '', '', '{\"tags\":[\"name\",\"sitename\",\"activate\",\"siteurl\",\"username\",\"password_clear\"]}'),
('com_users.registration.user.self_activation', 'com_users', '', 'COM_USERS_EMAIL_ACCOUNT_DETAILS', 'COM_USERS_EMAIL_REGISTERED_WITH_ACTIVATION_BODY_NOPW', '', '', '{\"tags\":[\"name\",\"sitename\",\"activate\",\"siteurl\",\"username\"]}'),
('com_users.registration.user.self_activation_w_pw', 'com_users', '', 'COM_USERS_EMAIL_ACCOUNT_DETAILS', 'COM_USERS_EMAIL_REGISTERED_WITH_ACTIVATION_BODY', '', '', '{\"tags\":[\"name\",\"sitename\",\"activate\",\"siteurl\",\"username\",\"password_clear\"]}'),
('com_users.reminder', 'com_users', '', 'COM_USERS_EMAIL_USERNAME_REMINDER_SUBJECT', 'COM_USERS_EMAIL_USERNAME_REMINDER_BODY', '', '', '{\"tags\":[\"name\",\"username\",\"sitename\",\"email\",\"link_text\",\"link_html\"]}'),
('plg_multifactorauth_email.mail', 'plg_multifactorauth_email', '', 'PLG_MULTIFACTORAUTH_EMAIL_EMAIL_SUBJECT', 'PLG_MULTIFACTORAUTH_EMAIL_EMAIL_BODY', '', '', '{\"tags\":[\"code\",\"sitename\",\"siteurl\",\"username\",\"email\",\"fullname\"]}'),
('plg_system_privacyconsent.request.reminder', 'plg_system_privacyconsent', '', 'PLG_SYSTEM_PRIVACYCONSENT_EMAIL_REMIND_SUBJECT', 'PLG_SYSTEM_PRIVACYCONSENT_EMAIL_REMIND_BODY', '', '', '{\"tags\":[\"sitename\",\"url\",\"tokenurl\",\"formurl\",\"token\"]}'),
('plg_system_tasknotification.failure_mail', 'plg_system_tasknotification', '', 'PLG_SYSTEM_TASK_NOTIFICATION_FAILURE_MAIL_SUBJECT', 'PLG_SYSTEM_TASK_NOTIFICATION_FAILURE_MAIL_BODY', '', '', '{\"tags\": [\"task_id\", \"task_title\", \"exit_code\", \"exec_data_time\", \"task_output\"]}'),
('plg_system_tasknotification.fatal_recovery_mail', 'plg_system_tasknotification', '', 'PLG_SYSTEM_TASK_NOTIFICATION_FATAL_MAIL_SUBJECT', 'PLG_SYSTEM_TASK_NOTIFICATION_FATAL_MAIL_BODY', '', '', '{\"tags\": [\"task_id\", \"task_title\"]}'),
('plg_system_tasknotification.orphan_mail', 'plg_system_tasknotification', '', 'PLG_SYSTEM_TASK_NOTIFICATION_ORPHAN_MAIL_SUBJECT', 'PLG_SYSTEM_TASK_NOTIFICATION_ORPHAN_MAIL_BODY', '', '', '{\"tags\": [\"task_id\", \"task_title\"]}'),
('plg_system_tasknotification.success_mail', 'plg_system_tasknotification', '', 'PLG_SYSTEM_TASK_NOTIFICATION_SUCCESS_MAIL_SUBJECT', 'PLG_SYSTEM_TASK_NOTIFICATION_SUCCESS_MAIL_BODY', '', '', '{\"tags\":[\"task_id\", \"task_title\", \"exec_data_time\", \"task_output\"]}'),
('plg_system_updatenotification.mail', 'plg_system_updatenotification', '', 'PLG_SYSTEM_UPDATENOTIFICATION_EMAIL_SUBJECT', 'PLG_SYSTEM_UPDATENOTIFICATION_EMAIL_BODY', '', '', '{\"tags\":[\"newversion\",\"curversion\",\"sitename\",\"url\",\"link\",\"releasenews\"]}'),
('plg_user_joomla.mail', 'plg_user_joomla', '', 'PLG_USER_JOOMLA_NEW_USER_EMAIL_SUBJECT', 'PLG_USER_JOOMLA_NEW_USER_EMAIL_BODY', '', '', '{\"tags\":[\"name\",\"sitename\",\"url\",\"username\",\"password\",\"email\"]}');

-- --------------------------------------------------------

--
-- Table structure for table `b5651_menu`
--

CREATE TABLE `b5651_menu` (
  `id` int NOT NULL,
  `menutype` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int UNSIGNED NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `checked_out` int UNSIGNED DEFAULT NULL COMMENT 'FK to #__users.id',
  `checked_out_time` datetime DEFAULT NULL COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int UNSIGNED NOT NULL DEFAULT '0',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint NOT NULL DEFAULT '0',
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `b5651_menu`
--

INSERT INTO `b5651_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`, `publish_up`, `publish_down`) VALUES
(1, '', 'Menu_Item_Root', 'root', '', '', '', '', 1, 0, 0, 0, NULL, NULL, 0, 0, '', 0, '', 0, 77, 0, '*', 0, NULL, NULL),
(2, 'main', 'com_banners', 'Banners', '', 'Banners', 'index.php?option=com_banners', 'component', 1, 1, 1, 3, NULL, NULL, 0, 0, 'class:bookmark', 0, '', 1, 10, 0, '*', 1, NULL, NULL),
(3, 'main', 'com_banners', 'Banners', '', 'Banners/Banners', 'index.php?option=com_banners&view=banners', 'component', 1, 2, 2, 3, NULL, NULL, 0, 0, 'class:banners', 0, '', 2, 3, 0, '*', 1, NULL, NULL),
(4, 'main', 'com_banners_categories', 'Categories', '', 'Banners/Categories', 'index.php?option=com_categories&view=categories&extension=com_banners', 'component', 1, 2, 2, 5, NULL, NULL, 0, 0, 'class:banners-cat', 0, '', 4, 5, 0, '*', 1, NULL, NULL),
(5, 'main', 'com_banners_clients', 'Clients', '', 'Banners/Clients', 'index.php?option=com_banners&view=clients', 'component', 1, 2, 2, 3, NULL, NULL, 0, 0, 'class:banners-clients', 0, '', 6, 7, 0, '*', 1, NULL, NULL),
(6, 'main', 'com_banners_tracks', 'Tracks', '', 'Banners/Tracks', 'index.php?option=com_banners&view=tracks', 'component', 1, 2, 2, 3, NULL, NULL, 0, 0, 'class:banners-tracks', 0, '', 8, 9, 0, '*', 1, NULL, NULL),
(7, 'main', 'com_contact', 'Contacts', '', 'Contacts', 'index.php?option=com_contact', 'component', 1, 1, 1, 7, NULL, NULL, 0, 0, 'class:address-book', 0, '', 11, 20, 0, '*', 1, NULL, NULL),
(8, 'main', 'com_contact_contacts', 'Contacts', '', 'Contacts/Contacts', 'index.php?option=com_contact&view=contacts', 'component', 1, 7, 2, 7, NULL, NULL, 0, 0, 'class:contact', 0, '', 12, 13, 0, '*', 1, NULL, NULL),
(9, 'main', 'com_contact_categories', 'Categories', '', 'Contacts/Categories', 'index.php?option=com_categories&view=categories&extension=com_contact', 'component', 1, 7, 2, 5, NULL, NULL, 0, 0, 'class:contact-cat', 0, '', 14, 15, 0, '*', 1, NULL, NULL),
(10, 'main', 'com_newsfeeds', 'News Feeds', '', 'News Feeds', 'index.php?option=com_newsfeeds', 'component', 1, 1, 1, 16, NULL, NULL, 0, 0, 'class:rss', 0, '', 23, 28, 0, '*', 1, NULL, NULL),
(11, 'main', 'com_newsfeeds_feeds', 'Feeds', '', 'News Feeds/Feeds', 'index.php?option=com_newsfeeds&view=newsfeeds', 'component', 1, 10, 2, 16, NULL, NULL, 0, 0, 'class:newsfeeds', 0, '', 24, 25, 0, '*', 1, NULL, NULL),
(12, 'main', 'com_newsfeeds_categories', 'Categories', '', 'News Feeds/Categories', 'index.php?option=com_categories&view=categories&extension=com_newsfeeds', 'component', 1, 10, 2, 5, NULL, NULL, 0, 0, 'class:newsfeeds-cat', 0, '', 26, 27, 0, '*', 1, NULL, NULL),
(13, 'main', 'com_finder', 'Smart Search', '', 'Smart Search', 'index.php?option=com_finder', 'component', 1, 1, 1, 23, NULL, NULL, 0, 0, 'class:search-plus', 0, '', 29, 38, 0, '*', 1, NULL, NULL),
(14, 'main', 'com_tags', 'Tags', '', 'Tags', 'index.php?option=com_tags&view=tags', 'component', 1, 1, 1, 25, NULL, NULL, 0, 1, 'class:tags', 0, '', 39, 40, 0, '', 1, NULL, NULL),
(15, 'main', 'com_associations', 'Multilingual Associations', '', 'Multilingual Associations', 'index.php?option=com_associations&view=associations', 'component', 1, 1, 1, 30, NULL, NULL, 0, 0, 'class:language', 0, '', 21, 22, 0, '*', 1, NULL, NULL),
(16, 'main', 'mod_menu_fields', 'Contact Custom Fields', '', 'Contacts/Contact Custom Fields', 'index.php?option=com_fields&context=com_contact.contact', 'component', 1, 7, 2, 29, NULL, NULL, 0, 0, 'class:messages-add', 0, '', 16, 17, 0, '*', 1, NULL, NULL),
(17, 'main', 'mod_menu_fields_group', 'Contact Custom Fields Group', '', 'Contacts/Contact Custom Fields Group', 'index.php?option=com_fields&view=groups&context=com_contact.contact', 'component', 1, 7, 2, 29, NULL, NULL, 0, 0, 'class:messages-add', 0, '', 18, 19, 0, '*', 1, NULL, NULL),
(18, 'main', 'com_finder_index', 'Smart-Search-Index', '', 'Smart Search/Smart-Search-Index', 'index.php?option=com_finder&view=index', 'component', 1, 13, 2, 23, NULL, NULL, 0, 0, 'class:finder', 0, '', 30, 31, 0, '*', 1, NULL, NULL),
(19, 'main', 'com_finder_maps', 'Smart-Search-Maps', '', 'Smart Search/Smart-Search-Maps', 'index.php?option=com_finder&view=maps', 'component', 1, 13, 2, 23, NULL, NULL, 0, 0, 'class:finder-maps', 0, '', 32, 33, 0, '*', 1, NULL, NULL),
(20, 'main', 'com_finder_filters', 'Smart-Search-Filters', '', 'Smart Search/Smart-Search-Filters', 'index.php?option=com_finder&view=filters', 'component', 1, 13, 2, 23, NULL, NULL, 0, 0, 'class:finder-filters', 0, '', 34, 35, 0, '*', 1, NULL, NULL),
(21, 'main', 'com_finder_searches', 'Smart-Search-Searches', '', 'Smart Search/Smart-Search-Searches', 'index.php?option=com_finder&view=searches', 'component', 1, 13, 2, 23, NULL, NULL, 0, 0, 'class:finder-searches', 0, '', 36, 37, 0, '*', 1, NULL, NULL),
(101, 'footer-left', 'Home', 'home', '', 'home', 'index.php?option=com_content&view=article&id=4', 'component', 1, 1, 1, 19, 135, '2023-05-03 04:56:40', 0, 1, ' ', 0, '{\"show_title\":\"0\",\"link_titles\":\"0\",\"show_intro\":\"0\",\"info_block_position\":\"\",\"info_block_show_title\":\"0\",\"show_category\":\"0\",\"link_category\":\"0\",\"show_parent_category\":\"0\",\"link_parent_category\":\"0\",\"show_author\":\"0\",\"link_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_publish_date\":\"0\",\"show_item_navigation\":\"0\",\"show_hits\":\"0\",\"show_tags\":\"0\",\"show_noauth\":\"0\",\"urls_position\":-1,\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"0\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\"}', 41, 42, 1, '*', 0, NULL, NULL),
(102, 'main', 'WB_WINBOARD', 'wb-winboard', '', 'wb-winboard', 'index.php?option=com_winboard', 'component', 1, 1, 1, 231, NULL, NULL, 0, 1, 'class:component', 0, '{}', 43, 44, 0, '', 1, NULL, NULL),
(103, 'hidden-menu', 'Owner registration', 'owner-registration', '', 'owner-registration', 'index.php?option=com_winboard&view=owner&layout=registration', 'component', 1, 1, 1, 231, NULL, NULL, 0, 5, ' ', 0, '{\"left_panel\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"Owner Registration\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\"}', 45, 46, 0, '*', 0, NULL, NULL),
(104, 'hidden-menu', 'Owner dashboard', 'owner-dashboard', '', 'owner-dashboard', 'index.php?option=com_winboard&view=owner', 'component', 1, 1, 1, 231, NULL, NULL, 0, 7, ' ', 0, '{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\"}', 47, 48, 0, '*', 0, NULL, NULL),
(105, 'hidden-menu', 'Advertiser registration', 'advertiser-registration', '', 'advertiser-registration', 'index.php?option=com_winboard&view=advertiser&layout=registration', 'component', 1, 1, 1, 231, NULL, NULL, 0, 5, ' ', 0, '{\"left_panel\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"Advertiser Registration\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\"}', 49, 50, 0, '*', 0, NULL, NULL),
(106, 'hidden-menu', 'Advertiser profile', 'advertiser-profile', '', 'advertiser-profile', 'index.php?option=com_winboard&view=advertiser', 'component', 1, 1, 1, 231, NULL, NULL, 0, 8, ' ', 0, '{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\"}', 51, 52, 0, '*', 0, NULL, NULL),
(107, 'hidden-menu', 'Admin dashboard', 'admin-dashboard', '', 'admin-dashboard', 'index.php?option=com_winboard&view=admin', 'component', 1, 1, 1, 231, NULL, NULL, 0, 6, ' ', 0, '{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\"}', 53, 54, 0, '*', 0, NULL, NULL),
(108, 'footer-left', 'About', 'about', '', 'about', 'index.php?option=com_content&view=article&id=1', 'component', 1, 1, 1, 19, NULL, NULL, 0, 1, ' ', 0, '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\"}', 55, 56, 0, '*', 0, NULL, NULL),
(109, 'footer-left', 'Terms', 'terms', '', 'terms', 'index.php?option=com_content&view=article&id=2', 'component', 1, 1, 1, 19, NULL, NULL, 0, 1, ' ', 0, '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\"}', 57, 58, 0, '*', 0, NULL, NULL),
(110, 'footer-right', 'Support', 'support', '', 'support', 'index.php?option=com_content&view=article&id=2', 'component', 1, 1, 1, 19, NULL, NULL, 0, 1, ' ', 0, '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\"}', 59, 60, 0, '*', 0, NULL, NULL),
(111, 'footer-right', 'Privacy', 'privacy', '', 'privacy', 'index.php?option=com_content&view=article&id=3', 'component', 1, 1, 1, 19, NULL, NULL, 0, 1, ' ', 0, '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\"}', 61, 62, 0, '*', 0, NULL, NULL),
(112, 'footer-right', 'Contact', 'contact', '', 'contact', 'index.php?option=com_content&view=article&id=3', 'component', 1, 1, 1, 19, NULL, NULL, 0, 1, ' ', 0, '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\"}', 63, 64, 0, '*', 0, NULL, NULL),
(113, 'hidden-menu', 'Login', 'login', '', 'login', 'index.php?option=com_users&view=login', 'component', 1, 1, 1, 22, NULL, NULL, 0, 1, ' ', 0, '{\"loginredirectchoice\":\"1\",\"login_redirect_url\":\"\",\"login_redirect_menuitem\":\"\",\"logindescription_show\":\"1\",\"login_description\":\"\",\"login_image\":\"\",\"login_image_alt\":\"\",\"logoutredirectchoice\":\"1\",\"logout_redirect_url\":\"\",\"logout_redirect_menuitem\":\"\",\"logoutdescription_show\":\"1\",\"logout_description\":\"\",\"logout_image\":\"\",\"logout_image_alt\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\"}', 65, 66, 0, '*', 0, NULL, NULL),
(114, 'hidden-menu', 'Listing', 'listing', '', 'listing', 'index.php?option=com_winboard&view=search', 'component', 1, 1, 1, 231, NULL, NULL, 0, 1, ' ', 0, '{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\"}', 67, 68, 0, '*', 0, NULL, NULL),
(115, 'main', 'FWS_FWSYNCMANAGER', 'fws-fwsyncmanager', '', 'fws-fwsyncmanager', 'index.php?option=com_fwsyncmanager', 'component', 1, 1, 1, 242, NULL, NULL, 0, 1, 'class:component', 0, '{}', 69, 74, 0, '', 1, NULL, NULL),
(116, 'main', 'FWS_SYNCHRONIZATIONS', 'fws-synchronizations', '', 'fws-fwsyncmanager/fws-synchronizations', 'index.php?option=com_fwsyncmanager&view=fwsyncmanager', 'component', 1, 115, 2, 242, NULL, NULL, 0, 1, 'class:component', 0, '{}', 70, 71, 0, '', 1, NULL, NULL),
(117, 'main', 'FWS_SETTINGS', 'fws-settings', '', 'fws-fwsyncmanager/fws-settings', 'index.php?option=com_fwsyncmanager&view=config', 'component', 1, 115, 2, 242, NULL, NULL, 0, 1, 'class:component', 0, '{}', 72, 73, 0, '', 1, NULL, NULL),
(118, 'main', 'COM_AKEEBA', 'com-akeeba', '', 'com-akeeba', 'index.php?option=com_akeeba', 'component', 1, 1, 1, 254, NULL, NULL, 0, 1, 'class:component', 0, '{}', 75, 76, 0, '', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `b5651_menu_types`
--

CREATE TABLE `b5651_menu_types` (
  `id` int UNSIGNED NOT NULL,
  `asset_id` int UNSIGNED NOT NULL DEFAULT '0',
  `menutype` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `b5651_menu_types`
--

INSERT INTO `b5651_menu_types` (`id`, `asset_id`, `menutype`, `title`, `description`, `client_id`) VALUES
(1, 54, 'footer-left', 'Footer left', 'The main menu for the site', 0),
(2, 95, 'hidden-menu', 'Hidden menu', '', 0),
(3, 96, 'footer-right', 'Footer right', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `b5651_messages`
--

CREATE TABLE `b5651_messages` (
  `message_id` int UNSIGNED NOT NULL,
  `user_id_from` int UNSIGNED NOT NULL DEFAULT '0',
  `user_id_to` int UNSIGNED NOT NULL DEFAULT '0',
  `folder_id` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL,
  `state` tinyint NOT NULL DEFAULT '0',
  `priority` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `b5651_messages_cfg`
--

CREATE TABLE `b5651_messages_cfg` (
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cfg_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `b5651_modules`
--

CREATE TABLE `b5651_modules` (
  `id` int NOT NULL,
  `asset_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ordering` int NOT NULL DEFAULT '0',
  `position` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `checked_out` int UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `published` tinyint NOT NULL DEFAULT '0',
  `module` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access` int UNSIGNED NOT NULL DEFAULT '0',
  `showtitle` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint NOT NULL DEFAULT '0',
  `language` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `b5651_modules`
--

INSERT INTO `b5651_modules` (`id`, `asset_id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES
(1, 39, 'Footer menu left', '', '', 1, 'sidebar-right', NULL, NULL, NULL, NULL, 1, 'mod_menu', 1, 0, '{\"menutype\":\"footer-left\",\"base\":\"\",\"startLevel\":1,\"endLevel\":0,\"showAllChildren\":1,\"tag_id\":\"\",\"class_sfx\":\" uk-grid uk-flex-left\",\"window_open\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\",\"yoo_config\":\"{\\\"visibility\\\":\\\"\\\",\\\"style\\\":\\\"\\\",\\\"title_style\\\":\\\"\\\",\\\"title_decoration\\\":\\\"\\\",\\\"text_align\\\":\\\"\\\",\\\"text_align_breakpoint\\\":\\\"\\\",\\\"text_align_fallback\\\":\\\"\\\",\\\"width\\\":\\\"\\\",\\\"maxwidth\\\":\\\"\\\",\\\"list_style\\\":\\\"\\\",\\\"link_style\\\":\\\"\\\",\\\"menu_type\\\":\\\"\\\",\\\"menu_style\\\":\\\"default\\\",\\\"menu_image_margin\\\":true,\\\"menu_image_align\\\":\\\"center\\\"}\"}', 0, '*'),
(2, 40, 'Login', '', '', 1, 'login', NULL, NULL, NULL, NULL, 1, 'mod_login', 1, 1, '', 1, '*'),
(3, 41, 'Popular Articles', '', '', 3, 'cpanel', NULL, NULL, NULL, NULL, 1, 'mod_popular', 3, 1, '{\"count\":\"5\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\", \"bootstrap_size\": \"12\",\"header_tag\":\"h2\"}', 1, '*'),
(4, 42, 'Recently Added Articles', '', '', 4, 'cpanel', NULL, NULL, NULL, NULL, 1, 'mod_latest', 3, 1, '{\"count\":\"5\",\"ordering\":\"c_dsc\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\", \"bootstrap_size\": \"12\",\"header_tag\":\"h2\"}', 1, '*'),
(8, 43, 'Toolbar', '', '', 1, 'toolbar', NULL, NULL, NULL, NULL, 1, 'mod_toolbar', 3, 1, '', 1, '*'),
(9, 44, 'Notifications', '', '', 3, 'icon', NULL, NULL, NULL, NULL, 1, 'mod_quickicon', 3, 1, '{\"context\":\"update_quickicon\",\"header_icon\":\"icon-sync\",\"show_jupdate\":\"1\",\"show_eupdate\":\"1\",\"show_oupdate\":\"1\",\"show_privacy\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"style\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\"}', 1, '*'),
(10, 45, 'Logged-in Users', '', '', 2, 'cpanel', NULL, NULL, NULL, NULL, 1, 'mod_logged', 3, 1, '{\"count\":\"5\",\"name\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\", \"bootstrap_size\": \"12\",\"header_tag\":\"h2\"}', 1, '*'),
(12, 46, 'Admin Menu', '', '', 1, 'menu', NULL, NULL, NULL, NULL, 1, 'mod_menu', 3, 1, '{\"layout\":\"\",\"moduleclass_sfx\":\"\",\"shownew\":\"1\",\"showhelp\":\"1\",\"cache\":\"0\"}', 1, '*'),
(15, 49, 'Title', '', '', 1, 'title', NULL, NULL, NULL, NULL, 1, 'mod_title', 3, 1, '', 1, '*'),
(16, 50, 'Login Form', '', '', 7, 'sidebar-right', NULL, NULL, NULL, NULL, 1, 'mod_login', 1, 1, '{\"greeting\":\"1\",\"name\":\"0\"}', 0, '*'),
(17, 51, 'Breadcrumbs', '', '', 1, 'breadcrumbs', NULL, NULL, NULL, NULL, 1, 'mod_breadcrumbs', 1, 1, '{\"moduleclass_sfx\":\"\",\"showHome\":\"1\",\"homeText\":\"\",\"showComponent\":\"1\",\"separator\":\"\",\"cache\":\"0\",\"cache_time\":\"0\",\"cachemode\":\"itemid\"}', 0, '*'),
(79, 52, 'Multilanguage status', '', '', 2, 'status', NULL, NULL, NULL, NULL, 1, 'mod_multilangstatus', 3, 1, '{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}', 1, '*'),
(86, 53, 'Joomla Version', '', '', 1, 'status', NULL, NULL, NULL, NULL, 1, 'mod_version', 3, 1, '{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}', 1, '*'),
(87, 55, 'Sample Data', '', '', 0, 'cpanel', NULL, NULL, NULL, NULL, 0, 'mod_sampledata', 6, 1, '{\"bootstrap_size\": \"12\",\"header_tag\":\"h2\"}', 1, '*'),
(88, 67, 'Latest Actions', '', '', 0, 'cpanel', NULL, NULL, NULL, NULL, 1, 'mod_latestactions', 6, 1, '{\"bootstrap_size\": \"12\",\"header_tag\":\"h2\"}', 1, '*'),
(89, 68, 'Privacy Dashboard', '', '', 0, 'cpanel', NULL, NULL, NULL, NULL, 1, 'mod_privacy_dashboard', 6, 1, '{\"bootstrap_size\": \"12\",\"header_tag\":\"h2\"}', 1, '*'),
(90, 89, 'Login Support', '', '', 1, 'sidebar', NULL, NULL, NULL, NULL, 1, 'mod_loginsupport', 1, 1, '{\"forum_url\":\"https://forum.joomla.org/\",\"documentation_url\":\"https://docs.joomla.org/\",\"news_url\":\"https://www.joomla.org/announcements.html\",\"automatic_title\":1,\"prepare_content\":1,\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 1, '*'),
(91, 72, 'System Dashboard', '', '', 1, 'cpanel-system', NULL, NULL, NULL, NULL, 1, 'mod_submenu', 1, 0, '{\"menutype\":\"*\",\"preset\":\"system\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\",\"style\":\"System-none\"}', 1, '*'),
(92, 73, 'Content Dashboard', '', '', 1, 'cpanel-content', NULL, NULL, NULL, NULL, 1, 'mod_submenu', 1, 0, '{\"menutype\":\"*\",\"preset\":\"content\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\",\"style\":\"System-none\"}', 1, '*'),
(93, 74, 'Menus Dashboard', '', '', 1, 'cpanel-menus', NULL, NULL, NULL, NULL, 1, 'mod_submenu', 1, 0, '{\"menutype\":\"*\",\"preset\":\"menus\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\",\"style\":\"System-none\"}', 1, '*'),
(94, 75, 'Components Dashboard', '', '', 1, 'cpanel-components', NULL, NULL, NULL, NULL, 1, 'mod_submenu', 1, 0, '{\"menutype\":\"*\",\"preset\":\"components\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\",\"style\":\"System-none\"}', 1, '*'),
(95, 76, 'Users Dashboard', '', '', 1, 'cpanel-users', NULL, NULL, NULL, NULL, 1, 'mod_submenu', 1, 0, '{\"menutype\":\"*\",\"preset\":\"users\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\",\"style\":\"System-none\"}', 1, '*'),
(96, 86, 'Popular Articles', '', '', 3, 'cpanel-content', NULL, NULL, NULL, NULL, 1, 'mod_popular', 3, 1, '{\"count\":\"5\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\", \"bootstrap_size\": \"12\",\"header_tag\":\"h2\"}', 1, '*'),
(97, 87, 'Recently Added Articles', '', '', 4, 'cpanel-content', NULL, NULL, NULL, NULL, 1, 'mod_latest', 3, 1, '{\"count\":\"5\",\"ordering\":\"c_dsc\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\", \"bootstrap_size\": \"12\",\"header_tag\":\"h2\"}', 1, '*'),
(98, 88, 'Logged-in Users', '', '', 2, 'cpanel-users', NULL, NULL, NULL, NULL, 1, 'mod_logged', 3, 1, '{\"count\":\"5\",\"name\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\", \"bootstrap_size\": \"12\",\"header_tag\":\"h2\"}', 1, '*'),
(99, 77, 'Frontend Link', '', '', 5, 'status', NULL, NULL, NULL, NULL, 1, 'mod_frontend', 1, 1, '', 1, '*'),
(100, 78, 'Messages', '', '', 4, 'status', NULL, NULL, NULL, NULL, 1, 'mod_messages', 3, 1, '', 1, '*'),
(101, 79, 'Post Install Messages', '', '', 3, 'status', NULL, NULL, NULL, NULL, 1, 'mod_post_installation_messages', 3, 1, '', 1, '*'),
(102, 80, 'User Status', '', '', 6, 'status', NULL, NULL, NULL, NULL, 1, 'mod_user', 3, 1, '', 1, '*'),
(103, 70, 'Site', '', '', 1, 'icon', NULL, NULL, NULL, NULL, 1, 'mod_quickicon', 1, 1, '{\"context\":\"site_quickicon\",\"header_icon\":\"icon-desktop\",\"show_users\":\"1\",\"show_articles\":\"1\",\"show_categories\":\"1\",\"show_media\":\"1\",\"show_menuItems\":\"1\",\"show_modules\":\"1\",\"show_plugins\":\"1\",\"show_templates\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"style\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\"}', 1, '*'),
(104, 71, 'System', '', '', 2, 'icon', NULL, NULL, NULL, NULL, 1, 'mod_quickicon', 1, 1, '{\"context\":\"system_quickicon\",\"header_icon\":\"icon-wrench\",\"show_global\":\"1\",\"show_checkin\":\"1\",\"show_cache\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"style\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\"}', 1, '*'),
(105, 82, '3rd Party', '', '', 4, 'icon', NULL, NULL, NULL, NULL, 1, 'mod_quickicon', 1, 1, '{\"context\":\"mod_quickicon\",\"header_icon\":\"icon-boxes\",\"load_plugins\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"style\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\"}', 1, '*'),
(106, 83, 'Help Dashboard', '', '', 1, 'cpanel-help', NULL, NULL, NULL, NULL, 1, 'mod_submenu', 1, 0, '{\"menutype\":\"*\",\"preset\":\"help\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"style\":\"System-none\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\"}', 1, '*'),
(107, 84, 'Privacy Requests', '', '', 1, 'cpanel-privacy', NULL, NULL, NULL, NULL, 1, 'mod_privacy_dashboard', 1, 1, '{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"cachemode\":\"static\",\"style\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\"}', 1, '*'),
(108, 85, 'Privacy Status', '', '', 1, 'cpanel-privacy', NULL, NULL, NULL, NULL, 1, 'mod_privacy_status', 1, 1, '{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"cachemode\":\"static\",\"style\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\"}', 1, '*'),
(109, 92, 'Builder', '', '', 1, '', NULL, NULL, NULL, NULL, 0, 'mod_yootheme_builder', 1, 1, '', 0, '*'),
(110, 93, 'Login buttons', '', '{\"type\":\"fragment\",\"children\":[{\"type\":\"row\",\"props\":{\"layout\":\"\"},\"children\":[{\"type\":\"column\",\"props\":{\"position_sticky_breakpoint\":\"m\",\"image_position\":\"center-center\",\"media_overlay_gradient\":\"\",\"width_medium\":\"\"},\"children\":[{\"type\":\"button\",\"props\":{\"grid_column_gap\":\"small\",\"grid_row_gap\":\"small\",\"margin\":\"default\"},\"children\":[{\"type\":\"button_item\",\"props\":{\"button_style\":\"secondary\",\"icon_align\":\"left\",\"content\":\"Login\",\"link\":\"index.php?Itemid=104\"}},{\"type\":\"button_item\",\"props\":{\"button_style\":\"primary\",\"icon_align\":\"left\",\"content\":\"Register\",\"link_target\":\"\",\"link\":\"index.php?Itemid=103\"}}]}]}]}],\"version\":\"3.0.9\",\"props\":[]}', 1, 'header', NULL, NULL, NULL, NULL, 0, 'mod_yootheme_builder', 1, 1, '{\"layout\":\"_:default\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(111, 94, 'Winboard When/Where', '', NULL, 1, 'navbar', NULL, NULL, NULL, NULL, 1, 'mod_winboardwhere', 1, 0, '{\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\",\"yoo_config\":\"{\\\"visibility\\\":\\\"\\\",\\\"style\\\":\\\"\\\",\\\"title_style\\\":\\\"\\\",\\\"title_decoration\\\":\\\"\\\",\\\"text_align\\\":\\\"\\\",\\\"text_align_breakpoint\\\":\\\"\\\",\\\"text_align_fallback\\\":\\\"\\\",\\\"width\\\":\\\"\\\",\\\"maxwidth\\\":\\\"\\\",\\\"list_style\\\":\\\"\\\",\\\"link_style\\\":\\\"\\\",\\\"menu_type\\\":\\\"\\\",\\\"menu_style\\\":\\\"default\\\",\\\"menu_image_margin\\\":true,\\\"menu_image_align\\\":\\\"center\\\"}\"}', 0, '*'),
(112, 100, 'Footer menu right', '', NULL, 1, '', NULL, NULL, NULL, NULL, 1, 'mod_menu', 1, 0, '{\"menutype\":\"footer-right\",\"base\":\"\",\"startLevel\":1,\"endLevel\":0,\"showAllChildren\":1,\"tag_id\":\"\",\"class_sfx\":\" uk-grid uk-flex-right\",\"window_open\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\",\"yoo_config\":\"{\\\"visibility\\\":\\\"\\\",\\\"style\\\":\\\"\\\",\\\"title_style\\\":\\\"\\\",\\\"title_decoration\\\":\\\"\\\",\\\"text_align\\\":\\\"\\\",\\\"text_align_breakpoint\\\":\\\"\\\",\\\"text_align_fallback\\\":\\\"\\\",\\\"width\\\":\\\"\\\",\\\"maxwidth\\\":\\\"\\\",\\\"list_style\\\":\\\"\\\",\\\"link_style\\\":\\\"\\\",\\\"menu_type\\\":\\\"\\\",\\\"menu_style\\\":\\\"default\\\",\\\"menu_image_margin\\\":true,\\\"menu_image_align\\\":\\\"center\\\"}\"}', 0, '*'),
(113, 101, 'Winboard Login/Register buttons', '', NULL, 1, 'header', NULL, NULL, NULL, NULL, 1, 'mod_winboardlogin', 1, 0, '{\"itemid_login\":\"113\",\"itemid_register_advertiser\":\"105\",\"itemid_register_owner\":\"103\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\",\"yoo_config\":\"{\\\"visibility\\\":\\\"\\\",\\\"style\\\":\\\"\\\",\\\"title_style\\\":\\\"\\\",\\\"title_decoration\\\":\\\"\\\",\\\"text_align\\\":\\\"\\\",\\\"text_align_breakpoint\\\":\\\"\\\",\\\"text_align_fallback\\\":\\\"\\\",\\\"width\\\":\\\"\\\",\\\"maxwidth\\\":\\\"\\\",\\\"list_style\\\":\\\"\\\",\\\"link_style\\\":\\\"\\\",\\\"menu_type\\\":\\\"\\\",\\\"menu_style\\\":\\\"default\\\",\\\"menu_image_margin\\\":true,\\\"menu_image_align\\\":\\\"center\\\"}\"}', 0, '*'),
(114, 102, 'Winboard Login/Register buttons Mobile', '', NULL, 1, 'dialog-mobile', NULL, NULL, NULL, NULL, 1, 'mod_winboardlogin', 1, 0, '{\"itemid_login\":\"113\",\"itemid_register_advertiser\":\"105\",\"itemid_register_owner\":\"103\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\",\"yoo_config\":\"{\\\"visibility\\\":\\\"\\\",\\\"style\\\":\\\"\\\",\\\"title_style\\\":\\\"\\\",\\\"title_decoration\\\":\\\"\\\",\\\"text_align\\\":\\\"\\\",\\\"text_align_breakpoint\\\":\\\"\\\",\\\"text_align_fallback\\\":\\\"\\\",\\\"width\\\":\\\"\\\",\\\"maxwidth\\\":\\\"\\\",\\\"list_style\\\":\\\"\\\",\\\"link_style\\\":\\\"\\\",\\\"menu_type\\\":\\\"\\\",\\\"menu_style\\\":\\\"default\\\",\\\"menu_image_margin\\\":true,\\\"menu_image_align\\\":\\\"center\\\"}\"}', 0, '*'),
(115, 103, 'Winboard When/Where Mobile', '', NULL, 1, 'dialog-mobile', NULL, NULL, NULL, NULL, 1, 'mod_winboardwhere', 1, 0, '{\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\",\"yoo_config\":\"{\\\"visibility\\\":\\\"\\\",\\\"style\\\":\\\"\\\",\\\"title_style\\\":\\\"\\\",\\\"title_decoration\\\":\\\"\\\",\\\"text_align\\\":\\\"\\\",\\\"text_align_breakpoint\\\":\\\"\\\",\\\"text_align_fallback\\\":\\\"\\\",\\\"width\\\":\\\"\\\",\\\"maxwidth\\\":\\\"\\\",\\\"list_style\\\":\\\"\\\",\\\"link_style\\\":\\\"\\\",\\\"menu_type\\\":\\\"\\\",\\\"menu_style\\\":\\\"default\\\",\\\"menu_image_margin\\\":true,\\\"menu_image_align\\\":\\\"center\\\"}\"}', 0, '*'),
(116, 104, 'Home Banner + Slider', '', '{\"type\":\"layout\",\"children\":[{\"type\":\"section\",\"props\":{\"style\":\"default\",\"width\":\"default\",\"vertical_align\":\"\",\"title_position\":\"top-left\",\"title_rotation\":\"left\",\"title_breakpoint\":\"xl\",\"image_position\":\"center-center\",\"image\":\"images\\/site\\/home_bg.jpg\",\"height\":\"full\",\"image_size\":\"cover\",\"padding\":\"small\"},\"children\":[{\"type\":\"row\",\"props\":{\"layout\":\"1-3,1-3,1-3\",\"id\":\"home-top-row\"},\"children\":[{\"type\":\"column\",\"props\":{\"position_sticky_breakpoint\":\"m\",\"image_position\":\"center-center\",\"media_overlay_gradient\":\"\",\"width_medium\":\"1-3\"},\"children\":[{\"type\":\"image\",\"props\":{\"margin\":\"default\",\"image_svg_color\":\"emphasis\",\"image\":\"images\\/site\\/logo_home.png\",\"image_height\":\"34\"}}]},{\"type\":\"column\",\"props\":{\"position_sticky_breakpoint\":\"m\",\"image_position\":\"center-center\",\"media_overlay_gradient\":\"\",\"width_medium\":\"1-3\"},\"children\":[{\"type\":\"module\",\"props\":{\"menu_style\":\"default\",\"menu_image_margin\":true,\"menu_image_align\":\"center\",\"menu_type\":\"nav\",\"module\":\"111\",\"type\":\"mod_winboardwhere\",\"class\":\"uk-text-center\"}}]},{\"type\":\"column\",\"props\":{\"position_sticky_breakpoint\":\"m\",\"image_position\":\"center-center\",\"media_overlay_gradient\":\"\",\"width_medium\":\"1-3\"},\"children\":[{\"type\":\"module\",\"props\":{\"menu_style\":\"default\",\"menu_image_margin\":true,\"menu_image_align\":\"center\",\"menu_type\":\"nav\",\"module\":\"113\",\"type\":\"mod_winboardlogin\",\"text_align\":\"right\"}}]}]},{\"type\":\"row\",\"props\":[],\"children\":[{\"type\":\"column\",\"props\":{\"position_sticky_breakpoint\":\"m\",\"image_position\":\"center-center\",\"media_overlay_gradient\":\"\"},\"children\":[{\"type\":\"headline\",\"props\":{\"title_element\":\"div\",\"content\":\"appear, anywhere.\",\"id\":\"home-banner-text\",\"position\":\"relative\",\"maxwidth\":\"\",\"position_left\":\"\",\"position_top\":\"\",\"position_z_index\":\"\"}},{\"type\":\"panel\",\"props\":{\"link_text\":\"Discover\",\"title_hover_style\":\"reset\",\"title_element\":\"h3\",\"title_align\":\"top\",\"title_grid_width\":\"1-2\",\"title_grid_breakpoint\":\"m\",\"meta_style\":\"text-meta\",\"meta_align\":\"below-title\",\"meta_element\":\"div\",\"content_column_breakpoint\":\"m\",\"icon_width\":80,\"image_align\":\"top\",\"image_grid_width\":\"1-2\",\"image_grid_breakpoint\":\"m\",\"image_svg_color\":\"emphasis\",\"link_style\":\"default\",\"margin\":\"default\",\"title\":\"\",\"id\":\"home-banner-card\",\"content\":\"<p>We are more than just billboards. We are about putting your brand in places you\'ve never considered.<\\/p>\",\"link\":\"index.php?Itemid=114\",\"position\":\"relative\",\"position_left\":\"\",\"position_top\":\"\",\"panel_style\":\"card-default\",\"panel_padding\":\"small\",\"panel_link\":true,\"maxwidth\":\"\"}}]}]}]},{\"type\":\"section\",\"props\":{\"style\":\"default\",\"width\":\"default\",\"vertical_align\":\"middle\",\"title_position\":\"top-left\",\"title_rotation\":\"left\",\"title_breakpoint\":\"xl\",\"image_position\":\"center-center\",\"padding\":\"large\"},\"children\":[{\"type\":\"row\",\"props\":[],\"children\":[{\"type\":\"column\",\"props\":{\"position_sticky_breakpoint\":\"m\",\"image_position\":\"center-center\",\"media_overlay_gradient\":\"\"},\"children\":[{\"name\":\"Panel Slider Image Left\",\"type\":\"panel-slider\",\"children\":[{\"type\":\"panel-slider_item\",\"props\":{\"content\":\"<p>Location: Monaco<br \\/>Size: 300sqm<br \\/>Avail: 1 week<br \\/>Dates: 2023 Grand Prix<br \\/>Rate:\\u00a0POA<\\/p>\",\"image\":\"images\\/slider\\/winboardslider1.jpg\",\"image_alt\":\"\",\"link\":\"#\",\"meta\":\"\",\"title\":\"Featured site\",\"link_text\":\"ENQUIRE\"}},{\"type\":\"panel-slider_item\",\"props\":{\"content\":\"<p>Location:\\u00a0Paris<br \\/>Size: 300sqm<br \\/>Avail: 1 week<br \\/>Dates: 2023\\u00a0Dec 1-30<br \\/>Rate:\\u00a0POA<\\/p>\",\"image\":\"images\\/slider\\/winboardslider2.jpg\",\"image_alt\":\"\",\"link\":\"#\",\"meta\":\"\",\"title\":\"Featured site\",\"link_text\":\"ENQUIRE\"}},{\"type\":\"panel-slider_item\",\"props\":{\"content\":\"<p>Location:\\u00a0Giza<br \\/>Size: 300sqm<br \\/>Avail: 1 week<br \\/>Dates: 2023\\u00a0August 1-20<br \\/>Rate:\\u00a0POA<\\/p>\",\"image\":\"images\\/slider\\/winboardslider3.jpg\",\"image_alt\":\"\",\"link\":\"#\",\"meta\":\"\",\"title\":\"Featured site\",\"link_text\":\"ENQUIRE\"}}],\"props\":{\"container_padding_remove\":true,\"content_column_breakpoint\":\"m\",\"icon_width\":80,\"image_align\":\"left\",\"image_grid_breakpoint\":\"s\",\"image_grid_column_gap\":\"\",\"image_grid_width\":\"4-5\",\"image_link\":true,\"image_svg_color\":\"emphasis\",\"image_vertical_align\":false,\"image_width\":\"\",\"link_margin\":\"\",\"link_style\":\"primary\",\"link_text\":\"Read More\",\"margin\":\"default\",\"meta_align\":\"above-title\",\"meta_element\":\"div\",\"meta_margin\":\"remove\",\"meta_style\":\"text-meta\",\"nav\":\"dotnav\",\"nav_align\":\"center\",\"nav_breakpoint\":\"\",\"nav_margin\":\"medium\",\"panel_card_match\":true,\"panel_card_offset\":true,\"panel_image_no_padding\":true,\"panel_link\":false,\"show_content\":true,\"show_image\":true,\"show_link\":true,\"show_meta\":false,\"show_title\":true,\"slidenav\":\"bottom-right\",\"slidenav_breakpoint\":\"xl\",\"slidenav_color\":\"\",\"slidenav_margin\":\"medium\",\"slidenav_outside_breakpoint\":\"xl\",\"slider_autoplay_pause\":true,\"slider_center\":false,\"slider_gap\":\"large\",\"slider_sets\":true,\"slider_width\":\"fixed\",\"slider_width_default\":\"1-1\",\"slider_width_medium\":\"\",\"slider_width_small\":\"\",\"title_align\":\"top\",\"title_element\":\"h3\",\"title_grid_breakpoint\":\"m\",\"title_grid_width\":\"1-2\",\"title_hover_style\":\"reset\",\"title_link\":true,\"title_margin\":\"small\",\"title_style\":\"h2\",\"panel_style\":\"\",\"id\":\"home-slider\",\"slider_autoplay\":true}}]}]}]}],\"version\":\"3.0.22\",\"props\":[]}', 1, 'top', NULL, NULL, NULL, NULL, 1, 'mod_yootheme_builder', 1, 1, '{\"layout\":\"_:default\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(117, 105, 'Winboard Frontpage Listing', '', NULL, 1, '', NULL, NULL, NULL, NULL, 1, 'mod_winboard', 1, 0, '{\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\",\"yoo_config\":\"{\\\"visibility\\\":\\\"\\\",\\\"style\\\":\\\"\\\",\\\"title_style\\\":\\\"\\\",\\\"title_decoration\\\":\\\"\\\",\\\"text_align\\\":\\\"\\\",\\\"text_align_breakpoint\\\":\\\"\\\",\\\"text_align_fallback\\\":\\\"\\\",\\\"width\\\":\\\"\\\",\\\"maxwidth\\\":\\\"\\\",\\\"list_style\\\":\\\"\\\",\\\"link_style\\\":\\\"\\\",\\\"menu_type\\\":\\\"\\\",\\\"menu_style\\\":\\\"default\\\",\\\"menu_image_margin\\\":true,\\\"menu_image_align\\\":\\\"center\\\"}\"}', 0, '*');

-- --------------------------------------------------------

--
-- Table structure for table `b5651_modules_menu`
--

CREATE TABLE `b5651_modules_menu` (
  `moduleid` int NOT NULL DEFAULT '0',
  `menuid` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `b5651_modules_menu`
--

INSERT INTO `b5651_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(12, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(79, 0),
(86, 0),
(87, 0),
(88, 0),
(89, 0),
(90, 0),
(91, 0),
(92, 0),
(93, 0),
(94, 0),
(95, 0),
(96, 0),
(97, 0),
(98, 0),
(99, 0),
(100, 0),
(101, 0),
(102, 0),
(103, 0),
(104, 0),
(105, 0),
(106, 0),
(107, 0),
(108, 0),
(110, 0),
(111, 0),
(112, 0),
(113, 0),
(114, 0),
(115, 0),
(116, 101),
(117, 101);

-- --------------------------------------------------------

--
-- Table structure for table `b5651_newsfeeds`
--

CREATE TABLE `b5651_newsfeeds` (
  `catid` int NOT NULL DEFAULT '0',
  `id` int UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `link` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` tinyint NOT NULL DEFAULT '0',
  `numarticles` int UNSIGNED NOT NULL DEFAULT '1',
  `cache_time` int UNSIGNED NOT NULL DEFAULT '3600',
  `checked_out` int UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `ordering` int NOT NULL DEFAULT '0',
  `rtl` tinyint NOT NULL DEFAULT '0',
  `access` int UNSIGNED NOT NULL DEFAULT '0',
  `language` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int UNSIGNED NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL,
  `modified_by` int UNSIGNED NOT NULL DEFAULT '0',
  `metakey` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `metadesc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int UNSIGNED NOT NULL DEFAULT '1',
  `hits` int UNSIGNED NOT NULL DEFAULT '0',
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `b5651_overrider`
--

CREATE TABLE `b5651_overrider` (
  `id` int NOT NULL COMMENT 'Primary Key',
  `constant` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `string` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `b5651_postinstall_messages`
--

CREATE TABLE `b5651_postinstall_messages` (
  `postinstall_message_id` bigint UNSIGNED NOT NULL,
  `extension_id` bigint NOT NULL DEFAULT '700' COMMENT 'FK to #__extensions',
  `title_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for the title',
  `description_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for description',
  `action_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language_extension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'com_postinstall' COMMENT 'Extension holding lang keys',
  `language_client_id` tinyint NOT NULL DEFAULT '1',
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'link' COMMENT 'Message type - message, link, action',
  `action_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'RAD URI to the PHP file containing action method',
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'Action method name or URL',
  `condition_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'RAD URI to file holding display condition method',
  `condition_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Display condition method, must return boolean',
  `version_introduced` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3.2.0' COMMENT 'Version when this message was introduced',
  `enabled` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `b5651_postinstall_messages`
--

INSERT INTO `b5651_postinstall_messages` (`postinstall_message_id`, `extension_id`, `title_key`, `description_key`, `action_key`, `language_extension`, `language_client_id`, `type`, `action_file`, `action`, `condition_file`, `condition_method`, `version_introduced`, `enabled`) VALUES
(2, 220, 'COM_CPANEL_WELCOME_BEGINNERS_TITLE', 'COM_CPANEL_WELCOME_BEGINNERS_MESSAGE', '', 'com_cpanel', 1, 'message', '', '', '', '', '3.2.0', 0),
(3, 220, 'COM_CPANEL_MSG_STATS_COLLECTION_TITLE', 'COM_CPANEL_MSG_STATS_COLLECTION_BODY', '', 'com_cpanel', 1, 'message', '', '', 'admin://components/com_admin/postinstall/statscollection.php', 'admin_postinstall_statscollection_condition', '3.5.0', 0),
(4, 220, 'PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME', 'PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME_BODY', 'PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME_ACTION', 'plg_system_updatenotification', 1, 'action', 'site://plugins/system/updatenotification/postinstall/updatecachetime.php', 'updatecachetime_postinstall_action', 'site://plugins/system/updatenotification/postinstall/updatecachetime.php', 'updatecachetime_postinstall_condition', '3.6.3', 0),
(5, 220, 'PLG_SYSTEM_HTTPHEADERS_POSTINSTALL_INTRODUCTION_TITLE', 'PLG_SYSTEM_HTTPHEADERS_POSTINSTALL_INTRODUCTION_BODY', 'PLG_SYSTEM_HTTPHEADERS_POSTINSTALL_INTRODUCTION_ACTION', 'plg_system_httpheaders', 1, 'action', 'site://plugins/system/httpheaders/postinstall/introduction.php', 'httpheaders_postinstall_action', 'site://plugins/system/httpheaders/postinstall/introduction.php', 'httpheaders_postinstall_condition', '4.0.0', 0),
(6, 220, 'COM_USERS_POSTINSTALL_MULTIFACTORAUTH_TITLE', 'COM_USERS_POSTINSTALL_MULTIFACTORAUTH_BODY', 'COM_USERS_POSTINSTALL_MULTIFACTORAUTH_ACTION', 'com_users', 1, 'action', 'admin://components/com_users/postinstall/multifactorauth.php', 'com_users_postinstall_mfa_action', 'admin://components/com_users/postinstall/multifactorauth.php', 'com_users_postinstall_mfa_condition', '4.2.0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `b5651_privacy_consents`
--

CREATE TABLE `b5651_privacy_consents` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `state` int NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remind` tinyint NOT NULL DEFAULT '0',
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `b5651_privacy_requests`
--

CREATE TABLE `b5651_privacy_requests` (
  `id` int UNSIGNED NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `requested_at` datetime NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `request_type` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `confirm_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `confirm_token_created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `b5651_redirect_links`
--

CREATE TABLE `b5651_redirect_links` (
  `id` int UNSIGNED NOT NULL,
  `old_url` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_url` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hits` int UNSIGNED NOT NULL DEFAULT '0',
  `published` tinyint NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `header` smallint NOT NULL DEFAULT '301'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `b5651_scheduler_tasks`
--

CREATE TABLE `b5651_scheduler_tasks` (
  `id` int UNSIGNED NOT NULL,
  `asset_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'unique identifier for job defined by plugin',
  `execution_rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Execution Rules, Unprocessed',
  `cron_rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Processed execution rules, crontab-like JSON form',
  `state` tinyint NOT NULL DEFAULT '0',
  `last_exit_code` int NOT NULL DEFAULT '0' COMMENT 'Exit code when job was last run',
  `last_execution` datetime DEFAULT NULL COMMENT 'Timestamp of last run',
  `next_execution` datetime DEFAULT NULL COMMENT 'Timestamp of next (planned) run, referred for execution on trigger',
  `times_executed` int DEFAULT '0' COMMENT 'Count of successful triggers',
  `times_failed` int DEFAULT '0' COMMENT 'Count of failures',
  `locked` datetime DEFAULT NULL,
  `priority` smallint NOT NULL DEFAULT '0',
  `ordering` int NOT NULL DEFAULT '0' COMMENT 'Configurable list ordering',
  `cli_exclusive` smallint NOT NULL DEFAULT '0' COMMENT 'If 1, the task is only accessible via CLI',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created` datetime NOT NULL,
  `created_by` int UNSIGNED NOT NULL DEFAULT '0',
  `checked_out` int UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `b5651_schemas`
--

CREATE TABLE `b5651_schemas` (
  `extension_id` int NOT NULL,
  `version_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `b5651_schemas`
--

INSERT INTO `b5651_schemas` (`extension_id`, `version_id`) VALUES
(220, '4.2.3-2022-09-07'),
(252, '9.0.10-20211130');

-- --------------------------------------------------------

--
-- Table structure for table `b5651_session`
--

CREATE TABLE `b5651_session` (
  `session_id` varbinary(192) NOT NULL,
  `client_id` tinyint UNSIGNED DEFAULT NULL,
  `guest` tinyint UNSIGNED DEFAULT '1',
  `time` int NOT NULL DEFAULT '0',
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `userid` int DEFAULT '0',
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `b5651_session`
--

INSERT INTO `b5651_session` (`session_id`, `client_id`, `guest`, `time`, `data`, `userid`, `username`) VALUES
(0x35756f64387670666c76643569343335333236766634746a6d61, 1, 0, 1683608096, 'joomla|s:2400:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjc6e3M6Nzoic2Vzc2lvbiI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJjb3VudGVyIjtpOjE2O3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTY4MzYwODA1NTtzOjQ6Imxhc3QiO2k6MTY4MzYwODA5MjtzOjM6Im5vdyI7aToxNjgzNjA4MDk2O31zOjU6InRva2VuIjtzOjMyOiI5NjU4Nzk5NzcwNWU2ZTAwMjM0Y2U1MGYxOTljM2U0MiI7fXM6ODoicmVnaXN0cnkiO086MjQ6Ikpvb21sYVxSZWdpc3RyeVxSZWdpc3RyeSI6Mzp7czo3OiIAKgBkYXRhIjtPOjg6InN0ZENsYXNzIjozOntzOjE0OiJjb21fY2F0ZWdvcmllcyI7Tzo4OiJzdGRDbGFzcyI6MTp7czoxMDoiY2F0ZWdvcmllcyI7Tzo4OiJzdGRDbGFzcyI6MTp7czo3OiJjb250ZW50IjtPOjg6InN0ZENsYXNzIjoyOntzOjY6ImZpbHRlciI7Tzo4OiJzdGRDbGFzcyI6MTp7czo5OiJleHRlbnNpb24iO3M6MTE6ImNvbV9jb250ZW50Ijt9czo0OiJsaXN0IjthOjQ6e3M6OToiZGlyZWN0aW9uIjtzOjM6ImFzYyI7czo1OiJsaW1pdCI7czoyOiIyMCI7czo4OiJvcmRlcmluZyI7czo1OiJhLmxmdCI7czo1OiJzdGFydCI7ZDowO319fX1zOjEwOiJjb21fZmllbGRzIjtPOjg6InN0ZENsYXNzIjoyOntzOjY6ImZpZWxkcyI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo3OiJjb250ZXh0IjtzOjE5OiJjb21fY29udGVudC5hcnRpY2xlIjtzOjQ6Imxpc3QiO2E6NDp7czo5OiJkaXJlY3Rpb24iO3M6MzoiYXNjIjtzOjU6ImxpbWl0IjtzOjI6IjIwIjtzOjg6Im9yZGVyaW5nIjtzOjEwOiJhLm9yZGVyaW5nIjtzOjU6InN0YXJ0IjtkOjA7fX1zOjY6Imdyb3VwcyI7Tzo4OiJzdGRDbGFzcyI6MTp7czo3OiJjb250ZXh0IjtzOjE5OiJjb21fY29udGVudC5hcnRpY2xlIjt9fXM6OToiY29tX21lbnVzIjtPOjg6InN0ZENsYXNzIjoxOntzOjU6Iml0ZW1zIjtPOjg6InN0ZENsYXNzIjoyOntzOjg6Im1lbnV0eXBlIjtzOjA6IiI7czo0OiJsaXN0IjthOjQ6e3M6OToiZGlyZWN0aW9uIjtzOjM6ImFzYyI7czo1OiJsaW1pdCI7czoyOiIyMCI7czo4OiJvcmRlcmluZyI7czo1OiJhLmxmdCI7czo1OiJzdGFydCI7ZDowO319fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086MjA6Ikpvb21sYVxDTVNcVXNlclxVc2VyIjoxOntzOjI6ImlkIjtpOjEzNTt9czoyMToicGxnX3NvY2lhbGxvZ2luX2FwcGxlIjtPOjg6InN0ZENsYXNzIjoyOntzOjg6ImxvZ2luVXJsIjtzOjQ5OiJodHRwOi8vbG9jYWxob3N0L3dpbmJvYXJkL2FkbWluaXN0cmF0b3IvaW5kZXgucGhwIjtzOjEwOiJmYWlsdXJlVXJsIjtzOjQ5OiJodHRwOi8vbG9jYWxob3N0L3dpbmJvYXJkL2FkbWluaXN0cmF0b3IvaW5kZXgucGhwIjt9czoyMjoicGxnX3NvY2lhbGxvZ2luX2dvb2dsZSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo4OiJsb2dpblVybCI7czo0OToiaHR0cDovL2xvY2FsaG9zdC93aW5ib2FyZC9hZG1pbmlzdHJhdG9yL2luZGV4LnBocCI7czoxMDoiZmFpbHVyZVVybCI7czo0OToiaHR0cDovL2xvY2FsaG9zdC93aW5ib2FyZC9hZG1pbmlzdHJhdG9yL2luZGV4LnBocCI7fXM6MTE6ImFwcGxpY2F0aW9uIjtPOjg6InN0ZENsYXNzIjoxOntzOjU6InF1ZXVlIjthOjA6e319czo5OiJjb21fdXNlcnMiO086ODoic3RkQ2xhc3MiOjE6e3M6MTE6Im1mYV9jaGVja2VkIjtpOjE7fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";', 135, 'winboard'),
(0x6d32633472627239306d723769306b386d6c30326e3563666b6b, 0, 1, 1683608013, 'joomla|s:1332:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjU6e3M6Nzoic2Vzc2lvbiI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJjb3VudGVyIjtpOjU7czo1OiJ0aW1lciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJzdGFydCI7aToxNjgzNjA4MDA1O3M6NDoibGFzdCI7aToxNjgzNjA4MDA5O3M6Mzoibm93IjtpOjE2ODM2MDgwMTM7fXM6NToidG9rZW4iO3M6MzI6IjkxY2FhMzU2YzZhZWM4MDM5YjllZGI3YWY4ZmUzNTk1Ijt9czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6NToidXNlcnMiO086ODoic3RkQ2xhc3MiOjE6e3M6NToibG9naW4iO086ODoic3RkQ2xhc3MiOjE6e3M6NDoiZm9ybSI7Tzo4OiJzdGRDbGFzcyI6MTp7czo0OiJkYXRhIjthOjA6e319fX19czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjk6InNlcGFyYXRvciI7czoxOiIuIjt9czo0OiJ1c2VyIjtPOjIwOiJKb29tbGFcQ01TXFVzZXJcVXNlciI6MTp7czoyOiJpZCI7aTowO31zOjIxOiJwbGdfc29jaWFsbG9naW5fYXBwbGUiO086ODoic3RkQ2xhc3MiOjI6e3M6ODoibG9naW5VcmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Qvd2luYm9hcmQvaW5kZXgucGhwL2xvZ2luIjtzOjEwOiJmYWlsdXJlVXJsIjtzOjQ5OiIvd2luYm9hcmQvaW5kZXgucGhwL2NvbXBvbmVudC91c2Vycy9sb2dpbj9JdGVtaWQ9Ijt9czoyMjoicGxnX3NvY2lhbGxvZ2luX2dvb2dsZSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo4OiJsb2dpblVybCI7czo0MToiaHR0cDovL2xvY2FsaG9zdC93aW5ib2FyZC9pbmRleC5waHAvbG9naW4iO3M6MTA6ImZhaWx1cmVVcmwiO3M6NDk6Ii93aW5ib2FyZC9pbmRleC5waHAvY29tcG9uZW50L3VzZXJzL2xvZ2luP0l0ZW1pZD0iO319czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjk6InNlcGFyYXRvciI7czoxOiIuIjt9\";', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `b5651_tags`
--

CREATE TABLE `b5651_tags` (
  `id` int UNSIGNED NOT NULL,
  `parent_id` int UNSIGNED NOT NULL DEFAULT '0',
  `lft` int NOT NULL DEFAULT '0',
  `rgt` int NOT NULL DEFAULT '0',
  `level` int UNSIGNED NOT NULL DEFAULT '0',
  `path` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint NOT NULL DEFAULT '0',
  `checked_out` int UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `access` int UNSIGNED NOT NULL DEFAULT '0',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'The keywords for the page.',
  `metadata` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL,
  `created_by_alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified_user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL,
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hits` int UNSIGNED NOT NULL DEFAULT '0',
  `language` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int UNSIGNED NOT NULL DEFAULT '1',
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `b5651_tags`
--

INSERT INTO `b5651_tags` (`id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `created_by_alias`, `modified_user_id`, `modified_time`, `images`, `urls`, `hits`, `language`, `version`, `publish_up`, `publish_down`) VALUES
(1, 0, 0, 1, 0, '', 'ROOT', 'root', '', '', 1, NULL, NULL, 1, '', '', '', '', 120, '2022-10-25 09:18:28', '', 120, '2022-10-25 09:18:28', '', '', 0, '*', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `b5651_template_overrides`
--

CREATE TABLE `b5651_template_overrides` (
  `id` int UNSIGNED NOT NULL,
  `template` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hash_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension_id` int DEFAULT '0',
  `state` tinyint NOT NULL DEFAULT '0',
  `action` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `b5651_template_styles`
--

CREATE TABLE `b5651_template_styles` (
  `id` int UNSIGNED NOT NULL,
  `template` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `home` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `inheritable` tinyint NOT NULL DEFAULT '0',
  `parent` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `params` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `b5651_template_styles`
--

INSERT INTO `b5651_template_styles` (`id`, `template`, `client_id`, `home`, `title`, `inheritable`, `parent`, `params`) VALUES
(10, 'atum', 1, '1', 'Atum - Default', 1, '', '{\"hue\":\"hsl(214, 63%, 20%)\",\"bg-light\":\"#f0f4fb\",\"text-dark\":\"#495057\",\"text-light\":\"#ffffff\",\"link-color\":\"#2a69b8\",\"special-color\":\"#001b4c\",\"monochrome\":\"0\",\"loginLogo\":\"\",\"loginLogoAlt\":\"\",\"logoBrandLarge\":\"\",\"logoBrandLargeAlt\":\"\",\"logoBrandSmall\":\"\",\"logoBrandSmallAlt\":\"\"}'),
(11, 'cassiopeia', 0, '0', 'Cassiopeia - Default', 1, '', '{\"brand\":\"1\",\"logoFile\":\"\",\"siteTitle\":\"\",\"siteDescription\":\"\",\"useFontScheme\":\"0\",\"colorName\":\"colors_standard\",\"fluidContainer\":\"0\",\"stickyHeader\":0,\"backTop\":0}'),
(12, 'yootheme', 0, '1', 'YOOtheme - Default', 0, '', '{\"config\":\"{\\\"menu\\\":{\\\"items\\\":[],\\\"positions\\\":{\\\"navbar\\\":{\\\"style\\\":\\\"default\\\",\\\"image_margin\\\":true,\\\"image_align\\\":\\\"center\\\",\\\"menu\\\":\\\"\\\"},\\\"header\\\":{\\\"style\\\":\\\"default\\\",\\\"image_margin\\\":true,\\\"image_align\\\":\\\"center\\\"},\\\"toolbar-left\\\":{\\\"style\\\":\\\"default\\\",\\\"image_margin\\\":true,\\\"image_align\\\":\\\"center\\\"},\\\"toolbar-right\\\":{\\\"style\\\":\\\"default\\\",\\\"image_margin\\\":true,\\\"image_align\\\":\\\"center\\\"},\\\"dialog\\\":{\\\"style\\\":\\\"default\\\",\\\"image_margin\\\":true,\\\"image_align\\\":\\\"center\\\"},\\\"navbar-mobile\\\":{\\\"style\\\":\\\"default\\\",\\\"image_margin\\\":true,\\\"image_align\\\":\\\"center\\\"},\\\"header-mobile\\\":{\\\"style\\\":\\\"default\\\",\\\"image_margin\\\":true,\\\"image_align\\\":\\\"center\\\"},\\\"dialog-mobile\\\":{\\\"style\\\":\\\"default\\\",\\\"image_margin\\\":true,\\\"image_align\\\":\\\"center\\\",\\\"menu\\\":\\\"mainmenu\\\"}}},\\\"site\\\":{\\\"layout\\\":\\\"full\\\",\\\"boxed\\\":{\\\"alignment\\\":1},\\\"image_size\\\":\\\"cover\\\",\\\"image_position\\\":\\\"center-center\\\",\\\"image_effect\\\":\\\"fixed\\\",\\\"toolbar_width\\\":\\\"default\\\",\\\"breadcrumbs_show_home\\\":true,\\\"breadcrumbs_show_current\\\":true,\\\"breadcrumbs_home_text\\\":\\\"\\\",\\\"main_section\\\":{\\\"height\\\":true}},\\\"header\\\":{\\\"layout\\\":\\\"horizontal-center\\\",\\\"width\\\":\\\"default\\\",\\\"social_gap\\\":\\\"small\\\"},\\\"navbar\\\":{\\\"sticky\\\":1,\\\"dropdown_align\\\":\\\"left\\\"},\\\"dialog\\\":{\\\"layout\\\":\\\"offcanvas-top\\\",\\\"toggle\\\":\\\"header:end\\\",\\\"menu_style\\\":\\\"default\\\",\\\"offcanvas\\\":{\\\"mode\\\":\\\"slide\\\",\\\"flip\\\":true}},\\\"mobile\\\":{\\\"breakpoint\\\":\\\"m\\\",\\\"header\\\":{\\\"layout\\\":\\\"horizontal-right\\\",\\\"transparent\\\":true},\\\"navbar\\\":{\\\"sticky\\\":0},\\\"dialog\\\":{\\\"layout\\\":\\\"offcanvas-top\\\",\\\"toggle\\\":\\\"header-mobile:end\\\",\\\"close\\\":true,\\\"menu_style\\\":\\\"default\\\",\\\"offcanvas\\\":{\\\"mode\\\":\\\"push\\\",\\\"flip\\\":true},\\\"dropbar\\\":{\\\"animation\\\":\\\"reveal-top\\\"}}},\\\"top\\\":{\\\"style\\\":\\\"default\\\",\\\"width\\\":\\\"default\\\",\\\"breakpoint\\\":\\\"m\\\",\\\"image_position\\\":\\\"center-center\\\"},\\\"main_sidebar\\\":{\\\"width\\\":\\\"1-4\\\",\\\"min_width\\\":\\\"200\\\",\\\"breakpoint\\\":\\\"m\\\",\\\"first\\\":0,\\\"divider\\\":0},\\\"bottom\\\":{\\\"style\\\":\\\"default\\\",\\\"width\\\":\\\"default\\\",\\\"breakpoint\\\":\\\"m\\\",\\\"image_position\\\":\\\"center-center\\\"},\\\"footer\\\":{\\\"content\\\":{\\\"type\\\":\\\"layout\\\",\\\"children\\\":[{\\\"type\\\":\\\"section\\\",\\\"props\\\":{\\\"style\\\":\\\"default\\\",\\\"width\\\":\\\"default\\\",\\\"vertical_align\\\":\\\"middle\\\",\\\"title_position\\\":\\\"top-left\\\",\\\"title_rotation\\\":\\\"left\\\",\\\"title_breakpoint\\\":\\\"xl\\\",\\\"image_position\\\":\\\"center-center\\\",\\\"css\\\":\\\".el-section {\\\\n    border-top: 1px solid #EBEBEB;\\\\n}\\\",\\\"id\\\":\\\"footer\\\"},\\\"children\\\":[{\\\"type\\\":\\\"row\\\",\\\"props\\\":{\\\"layout\\\":\\\"1-3,1-3,1-3\\\"},\\\"children\\\":[{\\\"type\\\":\\\"column\\\",\\\"props\\\":{\\\"position_sticky_breakpoint\\\":\\\"m\\\",\\\"image_position\\\":\\\"center-center\\\",\\\"media_overlay_gradient\\\":\\\"\\\",\\\"width_medium\\\":\\\"1-3\\\",\\\"class\\\":\\\"uk-padding-remove\\\"},\\\"children\\\":[{\\\"type\\\":\\\"module\\\",\\\"props\\\":{\\\"menu_style\\\":\\\"default\\\",\\\"menu_image_margin\\\":true,\\\"menu_image_align\\\":\\\"center\\\",\\\"menu_type\\\":\\\"nav\\\",\\\"module\\\":\\\"1\\\",\\\"type\\\":\\\"mod_menu\\\",\\\"text_align\\\":\\\"left\\\"}}]},{\\\"type\\\":\\\"column\\\",\\\"props\\\":{\\\"position_sticky_breakpoint\\\":\\\"m\\\",\\\"image_position\\\":\\\"center-center\\\",\\\"media_overlay_gradient\\\":\\\"\\\",\\\"width_medium\\\":\\\"1-3\\\"},\\\"children\\\":[{\\\"type\\\":\\\"image\\\",\\\"props\\\":{\\\"margin\\\":\\\"medium\\\",\\\"image_svg_color\\\":\\\"emphasis\\\",\\\"image\\\":\\\"images\\\\\\/site\\\\\\/winboard_logo.png\\\",\\\"image_height\\\":\\\"\\\",\\\"text_align\\\":\\\"center\\\",\\\"margin_remove_bottom\\\":true,\\\"image_width\\\":\\\"175px\\\"}},{\\\"type\\\":\\\"social\\\",\\\"props\\\":{\\\"link_style\\\":\\\"button\\\",\\\"grid\\\":\\\"horizontal\\\",\\\"grid_gap\\\":\\\"small\\\",\\\"margin\\\":\\\"large\\\",\\\"text_align\\\":\\\"center\\\",\\\"margin_remove_bottom\\\":true},\\\"children\\\":[{\\\"type\\\":\\\"social_item\\\",\\\"props\\\":{\\\"link\\\":\\\"https:\\\\\\/\\\\\\/facebook.com\\\\\\/#\\\"}},{\\\"type\\\":\\\"social_item\\\",\\\"props\\\":{\\\"link\\\":\\\"https:\\\\\\/\\\\\\/twitter.com\\\\\\/#\\\"}},{\\\"type\\\":\\\"social_item\\\",\\\"props\\\":{\\\"link\\\":\\\"https:\\\\\\/\\\\\\/youtube.com\\\\\\/#\\\"}},{\\\"type\\\":\\\"social_item\\\",\\\"props\\\":{\\\"link\\\":\\\"https:\\\\\\/\\\\\\/pinterest.com\\\\\\/#\\\"}}]},{\\\"type\\\":\\\"text\\\",\\\"props\\\":{\\\"margin\\\":\\\"default\\\",\\\"column_breakpoint\\\":\\\"m\\\",\\\"content\\\":\\\"\\\\u00a9 Winboard Inc 2023\\\",\\\"text_align\\\":\\\"center\\\"}}]},{\\\"type\\\":\\\"column\\\",\\\"props\\\":{\\\"position_sticky_breakpoint\\\":\\\"m\\\",\\\"image_position\\\":\\\"center-center\\\",\\\"media_overlay_gradient\\\":\\\"\\\",\\\"width_medium\\\":\\\"1-3\\\"},\\\"children\\\":[{\\\"type\\\":\\\"module\\\",\\\"props\\\":{\\\"menu_style\\\":\\\"default\\\",\\\"menu_image_margin\\\":true,\\\"menu_image_align\\\":\\\"center\\\",\\\"menu_type\\\":\\\"nav\\\",\\\"module\\\":\\\"112\\\",\\\"type\\\":\\\"mod_menu\\\",\\\"text_align\\\":\\\"right\\\"}}]}]}]}],\\\"version\\\":\\\"3.0.22\\\",\\\"props\\\":[]}},\\\"webp\\\":true,\\\"cookie\\\":{\\\"type\\\":\\\"bar\\\",\\\"bar_position\\\":\\\"bottom\\\",\\\"bar_style\\\":\\\"muted\\\",\\\"notification_position\\\":\\\"bottom-center\\\",\\\"message\\\":\\\"By using this website, you agree to the use of cookies as described in our Privacy Policy.\\\",\\\"button_consent_style\\\":\\\"icon\\\",\\\"button_consent_text\\\":\\\"Ok\\\",\\\"button_reject_style\\\":\\\"default\\\",\\\"button_reject_text\\\":\\\"No, Thanks\\\"},\\\"post\\\":{\\\"width\\\":\\\"default\\\",\\\"padding\\\":\\\"\\\",\\\"content_width\\\":\\\"\\\",\\\"image_align\\\":\\\"top\\\",\\\"image_margin\\\":\\\"medium\\\",\\\"image_width\\\":\\\"\\\",\\\"image_height\\\":\\\"\\\",\\\"header_align\\\":0,\\\"title_margin\\\":\\\"default\\\",\\\"meta_margin\\\":\\\"default\\\",\\\"meta_style\\\":\\\"sentence\\\",\\\"content_margin\\\":\\\"medium\\\",\\\"content_dropcap\\\":0},\\\"blog\\\":{\\\"width\\\":\\\"default\\\",\\\"padding\\\":\\\"\\\",\\\"grid_column_gap\\\":\\\"\\\",\\\"grid_row_gap\\\":\\\"\\\",\\\"grid_breakpoint\\\":\\\"m\\\",\\\"image_align\\\":\\\"top\\\",\\\"image_margin\\\":\\\"medium\\\",\\\"image_width\\\":\\\"\\\",\\\"image_height\\\":\\\"\\\",\\\"header_align\\\":0,\\\"title_style\\\":\\\"\\\",\\\"title_margin\\\":\\\"default\\\",\\\"meta_margin\\\":\\\"default\\\",\\\"content_excerpt\\\":0,\\\"content_length\\\":\\\"\\\",\\\"content_margin\\\":\\\"medium\\\",\\\"content_align\\\":0,\\\"button_style\\\":\\\"default\\\",\\\"button_margin\\\":\\\"medium\\\",\\\"navigation\\\":\\\"pagination\\\"},\\\"media_folder\\\":\\\"yootheme\\\",\\\"search_module\\\":\\\"mod_finder\\\",\\\"bootstrap\\\":true,\\\"less\\\":{\\\"@global-font-family\\\":\\\"\'Poppins\'\\\",\\\"@global-font-size\\\":\\\"15px\\\",\\\"@global-line-height\\\":\\\"1.7\\\",\\\"@global-medium-font-size\\\":\\\"18px\\\",\\\"@global-large-font-size\\\":\\\"22px\\\",\\\"@global-xlarge-font-size\\\":\\\"26px\\\",\\\"@theme-page-border\\\":\\\"\\\",\\\"@theme-page-border-width\\\":\\\"0\\\",\\\"@theme-page-container-background\\\":\\\"\\\",\\\"@global-color\\\":\\\"#20184C\\\",\\\"@global-emphasis-color\\\":\\\"#20184C\\\",\\\"@global-link-hover-color\\\":\\\"#F68E67\\\",\\\"@global-inverse-color\\\":\\\"#F68E67\\\",\\\"@global-link-color\\\":\\\"#20184C\\\",\\\"@button-font-weight\\\":\\\"700\\\",\\\"@button-letter-spacing\\\":\\\"0\\\",\\\"@button-font-size\\\":\\\"14px\\\",\\\"@button-line-height\\\":\\\"43px\\\",\\\"@button-border-width\\\":\\\"1px\\\",\\\"@button-text-transform\\\":\\\"capitalize\\\",\\\"@button-default-background\\\":\\\"#20184C\\\",\\\"@button-primary-background\\\":\\\"#F68E67\\\",\\\"@button-primary-border\\\":\\\"#F68E67\\\",\\\"@button-primary-color\\\":\\\"#FFFFFF\\\",\\\"@button-primary-hover-background\\\":\\\"#20184C\\\",\\\"@button-primary-hover-border\\\":\\\"#20184C\\\",\\\"@button-primary-hover-color\\\":\\\"#FFFFFF\\\",\\\"@button-secondary-background\\\":\\\"#FFFFFF\\\",\\\"@button-secondary-color\\\":\\\"#20184C\\\",\\\"@button-secondary-border\\\":\\\"#F68E67\\\",\\\"@button-secondary-hover-background\\\":\\\"#F68E67\\\",\\\"@button-secondary-hover-border\\\":\\\"#F68E67\\\",\\\"@button-secondary-hover-color\\\":\\\"#20184C\\\",\\\"@button-default-border\\\":\\\"#20184C\\\",\\\"@button-default-color\\\":\\\"#FFFFFF\\\",\\\"@button-default-hover-background\\\":\\\"#F68E67\\\",\\\"@button-default-hover-border\\\":\\\"#F68E67\\\",\\\"@tab-item-color\\\":\\\"#20184C\\\",\\\"@tab-item-hover-border\\\":\\\"#F68E67\\\",\\\"@tab-item-active-border\\\":\\\"#20184C\\\",\\\"@tab-item-hover-color\\\":\\\"#20184C\\\",\\\"@theme-page-container-margin-bottom\\\":\\\"70px\\\",\\\"@theme-page-container-margin-top\\\":\\\"70px\\\",\\\"@section-padding-vertical-m\\\":\\\"20px\\\",\\\"@section-padding-vertical\\\":\\\"20px\\\",\\\"@nav-header-font-weight\\\":\\\"600\\\",\\\"@navbar-nav-item-font-weight\\\":\\\"700\\\",\\\"@nav-default-letter-spacing\\\":\\\"0\\\",\\\"@nav-default-font-weight\\\":\\\"700\\\",\\\"@nav-primary-item-hover-color\\\":\\\"#F68E67\\\",\\\"@nav-primary-item-active-color\\\":\\\"#F68E67\\\",\\\"@nav-default-item-hover-color\\\":\\\"#F68E67\\\",\\\"@card-default-background\\\":\\\"#FFFFFF\\\",\\\"@background-muted-background\\\":\\\"#EBEBEB\\\",\\\"@card-default-hover-background\\\":\\\"#FFFFFF\\\",\\\"@tab-item-font-weight\\\":\\\"700\\\",\\\"@tab-item-text-transform\\\":\\\"capitalize\\\",\\\"@tab-item-padding-horizontal\\\":\\\"30px\\\",\\\"@tab-item-line-height\\\":\\\"36px\\\",\\\"@tab-item-letter-spacing\\\":\\\"0\\\",\\\"@tab-item-padding-vertical\\\":\\\"0\\\",\\\"@tab-item-font-size\\\":\\\"12px\\\",\\\"@theme-toolbar-padding-bottom\\\":\\\"70px\\\",\\\"@theme-toolbar-padding-top\\\":\\\"30px\\\",\\\"@base-heading-font-weight\\\":\\\"700\\\",\\\"@base-h1-font-size\\\":\\\"32\\\",\\\"@base-h1-font-size-m\\\":\\\"32px\\\",\\\"@base-h2-font-size\\\":\\\"32px\\\",\\\"@base-h2-font-size-m\\\":\\\"32px\\\",\\\"@form-background\\\":\\\"#F0F0F0\\\",\\\"@form-border-width\\\":\\\"1px\\\",\\\"@form-border\\\":\\\"#DCDCDC\\\",\\\"@form-border-radius\\\":\\\"10px\\\",\\\"@form-focus-border\\\":\\\"#20184C\\\",\\\"@form-height\\\":\\\"45px\\\",\\\"@form-label-font-size\\\":\\\"14px\\\",\\\"@form-label-font-weight\\\":\\\"700\\\",\\\"@form-label-letter-spacing\\\":\\\"\\\",\\\"@form-label-text-transform\\\":\\\"capitalize\\\",\\\"@form-select-option-color\\\":\\\"#F0F0F0\\\",\\\"@label-color\\\":\\\"#20184C\\\",\\\"@label-success-color\\\":\\\"#FFFFFF\\\",\\\"@label-danger-color\\\":\\\"#FFFFFF\\\",\\\"@label-background\\\":\\\"#F0F0F0\\\",\\\"@label-warning-color\\\":\\\"#20184C\\\",\\\"@button-danger-color\\\":\\\"#FFFFFF\\\",\\\"@button-danger-hover-color\\\":\\\"#20184C\\\",\\\"@button-danger-active-color\\\":\\\"#20184C\\\",\\\"@border-rounded-border-radius\\\":\\\"10px\\\",\\\"@button-small-padding-horizontal\\\":\\\"10px\\\",\\\"@button-small-line-height\\\":\\\"30px\\\",\\\"@button-small-font-size\\\":\\\"11px\\\",\\\"@global-success-background\\\":\\\"#3FCB55\\\",\\\"@global-danger-background\\\":\\\"#EF405F\\\",\\\"@global-warning-background\\\":\\\"#FBD53A\\\",\\\"@label-font-size\\\":\\\"12px\\\",\\\"@label-text-transform\\\":\\\"capitalize\\\",\\\"@label-line-height\\\":\\\"18px\\\",\\\"@label-letter-spacing\\\":\\\"0\\\",\\\"@label-font-weight\\\":\\\"400\\\",\\\"@internal-fonts\\\":\\\"~\'Poppins:300,400,700|Roboto:700\'\\\",\\\"@global-primary-font-family\\\":\\\"inherit\\\",\\\"@global-primary-font-weight\\\":\\\"700\\\",\\\"@global-secondary-font-family\\\":\\\"inherit\\\",\\\"@global-secondary-font-weight\\\":\\\"700\\\",\\\"@global-secondary-letter-spacing\\\":\\\"0\\\",\\\"@global-secondary-text-transform\\\":\\\"none\\\",\\\"@navbar-box-shadow\\\":\\\"none\\\",\\\"@navbar-border\\\":\\\"#EBEBEB\\\",\\\"@navbar-mode\\\":\\\"border\\\",\\\"@text-primary-color\\\":\\\"#20184C\\\",\\\"@text-secondary-color\\\":\\\"#F68E67\\\",\\\"@pagination-item-color\\\":\\\"#20184C\\\",\\\"@pagination-item-border-radius\\\":\\\"10px\\\",\\\"@pagination-item-next-previous-color\\\":\\\"#F68E67\\\",\\\"@pagination-item-font-weight\\\":\\\"400\\\",\\\"@pagination-item-hover-color\\\":\\\"#20184C\\\",\\\"@pagination-item-hover-background\\\":\\\"#F0F0F0\\\",\\\"@pagination-item-active-background\\\":\\\"#F0F0F0\\\",\\\"@pagination-item-active-border\\\":\\\"#DCDCDC\\\",\\\"@pagination-item-next-previous-hover-color\\\":\\\"#20184C\\\",\\\"@pagination-item-active-color\\\":\\\"#20184C\\\",\\\"@pagination-margin-horizontal\\\":\\\"2px\\\",\\\"@pagination-item-border-width\\\":\\\"1px\\\",\\\"@tab-margin-horizontal\\\":\\\"0\\\",\\\"@accordion-title-background\\\":\\\"#F0F0F0\\\",\\\"@accordion-icon-color\\\":\\\"#20184C\\\",\\\"@accordion-title-font-size\\\":\\\"15px\\\",\\\"@accordion-title-padding-horizontal\\\":\\\"20px\\\",\\\"@accordion-title-padding-vertical\\\":\\\"15px\\\",\\\"@accordion-item-margin-top\\\":\\\"10px\\\",\\\"@accordion-item-border-width\\\":\\\"0\\\",\\\"@accordion-item-padding-top\\\":\\\"0\\\",\\\"@card-default-border\\\":\\\"#F0F0F0\\\",\\\"@card-default-border-width\\\":\\\"1px\\\",\\\"@card-border-radius\\\":\\\"10px\\\",\\\"@tooltip-background\\\":\\\"#F0F0F0\\\",\\\"@tooltip-color\\\":\\\"#20184C\\\",\\\"@accordion-content-margin-top\\\":\\\"0\\\",\\\"@button-default-hover-color\\\":\\\"#FFFFFF\\\",\\\"@base-hr-margin-vertical\\\":\\\"55px\\\",\\\"@margin-large-margin-l\\\":\\\"55px\\\",\\\"@global-secondary-background\\\":\\\"#F68E67\\\",\\\"@global-primary-background\\\":\\\"#20184C\\\",\\\"@offcanvas-bar-background\\\":\\\"#FFFFFF\\\",\\\"@offcanvas-bar-color-mode\\\":\\\"none\\\",\\\"@global-tertiary-font-family\\\":\\\"\'Roboto\'\\\",\\\"@modal-dialog-border-radius\\\":\\\"10px\\\"},\\\"custom_less\\\":\\\"\\\",\\\"style\\\":\\\"union-dental\\\",\\\"version\\\":\\\"3.0.22\\\",\\\"child_theme\\\":\\\"winboard\\\",\\\"logo\\\":{\\\"text\\\":\\\"Winboard\\\",\\\"image\\\":\\\"images\\\\\\/site\\\\\\/winboard_logo.png\\\",\\\"image_inverse\\\":\\\"images\\\\\\/site\\\\\\/logo_home.svg\\\",\\\"image_width\\\":\\\"175px\\\"},\\\"favicon\\\":\\\"images\\\\\\/site\\\\\\/favicon_new.png\\\"}\",\"yootheme\":\"true\",\"uikit3\":\"true\",\"widgetkit\":\"noconflict\"}');

-- --------------------------------------------------------

--
-- Table structure for table `b5651_ucm_base`
--

CREATE TABLE `b5651_ucm_base` (
  `ucm_id` int UNSIGNED NOT NULL,
  `ucm_item_id` int NOT NULL,
  `ucm_type_id` int NOT NULL,
  `ucm_language_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `b5651_ucm_content`
--

CREATE TABLE `b5651_ucm_content` (
  `core_content_id` int UNSIGNED NOT NULL,
  `core_type_alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'FK to the content types table',
  `core_title` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `core_body` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `core_state` tinyint NOT NULL DEFAULT '0',
  `core_checked_out_time` datetime DEFAULT NULL,
  `core_checked_out_user_id` int UNSIGNED DEFAULT NULL,
  `core_access` int UNSIGNED NOT NULL DEFAULT '0',
  `core_params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `core_featured` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `core_metadata` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'JSON encoded metadata properties.',
  `core_created_user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `core_created_by_alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_created_time` datetime NOT NULL,
  `core_modified_user_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Most recent user that modified',
  `core_modified_time` datetime NOT NULL,
  `core_language` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_publish_up` datetime DEFAULT NULL,
  `core_publish_down` datetime DEFAULT NULL,
  `core_content_item_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'ID from the individual type table',
  `asset_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `core_images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `core_urls` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `core_hits` int UNSIGNED NOT NULL DEFAULT '0',
  `core_version` int UNSIGNED NOT NULL DEFAULT '1',
  `core_ordering` int NOT NULL DEFAULT '0',
  `core_metakey` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `core_metadesc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `core_catid` int UNSIGNED NOT NULL DEFAULT '0',
  `core_type_id` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Contains core content data in name spaced fields';

-- --------------------------------------------------------

--
-- Table structure for table `b5651_updates`
--

CREATE TABLE `b5651_updates` (
  `update_id` int NOT NULL,
  `update_site_id` int DEFAULT '0',
  `extension_id` int DEFAULT '0',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `folder` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `client_id` tinyint DEFAULT '0',
  `version` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `detailsurl` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `infourl` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `changelogurl` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `extra_query` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Available Updates';

--
-- Dumping data for table `b5651_updates`
--

INSERT INTO `b5651_updates` (`update_id`, `update_site_id`, `extension_id`, `name`, `description`, `element`, `type`, `folder`, `client_id`, `version`, `data`, `detailsurl`, `infourl`, `changelogurl`, `extra_query`) VALUES
(1, 2, 0, 'Afrikaans', '', 'pkg_af-ZA', 'package', '', 0, '4.3.1.1', '', 'https://update.joomla.org/language/details4/af-ZA_details.xml', '', '', ''),
(2, 2, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '4.0.2.1', '', 'https://update.joomla.org/language/details4/ar-AA_details.xml', '', '', ''),
(3, 2, 0, 'Bulgarian', '', 'pkg_bg-BG', 'package', '', 0, '4.2.7.1', '', 'https://update.joomla.org/language/details4/bg-BG_details.xml', '', '', ''),
(4, 2, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '4.0.4.2', '', 'https://update.joomla.org/language/details4/ca-ES_details.xml', '', '', ''),
(5, 2, 0, 'Chinese, Simplified', '', 'pkg_zh-CN', 'package', '', 0, '4.3.0.2', '', 'https://update.joomla.org/language/details4/zh-CN_details.xml', '', '', ''),
(6, 2, 0, 'Chinese, Traditional', '', 'pkg_zh-TW', 'package', '', 0, '4.2.3.1', '', 'https://update.joomla.org/language/details4/zh-TW_details.xml', '', '', ''),
(7, 2, 0, 'Czech', '', 'pkg_cs-CZ', 'package', '', 0, '4.2.0.1', '', 'https://update.joomla.org/language/details4/cs-CZ_details.xml', '', '', ''),
(8, 2, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '4.3.0.2', '', 'https://update.joomla.org/language/details4/da-DK_details.xml', '', '', ''),
(9, 2, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '4.3.1.1', '', 'https://update.joomla.org/language/details4/nl-NL_details.xml', '', '', ''),
(10, 2, 0, 'English, Australia', '', 'pkg_en-AU', 'package', '', 0, '4.2.8.2', '', 'https://update.joomla.org/language/details4/en-AU_details.xml', '', '', ''),
(11, 2, 0, 'English, Canada', '', 'pkg_en-CA', 'package', '', 0, '4.2.8.1', '', 'https://update.joomla.org/language/details4/en-CA_details.xml', '', '', ''),
(12, 2, 0, 'English, New Zealand', '', 'pkg_en-NZ', 'package', '', 0, '4.2.8.1', '', 'https://update.joomla.org/language/details4/en-NZ_details.xml', '', '', ''),
(13, 2, 0, 'English, USA', '', 'pkg_en-US', 'package', '', 0, '4.2.8.1', '', 'https://update.joomla.org/language/details4/en-US_details.xml', '', '', ''),
(14, 2, 0, 'Estonian', '', 'pkg_et-EE', 'package', '', 0, '4.3.0.1', '', 'https://update.joomla.org/language/details4/et-EE_details.xml', '', '', ''),
(15, 2, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '4.1.1.2', '', 'https://update.joomla.org/language/details4/fi-FI_details.xml', '', '', ''),
(16, 2, 0, 'Flemish', '', 'pkg_nl-BE', 'package', '', 0, '4.3.0.1', '', 'https://update.joomla.org/language/details4/nl-BE_details.xml', '', '', ''),
(17, 2, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '4.3.1.1', '', 'https://update.joomla.org/language/details4/fr-FR_details.xml', '', '', ''),
(18, 2, 0, 'Georgian', '', 'pkg_ka-GE', 'package', '', 0, '4.3.1.1', '', 'https://update.joomla.org/language/details4/ka-GE_details.xml', '', '', ''),
(19, 2, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '4.3.1.1', '', 'https://update.joomla.org/language/details4/de-DE_details.xml', '', '', ''),
(20, 2, 0, 'German, Austria', '', 'pkg_de-AT', 'package', '', 0, '4.3.1.1', '', 'https://update.joomla.org/language/details4/de-AT_details.xml', '', '', ''),
(21, 2, 0, 'German, Liechtenstein', '', 'pkg_de-LI', 'package', '', 0, '4.3.1.1', '', 'https://update.joomla.org/language/details4/de-LI_details.xml', '', '', ''),
(22, 2, 0, 'German, Luxembourg', '', 'pkg_de-LU', 'package', '', 0, '4.3.1.1', '', 'https://update.joomla.org/language/details4/de-LU_details.xml', '', '', ''),
(23, 2, 0, 'German, Switzerland', '', 'pkg_de-CH', 'package', '', 0, '4.3.1.1', '', 'https://update.joomla.org/language/details4/de-CH_details.xml', '', '', ''),
(24, 2, 0, 'Greek', '', 'pkg_el-GR', 'package', '', 0, '4.3.1.1', '', 'https://update.joomla.org/language/details4/el-GR_details.xml', '', '', ''),
(25, 2, 0, 'Hungarian', '', 'pkg_hu-HU', 'package', '', 0, '4.3.1.1', '', 'https://update.joomla.org/language/details4/hu-HU_details.xml', '', '', ''),
(26, 2, 0, 'Irish', '', 'pkg_ga-IE', 'package', '', 0, '4.2.8.1', '', 'https://update.joomla.org/language/details4/ga-IE_details.xml', '', '', ''),
(27, 2, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '4.3.1.1', '', 'https://update.joomla.org/language/details4/it-IT_details.xml', '', '', ''),
(28, 2, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '4.3.1.1', '', 'https://update.joomla.org/language/details4/ja-JP_details.xml', '', '', ''),
(29, 2, 0, 'Kazakh', '', 'pkg_kk-KZ', 'package', '', 0, '4.1.2.1', '', 'https://update.joomla.org/language/details4/kk-KZ_details.xml', '', '', ''),
(30, 2, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '4.3.1.1', '', 'https://update.joomla.org/language/details4/lv-LV_details.xml', '', '', ''),
(31, 2, 0, 'Lithuanian', '', 'pkg_lt-LT', 'package', '', 0, '4.2.9.1', '', 'https://update.joomla.org/language/details4/lt-LT_details.xml', '', '', ''),
(32, 2, 0, 'Macedonian', '', 'pkg_mk-MK', 'package', '', 0, '4.2.4.1', '', 'https://update.joomla.org/language/details4/mk-MK_details.xml', '', '', ''),
(33, 2, 0, 'Norwegian Bokmål', '', 'pkg_nb-NO', 'package', '', 0, '4.0.1.1', '', 'https://update.joomla.org/language/details4/nb-NO_details.xml', '', '', ''),
(34, 2, 0, 'Persian Farsi', '', 'pkg_fa-IR', 'package', '', 0, '4.3.1.1', '', 'https://update.joomla.org/language/details4/fa-IR_details.xml', '', '', ''),
(35, 2, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '4.2.8.2', '', 'https://update.joomla.org/language/details4/pl-PL_details.xml', '', '', ''),
(36, 2, 0, 'Portuguese, Brazil', '', 'pkg_pt-BR', 'package', '', 0, '4.0.3.1', '', 'https://update.joomla.org/language/details4/pt-BR_details.xml', '', '', ''),
(37, 2, 0, 'Portuguese, Portugal', '', 'pkg_pt-PT', 'package', '', 0, '4.0.0-rc4.2', '', 'https://update.joomla.org/language/details4/pt-PT_details.xml', '', '', ''),
(38, 2, 0, 'Romanian', '', 'pkg_ro-RO', 'package', '', 0, '4.3.1.1', '', 'https://update.joomla.org/language/details4/ro-RO_details.xml', '', '', ''),
(39, 2, 0, 'Russian', '', 'pkg_ru-RU', 'package', '', 0, '4.2.9.1', '', 'https://update.joomla.org/language/details4/ru-RU_details.xml', '', '', ''),
(40, 2, 0, 'Serbian, Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '4.2.7.1', '', 'https://update.joomla.org/language/details4/sr-RS_details.xml', '', '', ''),
(41, 2, 0, 'Serbian, Latin', '', 'pkg_sr-YU', 'package', '', 0, '4.3.1.1', '', 'https://update.joomla.org/language/details4/sr-YU_details.xml', '', '', ''),
(42, 2, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '4.3.0.1', '', 'https://update.joomla.org/language/details4/sk-SK_details.xml', '', '', ''),
(43, 2, 0, 'Slovenian', '', 'pkg_sl-SI', 'package', '', 0, '4.3.1.1', '', 'https://update.joomla.org/language/details4/sl-SI_details.xml', '', '', ''),
(44, 2, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '4.2.3.1', '', 'https://update.joomla.org/language/details4/es-ES_details.xml', '', '', ''),
(45, 2, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '4.3.1.1', '', 'https://update.joomla.org/language/details4/sv-SE_details.xml', '', '', ''),
(46, 2, 0, 'Tamil, India', '', 'pkg_ta-IN', 'package', '', 0, '4.3.1.1', '', 'https://update.joomla.org/language/details4/ta-IN_details.xml', '', '', ''),
(47, 2, 0, 'Thai', '', 'pkg_th-TH', 'package', '', 0, '4.3.1.1', '', 'https://update.joomla.org/language/details4/th-TH_details.xml', '', '', ''),
(48, 2, 0, 'Turkish', '', 'pkg_tr-TR', 'package', '', 0, '4.3.1.1', '', 'https://update.joomla.org/language/details4/tr-TR_details.xml', '', '', ''),
(49, 2, 0, 'Ukrainian', '', 'pkg_uk-UA', 'package', '', 0, '4.2.5.1', '', 'https://update.joomla.org/language/details4/uk-UA_details.xml', '', '', ''),
(50, 2, 0, 'Vietnamese', '', 'pkg_vi-VN', 'package', '', 0, '4.2.2.1', '', 'https://update.joomla.org/language/details4/vi-VN_details.xml', '', '', ''),
(51, 2, 0, 'Welsh', '', 'pkg_cy-GB', 'package', '', 0, '4.3.1.1', '', 'https://update.joomla.org/language/details4/cy-GB_details.xml', '', '', ''),
(52, 4, 237, 'YOOtheme - Joomla Template', '', 'pkg_yootheme', 'package', '', 0, '3.0.31', '', 'https://yootheme.com/api/update/yootheme_j33.xml', 'https://yootheme.com', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `b5651_update_sites`
--

CREATE TABLE `b5651_update_sites` (
  `update_site_id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` int DEFAULT '0',
  `last_check_timestamp` bigint DEFAULT '0',
  `extra_query` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `checked_out` int UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Update Sites';

--
-- Dumping data for table `b5651_update_sites`
--

INSERT INTO `b5651_update_sites` (`update_site_id`, `name`, `type`, `location`, `enabled`, `last_check_timestamp`, `extra_query`, `checked_out`, `checked_out_time`) VALUES
(1, 'Joomla! Core', 'collection', 'https://update.joomla.org/core/list.xml', 0, 0, '', NULL, NULL),
(2, 'Accredited Joomla! Translations', 'collection', 'https://update.joomla.org/language/translationlist_4.xml', 1, 1683606946, '', NULL, NULL),
(3, 'Joomla! Update Component', 'extension', 'https://update.joomla.org/core/extensions/com_joomlaupdate.xml', 1, 1683606946, '', NULL, NULL),
(4, 'YOOtheme', 'extension', 'https://yootheme.com/api/update/yootheme_j33.xml', 1, 1683606947, '', NULL, NULL),
(5, 'YOOtheme Installer', 'extension', 'https://yootheme.com/api/update/installer_yootheme_j33.xml', 1, 1683606948, '', NULL, NULL),
(6, 'FOF 4.x', 'extension', 'http://cdn.akeeba.com/updates/fof4_file.xml', 1, 1683606948, '', NULL, NULL),
(7, 'Akeeba FEF', 'extension', 'http://cdn.akeeba.com/updates/fef.xml', 1, 1683606948, '', NULL, NULL),
(8, 'Akeeba Backup Core', 'extension', 'https://cdn.akeeba.com/updates/pkgakeebacore.xml', 1, 1683606949, '', NULL, NULL),
(9, 'Akeeba Backup Core for Joomla!', 'extension', 'https://cdn.akeeba.com/updates/pkgakeebabackupcore.xml', 1, 1683608078, '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `b5651_update_sites_extensions`
--

CREATE TABLE `b5651_update_sites_extensions` (
  `update_site_id` int NOT NULL DEFAULT '0',
  `extension_id` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Links extensions to update sites';

--
-- Dumping data for table `b5651_update_sites_extensions`
--

INSERT INTO `b5651_update_sites_extensions` (`update_site_id`, `extension_id`) VALUES
(1, 220),
(2, 221),
(3, 24),
(4, 232),
(4, 233),
(4, 235),
(4, 236),
(4, 237),
(5, 234),
(6, 253),
(7, 260),
(8, 259),
(9, 261);

-- --------------------------------------------------------

--
-- Table structure for table `b5651_usergroups`
--

CREATE TABLE `b5651_usergroups` (
  `id` int UNSIGNED NOT NULL COMMENT 'Primary Key',
  `parent_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `b5651_usergroups`
--

INSERT INTO `b5651_usergroups` (`id`, `parent_id`, `lft`, `rgt`, `title`) VALUES
(1, 0, 1, 22, 'Public'),
(2, 1, 8, 19, 'Registered'),
(3, 2, 11, 16, 'Author'),
(4, 3, 12, 15, 'Editor'),
(5, 4, 13, 14, 'Publisher'),
(6, 1, 4, 7, 'Manager'),
(7, 6, 5, 6, 'Administrator'),
(8, 1, 20, 21, 'Super Users'),
(9, 1, 2, 3, 'Guest'),
(10, 2, 17, 18, 'Owners'),
(11, 2, 9, 10, 'Advertisers');

-- --------------------------------------------------------

--
-- Table structure for table `b5651_users`
--

CREATE TABLE `b5651_users` (
  `id` int NOT NULL,
  `name` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `block` tinyint NOT NULL DEFAULT '0',
  `sendEmail` tinyint DEFAULT '0',
  `registerDate` datetime NOT NULL,
  `lastvisitDate` datetime DEFAULT NULL,
  `activation` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastResetTime` datetime DEFAULT NULL COMMENT 'Date of last password reset',
  `resetCount` int NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  `otpKey` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Two factor authentication encrypted keys',
  `otep` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'One time emergency passwords',
  `requireReset` tinyint NOT NULL DEFAULT '0' COMMENT 'Require user to reset password on next login',
  `authProvider` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Name of used authentication plugin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `b5651_users`
--

INSERT INTO `b5651_users` (`id`, `name`, `username`, `email`, `password`, `block`, `sendEmail`, `registerDate`, `lastvisitDate`, `activation`, `params`, `lastResetTime`, `resetCount`, `otpKey`, `otep`, `requireReset`, `authProvider`) VALUES
(110, 'Noah Greenstone', 'noah', 'noah@joomstore.com', '$2y$10$8L4UDVedB2mfH140jTqtDuBo85dHwj.A.5RBE28czB6H7iOROdqS2', 0, 0, '2017-04-09 01:03:35', '2023-04-28 05:49:01', '', '{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"helpsite\":\"\",\"timezone\":\"Australia\\/Sydney\"}', '2017-04-09 01:03:35', 0, '', '', 0, ''),
(120, 'fastw3b', 'fastw3b', 'dev@fastw3b.com', '$2y$10$CgHxoLAoH0Yra7Vdt7gvGeKqmvgewanRzVM1mz5M0ZnZ/TQvc/862', 0, 1, '2022-10-25 09:19:41', '2023-04-12 09:35:41', '0', '', NULL, 0, '', '', 0, ''),
(124, 'owner 1', 'owner1@mail.com', 'owner1@mail.com', '$2y$10$ZJCuEWP17UTMeYsE0IaEA.vxMDxDmB4CQjii1BIeIRk5v2bvJqIJq', 0, 0, '2022-10-28 12:23:54', '2023-05-03 04:48:44', '', '{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"timezone\":\"\",\"a11y_mono\":\"0\",\"a11y_contrast\":\"0\",\"a11y_highlight\":\"0\",\"a11y_font\":\"0\"}', NULL, 0, '', '', 0, ''),
(125, 'test test', 'test141@mail.com', 'test141@mail.com', '$2y$10$N8.NsrxoArz/rl30CKg6VO6g2dlyMghY6oqT7SO9mh71muGVgnpOy', 0, 0, '2022-10-28 12:27:51', '2023-05-03 04:54:45', '', '{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"timezone\":\"\",\"a11y_mono\":\"0\",\"a11y_contrast\":\"0\",\"a11y_highlight\":\"0\",\"a11y_font\":\"0\"}', NULL, 0, '', '', 0, ''),
(126, 'owner 2', 'owner2@mail.com', 'owner2@mail.com', '$2y$10$l1roqv4xWvei1s0cLutPkOF1RsgctndvVBsczw1zUaaOUdE9BuStO', 0, 0, '2022-11-01 17:49:31', '2023-05-03 04:51:15', '', '{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"timezone\":\"\",\"a11y_mono\":\"0\",\"a11y_contrast\":\"0\",\"a11y_highlight\":\"0\",\"a11y_font\":\"0\"}', NULL, 0, '', '', 0, ''),
(127, 'owner 3', 'owner3@mail.com', 'owner3@mail.com', '$2y$10$BXe0MZM3mTOSO1y/BjCddOe5hB0QO.FmtQI2QBIqBn2drlCumZMs6', 0, 0, '2022-11-01 17:52:17', '2023-04-12 09:36:41', '', '{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"timezone\":\"\",\"a11y_mono\":\"0\",\"a11y_contrast\":\"0\",\"a11y_highlight\":\"0\",\"a11y_font\":\"0\"}', NULL, 0, '', '', 0, ''),
(128, 'owner 4', 'owner4@mail.com', 'owner4@mail.com', '$2y$10$A2mPuL08prOXwXB4lhzx.uLtB3q.vUVQ4m8c8sfsG7SNsGxQ/fqXm', 0, 0, '2022-11-16 09:27:37', '2022-11-16 09:28:21', '', '{}', NULL, 0, '', '', 0, ''),
(129, 'owner 5', 'owner5@mail.com', 'owner5@mail.com', '$2y$10$us2SMVagnbWucx9NzPoYse7TTw.m3XdsxZdNolj2kx6OSGQEzTmga', 0, 0, '2022-11-16 09:28:56', '2022-11-16 16:36:47', '', '{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"timezone\":\"\",\"a11y_mono\":\"0\",\"a11y_contrast\":\"0\",\"a11y_highlight\":\"0\",\"a11y_font\":\"0\"}', NULL, 0, '', '', 0, ''),
(130, 'Advertiser 2', 'advertiser2@mail.com', 'advertiser2@mail.com', '$2y$10$4v8ClNsVS6fNyt/kxjyufe19Pb5yepJZF7m2nnkkXTGznpNYZy7ea', 0, 0, '2022-11-16 10:08:54', '2023-03-10 02:08:57', '', '{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"timezone\":\"\",\"a11y_mono\":\"0\",\"a11y_contrast\":\"0\",\"a11y_highlight\":\"0\",\"a11y_font\":\"0\"}', NULL, 0, '', '', 0, ''),
(132, 'Winboard Admin', 'admin', 'dev@joomstore.com.au', '$2y$10$ilLcy5JoUIJdkgJ5AYtAM.GhH11lnnqwMND6tc/cqwOimEyeAVa6u', 0, 0, '2023-01-06 05:37:22', '2023-03-22 02:25:01', '', '{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"timezone\":\"\",\"a11y_mono\":\"0\",\"a11y_contrast\":\"0\",\"a11y_highlight\":\"0\",\"a11y_font\":\"0\"}', NULL, 0, '', '', 0, ''),
(134, 'advertiser6@mail.com test', 'advertiser6@mail.com', 'advertiser6@mail.com', '$2y$10$21qnT39HFtYEW.GQoIQckeHuGIeFiDFkAINn0DIGsIdQS/jBaQrsC', 0, 0, '2023-04-12 09:00:22', '2023-04-12 09:36:30', '', '{}', NULL, 0, '', '', 0, ''),
(135, 'Winboard Test', 'winboard', 'test@winboard.joomstore.com', '$2y$10$kblY1GWqIzDUUEbNdn/hGeuHYnSagrB2PZtJTIvRf/YCVPscRw0di', 0, 0, '2023-04-28 05:41:34', '2023-05-09 04:54:37', '', '{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"timezone\":\"\",\"a11y_mono\":\"0\",\"a11y_contrast\":\"0\",\"a11y_highlight\":\"0\",\"a11y_font\":\"0\"}', NULL, 0, '', '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `b5651_user_keys`
--

CREATE TABLE `b5651_user_keys` (
  `id` int UNSIGNED NOT NULL,
  `user_id` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `series` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uastring` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `b5651_user_mfa`
--

CREATE TABLE `b5651_user_mfa` (
  `id` int NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` tinyint NOT NULL DEFAULT '0',
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL,
  `last_used` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Multi-factor Authentication settings';

-- --------------------------------------------------------

--
-- Table structure for table `b5651_user_notes`
--

CREATE TABLE `b5651_user_notes` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `catid` int UNSIGNED NOT NULL DEFAULT '0',
  `subject` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint NOT NULL DEFAULT '0',
  `checked_out` int UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `created_user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL,
  `modified_user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL,
  `review_time` datetime DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `b5651_user_profiles`
--

CREATE TABLE `b5651_user_profiles` (
  `user_id` int NOT NULL,
  `profile_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Simple user profile storage table';

--
-- Dumping data for table `b5651_user_profiles`
--

INSERT INTO `b5651_user_profiles` (`user_id`, `profile_key`, `profile_value`, `ordering`) VALUES
(132, 'joomlatoken.enabled', '1', 1),
(132, 'joomlatoken.token', 'jCnAlS08riLFnOnTpVtCCvET4mWDI/lz4Kg+mDaFdrM=', 2),
(135, 'joomlatoken.enabled', '1', 2),
(135, 'joomlatoken.token', 'fGudGfDZdb8O6Fs3x4UOwktoMO6G7tqaYiu/4hk4bpc=', 1);

-- --------------------------------------------------------

--
-- Table structure for table `b5651_user_usergroup_map`
--

CREATE TABLE `b5651_user_usergroup_map` (
  `user_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `b5651_user_usergroup_map`
--

INSERT INTO `b5651_user_usergroup_map` (`user_id`, `group_id`) VALUES
(110, 8),
(120, 8),
(124, 2),
(124, 10),
(125, 2),
(125, 11),
(126, 2),
(126, 10),
(127, 2),
(127, 10),
(128, 2),
(128, 10),
(129, 2),
(129, 10),
(130, 2),
(130, 11),
(132, 8),
(134, 2),
(134, 11),
(135, 2),
(135, 8);

-- --------------------------------------------------------

--
-- Table structure for table `b5651_viewlevels`
--

CREATE TABLE `b5651_viewlevels` (
  `id` int UNSIGNED NOT NULL COMMENT 'Primary Key',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ordering` int NOT NULL DEFAULT '0',
  `rules` varchar(5120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `b5651_viewlevels`
--

INSERT INTO `b5651_viewlevels` (`id`, `title`, `ordering`, `rules`) VALUES
(1, 'Public', 0, '[1]'),
(2, 'Registered', 2, '[6,2,8]'),
(3, 'Special', 3, '[6,3,8]'),
(5, 'Guest', 1, '[9]'),
(6, 'Super Users', 4, '[8]'),
(7, 'Owners', 0, '[10]'),
(8, 'Advertisers', 0, '[11]');

-- --------------------------------------------------------

--
-- Table structure for table `b5651_wb_advertiser`
--

CREATE TABLE `b5651_wb_advertiser` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `street_number` int UNSIGNED DEFAULT NULL,
  `street_id` int UNSIGNED DEFAULT NULL,
  `postcode_id` int UNSIGNED DEFAULT NULL,
  `city_id` int UNSIGNED DEFAULT NULL,
  `state_id` int UNSIGNED DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `first_name` varchar(250) DEFAULT NULL,
  `surname` varchar(250) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `description` text,
  `published` tinyint UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `b5651_wb_advertiser`
--

INSERT INTO `b5651_wb_advertiser` (`id`, `user_id`, `street_number`, `street_id`, `postcode_id`, `city_id`, `state_id`, `created`, `first_name`, `surname`, `phone`, `email`, `image`, `description`, `published`) VALUES
(1, 125, 12, 1, 1, 1, 1, '2022-10-28 06:57:51', 'Advertiser', '1', '989898989', 'advertiser1@mail.com', NULL, NULL, 1),
(2, 130, NULL, NULL, NULL, NULL, NULL, '2022-11-16 04:38:54', 'Advertiser', '2', '989898989', 'advertiser2@mail.com', NULL, NULL, 1),
(3, 131, NULL, NULL, NULL, NULL, NULL, '2022-11-16 04:45:37', 'Advertiser', '3', '(02) 1111 0000', 'advertiser3@mail.com', NULL, NULL, 1),
(4, 133, NULL, NULL, NULL, NULL, NULL, '2023-04-12 02:32:06', 'test', 'test', '(02) 6760 8428', 'advertiser5@mail.com', NULL, NULL, 0),
(5, 134, NULL, NULL, NULL, NULL, NULL, '2023-04-12 03:30:22', 'advertiser6@mail.com', 'test', '(02) 6760 8428', 'advertiser6@mail.com', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `b5651_wb_city`
--

CREATE TABLE `b5651_wb_city` (
  `id` int UNSIGNED NOT NULL,
  `state_id` int UNSIGNED DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `b5651_wb_city`
--

INSERT INTO `b5651_wb_city` (`id`, `state_id`, `name`) VALUES
(1, 1, 'Dangar Island'),
(2, 2, 'Maddingley'),
(3, 6, 'Wesley Vale'),
(4, 5, 'Tarlee'),
(5, 1, 'Wallagoot'),
(6, 5, 'Punthari'),
(7, 1, 'Doon Ayre'),
(8, 3, 'Flinders View'),
(9, 3, 'Epsom'),
(10, 4, 'Hacketts Gully'),
(11, 5, 'Truro'),
(12, 1, 'Mount Mcdonald'),
(13, 2, 'Mickleham'),
(14, 1, 'Tanja'),
(15, 2, 'Fawkner North'),
(16, 1, 'Dolls Point'),
(17, 1, 'Butterwick'),
(18, 2, 'Mount Moriac'),
(19, 1, 'Brenda'),
(20, 2, 'Chetwynd'),
(21, 1, 'Tinonee'),
(22, 1, 'Armatree'),
(23, 4, 'Beachlands'),
(24, 3, 'Struck Oil'),
(25, 4, 'Mosman Park'),
(26, 4, 'Floreat'),
(27, 4, 'South Guildford'),
(28, 4, 'subiaco'),
(29, 1, 'bondi beach'),
(30, 4, 'Bunbury');

-- --------------------------------------------------------

--
-- Table structure for table `b5651_wb_country`
--

CREATE TABLE `b5651_wb_country` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `b5651_wb_country`
--

INSERT INTO `b5651_wb_country` (`id`, `name`) VALUES
(1, 'Australia');

-- --------------------------------------------------------

--
-- Table structure for table `b5651_wb_media`
--

CREATE TABLE `b5651_wb_media` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `b5651_wb_media`
--

INSERT INTO `b5651_wb_media` (`id`, `name`) VALUES
(4, 'Hanging Banner'),
(5, 'Installation'),
(1, 'Poster'),
(2, 'Projection'),
(3, 'Sign'),
(6, 'Wrap');

-- --------------------------------------------------------

--
-- Table structure for table `b5651_wb_owner`
--

CREATE TABLE `b5651_wb_owner` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `street_number` int UNSIGNED DEFAULT NULL,
  `street_id` int UNSIGNED DEFAULT NULL,
  `postcode_id` int UNSIGNED DEFAULT NULL,
  `city_id` int UNSIGNED DEFAULT NULL,
  `state_id` int UNSIGNED DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `first_name` varchar(250) DEFAULT NULL,
  `surname` varchar(250) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `stripe_email` varchar(250) DEFAULT NULL,
  `stripe_account` varchar(250) DEFAULT NULL,
  `stripe_connection_expires` datetime DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `description` text,
  `published` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `bank` varchar(250) DEFAULT NULL,
  `bsb` varchar(250) DEFAULT NULL,
  `account` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `b5651_wb_owner`
--

INSERT INTO `b5651_wb_owner` (`id`, `user_id`, `street_number`, `street_id`, `postcode_id`, `city_id`, `state_id`, `created`, `first_name`, `surname`, `phone`, `email`, `stripe_email`, `stripe_account`, `stripe_connection_expires`, `image`, `description`, `published`, `bank`, `bsb`, `account`) VALUES
(1, 124, NULL, NULL, NULL, NULL, 8, '2022-10-28 06:53:54', 'Owner', '1', '(02) 6760 8502', 'owner1@mail.com', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(2, 126, 35, 1, 1, 1, 1, '2022-11-01 12:19:31', 'Owner', '2', '(02) 6760 8502', 'owner2@mail.com', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(3, 127, 12, 1, 1, 1, 1, '2022-11-01 12:22:17', 'Owner', '3', '(02) 6760 8428', 'owner3@mail.com', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(4, 128, NULL, NULL, NULL, NULL, 8, '2022-11-16 03:57:37', 'Owner', '4', '(02) 6760 8428', 'owner4@mail.com', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(5, 129, NULL, NULL, NULL, NULL, NULL, '2022-11-16 03:58:56', 'Owner', '5', '(02) 6760 8428', 'owner5@mail.com', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `b5651_wb_postcode`
--

CREATE TABLE `b5651_wb_postcode` (
  `id` int UNSIGNED NOT NULL,
  `city_id` int UNSIGNED DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `b5651_wb_postcode`
--

INSERT INTO `b5651_wb_postcode` (`id`, `city_id`, `name`) VALUES
(1, 1, '2083'),
(2, NULL, '3340'),
(3, NULL, '7307'),
(4, NULL, '5411'),
(5, NULL, '2550'),
(6, NULL, '5238'),
(7, NULL, '2422'),
(8, NULL, '4305'),
(9, NULL, '4741'),
(10, NULL, '6076'),
(11, NULL, '5356'),
(12, NULL, '2793'),
(13, NULL, '3064'),
(14, NULL, '3060'),
(15, NULL, '2219'),
(16, NULL, '2321'),
(17, NULL, '3240'),
(18, NULL, '2831'),
(19, NULL, '3312'),
(20, NULL, '2430'),
(21, NULL, '6530'),
(22, NULL, '4714'),
(23, NULL, '6014'),
(24, NULL, '6055'),
(25, NULL, '2026'),
(26, NULL, '6230');

-- --------------------------------------------------------

--
-- Table structure for table `b5651_wb_precinct_type`
--

CREATE TABLE `b5651_wb_precinct_type` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `b5651_wb_precinct_type`
--

INSERT INTO `b5651_wb_precinct_type` (`id`, `name`) VALUES
(1, 'CBD'),
(2, 'High Street'),
(3, 'Residential'),
(4, 'Suburban'),
(5, 'Roadway'),
(6, 'Highway'),
(7, 'Industrial'),
(8, 'Agricultural'),
(9, 'Tourism');

-- --------------------------------------------------------

--
-- Table structure for table `b5651_wb_property`
--

CREATE TABLE `b5651_wb_property` (
  `id` int UNSIGNED NOT NULL,
  `owner_id` int UNSIGNED DEFAULT NULL,
  `verified` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `property_type_id` int UNSIGNED DEFAULT NULL,
  `precinct_type_id` int UNSIGNED DEFAULT NULL,
  `street_number` int UNSIGNED DEFAULT NULL,
  `street_id` int UNSIGNED DEFAULT NULL,
  `postcode_id` int UNSIGNED DEFAULT NULL,
  `city_id` int UNSIGNED DEFAULT NULL,
  `state_id` int UNSIGNED DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `precinct` text,
  `description` text,
  `title` varchar(250) DEFAULT NULL,
  `agent_name` varchar(250) DEFAULT NULL,
  `agent_phone` varchar(50) DEFAULT NULL,
  `agent_email` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `b5651_wb_property`
--

INSERT INTO `b5651_wb_property` (`id`, `owner_id`, `verified`, `property_type_id`, `precinct_type_id`, `street_number`, `street_id`, `postcode_id`, `city_id`, `state_id`, `created`, `latitude`, `longitude`, `precinct`, `description`, `title`, `agent_name`, `agent_phone`, `agent_email`) VALUES
(1, 3, 1, 2, 1, 12, 8, 8, 8, 3, '2022-11-03 10:23:40', -27.710282, 153.260099, '', '', 'property 1', '', '', ''),
(2, 3, 1, 2, 1, 12, 1, 1, 1, 1, '2022-11-03 10:56:01', -33.538079, 151.24055, '<p>bla <strong>bla</strong></p>', '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'property 2', '', '', ''),
(5, 5, 1, 2, 1, 34, 7, 7, 7, 1, '2022-11-16 12:40:01', -31.253218, 146.921099, '<p>Precinct description</p>', '<p>Property description</p>', 'Property #1', '', '', ''),
(6, 5, 1, 1, 1, 20, 6, 6, 6, 5, '2022-11-16 12:54:34', -34.929774, 139.332716, '<p>precinct descr</p>', '<p>property descr</p>', 'Property #2', '', '', ''),
(7, 5, 1, 3, 6, 91, 5, 5, 5, 1, '2022-11-16 13:00:32', -35.108681, 139.300653, '', '<p>property descr</p>', 'Property #3', '', '', ''),
(8, 5, 1, 2, 3, 19, 4, 4, 4, 5, '2022-11-16 13:02:59', -27.323645, 149.882111, '<p>precinct descr</p>', '<p>property descr</p>', 'Property #4', '', '', ''),
(9, 5, 1, 1, 5, 61, 3, 3, 3, 6, '2022-11-16 13:06:02', -41.24538, 146.422816, '<p>precinct descr</p>', '<p>property description</p>', 'Property #5', '', '', ''),
(10, 1, 1, 2, 5, 68, 2, 2, 2, 2, '2022-11-16 15:41:40', -38.153349, 144.360514, '', '', 'Property #6', '', '', ''),
(11, 2, 1, 2, 1, 18, 11, 11, 11, 5, '2022-11-18 04:33:27', -35.111137, 139.29977, '', '', 'Property #9', '', '', ''),
(12, 2, 1, 2, 1, 82, 10, 10, 10, 4, '2022-11-18 04:33:28', -31.981051, 116.103176, '', '', 'Propery #8', '', '', ''),
(13, 2, 1, 2, 1, 22, 9, 9, 9, 3, '2022-11-18 04:33:41', -20.908154, 148.998152, '', '', 'Property #7', '', '', ''),
(14, 2, 1, 2, 1, 36, 12, 12, 12, 1, '2022-11-18 04:45:42', -33.746969, 151.061464, '', '', 'Property #10', '', '', ''),
(15, 2, 1, 2, 1, 48, 5, 5, 14, 1, '2022-11-18 04:49:42', -36.713751, 149.836948, '', '', 'Property #14', '', '', ''),
(16, 2, 1, 2, 1, 27, 13, 13, 13, 2, '2022-11-18 04:49:43', -37.589753, 144.910176, '', '', 'Property #12', '', '', ''),
(17, 2, 1, 2, 1, 91, 14, 14, 15, 2, '2022-11-18 04:55:54', -37.714938, 144.969972, '', '', 'Property #15', '', '', ''),
(18, 2, 1, 2, 1, 82, 15, 15, 16, 1, '2022-11-18 05:16:28', -33.994201, 151.14264, '', '', 'Property #17', '', '', ''),
(19, 2, 1, 2, 1, 6, 16, 16, 17, 1, '2022-11-18 07:18:47', -32.65825, 151.639083, '', '', 'Property #20', '', '', ''),
(20, 2, 1, 2, 1, 17, 17, 17, 18, 2, '2022-11-18 05:19:06', -38.177549, 144.344772, '', '', 'Property #19', '', '', ''),
(21, 2, 1, 2, 1, 17, 18, 18, 19, 1, '2022-11-18 05:19:06', -36.907446, 174.768122, '', '', 'Property #18', '', '', ''),
(22, 2, 1, 2, 5, 51, 21, 21, 23, 4, '2022-11-18 06:23:22', -28.782619, 114.604344, '<p>precinct descr</p>', '<p>Rutrum quisque non tellus orci ac auctor augue mauris. Pharetra vel turpis nunc eget. Commodo elit at imperdiet dui accumsan. Urna id volutpat lacus laoreet non. Eget sit amet tellus cras adipiscing enim eu turpis egestas. Mattis rhoncus urna neque viverra justo nec ultrices dui. Sit amet consectetur adipiscing elit ut aliquam purus sit. Dolor morbi non arcu risus quis varius quam quisque id. In aliquam sem fringilla ut morbi. Vitae et leo duis ut diam quam. Condimentum id venenatis a condimentum vitae sapien pellentesque habitant. Neque aliquam vestibulum morbi blandit cursus. Feugiat nibh sed pulvinar proin gravida hendrerit lectus. Tincidunt tortor aliquam nulla facilisi cras fermentum odio. Odio morbi quis commodo odio aenean.</p>', 'Property #22', '', '', ''),
(23, 2, 1, 2, 5, 9, 22, 22, 24, 3, '2022-11-18 06:23:22', -24.214772, 151.898568, '', '', 'Property #26', '', '', ''),
(24, 2, 1, 2, 3, 22, 20, 20, 21, 1, '2022-11-18 06:25:18', -32.097676, 152.476284, '', '', 'Property #26', '', '', ''),
(25, 2, 1, 2, 3, 33, 18, 18, 22, 1, '2022-11-18 06:25:18', -31.446975, 148.479741, '', '', 'Property #21', '', '', ''),
(26, 2, 1, 2, 2, 82, 19, 19, 20, 2, '2022-11-18 06:27:42', -37.56148, 143.81202, '', '', 'Property #25', '', '', ''),
(27, 1, 1, 2, 4, 620, 23, NULL, 25, 4, '2023-02-26 19:25:53', -32.00719, 115.75799, '', '<p>Massive to over approximately 32000 cars per day.</p>\r\n<p>Windows approximately 160cm high by 180cm wide.</p>\r\n<p>&nbsp;</p>', 'Massive Exposure to Stirling Hwy', NULL, NULL, NULL),
(28, 1, 1, 3, 4, NULL, 24, 23, 26, 4, '2023-02-26 20:05:33', -31.935911, 115.792411, '<p>&nbsp;</p>\r\n<p>&nbsp;</p>', '<p>Busy suburban shopping centre located in the heart of Floreat, an affluent suburb 7kms to the west of the Perth CBD.</p>\r\n<p>The centre is anchored by Coles and Woolworths</p>\r\n<p>2 x Winboard opportunities facing Coles</p>\r\n<p>1x hoarding opportunity near busy western entrnce to centre&nbsp;</p>', 'Floreat Forum Shopping Centre', NULL, NULL, NULL),
(29, 1, 1, 4, 7, 128, 25, 24, 27, 4, '2023-02-26 23:11:56', -31.912611, 115.967956, '', '<p>Massive exposure to passing airline passengers</p>\r\n<p>Capture your customers before they land in Perth!</p>', 'Massive Rooftop Opportunity', NULL, NULL, NULL),
(30, 1, 1, 2, 2, 460, 26, NULL, 28, 4, '2023-02-27 00:03:38', -31.946849, 115.824267, '', '<p>Long Term Signage opportiunity available close to the Hay St &amp; Rokeby intersection.</p>\r\n<p>Exposure to approximatrely 65000 cars per week.</p>', '65000 cars per day', NULL, NULL, NULL),
(31, 1, 1, 7, 9, 1, 27, 25, 29, 1, '2023-02-27 19:33:32', -33.895281, 151.274414, NULL, '<p>Make a splash with you next campaign in Australias most iconic oceanside pool</p>', 'Bondi Icebergs', NULL, NULL, NULL),
(32, 1, 0, 3, 4, 60, 28, 26, 30, 4, '2023-02-28 22:41:12', -33.326058, 115.640224, NULL, '<p>Capture your target audience in Bunbury Centrepoint.</p>\r\n<p>The centre enjoys 2m+ vistations per year and has a diverse demographic profile.</p>', 'Bunbury Centrepoint Shopping Centre', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `b5651_wb_property_photo`
--

CREATE TABLE `b5651_wb_property_photo` (
  `id` int UNSIGNED NOT NULL,
  `property_id` int UNSIGNED DEFAULT NULL,
  `type` enum('precinct','building') NOT NULL DEFAULT 'building',
  `ordering` int UNSIGNED NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `filename` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `b5651_wb_property_photo`
--

INSERT INTO `b5651_wb_property_photo` (`id`, `property_id`, `type`, `ordering`, `created`, `filename`) VALUES
(15, 2, 'building', 2, '2022-11-04 05:54:43', '273026788_2981373928795791_9181696943439271328_n.jpg'),
(16, 2, 'building', 1, '2022-11-04 05:54:43', '273027679_2981374068795777_5357890056309619118_n.jpg'),
(17, 1, 'building', 1, '2022-11-08 08:37:06', '766786aa-e0f9-11ec-a1b1-02420a0000c9_1024.jpg'),
(18, 5, 'building', 1, '2022-11-16 10:46:35', 'orig_a8d837f9b1bcc7d92191ab92267db925.png'),
(19, 5, 'building', 2, '2022-11-16 10:46:36', 'orig_fc3634fa9576f5f8d120c556b04fa67d.jpg'),
(20, 6, 'building', 1, '2022-11-16 10:55:11', 'orig_8a8ca231bb7cba95a54b7b6a758c3a07.png'),
(21, 6, 'building', 2, '2022-11-16 10:55:11', 'orig_237dbd83591ac8e320d1f0ff1b34a4e6.jpg'),
(22, 6, 'building', 3, '2022-11-16 10:55:12', 'orig_541e97863a2b8f3445b11d479a9c272d.jpg'),
(23, 7, 'building', 1, '2022-11-16 11:00:51', 'orig_66d3c6f8da2718349e73012125641483.jpg'),
(24, 7, 'building', 2, '2022-11-16 11:00:51', 'orig_0815094714f721c380fa0ebaedb6c684.jpg'),
(25, 8, 'building', 1, '2022-11-16 11:03:17', 'orig_3f9e3068ed7f6f3ef4148484696f7078.jpg'),
(26, 8, 'building', 2, '2022-11-16 11:03:18', 'orig_09c63262e96e23ed83330df1a2b2fc02.jpg'),
(27, 8, 'building', 3, '2022-11-16 11:03:18', 'orig_b26ebb5790fff85aa869b9bee3c69226.png'),
(28, 9, 'building', 1, '2022-11-16 11:06:20', 'orig_5214e9b9425d7f3d4868bb73b6892a33.png'),
(29, 9, 'building', 2, '2022-11-16 11:06:21', 'orig_7231bf6322cbaf2c2bde71408b138075.jpg'),
(30, 10, 'building', 1, '2022-11-16 13:42:02', 'orig_3cbc769e2d47cc0a45a64a1c602f774a.jpg'),
(31, 10, 'building', 2, '2022-11-16 13:42:03', 'orig_4b6dc1983f3e58b5101e463fbf9d17bd.jpg'),
(32, 10, 'building', 3, '2022-11-16 13:42:03', 'orig_8d7188c7a272e768f15413bce5b36dae.png'),
(35, 13, 'building', 1, '2022-11-18 04:33:41', 'orig_702ef022bbe86c317ff8f33d15e3d4e3.png'),
(36, 13, 'building', 2, '2022-11-18 04:35:15', 'orig_bde72376f51cc44dfb72695857f606b3.jpg'),
(37, 12, 'building', 1, '2022-11-18 04:36:25', 'orig_33655a8d2258094f0c5e346f006adb2a.jpg'),
(38, 12, 'building', 2, '2022-11-18 04:36:25', 'orig_b7e75b0e06f3e728c0c2340fc7475650.png'),
(39, 11, 'building', 1, '2022-11-18 04:38:29', 'orig_365622a44605de99245e01c52f3f6424.png'),
(40, 11, 'building', 2, '2022-11-18 04:38:29', 'orig_bee51e63d9116a2ea148b0ce946d764a.jpg'),
(41, 11, 'building', 3, '2022-11-18 04:38:29', 'orig_cd0a36d310dba9d415915ae7d61e9c5c.jpg'),
(42, 14, 'building', 1, '2022-11-18 04:45:42', 'orig_1b60f64ebf203efc182d75e9e4865c23.png'),
(43, 14, 'building', 2, '2022-11-18 04:47:25', 'orig_36083b3fd01b3fb6e95a0aa157a6203a.jpg'),
(44, 14, 'building', 3, '2022-11-18 04:47:26', 'orig_e368c1867c1955e8c6451b415a26ed2b.jpg'),
(46, 16, 'building', 1, '2022-11-18 04:49:43', 'orig_e6a46d97a156f655bbe3e6d512c4849a.jpg'),
(47, 15, 'building', 1, '2022-11-18 04:53:13', 'orig_1d2fbe55018c564d76e546003940f8b9.png'),
(48, 15, 'building', 2, '2022-11-18 04:53:13', 'orig_1e6aa28ae03da23d9f076311137ef85c.jpg'),
(49, 15, 'building', 3, '2022-11-18 04:53:13', 'orig_98c4aa62f5768b8befd65be767a87c6f.jpg'),
(50, 17, 'building', 1, '2022-11-18 04:55:54', 'orig_34d5963ade58833406e5e61b06e8d672.jpg'),
(51, 18, 'building', 1, '2022-11-18 05:16:28', 'orig_2bc9e2502f0ac8f322083e9f89060e5c.jpg'),
(53, 21, 'building', 1, '2022-11-18 05:19:06', 'orig_b8efe8f245cfa2d45216e026716b5b25.jpg'),
(54, 20, 'building', 1, '2022-11-18 05:19:49', 'orig_0db3c819af2a3d4c8b4ea2e5df62024d.jpg'),
(55, 20, 'building', 2, '2022-11-18 05:19:49', 'orig_a8824e29a299ee3a6addac1bfa286a8a.jpg'),
(56, 21, 'building', 2, '2022-11-18 05:21:02', 'orig_40f3c0f923485ab26a090f576223e20c.jpg'),
(57, 19, 'building', 1, '2022-11-18 05:22:08', 'orig_4ab73906e317d256560af8dcbf06e7b4.jpg'),
(58, 19, 'building', 2, '2022-11-18 05:22:09', 'orig_4290d816a519d401a58c0e344e15324a.jpg'),
(66, 22, 'building', 1, '2022-11-18 06:23:22', 'orig_15b56aff41885c7e043ba735845ac16c.jpg'),
(67, 23, 'building', 1, '2022-11-18 06:23:22', 'orig_b28e57f3851794fdf90e4d4e72776e96.jpg'),
(68, 24, 'building', 1, '2022-11-18 06:25:18', 'orig_41d8bf88537fbfa543ec270cbd73e266.jpg'),
(69, 25, 'building', 1, '2022-11-18 06:25:18', 'orig_03240ad51101bf98f55f03840e7e617b.jpg'),
(70, 26, 'building', 1, '2022-11-18 06:27:42', 'orig_05bb0b76cb4eabdde073268b332115a7.jpg'),
(71, 26, 'building', 2, '2022-11-18 06:27:42', 'orig_041aa1c2a06ef698ad369c10f372125e.jpg'),
(74, 22, 'building', 2, '2022-12-12 09:25:09', '27228880c1ceac6d7d2aa567b3960f11.jpg'),
(77, 22, 'building', 3, '2022-12-12 09:39:15', 'b45b908fd934955af82ccb1d3bc8af69.jpg'),
(79, 27, 'building', 1, '2023-02-26 19:26:46', '620 Stirling Hwy-min.jpg'),
(80, 27, 'building', 2, '2023-02-26 19:26:57', '620 Stirling Hwy.jpg'),
(81, 28, 'building', 1, '2023-02-26 20:05:33', '7a67270a-9c7d-e811-8136-e0071b714b91_M.jpg'),
(82, 29, 'building', 1, '2023-02-26 23:11:56', 'Screenshot 2023-01-30 at 10.33.37 am-min-min.jpg'),
(83, 30, 'building', 1, '2023-02-27 00:03:38', '5a4ffdf6d8832a10d4ced8217a91fb009e435c97 copy.png'),
(84, 30, 'building', 2, '2023-02-27 00:03:54', 'Subiaco David Henry.jpg'),
(85, 31, 'building', 1, '2023-02-27 19:33:32', 'IMG_5638.JPG'),
(86, 32, 'building', 1, '2023-02-28 22:41:12', 'Screenshot 2023-03-01 at 12.09.53 pm.png');

-- --------------------------------------------------------

--
-- Table structure for table `b5651_wb_property_type`
--

CREATE TABLE `b5651_wb_property_type` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `b5651_wb_property_type`
--

INSERT INTO `b5651_wb_property_type` (`id`, `name`) VALUES
(1, 'Office Building'),
(2, 'Standalone  Retail Building'),
(3, 'Shopping Centre Retail'),
(4, 'Industrial'),
(5, 'Agricultural/Farming'),
(6, 'Residential'),
(7, 'Tourist Attraction'),
(8, 'Public Transport Precinct');

-- --------------------------------------------------------

--
-- Table structure for table `b5651_wb_property_verification`
--

CREATE TABLE `b5651_wb_property_verification` (
  `id` int UNSIGNED NOT NULL,
  `property_id` int UNSIGNED DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `filename` varchar(250) NOT NULL,
  `verified` tinyint UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `b5651_wb_property_verification`
--

INSERT INTO `b5651_wb_property_verification` (`id`, `property_id`, `created`, `filename`, `verified`) VALUES
(1, 22, '2022-11-25 11:09:15', '1646051565.jpg', 1),
(2, 22, '2022-11-25 11:09:15', 'yacht.jpg', 1),
(3, 22, '2022-11-25 11:14:33', '1148943202.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `b5651_wb_state`
--

CREATE TABLE `b5651_wb_state` (
  `id` int UNSIGNED NOT NULL,
  `country_id` int UNSIGNED DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `code` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `b5651_wb_state`
--

INSERT INTO `b5651_wb_state` (`id`, `country_id`, `name`, `code`) VALUES
(1, 1, 'New South Wales', 'NSW'),
(2, 1, 'Victoria', 'VIC'),
(3, 1, 'Queensland', 'QLD'),
(4, 1, 'Western Australia', 'WA'),
(5, 1, 'South Australia', 'SA'),
(6, 1, 'Tasmania', 'TAS'),
(7, 1, 'Northern Territory', 'NT'),
(8, 1, 'Australian Capital Territory', 'ACT');

-- --------------------------------------------------------

--
-- Table structure for table `b5651_wb_street`
--

CREATE TABLE `b5651_wb_street` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `b5651_wb_street`
--

INSERT INTO `b5651_wb_street` (`id`, `name`) VALUES
(20, 'Aquatic Road'),
(22, 'Bayview Close'),
(3, 'Benny Street'),
(5, 'Black Range Road'),
(28, 'Blair'),
(9, 'Buoro Street'),
(12, 'Chapman Avenue'),
(24, 'Cnr Howtree Place &, The Blvd'),
(17, 'Corio Street'),
(14, 'Creedon Street'),
(6, 'Dabinett Road'),
(18, 'Fernleigh Ave'),
(25, 'Great Eastern Hwy'),
(26, 'hay st'),
(10, 'Jacolite Street'),
(19, 'Learmouth Street'),
(2, 'Little Myers Street'),
(15, 'Magnolia Drive'),
(7, 'Manchester Road'),
(16, 'Mnimbah Road'),
(1, 'Norton Street'),
(27, 'notts ave'),
(23, 'Stirling Hwy'),
(13, 'Thomas Lane'),
(11, 'Thule Drive'),
(21, 'Todd Street'),
(4, 'Weigall Avenue'),
(8, 'Zipfs Road');

-- --------------------------------------------------------

--
-- Table structure for table `b5651_wb_winboard`
--

CREATE TABLE `b5651_wb_winboard` (
  `id` int UNSIGNED NOT NULL,
  `winboard_type_id` int UNSIGNED DEFAULT NULL,
  `property_id` int UNSIGNED DEFAULT NULL,
  `published` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `width` int UNSIGNED DEFAULT NULL,
  `height` int UNSIGNED DEFAULT NULL,
  `depth` int UNSIGNED DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `traffic` text,
  `location` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `bump_in_out` text,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `b5651_wb_winboard`
--

INSERT INTO `b5651_wb_winboard` (`id`, `winboard_type_id`, `property_id`, `published`, `created`, `width`, `height`, `depth`, `date_from`, `date_to`, `price`, `traffic`, `location`, `name`, `image`, `bump_in_out`, `description`) VALUES
(1, 1, 2, 1, '2022-11-04 07:03:28', 1200, 1200, 10, '2022-11-15', '2022-12-31', '10.00', '', '', 'Winboard #001', NULL, '', NULL),
(2, 3, 1, 1, '2022-11-04 07:03:28', 1800, 1200, 10, '2022-11-15', '2022-12-31', '8.00', '', '', 'Winboard #002', NULL, '', NULL),
(3, 3, 1, 1, '2022-11-04 07:06:34', 2400, 1000, 0, '2022-11-15', '2022-12-31', '10.00', '', '', 'Winboard #003', NULL, '', NULL),
(4, 1, 5, 1, '2022-11-16 12:40:01', 1200, 1200, 0, '2022-11-16', '2022-12-31', '9.00', NULL, NULL, 'Winboard #004', NULL, NULL, NULL),
(5, 3, 5, 1, '2022-11-16 12:40:01', 1200, 1200, 0, '2022-11-16', '2022-12-31', '8.00', NULL, NULL, 'Winboard #005', NULL, NULL, NULL),
(6, 2, 5, 1, '2022-11-16 12:40:01', 1200, 1200, 0, '2022-11-16', '2022-12-31', '7.00', NULL, NULL, 'Winboard #006', NULL, NULL, NULL),
(7, 4, 5, 1, '2022-11-16 12:40:01', 1200, 1200, 0, '2022-11-17', '2022-12-31', '10.00', NULL, NULL, 'Winboard #007', NULL, NULL, NULL),
(8, 5, 5, 1, '2022-11-16 12:40:01', 1200, 1200, 0, '2022-11-17', '2022-12-31', '11.00', NULL, NULL, 'Winboard #008', NULL, NULL, NULL),
(9, 6, 5, 1, '2022-11-16 12:40:01', 1200, 1200, 0, '2022-11-17', '2022-12-31', '12.00', NULL, NULL, 'Winboard #009', NULL, NULL, NULL),
(10, 7, 5, 1, '2022-11-16 12:40:01', 1200, 1200, 0, '2022-11-18', '2022-12-31', '13.00', NULL, NULL, 'Winboard #0010', NULL, NULL, NULL),
(11, 1, 6, 1, '2022-11-16 12:54:34', 100, 100, 0, '2022-11-18', '2022-12-31', '14.00', NULL, NULL, 'Winboard #0011', NULL, NULL, NULL),
(12, 3, 6, 1, '2022-11-16 12:54:34', 100, 100, 0, '2022-11-18', '2022-12-31', '15.00', NULL, NULL, 'Winboard #0012', NULL, NULL, NULL),
(13, 2, 6, 1, '2022-11-16 12:54:34', 100, 100, 0, '2022-11-19', '2022-12-31', '16.00', NULL, NULL, 'Winboard #0013', NULL, NULL, NULL),
(14, 4, 6, 1, '2022-11-16 12:54:34', 100, 100, 0, '2022-11-19', '2022-12-31', '17.00', NULL, NULL, 'Winboard #0014', NULL, NULL, NULL),
(15, 5, 6, 1, '2022-11-16 12:54:34', 100, 100, 0, '2022-11-19', '2022-12-31', '18.00', NULL, NULL, 'Winboard #0015', NULL, NULL, NULL),
(16, 6, 6, 1, '2022-11-16 12:54:34', 100, 100, 0, '2022-11-20', '2022-12-31', '19.00', NULL, NULL, 'Winboard #0016', NULL, NULL, NULL),
(17, 7, 6, 1, '2022-11-16 12:54:34', 100, 100, 0, '2022-11-20', '2022-12-31', '20.00', NULL, NULL, 'Winboard #0017', NULL, NULL, NULL),
(18, 1, 7, 1, '2022-11-16 13:00:33', 120, 120, 0, '2022-11-20', '2022-12-31', '21.00', NULL, NULL, 'Winboard #0018', NULL, NULL, NULL),
(19, 3, 7, 1, '2022-11-16 13:00:33', 120, 120, 0, '2022-11-21', '2022-12-31', '22.00', NULL, NULL, 'Winboard #0019', NULL, NULL, NULL),
(20, 2, 7, 1, '2022-11-16 13:00:33', 120, 120, 0, '2022-11-20', '2022-12-31', '23.00', NULL, NULL, 'Winboard #0020', NULL, NULL, NULL),
(21, 4, 7, 1, '2022-11-16 13:00:33', 120, 120, 0, '2022-11-20', '2022-12-31', '24.00', NULL, NULL, 'Winboard #0021', NULL, NULL, NULL),
(22, 5, 7, 1, '2022-11-16 13:00:33', 120, 120, 0, '2022-11-20', '2022-12-31', '25.00', NULL, NULL, 'Winboard #0022', NULL, NULL, NULL),
(23, 6, 7, 1, '2022-11-16 13:00:33', 120, 120, 0, '2022-11-20', '2022-12-31', '26.00', NULL, NULL, 'Winboard #0023', NULL, NULL, NULL),
(24, 7, 7, 1, '2022-11-16 13:00:33', 120, 120, 0, '2022-11-20', '2022-12-31', '27.00', NULL, NULL, 'Winboard #0024', NULL, NULL, NULL),
(25, 1, 8, 1, '2022-11-16 13:02:59', 150, 150, 0, '2022-11-20', '2022-12-31', '28.00', NULL, NULL, 'Winboard #0025', NULL, NULL, NULL),
(26, 3, 8, 1, '2022-11-16 13:02:59', 150, 150, 0, '2022-11-20', '2022-12-31', '29.00', NULL, NULL, 'Winboard #0026', NULL, NULL, NULL),
(27, 2, 8, 1, '2022-11-16 13:02:59', 150, 150, 0, '2022-11-20', '2022-12-31', '30.00', NULL, NULL, 'Winboard #0027', NULL, NULL, NULL),
(28, 4, 8, 1, '2022-11-16 13:02:59', 150, 150, 0, '2022-11-20', '2022-12-31', '31.00', NULL, NULL, 'Winboard #0028', NULL, NULL, NULL),
(29, 5, 8, 1, '2022-11-16 13:02:59', 150, 150, 0, '2022-11-20', '2022-12-31', '32.00', NULL, NULL, 'Winboard #0029', NULL, NULL, NULL),
(30, 6, 8, 1, '2022-11-16 13:02:59', 150, 150, 0, '2022-11-20', '2022-12-31', '33.00', NULL, NULL, 'Winboard #0030', NULL, NULL, NULL),
(31, 7, 8, 1, '2022-11-16 13:02:59', 150, 150, 0, '2022-11-20', '2022-12-31', '34.00', NULL, NULL, 'Winboard #0031', NULL, NULL, NULL),
(32, 1, 9, 1, '2022-11-16 13:06:02', 140, 140, 0, '2022-11-20', '2023-01-20', '35.00', NULL, NULL, 'Winboard #0032', NULL, NULL, NULL),
(33, 3, 9, 1, '2022-11-16 13:06:02', 140, 140, 0, '2022-11-20', '2022-12-31', '36.00', NULL, NULL, 'Winboard #0033', NULL, NULL, NULL),
(34, 2, 9, 1, '2022-11-16 13:06:02', 140, 140, 0, '2022-11-20', '2022-12-31', '37.00', NULL, NULL, 'Winboard #0034', NULL, NULL, NULL),
(35, 4, 9, 1, '2022-11-16 13:06:02', 140, 140, 0, '2022-11-20', '2022-12-31', '38.00', NULL, NULL, 'Winboard #0035', NULL, NULL, NULL),
(36, 5, 9, 1, '2022-11-16 13:06:02', 140, 140, 0, '2022-11-20', '2022-12-31', '39.00', NULL, NULL, 'Winboard #0036', NULL, NULL, NULL),
(37, 6, 22, 1, '2022-11-16 13:06:02', 140, 140, 0, '2022-11-20', '2022-12-31', '40.00', NULL, NULL, 'Winboard #0037', NULL, NULL, NULL),
(38, 7, 9, 1, '2022-11-16 13:06:02', 140, 140, 0, '2022-11-20', '2022-12-31', '41.00', NULL, NULL, 'Winboard #0038', NULL, NULL, NULL),
(39, 1, 10, 1, '2022-11-16 15:43:10', 100, 100, 0, NULL, NULL, '39.00', NULL, NULL, 'Winboard #0039', NULL, NULL, NULL),
(40, 3, 10, 1, '2022-11-16 15:43:10', 100, 100, 0, NULL, NULL, '39.00', NULL, NULL, 'Winboard #0040', NULL, NULL, NULL),
(41, 2, 10, 1, '2022-11-16 15:43:10', 100, 100, 0, NULL, NULL, '39.00', NULL, NULL, 'Winboard #0041', NULL, NULL, NULL),
(42, 4, 22, 1, '2022-11-16 15:43:10', 100, 100, 0, NULL, NULL, '39.00', NULL, NULL, 'Winboard #0042', NULL, NULL, NULL),
(43, 5, 10, 1, '2022-11-16 15:43:10', 100, 100, 0, NULL, NULL, '39.00', NULL, NULL, 'Winboard #0043', NULL, NULL, NULL),
(44, 6, 10, 1, '2022-11-16 15:43:10', 100, 100, 0, NULL, NULL, '39.00', NULL, NULL, 'Winboard #0044', NULL, NULL, NULL),
(45, 1, 13, 1, '2022-11-18 06:35:49', 120, 120, 0, NULL, NULL, '39.00', NULL, NULL, 'Winboard #0045', NULL, NULL, NULL),
(46, 3, 13, 1, '2022-11-18 06:35:49', 150, 60, 0, NULL, NULL, '39.00', NULL, NULL, 'Winboard #0046', NULL, NULL, NULL),
(47, 1, 11, 1, '2022-11-18 06:39:45', 120, 120, 0, NULL, NULL, '39.00', NULL, NULL, 'Winboard #0047', NULL, NULL, NULL),
(48, 3, 11, 1, '2022-11-18 06:39:45', 150, 150, 0, NULL, NULL, '39.00', NULL, NULL, 'Winboard #0048', NULL, NULL, NULL),
(49, 1, 14, 1, '2022-11-18 06:47:00', 130, 130, 0, NULL, NULL, '39.00', NULL, NULL, 'Winboard #0049', NULL, NULL, NULL),
(50, 2, 14, 1, '2022-11-18 06:47:00', 120, 120, 0, NULL, NULL, '39.00', NULL, NULL, 'Winboard #0050', NULL, NULL, NULL),
(51, 1, 16, 1, '2022-11-18 06:52:31', 110, 110, 0, NULL, NULL, '39.00', NULL, NULL, 'Winboard #0051', NULL, NULL, NULL),
(52, 4, 16, 1, '2022-11-18 06:52:31', 120, 120, 0, NULL, NULL, '39.00', NULL, NULL, 'Winboard #0052', NULL, NULL, NULL),
(53, 1, 15, 1, '2022-11-18 06:54:41', 150, 150, 0, NULL, NULL, '39.00', NULL, NULL, 'Winboard #0053', NULL, NULL, NULL),
(54, 1, 15, 1, '2022-11-18 06:54:41', 140, 140, 0, NULL, NULL, '39.00', NULL, NULL, 'Winboard #0054', NULL, NULL, NULL),
(55, 5, 15, 1, '2022-11-18 06:54:41', 200, 200, 0, NULL, NULL, '39.00', NULL, NULL, 'Winboard #0055', NULL, NULL, NULL),
(56, 1, 17, 1, '2022-11-18 06:57:45', 150, 150, 0, NULL, NULL, '39.00', NULL, NULL, 'Winboard #0056', NULL, NULL, NULL),
(57, 6, 17, 1, '2022-11-18 06:57:45', 200, 200, 0, NULL, NULL, '39.00', NULL, NULL, 'Winboard #0057', NULL, NULL, NULL),
(58, 1, 18, 1, '2022-11-18 07:17:41', 200, 200, 0, NULL, NULL, '39.00', NULL, 'location on building', 'Winboard #0058', NULL, NULL, NULL),
(59, 4, 18, 1, '2022-11-18 07:17:41', 300, 100, 0, NULL, NULL, '39.00', NULL, 'location on building', 'Winboard #0059', NULL, NULL, NULL),
(60, 6, 18, 1, '2022-11-18 07:17:41', 500, 300, 0, NULL, NULL, '39.00', NULL, 'location on building', 'Winboard #0060', NULL, NULL, NULL),
(61, 1, 21, 1, '2022-11-18 07:21:44', 200, 200, 0, NULL, NULL, '39.00', NULL, 'location on building', 'Winboard #0061', NULL, NULL, NULL),
(62, 2, 21, 1, '2022-11-18 07:21:44', 200, 200, 0, NULL, NULL, '39.00', NULL, 'location on building', 'Winboard #0062', NULL, NULL, NULL),
(63, 5, 21, 1, '2022-11-18 07:21:44', 100, 100, 0, NULL, NULL, '39.00', NULL, 'location on building', 'Winboard #0063', NULL, NULL, NULL),
(64, 3, 19, 1, '2022-11-18 07:22:49', 150, 150, 0, NULL, NULL, '39.00', NULL, 'location on building', 'Winboard #0064', NULL, NULL, NULL),
(65, 5, 19, 1, '2022-11-18 07:22:49', 200, 200, 0, NULL, NULL, '39.00', NULL, 'location on building', 'Winboard #0065', NULL, NULL, NULL),
(66, 7, 19, 1, '2022-11-18 07:22:49', 300, 200, 0, NULL, NULL, '39.00', NULL, 'location on building', 'Winboard #0066', NULL, NULL, NULL),
(67, 3, 26, 1, '2022-11-18 08:29:07', 150, 150, 0, NULL, NULL, '39.00', NULL, 'location on building', 'Winboard #0067', NULL, NULL, NULL),
(68, 4, 26, 1, '2022-11-18 08:29:07', 300, 200, 0, NULL, NULL, '39.00', NULL, 'location on building', 'Winboard #0068', NULL, NULL, NULL),
(69, 6, 26, 1, '2022-11-18 08:29:07', 200, 500, 0, NULL, NULL, '39.00', NULL, 'location on building', 'Winboard #0069', NULL, NULL, NULL),
(70, 3, 24, 1, '2022-11-18 08:30:48', 200, 100, 0, NULL, NULL, '39.00', NULL, 'location on building', 'Winboard #0070', NULL, NULL, NULL),
(71, 6, 24, 1, '2022-11-18 08:30:48', 500, 500, 0, NULL, NULL, '39.00', NULL, 'location on building', 'Winboard #0071', NULL, NULL, NULL),
(72, 7, 24, 1, '2022-11-18 08:30:48', 10000, 200, 0, NULL, NULL, '39.00', NULL, 'location on building', 'Winboard #0072', NULL, NULL, NULL),
(73, 1, 25, 1, '2022-11-18 08:33:17', 300, 100, 0, NULL, NULL, '39.00', NULL, 'location on building', 'Winboard #0073', NULL, NULL, NULL),
(74, 1, 25, 1, '2022-11-18 08:33:17', 200, 100, 0, NULL, NULL, '39.00', NULL, 'location on building', 'Winboard #0074', NULL, NULL, NULL),
(75, 3, 25, 1, '2022-11-18 08:33:17', 500, 100, 0, NULL, NULL, '39.00', NULL, 'location on building', 'Winboard #0075', NULL, NULL, NULL),
(76, 6, 25, 1, '2022-11-18 08:33:17', 500, 100, 0, NULL, NULL, '39.00', NULL, 'location on building', 'Winboard #0076', NULL, NULL, NULL),
(77, 1, 22, 1, '2022-11-18 08:36:30', 100, 100, 0, NULL, NULL, '39.00', NULL, 'location on building', 'Winboard #0077', NULL, NULL, NULL),
(78, 3, 22, 1, '2022-11-18 08:36:30', 200, 200, 0, NULL, NULL, '39.00', 'traffic text one two three', 'location on building', 'Winboard #0078', NULL, 'bump in out', 'description text'),
(79, 2, 22, 1, '2022-11-18 08:36:30', 200, 200, 0, NULL, NULL, '39.00', NULL, 'location on building', 'Winboard #0079', NULL, NULL, NULL),
(80, 1, 14, 1, '2022-11-18 08:37:50', 200, 100, 0, '2022-11-01', '2023-01-26', '38.00', '', 'location on building', 'Winboard #0080', NULL, '', NULL),
(81, 1, 14, 1, '2022-11-18 08:37:50', 300, 100, 0, '2022-11-10', '2022-12-30', '39.00', '', 'location on building', 'Winboard #0081', NULL, '', NULL),
(82, 3, 23, 1, '2022-11-18 08:37:50', 200, 200, 0, NULL, NULL, '39.00', NULL, 'location on building', 'Winboard #0082', NULL, NULL, NULL),
(83, 6, 22, 1, '2022-12-12 11:49:38', 120, 120, 0, '2022-12-01', '2023-02-28', '24.00', 'estimated traffic', 'location on building', 'Winboard #0084', NULL, 'bump in out', NULL),
(84, 6, 22, 1, '2022-12-12 12:03:18', 120, 120, 0, '2023-03-31', '2023-05-31', '26.00', 'estimated traffic', 'location on building', 'Winboard #0085', 'winboardslider3.jpg', 'bump in out', NULL),
(85, 2, 27, 1, '2023-02-27 06:52:15', 180, 160, 0, '2023-02-28', '2023-06-30', '75.00', '32000 ', 'Shop Front', 'Stirling Highway Windows', NULL, 'Liaise with owner upon agreed License', NULL),
(86, 8, 28, 1, '2023-02-27 09:03:32', 1000, 200, 50, '2023-03-01', '2023-04-14', '50.00', '5000', 'Internal facing Coles near western entrance', 'Hoarding Opportunity ', NULL, 'Liaise with Property management', NULL),
(87, 2, 28, 1, '2023-02-27 09:03:32', 600, 200, 200, '2023-03-01', '2023-05-31', '75.00', '5000', 'Internal facing Coles', 'Prime Signage Opportunity', NULL, 'Liaise with Property Management prior to bump in', NULL),
(88, 2, 28, 1, '2023-02-27 09:03:32', 150, 200, 0, '2023-03-01', '2023-04-30', '30.00', '', 'Internal ', 'Prime Poster Opportunity', NULL, '', NULL),
(89, 3, 29, 1, '2023-02-27 10:17:40', 3000, 10000, 0, '2023-03-01', '2023-06-30', '600.00', '10000', 'Rooftop', 'Massive Exposure to Airline Passengers', NULL, '', NULL),
(90, 8, 30, 1, '2023-02-27 11:08:57', 2000, 200, 0, NULL, NULL, '250.00', '8000', 'External facing Hay St', 'Your Campaign Here', NULL, '', NULL),
(91, 6, 31, 1, '2023-03-01 08:24:32', 2500, 5000, 0, '2023-04-01', '2023-05-31', '750000.00', '', 'Pool floor', 'Australias most iconic pool', NULL, '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `b5651_wb_winboard_booking`
--

CREATE TABLE `b5651_wb_winboard_booking` (
  `id` int UNSIGNED NOT NULL,
  `winboard_id` int UNSIGNED DEFAULT NULL,
  `advertiser_id` int UNSIGNED DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `artwork` varchar(250) DEFAULT NULL,
  `amount` decimal(12,2) DEFAULT NULL,
  `admin_fee` decimal(12,2) DEFAULT NULL,
  `stripe_fee` decimal(12,2) DEFAULT NULL,
  `date_paid` datetime DEFAULT NULL,
  `status` enum('pending','accepted','paid','completed','canceled') NOT NULL DEFAULT 'pending',
  `brief` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `b5651_wb_winboard_booking`
--

INSERT INTO `b5651_wb_winboard_booking` (`id`, `winboard_id`, `advertiser_id`, `created`, `date_from`, `date_to`, `artwork`, `amount`, `admin_fee`, `stripe_fee`, `date_paid`, `status`, `brief`) VALUES
(1, 2, 1, '2022-11-15 09:22:52', '2022-11-15', '2022-12-01', '272035266.jpg', '136.00', NULL, NULL, NULL, 'pending', NULL),
(2, 83, 1, '2022-12-21 02:48:30', '2022-12-22', '2022-12-25', '', '96.00', NULL, NULL, NULL, 'pending', NULL),
(3, 83, 1, '2022-12-21 02:54:36', '2022-12-22', '2022-12-25', '72_blog_everything_is_ukraine.jpg', '96.00', NULL, NULL, NULL, 'accepted', NULL),
(4, 67, 2, '2023-02-23 23:47:01', '2023-03-01', '2023-03-31', '5732rb1i6lumteaikve2r4wfn40m.png', '1209.00', NULL, NULL, NULL, 'accepted', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `b5651_wb_winboard_booking_messages`
--

CREATE TABLE `b5651_wb_winboard_booking_messages` (
  `id` int UNSIGNED NOT NULL,
  `winboard_booking_id` int UNSIGNED DEFAULT NULL,
  `direction` enum('in','out') NOT NULL DEFAULT 'in',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `message` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `b5651_wb_winboard_media`
--

CREATE TABLE `b5651_wb_winboard_media` (
  `id` int UNSIGNED NOT NULL,
  `winboard_id` int UNSIGNED NOT NULL,
  `media_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `b5651_wb_winboard_media`
--

INSERT INTO `b5651_wb_winboard_media` (`id`, `winboard_id`, `media_id`) VALUES
(1, 3, 4),
(2, 3, 1),
(4, 1, 4),
(5, 1, 1),
(6, 2, 1),
(7, 80, 4),
(8, 80, 1),
(9, 81, 1),
(10, 81, 2),
(11, 83, 4),
(12, 83, 1),
(15, 78, 4),
(16, 78, 1),
(17, 84, 2),
(18, 84, 3),
(19, 85, 5),
(20, 85, 1),
(21, 85, 3),
(22, 86, 1),
(23, 86, 3),
(24, 87, 4),
(25, 87, 5),
(26, 87, 1),
(27, 87, 3),
(28, 88, 1),
(29, 88, 3),
(30, 89, 1),
(31, 89, 3),
(32, 90, 4),
(33, 90, 1),
(34, 90, 3),
(35, 91, 2),
(36, 91, 3);

-- --------------------------------------------------------

--
-- Table structure for table `b5651_wb_winboard_message`
--

CREATE TABLE `b5651_wb_winboard_message` (
  `id` int UNSIGNED NOT NULL,
  `obj_id` int UNSIGNED NOT NULL,
  `obj_type` enum('property','winboard','booking') NOT NULL DEFAULT 'winboard',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `b5651_wb_winboard_message`
--

INSERT INTO `b5651_wb_winboard_message` (`id`, `obj_id`, `obj_type`, `created`) VALUES
(1, 2, 'winboard', '2022-12-10 12:42:49'),
(2, 83, 'winboard', '2022-12-21 02:41:26');

-- --------------------------------------------------------

--
-- Table structure for table `b5651_wb_winboard_message_chat`
--

CREATE TABLE `b5651_wb_winboard_message_chat` (
  `id` int UNSIGNED NOT NULL,
  `message_id` int UNSIGNED NOT NULL,
  `from_user_id` int UNSIGNED NOT NULL,
  `to_user_id` int UNSIGNED NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `seen` datetime DEFAULT NULL,
  `message` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `b5651_wb_winboard_message_chat`
--

INSERT INTO `b5651_wb_winboard_message_chat` (`id`, `message_id`, `from_user_id`, `to_user_id`, `created`, `seen`, `message`) VALUES
(1, 1, 125, 127, '2022-12-10 12:42:49', NULL, 'this is a new message to the user'),
(2, 1, 125, 127, '2022-12-19 22:19:44', NULL, 'Message to the owner1'),
(3, 2, 125, 126, '2022-12-21 02:41:26', '2022-12-21 08:12:31', 'Hello Owner 22'),
(4, 2, 125, 126, '2022-12-21 02:42:24', '2022-12-21 08:12:31', 'Hello Owner 2!'),
(5, 2, 126, 125, '2022-12-21 02:43:05', '2022-12-21 08:13:45', 'Hello advertiser 1'),
(6, 2, 126, 125, '2022-12-21 02:44:14', NULL, 'Hello again'),
(7, 2, 126, 125, '2022-12-23 10:50:49', NULL, 'A message from me'),
(8, 2, 126, 125, '2022-12-25 15:44:04', NULL, 'One more message'),
(9, 2, 126, 125, '2022-12-25 15:44:22', NULL, 'and more long message'),
(10, 2, 126, 125, '2022-12-25 15:44:33', NULL, 'and another one'),
(11, 2, 126, 125, '2022-12-25 15:44:48', NULL, 'and even more'),
(12, 2, 126, 125, '2022-12-25 15:50:07', NULL, 'test last message');

-- --------------------------------------------------------

--
-- Table structure for table `b5651_wb_winboard_photo`
--

CREATE TABLE `b5651_wb_winboard_photo` (
  `id` int UNSIGNED NOT NULL,
  `winboard_id` int UNSIGNED DEFAULT NULL,
  `ordering` int UNSIGNED NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `filename` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `b5651_wb_winboard_photo`
--

INSERT INTO `b5651_wb_winboard_photo` (`id`, `winboard_id`, `ordering`, `created`, `filename`) VALUES
(12, 3, 1, '2023-02-24 08:55:24', 'yacht.jpg'),
(13, 85, 1, '2023-02-26 19:55:07', '620 Stirling Hwy.jpg'),
(14, 85, 1, '2023-02-26 19:55:53', '620 Stirling Hwy-min.jpg'),
(15, 86, 1, '2023-02-26 22:05:41', 'IMG_5926-min.jpg'),
(16, 86, 1, '2023-02-26 22:06:31', 'IMG_5926.jpg'),
(17, 87, 1, '2023-02-26 22:13:54', 'IMG_5928-min.jpg'),
(18, 87, 1, '2023-02-26 22:23:36', 'IMG_5929-min.jpg'),
(19, 88, 1, '2023-02-26 22:26:54', 'IMG_5930-min.jpg'),
(20, 88, 1, '2023-02-26 22:37:00', 'IMG_5930-min.jpg'),
(21, 88, 1, '2023-02-26 22:50:50', 'Poster opp-min.jpg'),
(22, 84, 1, '2023-02-26 23:05:22', 'winboardsample.jpeg'),
(23, 89, 1, '2023-02-26 23:18:45', 'Screenshot 2023-01-30 at 10.33.37 am-min-min.jpg'),
(24, 89, 1, '2023-02-26 23:19:07', 'Screenshot 2023-01-30 at 10.41.28 am-min.png'),
(25, 90, 1, '2023-02-27 00:12:37', '5a4ffdf6d8832a10d4ced8217a91fb009e435c97 copy.png'),
(27, 91, 1, '2023-02-28 21:50:24', 'Icebergs.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `b5651_wb_winboard_type`
--

CREATE TABLE `b5651_wb_winboard_type` (
  `id` int UNSIGNED NOT NULL,
  `ordering` int UNSIGNED NOT NULL DEFAULT '0',
  `published` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(250) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `b5651_wb_winboard_type`
--

INSERT INTO `b5651_wb_winboard_type` (`id`, `ordering`, `published`, `name`, `icon`) VALUES
(1, 3, 0, 'Billboard', 'billboard'),
(2, 1, 1, 'Window Signage', 'window'),
(3, 2, 1, 'Rooftop', 'rooftop'),
(4, 4, 1, 'Scaffold', 'scaffold'),
(5, 5, 1, 'Marquee', 'marquis'),
(6, 6, 1, 'Wall', 'wall'),
(7, 7, 1, 'Banner', 'banner'),
(8, 8, 1, 'Hoarding', 'eye');

-- --------------------------------------------------------

--
-- Table structure for table `b5651_webauthn_credentials`
--

CREATE TABLE `b5651_webauthn_credentials` (
  `id` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Credential ID',
  `user_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'User handle',
  `label` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Human readable label',
  `credential` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Credential source data, JSON format'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `b5651_workflows`
--

CREATE TABLE `b5651_workflows` (
  `id` int NOT NULL,
  `asset_id` int DEFAULT '0',
  `published` tinyint NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` tinyint NOT NULL DEFAULT '0',
  `ordering` int NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `created_by` int NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL,
  `modified_by` int NOT NULL DEFAULT '0',
  `checked_out_time` datetime DEFAULT NULL,
  `checked_out` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `b5651_workflows`
--

INSERT INTO `b5651_workflows` (`id`, `asset_id`, `published`, `title`, `description`, `extension`, `default`, `ordering`, `created`, `created_by`, `modified`, `modified_by`, `checked_out_time`, `checked_out`) VALUES
(1, 56, 1, 'COM_WORKFLOW_BASIC_WORKFLOW', '', 'com_content.article', 1, 1, '2022-10-25 09:18:36', 120, '2022-10-25 09:18:36', 120, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `b5651_workflow_associations`
--

CREATE TABLE `b5651_workflow_associations` (
  `item_id` int NOT NULL DEFAULT '0' COMMENT 'Extension table id value',
  `stage_id` int NOT NULL COMMENT 'Foreign Key to #__workflow_stages.id',
  `extension` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `b5651_workflow_associations`
--

INSERT INTO `b5651_workflow_associations` (`item_id`, `stage_id`, `extension`) VALUES
(1, 1, 'com_content.article'),
(2, 1, 'com_content.article'),
(3, 1, 'com_content.article'),
(4, 1, 'com_content.article');

-- --------------------------------------------------------

--
-- Table structure for table `b5651_workflow_stages`
--

CREATE TABLE `b5651_workflow_stages` (
  `id` int NOT NULL,
  `asset_id` int DEFAULT '0',
  `ordering` int NOT NULL DEFAULT '0',
  `workflow_id` int NOT NULL,
  `published` tinyint NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` tinyint NOT NULL DEFAULT '0',
  `checked_out_time` datetime DEFAULT NULL,
  `checked_out` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `b5651_workflow_stages`
--

INSERT INTO `b5651_workflow_stages` (`id`, `asset_id`, `ordering`, `workflow_id`, `published`, `title`, `description`, `default`, `checked_out_time`, `checked_out`) VALUES
(1, 57, 1, 1, 1, 'COM_WORKFLOW_BASIC_STAGE', '', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `b5651_workflow_transitions`
--

CREATE TABLE `b5651_workflow_transitions` (
  `id` int NOT NULL,
  `asset_id` int DEFAULT '0',
  `ordering` int NOT NULL DEFAULT '0',
  `workflow_id` int NOT NULL,
  `published` tinyint NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_stage_id` int NOT NULL,
  `to_stage_id` int NOT NULL,
  `options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `checked_out` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `b5651_workflow_transitions`
--

INSERT INTO `b5651_workflow_transitions` (`id`, `asset_id`, `ordering`, `workflow_id`, `published`, `title`, `description`, `from_stage_id`, `to_stage_id`, `options`, `checked_out_time`, `checked_out`) VALUES
(1, 58, 1, 1, 1, 'UNPUBLISH', '', -1, 1, '{\"publishing\":\"0\"}', NULL, NULL),
(2, 59, 2, 1, 1, 'PUBLISH', '', -1, 1, '{\"publishing\":\"1\"}', NULL, NULL),
(3, 60, 3, 1, 1, 'TRASH', '', -1, 1, '{\"publishing\":\"-2\"}', NULL, NULL),
(4, 61, 4, 1, 1, 'ARCHIVE', '', -1, 1, '{\"publishing\":\"2\"}', NULL, NULL),
(5, 62, 5, 1, 1, 'FEATURE', '', -1, 1, '{\"featuring\":\"1\"}', NULL, NULL),
(6, 63, 6, 1, 1, 'UNFEATURE', '', -1, 1, '{\"featuring\":\"0\"}', NULL, NULL),
(7, 64, 7, 1, 1, 'PUBLISH_AND_FEATURE', '', -1, 1, '{\"publishing\":\"1\",\"featuring\":\"1\"}', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `b5651_action_logs`
--
ALTER TABLE `b5651_action_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_user_id_logdate` (`user_id`,`log_date`),
  ADD KEY `idx_user_id_extension` (`user_id`,`extension`),
  ADD KEY `idx_extension_item_id` (`extension`,`item_id`);

--
-- Indexes for table `b5651_action_logs_extensions`
--
ALTER TABLE `b5651_action_logs_extensions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `b5651_action_logs_users`
--
ALTER TABLE `b5651_action_logs_users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `idx_notify` (`notify`);

--
-- Indexes for table `b5651_action_log_config`
--
ALTER TABLE `b5651_action_log_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `b5651_akeebabackup_backups`
--
ALTER TABLE `b5651_akeebabackup_backups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_fullstatus` (`filesexist`,`status`),
  ADD KEY `idx_stale` (`status`,`origin`);

--
-- Indexes for table `b5651_akeebabackup_profiles`
--
ALTER TABLE `b5651_akeebabackup_profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `b5651_akeebabackup_storage`
--
ALTER TABLE `b5651_akeebabackup_storage`
  ADD PRIMARY KEY (`tag`(100));

--
-- Indexes for table `b5651_akeeba_common`
--
ALTER TABLE `b5651_akeeba_common`
  ADD PRIMARY KEY (`key`(100));

--
-- Indexes for table `b5651_ak_profiles`
--
ALTER TABLE `b5651_ak_profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `b5651_ak_stats`
--
ALTER TABLE `b5651_ak_stats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_fullstatus` (`filesexist`,`status`),
  ADD KEY `idx_stale` (`status`,`origin`);

--
-- Indexes for table `b5651_ak_storage`
--
ALTER TABLE `b5651_ak_storage`
  ADD PRIMARY KEY (`tag`(100));

--
-- Indexes for table `b5651_assets`
--
ALTER TABLE `b5651_assets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_asset_name` (`name`),
  ADD KEY `idx_lft_rgt` (`lft`,`rgt`),
  ADD KEY `idx_parent_id` (`parent_id`);

--
-- Indexes for table `b5651_associations`
--
ALTER TABLE `b5651_associations`
  ADD PRIMARY KEY (`context`,`id`),
  ADD KEY `idx_key` (`key`);

--
-- Indexes for table `b5651_banners`
--
ALTER TABLE `b5651_banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_own_prefix` (`own_prefix`),
  ADD KEY `idx_metakey_prefix` (`metakey_prefix`(100)),
  ADD KEY `idx_banner_catid` (`catid`),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `b5651_banner_clients`
--
ALTER TABLE `b5651_banner_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_own_prefix` (`own_prefix`),
  ADD KEY `idx_metakey_prefix` (`metakey_prefix`(100));

--
-- Indexes for table `b5651_banner_tracks`
--
ALTER TABLE `b5651_banner_tracks`
  ADD PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  ADD KEY `idx_track_date` (`track_date`),
  ADD KEY `idx_track_type` (`track_type`),
  ADD KEY `idx_banner_id` (`banner_id`);

--
-- Indexes for table `b5651_categories`
--
ALTER TABLE `b5651_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_idx` (`extension`,`published`,`access`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_path` (`path`(100)),
  ADD KEY `idx_left_right` (`lft`,`rgt`),
  ADD KEY `idx_alias` (`alias`(100)),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `b5651_contact_details`
--
ALTER TABLE `b5651_contact_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`published`),
  ADD KEY `idx_catid` (`catid`),
  ADD KEY `idx_createdby` (`created_by`),
  ADD KEY `idx_featured_catid` (`featured`,`catid`),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `b5651_content`
--
ALTER TABLE `b5651_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_catid` (`catid`),
  ADD KEY `idx_createdby` (`created_by`),
  ADD KEY `idx_featured_catid` (`featured`,`catid`),
  ADD KEY `idx_language` (`language`),
  ADD KEY `idx_alias` (`alias`(191));

--
-- Indexes for table `b5651_contentitem_tag_map`
--
ALTER TABLE `b5651_contentitem_tag_map`
  ADD UNIQUE KEY `uc_ItemnameTagid` (`type_id`,`content_item_id`,`tag_id`),
  ADD KEY `idx_tag_type` (`tag_id`,`type_id`),
  ADD KEY `idx_date_id` (`tag_date`,`tag_id`),
  ADD KEY `idx_core_content_id` (`core_content_id`);

--
-- Indexes for table `b5651_content_frontpage`
--
ALTER TABLE `b5651_content_frontpage`
  ADD PRIMARY KEY (`content_id`);

--
-- Indexes for table `b5651_content_rating`
--
ALTER TABLE `b5651_content_rating`
  ADD PRIMARY KEY (`content_id`);

--
-- Indexes for table `b5651_content_types`
--
ALTER TABLE `b5651_content_types`
  ADD PRIMARY KEY (`type_id`),
  ADD KEY `idx_alias` (`type_alias`(100));

--
-- Indexes for table `b5651_extensions`
--
ALTER TABLE `b5651_extensions`
  ADD PRIMARY KEY (`extension_id`),
  ADD KEY `element_clientid` (`element`,`client_id`),
  ADD KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  ADD KEY `extension` (`type`,`element`,`folder`,`client_id`);

--
-- Indexes for table `b5651_fields`
--
ALTER TABLE `b5651_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_created_user_id` (`created_user_id`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_context` (`context`(191)),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `b5651_fields_categories`
--
ALTER TABLE `b5651_fields_categories`
  ADD PRIMARY KEY (`field_id`,`category_id`);

--
-- Indexes for table `b5651_fields_groups`
--
ALTER TABLE `b5651_fields_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_created_by` (`created_by`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_context` (`context`(191)),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `b5651_fields_values`
--
ALTER TABLE `b5651_fields_values`
  ADD KEY `idx_field_id` (`field_id`),
  ADD KEY `idx_item_id` (`item_id`(191));

--
-- Indexes for table `b5651_finder_filters`
--
ALTER TABLE `b5651_finder_filters`
  ADD PRIMARY KEY (`filter_id`);

--
-- Indexes for table `b5651_finder_links`
--
ALTER TABLE `b5651_finder_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `idx_type` (`type_id`),
  ADD KEY `idx_title` (`title`(100)),
  ADD KEY `idx_md5` (`md5sum`),
  ADD KEY `idx_url` (`url`(75)),
  ADD KEY `idx_language` (`language`),
  ADD KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  ADD KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`);

--
-- Indexes for table `b5651_finder_links_terms`
--
ALTER TABLE `b5651_finder_links_terms`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `b5651_finder_logging`
--
ALTER TABLE `b5651_finder_logging`
  ADD PRIMARY KEY (`md5sum`),
  ADD KEY `searchterm` (`searchterm`(191));

--
-- Indexes for table `b5651_finder_taxonomy`
--
ALTER TABLE `b5651_finder_taxonomy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_path` (`path`(100)),
  ADD KEY `idx_level` (`level`),
  ADD KEY `idx_left_right` (`lft`,`rgt`),
  ADD KEY `idx_alias` (`alias`(100)),
  ADD KEY `idx_language` (`language`),
  ADD KEY `idx_parent_published` (`parent_id`,`state`,`access`);

--
-- Indexes for table `b5651_finder_taxonomy_map`
--
ALTER TABLE `b5651_finder_taxonomy_map`
  ADD PRIMARY KEY (`link_id`,`node_id`),
  ADD KEY `link_id` (`link_id`),
  ADD KEY `node_id` (`node_id`);

--
-- Indexes for table `b5651_finder_terms`
--
ALTER TABLE `b5651_finder_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD UNIQUE KEY `idx_term_language` (`term`,`language`),
  ADD KEY `idx_stem` (`stem`),
  ADD KEY `idx_term_phrase` (`term`,`phrase`),
  ADD KEY `idx_stem_phrase` (`stem`,`phrase`),
  ADD KEY `idx_soundex_phrase` (`soundex`,`phrase`),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `b5651_finder_terms_common`
--
ALTER TABLE `b5651_finder_terms_common`
  ADD UNIQUE KEY `idx_term_language` (`term`,`language`),
  ADD KEY `idx_lang` (`language`);

--
-- Indexes for table `b5651_finder_tokens`
--
ALTER TABLE `b5651_finder_tokens`
  ADD KEY `idx_word` (`term`),
  ADD KEY `idx_stem` (`stem`),
  ADD KEY `idx_context` (`context`),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `b5651_finder_tokens_aggregate`
--
ALTER TABLE `b5651_finder_tokens_aggregate`
  ADD KEY `token` (`term`),
  ADD KEY `keyword_id` (`term_id`);

--
-- Indexes for table `b5651_finder_types`
--
ALTER TABLE `b5651_finder_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Indexes for table `b5651_fwsync_sync`
--
ALTER TABLE `b5651_fwsync_sync`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`);

--
-- Indexes for table `b5651_history`
--
ALTER TABLE `b5651_history`
  ADD PRIMARY KEY (`version_id`),
  ADD KEY `idx_ucm_item_id` (`item_id`),
  ADD KEY `idx_save_date` (`save_date`);

--
-- Indexes for table `b5651_languages`
--
ALTER TABLE `b5651_languages`
  ADD PRIMARY KEY (`lang_id`),
  ADD UNIQUE KEY `idx_sef` (`sef`),
  ADD UNIQUE KEY `idx_langcode` (`lang_code`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_ordering` (`ordering`);

--
-- Indexes for table `b5651_mail_templates`
--
ALTER TABLE `b5651_mail_templates`
  ADD PRIMARY KEY (`template_id`,`language`);

--
-- Indexes for table `b5651_menu`
--
ALTER TABLE `b5651_menu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`(100),`language`),
  ADD KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  ADD KEY `idx_menutype` (`menutype`),
  ADD KEY `idx_left_right` (`lft`,`rgt`),
  ADD KEY `idx_alias` (`alias`(100)),
  ADD KEY `idx_path` (`path`(100)),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `b5651_menu_types`
--
ALTER TABLE `b5651_menu_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_menutype` (`menutype`);

--
-- Indexes for table `b5651_messages`
--
ALTER TABLE `b5651_messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `useridto_state` (`user_id_to`,`state`);

--
-- Indexes for table `b5651_messages_cfg`
--
ALTER TABLE `b5651_messages_cfg`
  ADD UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`);

--
-- Indexes for table `b5651_modules`
--
ALTER TABLE `b5651_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `published` (`published`,`access`),
  ADD KEY `newsfeeds` (`module`,`published`),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `b5651_modules_menu`
--
ALTER TABLE `b5651_modules_menu`
  ADD PRIMARY KEY (`moduleid`,`menuid`);

--
-- Indexes for table `b5651_newsfeeds`
--
ALTER TABLE `b5651_newsfeeds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`published`),
  ADD KEY `idx_catid` (`catid`),
  ADD KEY `idx_createdby` (`created_by`),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `b5651_overrider`
--
ALTER TABLE `b5651_overrider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `b5651_postinstall_messages`
--
ALTER TABLE `b5651_postinstall_messages`
  ADD PRIMARY KEY (`postinstall_message_id`);

--
-- Indexes for table `b5651_privacy_consents`
--
ALTER TABLE `b5651_privacy_consents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- Indexes for table `b5651_privacy_requests`
--
ALTER TABLE `b5651_privacy_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `b5651_redirect_links`
--
ALTER TABLE `b5651_redirect_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_old_url` (`old_url`(100)),
  ADD KEY `idx_link_modified` (`modified_date`);

--
-- Indexes for table `b5651_scheduler_tasks`
--
ALTER TABLE `b5651_scheduler_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_type` (`type`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_last_exit` (`last_exit_code`),
  ADD KEY `idx_next_exec` (`next_execution`),
  ADD KEY `idx_locked` (`locked`),
  ADD KEY `idx_priority` (`priority`),
  ADD KEY `idx_cli_exclusive` (`cli_exclusive`),
  ADD KEY `idx_checked_out` (`checked_out`);

--
-- Indexes for table `b5651_schemas`
--
ALTER TABLE `b5651_schemas`
  ADD PRIMARY KEY (`extension_id`,`version_id`);

--
-- Indexes for table `b5651_session`
--
ALTER TABLE `b5651_session`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `time` (`time`),
  ADD KEY `client_id_guest` (`client_id`,`guest`);

--
-- Indexes for table `b5651_tags`
--
ALTER TABLE `b5651_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tag_idx` (`published`,`access`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_path` (`path`(100)),
  ADD KEY `idx_left_right` (`lft`,`rgt`),
  ADD KEY `idx_alias` (`alias`(100)),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `b5651_template_overrides`
--
ALTER TABLE `b5651_template_overrides`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_template` (`template`),
  ADD KEY `idx_extension_id` (`extension_id`);

--
-- Indexes for table `b5651_template_styles`
--
ALTER TABLE `b5651_template_styles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_template` (`template`),
  ADD KEY `idx_client_id` (`client_id`),
  ADD KEY `idx_client_id_home` (`client_id`,`home`);

--
-- Indexes for table `b5651_ucm_base`
--
ALTER TABLE `b5651_ucm_base`
  ADD PRIMARY KEY (`ucm_id`),
  ADD KEY `idx_ucm_item_id` (`ucm_item_id`),
  ADD KEY `idx_ucm_type_id` (`ucm_type_id`),
  ADD KEY `idx_ucm_language_id` (`ucm_language_id`);

--
-- Indexes for table `b5651_ucm_content`
--
ALTER TABLE `b5651_ucm_content`
  ADD PRIMARY KEY (`core_content_id`),
  ADD KEY `tag_idx` (`core_state`,`core_access`),
  ADD KEY `idx_access` (`core_access`),
  ADD KEY `idx_alias` (`core_alias`(100)),
  ADD KEY `idx_language` (`core_language`),
  ADD KEY `idx_title` (`core_title`(100)),
  ADD KEY `idx_modified_time` (`core_modified_time`),
  ADD KEY `idx_created_time` (`core_created_time`),
  ADD KEY `idx_content_type` (`core_type_alias`(100)),
  ADD KEY `idx_core_modified_user_id` (`core_modified_user_id`),
  ADD KEY `idx_core_checked_out_user_id` (`core_checked_out_user_id`),
  ADD KEY `idx_core_created_user_id` (`core_created_user_id`),
  ADD KEY `idx_core_type_id` (`core_type_id`);

--
-- Indexes for table `b5651_updates`
--
ALTER TABLE `b5651_updates`
  ADD PRIMARY KEY (`update_id`);

--
-- Indexes for table `b5651_update_sites`
--
ALTER TABLE `b5651_update_sites`
  ADD PRIMARY KEY (`update_site_id`);

--
-- Indexes for table `b5651_update_sites_extensions`
--
ALTER TABLE `b5651_update_sites_extensions`
  ADD PRIMARY KEY (`update_site_id`,`extension_id`);

--
-- Indexes for table `b5651_usergroups`
--
ALTER TABLE `b5651_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  ADD KEY `idx_usergroup_title_lookup` (`title`),
  ADD KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  ADD KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`);

--
-- Indexes for table `b5651_users`
--
ALTER TABLE `b5651_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_username` (`username`),
  ADD KEY `idx_name` (`name`(100)),
  ADD KEY `idx_block` (`block`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `b5651_user_keys`
--
ALTER TABLE `b5651_user_keys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `series` (`series`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `b5651_user_mfa`
--
ALTER TABLE `b5651_user_mfa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- Indexes for table `b5651_user_notes`
--
ALTER TABLE `b5651_user_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_category_id` (`catid`);

--
-- Indexes for table `b5651_user_profiles`
--
ALTER TABLE `b5651_user_profiles`
  ADD UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`);

--
-- Indexes for table `b5651_user_usergroup_map`
--
ALTER TABLE `b5651_user_usergroup_map`
  ADD PRIMARY KEY (`user_id`,`group_id`);

--
-- Indexes for table `b5651_viewlevels`
--
ALTER TABLE `b5651_viewlevels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_assetgroup_title_lookup` (`title`);

--
-- Indexes for table `b5651_wb_advertiser`
--
ALTER TABLE `b5651_wb_advertiser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `b5651_wb_city`
--
ALTER TABLE `b5651_wb_city`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `b5651_wb_country`
--
ALTER TABLE `b5651_wb_country`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `b5651_wb_media`
--
ALTER TABLE `b5651_wb_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `b5651_wb_owner`
--
ALTER TABLE `b5651_wb_owner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `b5651_wb_postcode`
--
ALTER TABLE `b5651_wb_postcode`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `b5651_wb_precinct_type`
--
ALTER TABLE `b5651_wb_precinct_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `b5651_wb_property`
--
ALTER TABLE `b5651_wb_property`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`);

--
-- Indexes for table `b5651_wb_property_photo`
--
ALTER TABLE `b5651_wb_property_photo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ordering` (`ordering`),
  ADD KEY `type` (`type`),
  ADD KEY `property_id` (`property_id`);

--
-- Indexes for table `b5651_wb_property_type`
--
ALTER TABLE `b5651_wb_property_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `b5651_wb_property_verification`
--
ALTER TABLE `b5651_wb_property_verification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `property_id` (`property_id`);

--
-- Indexes for table `b5651_wb_state`
--
ALTER TABLE `b5651_wb_state`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `b5651_wb_street`
--
ALTER TABLE `b5651_wb_street`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `b5651_wb_winboard`
--
ALTER TABLE `b5651_wb_winboard`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`),
  ADD KEY `published` (`published`);

--
-- Indexes for table `b5651_wb_winboard_booking`
--
ALTER TABLE `b5651_wb_winboard_booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`),
  ADD KEY `winboard_id` (`winboard_id`),
  ADD KEY `advertiser_id` (`advertiser_id`),
  ADD KEY `date_from` (`date_from`),
  ADD KEY `date_to` (`date_to`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `b5651_wb_winboard_booking_messages`
--
ALTER TABLE `b5651_wb_winboard_booking_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`),
  ADD KEY `winboard_booking_id` (`winboard_booking_id`);

--
-- Indexes for table `b5651_wb_winboard_media`
--
ALTER TABLE `b5651_wb_winboard_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `winboard_id` (`winboard_id`);

--
-- Indexes for table `b5651_wb_winboard_message`
--
ALTER TABLE `b5651_wb_winboard_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`),
  ADD KEY `obj_id` (`obj_id`),
  ADD KEY `obj_type` (`obj_type`);

--
-- Indexes for table `b5651_wb_winboard_message_chat`
--
ALTER TABLE `b5651_wb_winboard_message_chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`),
  ADD KEY `seen` (`seen`),
  ADD KEY `message_id` (`message_id`),
  ADD KEY `to_user_id` (`to_user_id`),
  ADD KEY `from_user_id` (`from_user_id`);

--
-- Indexes for table `b5651_wb_winboard_photo`
--
ALTER TABLE `b5651_wb_winboard_photo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ordering` (`ordering`);

--
-- Indexes for table `b5651_wb_winboard_type`
--
ALTER TABLE `b5651_wb_winboard_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ordering` (`ordering`),
  ADD KEY `published` (`published`);

--
-- Indexes for table `b5651_webauthn_credentials`
--
ALTER TABLE `b5651_webauthn_credentials`
  ADD PRIMARY KEY (`id`(100)),
  ADD KEY `user_id` (`user_id`(100));

--
-- Indexes for table `b5651_workflows`
--
ALTER TABLE `b5651_workflows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_asset_id` (`asset_id`),
  ADD KEY `idx_title` (`title`(191)),
  ADD KEY `idx_extension` (`extension`),
  ADD KEY `idx_default` (`default`),
  ADD KEY `idx_created` (`created`),
  ADD KEY `idx_created_by` (`created_by`),
  ADD KEY `idx_modified` (`modified`),
  ADD KEY `idx_modified_by` (`modified_by`),
  ADD KEY `idx_checked_out` (`checked_out`);

--
-- Indexes for table `b5651_workflow_associations`
--
ALTER TABLE `b5651_workflow_associations`
  ADD PRIMARY KEY (`item_id`,`extension`),
  ADD KEY `idx_item_stage_extension` (`item_id`,`stage_id`,`extension`),
  ADD KEY `idx_item_id` (`item_id`),
  ADD KEY `idx_stage_id` (`stage_id`),
  ADD KEY `idx_extension` (`extension`);

--
-- Indexes for table `b5651_workflow_stages`
--
ALTER TABLE `b5651_workflow_stages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_workflow_id` (`workflow_id`),
  ADD KEY `idx_checked_out` (`checked_out`),
  ADD KEY `idx_title` (`title`(191)),
  ADD KEY `idx_asset_id` (`asset_id`),
  ADD KEY `idx_default` (`default`);

--
-- Indexes for table `b5651_workflow_transitions`
--
ALTER TABLE `b5651_workflow_transitions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_title` (`title`(191)),
  ADD KEY `idx_asset_id` (`asset_id`),
  ADD KEY `idx_checked_out` (`checked_out`),
  ADD KEY `idx_from_stage_id` (`from_stage_id`),
  ADD KEY `idx_to_stage_id` (`to_stage_id`),
  ADD KEY `idx_workflow_id` (`workflow_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `b5651_action_logs`
--
ALTER TABLE `b5651_action_logs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=450;

--
-- AUTO_INCREMENT for table `b5651_action_logs_extensions`
--
ALTER TABLE `b5651_action_logs_extensions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `b5651_action_log_config`
--
ALTER TABLE `b5651_action_log_config`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `b5651_akeebabackup_backups`
--
ALTER TABLE `b5651_akeebabackup_backups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `b5651_akeebabackup_profiles`
--
ALTER TABLE `b5651_akeebabackup_profiles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `b5651_ak_profiles`
--
ALTER TABLE `b5651_ak_profiles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `b5651_ak_stats`
--
ALTER TABLE `b5651_ak_stats`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `b5651_assets`
--
ALTER TABLE `b5651_assets`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `b5651_banners`
--
ALTER TABLE `b5651_banners`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `b5651_banner_clients`
--
ALTER TABLE `b5651_banner_clients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `b5651_categories`
--
ALTER TABLE `b5651_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `b5651_contact_details`
--
ALTER TABLE `b5651_contact_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `b5651_content`
--
ALTER TABLE `b5651_content`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `b5651_content_types`
--
ALTER TABLE `b5651_content_types`
  MODIFY `type_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `b5651_extensions`
--
ALTER TABLE `b5651_extensions`
  MODIFY `extension_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=262;

--
-- AUTO_INCREMENT for table `b5651_fields`
--
ALTER TABLE `b5651_fields`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `b5651_fields_groups`
--
ALTER TABLE `b5651_fields_groups`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `b5651_finder_filters`
--
ALTER TABLE `b5651_finder_filters`
  MODIFY `filter_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `b5651_finder_links`
--
ALTER TABLE `b5651_finder_links`
  MODIFY `link_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `b5651_finder_taxonomy`
--
ALTER TABLE `b5651_finder_taxonomy`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `b5651_finder_terms`
--
ALTER TABLE `b5651_finder_terms`
  MODIFY `term_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `b5651_finder_types`
--
ALTER TABLE `b5651_finder_types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `b5651_fwsync_sync`
--
ALTER TABLE `b5651_fwsync_sync`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `b5651_history`
--
ALTER TABLE `b5651_history`
  MODIFY `version_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `b5651_languages`
--
ALTER TABLE `b5651_languages`
  MODIFY `lang_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `b5651_menu`
--
ALTER TABLE `b5651_menu`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `b5651_menu_types`
--
ALTER TABLE `b5651_menu_types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `b5651_messages`
--
ALTER TABLE `b5651_messages`
  MODIFY `message_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `b5651_modules`
--
ALTER TABLE `b5651_modules`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `b5651_newsfeeds`
--
ALTER TABLE `b5651_newsfeeds`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `b5651_overrider`
--
ALTER TABLE `b5651_overrider`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `b5651_postinstall_messages`
--
ALTER TABLE `b5651_postinstall_messages`
  MODIFY `postinstall_message_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `b5651_privacy_consents`
--
ALTER TABLE `b5651_privacy_consents`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `b5651_privacy_requests`
--
ALTER TABLE `b5651_privacy_requests`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `b5651_redirect_links`
--
ALTER TABLE `b5651_redirect_links`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `b5651_scheduler_tasks`
--
ALTER TABLE `b5651_scheduler_tasks`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `b5651_tags`
--
ALTER TABLE `b5651_tags`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `b5651_template_overrides`
--
ALTER TABLE `b5651_template_overrides`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `b5651_template_styles`
--
ALTER TABLE `b5651_template_styles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `b5651_ucm_content`
--
ALTER TABLE `b5651_ucm_content`
  MODIFY `core_content_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `b5651_updates`
--
ALTER TABLE `b5651_updates`
  MODIFY `update_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `b5651_update_sites`
--
ALTER TABLE `b5651_update_sites`
  MODIFY `update_site_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `b5651_usergroups`
--
ALTER TABLE `b5651_usergroups`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `b5651_users`
--
ALTER TABLE `b5651_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT for table `b5651_user_keys`
--
ALTER TABLE `b5651_user_keys`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `b5651_user_mfa`
--
ALTER TABLE `b5651_user_mfa`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `b5651_user_notes`
--
ALTER TABLE `b5651_user_notes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `b5651_viewlevels`
--
ALTER TABLE `b5651_viewlevels`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `b5651_wb_advertiser`
--
ALTER TABLE `b5651_wb_advertiser`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `b5651_wb_city`
--
ALTER TABLE `b5651_wb_city`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `b5651_wb_country`
--
ALTER TABLE `b5651_wb_country`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `b5651_wb_media`
--
ALTER TABLE `b5651_wb_media`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `b5651_wb_owner`
--
ALTER TABLE `b5651_wb_owner`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `b5651_wb_postcode`
--
ALTER TABLE `b5651_wb_postcode`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `b5651_wb_precinct_type`
--
ALTER TABLE `b5651_wb_precinct_type`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `b5651_wb_property`
--
ALTER TABLE `b5651_wb_property`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `b5651_wb_property_photo`
--
ALTER TABLE `b5651_wb_property_photo`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `b5651_wb_property_type`
--
ALTER TABLE `b5651_wb_property_type`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `b5651_wb_property_verification`
--
ALTER TABLE `b5651_wb_property_verification`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `b5651_wb_state`
--
ALTER TABLE `b5651_wb_state`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `b5651_wb_street`
--
ALTER TABLE `b5651_wb_street`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `b5651_wb_winboard`
--
ALTER TABLE `b5651_wb_winboard`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `b5651_wb_winboard_booking`
--
ALTER TABLE `b5651_wb_winboard_booking`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `b5651_wb_winboard_booking_messages`
--
ALTER TABLE `b5651_wb_winboard_booking_messages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `b5651_wb_winboard_media`
--
ALTER TABLE `b5651_wb_winboard_media`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `b5651_wb_winboard_message`
--
ALTER TABLE `b5651_wb_winboard_message`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `b5651_wb_winboard_message_chat`
--
ALTER TABLE `b5651_wb_winboard_message_chat`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `b5651_wb_winboard_photo`
--
ALTER TABLE `b5651_wb_winboard_photo`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `b5651_wb_winboard_type`
--
ALTER TABLE `b5651_wb_winboard_type`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `b5651_workflows`
--
ALTER TABLE `b5651_workflows`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `b5651_workflow_stages`
--
ALTER TABLE `b5651_workflow_stages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `b5651_workflow_transitions`
--
ALTER TABLE `b5651_workflow_transitions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
