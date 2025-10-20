-- =========================
-- init.sql สำหรับ AHHH HA! Coffee Shop
-- =========================

-- 1. สร้างฐานข้อมูล (ถ้ายังไม่มี)
CREATE DATABASE IF NOT EXISTS ahcr;
USE ahcr;

-- =========================
-- Table: Menu
-- =========================
CREATE TABLE IF NOT EXISTS `menu` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `category` VARCHAR(50) NOT NULL,
    `notes` VARCHAR(255) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =========================
-- Table: MenuPrices
-- =========================
CREATE TABLE IF NOT EXISTS `menuprices` (
    `menu_id` INT NOT NULL,
    `serving_type` VARCHAR(50) NOT NULL,
    `price` DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (`menu_id`, `serving_type`),
    FOREIGN KEY (`menu_id`) REFERENCES `menu`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =========================
-- Table: AddOns
-- =========================
CREATE TABLE IF NOT EXISTS `addons` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `price` DECIMAL(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =========================
-- Insert ข้อมูล Menu
-- =========================
INSERT INTO `menu` (`id`, `name`, `category`, `notes`) VALUES
(1, 'Americano', 'Coffee', NULL),
(2, 'Latte', 'Coffee', NULL),
(3, 'Es-Yen', 'Coffee', NULL),
(4, 'Mocha', 'Coffee', NULL),
(5, 'Ovaltine Mocha', 'Coffee', NULL),
(6, 'Cappuccino', 'Coffee', NULL),
(7, 'Caramel Macchiato', 'Coffee', NULL),
(8, 'Hazelnut Coffee', 'Coffee', NULL),
(9, 'Apple Coffee', 'Coffee', NULL),
(10, 'Orange Coffee', 'Coffee', NULL),
(11, 'Dirty', 'Coffee', NULL),
(12, 'Chocolate', 'Non-Coffee', NULL),
(13, 'Pinky Milk', 'Non-Coffee', NULL),
(14, 'Cha-Thai', 'Non-Coffee', NULL),
(15, 'Caramel Milk', 'Non-Coffee', NULL),
(16, 'Cocoa Lava', 'Non-Coffee', NULL),
(17, 'Yuzu Soda', 'Soda', NULL),
(18, 'Leechy Soda', 'Soda', NULL),
(19, 'Matcha Latte', 'Matcha', NULL),
(20, 'Almond Chocchip Cookie', 'Cookie', '49 BAHT'),
(21, 'Whitechoc Cranberry Cookie', 'Cookie', '49 BAHT'),
(22, 'Classic Chocchip Cookie', 'Cookie', '49 BAHT'),
(23, 'Chocolate Lava Cookie', 'Cookie', '59 BAHT'),
(24, 'Plain Croissant', 'Croissant', '60 BAHT'),
(25, 'Danish Custard', 'Danish', '70 BAHT'),
(26, 'Pain Au Raisin', 'Danish', '70 BAHT'),
(27, 'Pain Au Chocolaté', 'Croissant', '75 BAHT'),
(28, 'Ham & Cheese Croissant', 'Croissant', '90 BAHT'),
(29, 'Almond Croissant', 'Croissant', '100 BAHT'),
(30, 'Briache Nutella', 'Bread', '100 BAHT'),
(31, 'Cinnamon Butterfly', 'Bread', '100 BAHT'),
(32, 'Fiji 500ml', 'Water', '89 BAHT'),
(33, 'Voss 375ml', 'Water', '120 BAHT')
ON DUPLICATE KEY UPDATE
`name`=VALUES(`name`), `category`=VALUES(`category`), `notes`=VALUES(`notes`);

-- =========================
-- Insert ข้อมูล MenuPrices
-- =========================
INSERT INTO `menuprices` (`menu_id`, `serving_type`, `price`) VALUES
(1, 'Hot', 65.00), (1, 'Iced', 65.00),
(2, 'Hot', 70.00), (2, 'Iced', 70.00), (2, 'Frappe', 95.00),
(3, 'Iced', 70.00), (3, 'Frappe', 95.00),
(4, 'Hot', 70.00), (4, 'Iced', 70.00), (4, 'Frappe', 95.00),
(5, 'Hot', 80.00), (5, 'Iced', 80.00), (5, 'Frappe', 105.00),
(6, 'Hot', 85.00), (6, 'Iced', 80.00),
(7, 'Hot', 85.00), (7, 'Iced', 85.00), (7, 'Frappe', 110.00),
(8, 'Hot', 85.00), (8, 'Iced', 85.00), (8, 'Frappe', 110.00),
(9, 'Iced', 85.00),
(10, 'Iced', 85.00),
(11, 'Iced', 125.00),
(12, 'Hot', 60.00), (12, 'Iced', 60.00), (12, 'Frappe', 85.00),
(13, 'Hot', 60.00), (13, 'Iced', 60.00), (13, 'Frappe', 85.00),
(14, 'Hot', 60.00), (14, 'Iced', 60.00), (14, 'Frappe', 85.00),
(15, 'Hot', 65.00), (15, 'Iced', 65.00), (15, 'Frappe', 90.00),
(16, 'Hot', 65.00), (16, 'Iced', 65.00), (16, 'Frappe', 90.00),
(17, 'Iced', 70.00),
(18, 'Iced', 70.00),
(19, 'Hot', 80.00), (19, 'Iced', 80.00), (19, 'Frappe', 110.00)
ON DUPLICATE KEY UPDATE
`price`=VALUES(`price`);

-- =========================
-- Insert ข้อมูล AddOns
-- =========================
INSERT INTO `addons` (`id`, `name`, `price`) VALUES
(1, 'Oat milk', 15.00),
(2, 'Extra shot', 20.00),
(3, 'Matcha shot', 20.00),
(4, 'Whipped cream', 15.00)
ON DUPLICATE KEY UPDATE
`name`=VALUES(`name`), `price`=VALUES(`price`);
