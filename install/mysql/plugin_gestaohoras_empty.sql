-- Saldo de horas por grupo
CREATE TABLE IF NOT EXISTS `glpi_plugin_gestaohoras_balances_hours` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `total` int unsigned NOT NULL,
  `daily` int unsigned NOT NULL,
  `default` int unsigned NOT NULL,
  `date_creation` timestamp NOT NULL,
  `groups_id` int unsigned NOT NULL,
  `users_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`groups_id`) REFERENCES glpi_groups(`id`),
  FOREIGN KEY (`users_id`) REFERENCES glpi_users(`id`),
  INDEX `idx_balance_hours_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- Histórico de lançamentos
CREATE TABLE IF NOT EXISTS `glpi_plugin_gestaohoras_balances_historys` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL, -- 'C (Crédito) ou D (Débito)'
  `quantity` int unsigned NOT NULL,
  `date_operation` timestamp NOT NULL,
  `plugin_gestaohoras_balances_hours_id` int unsigned NOT NULL,
  `users_id` int unsigned,
  `tickets_id` int unsigned,
  `category` varchar(10),
  `justification` longtext,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`plugin_gestaohoras_balances_hours_id`) REFERENCES glpi_plugin_gestaohoras_balances_hours(`id`),
  FOREIGN KEY (`users_id`) REFERENCES glpi_users(`id`),
  INDEX `idx_balance_history_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- Tabelas para inclusão do dados da Categoria
CREATE TABLE IF NOT EXISTS `glpi_plugin_gestaohoras_itilcategorycategorias` (
    `id` int unsigned  NOT NULL AUTO_INCREMENT,
    `items_id` int unsigned NOT NULL,
    `itemtype` varchar(255) DEFAULT 'ITILCategory',
    `debitofield` int(11) UNSIGNED  NOT NULL DEFAULT 0,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- INSERT PADRAO DAS CATEGORIAS
INSERT INTO glpi_plugin_gestaohoras_itilcategorycategorias (
	items_id, 
	itemtype, 
	debitofield
) SELECT id, 'ITILCategory', 0 FROM glpi_itilcategories;
