DROP TABLE IF EXISTS `glpi_plugin_addressing_addressings`;
CREATE TABLE `glpi_plugin_addressing_addressings` (
   `id` int(11) NOT NULL auto_increment,
   `entities_id` int(11) NOT NULL default '0',
   `is_recursive` tinyint(1) NOT NULL default '0',
   `use_ping` tinyint(1) NOT NULL default '0',
   `name` varchar(255) collate utf8_unicode_ci default NULL,
   `networks_id` int(11) NOT NULL default '0' COMMENT 'RELATION to glpi_networks (id)',
   `locations_id` int(11) NOT NULL default '0' COMMENT 'RELATION to glpi_locations (id)',
   `fqdns_id` int(11) NOT NULL default '0' COMMENT 'RELATION to glpi_fqdns (id)',
   `begin_ip` varchar(255) collate utf8_unicode_ci default NULL,
   `end_ip` varchar(255) collate utf8_unicode_ci default NULL,
   `alloted_ip` tinyint(1) NOT NULL default '0',
   `double_ip` tinyint(1) NOT NULL default '0',
   `free_ip` tinyint(1) NOT NULL default '0',
   `reserved_ip` tinyint(1) NOT NULL default '0',
   `comment` text collate utf8_unicode_ci,
   `is_deleted` tinyint(1) NOT NULL default '0',
   PRIMARY KEY  (`id`),
   KEY `name` (`name`),
   KEY `entities_id` (`entities_id`),
   KEY `networks_id` (`networks_id`),
   KEY `is_deleted` (`is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `glpi_plugin_addressing_pinginfos`;
CREATE TABLE `glpi_plugin_addressing_pinginfos` (
  `id` int(11) NOT NULL auto_increment,
  `plugin_addressing_addressings_id` int(11) NOT NULL default '0',
  `ipname` varchar(255) collate utf8_unicode_ci default NULL,
  `items_id` int(11) NOT NULL default '0' COMMENT 'RELATION to various tables, according to itemtype (id)',
  `itemtype` varchar(100) collate utf8_unicode_ci COMMENT 'see .class.php file',
  `ping_response` tinyint(1) NOT NULL default '0',
  `ping_date` datetime DEFAULT NULL,
  PRIMARY KEY  (`id`),
  KEY `plugin_addressing_addressings_id` (`plugin_addressing_addressings_id`),
  KEY `ipname` (`ipname`),
  KEY `ping_response` (`ping_response`),
  KEY `ping_date` (`ping_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `glpi_plugin_addressing_configs`;
CREATE TABLE `glpi_plugin_addressing_configs` (
   `id` int(11) NOT NULL auto_increment,
   `alloted_ip` tinyint(1) NOT NULL default '0',
   `double_ip` tinyint(1) NOT NULL default '0',
   `free_ip` tinyint(1) NOT NULL default '0',
   `reserved_ip` tinyint(1) NOT NULL default '0',
   `use_ping` tinyint(1) NOT NULL default '0',
   `used_system` tinyint(1) NOT NULL default '0',
   PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `glpi_plugin_addressing_filters`;
CREATE TABLE `glpi_plugin_addressing_filters` (
   `id` int(11) NOT NULL auto_increment,
   `entities_id` int(11) NOT NULL default '0',
   `plugin_addressing_addressings_id` int(11) NOT NULL default '0',
   `name` varchar(255) collate utf8_unicode_ci default NULL,
   `begin_ip` varchar(255) collate utf8_unicode_ci default NULL,
   `end_ip` varchar(255) collate utf8_unicode_ci default NULL,
   `type` varchar(255) collate utf8_unicode_ci default NULL,
   PRIMARY KEY  (`id`),
   KEY `entities_id` (`entities_id`),
   KEY `plugin_addressing_addressings_id` (`plugin_addressing_addressings_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_plugin_addressing_configs` VALUES ('1','1','1','1','1','0','0');

INSERT INTO `glpi_displaypreferences` VALUES (NULL,'PluginAddressingAddressing',2,2,0);
INSERT INTO `glpi_displaypreferences` VALUES (NULL,'PluginAddressingAddressing',3,6,0);
INSERT INTO `glpi_displaypreferences` VALUES (NULL,'PluginAddressingAddressing',4,5,0);
INSERT INTO `glpi_displaypreferences` VALUES (NULL,'PluginAddressingAddressing',1000,3,0);
INSERT INTO `glpi_displaypreferences` VALUES (NULL,'PluginAddressingAddressing',1001,4,0);
