CREATE DATABASE  IF NOT EXISTS `scripwebDB`;
  USE `scripwebDB`;

DROP TABLE IF EXISTS `user_type`;
CREATE TABLE `user_type` (
  `cod_user_type` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_user_type` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `created_user_type` TIMESTAMP NOT NULL,
  `updated_user_type` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_user_type`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
DROP TABLE IF EXISTS `training_area`;
CREATE TABLE `training_area` (
  `cod_train_area` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_train_area` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `created_train_area` TIMESTAMP NOT NULL,
  `updated_train_area` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_train_area`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
DROP TABLE IF EXISTS `knowledge_area`;
CREATE TABLE `knowledge_area` (
  `cod_know_area` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_know_area` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `created_know_area` TIMESTAMP NOT NULL,
  `updated_know_area` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_know_area`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
 DROP TABLE IF EXISTS `document_type`;

  CREATE TABLE `tipo_documento` (
    `cod_doc_type` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `name_doc_type` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
    `created_doc_type` TIMESTAMP NOT NULL,
    `updated_doc_type` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_doc_type`)
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
  `cod_country` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_country` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `postal_country` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `created_country` TIMESTAMP NOT NULL,
  `updated_country` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_country`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
DROP TABLE IF EXISTS `states`;
CREATE TABLE `states` (
  `cod_state` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cod_country` int(10) unsigned NOT NULL,
  `name_state` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `created_state` TIMESTAMP NOT NULL,
  `updated_state` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_state`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities` (
  `cod_city` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cod_state` int(10) unsigned NOT NULL,
  `name_city` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `created_city` TIMESTAMP NOT NULL,
  `updated_city` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_city`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
DROP TABLE IF EXISTS `communes`;
CREATE TABLE `communes` (
  `cod_commune` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_commune` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `created_commune` TIMESTAMP NOT NULL,
  `updated_commune` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_commune`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
DROP TABLE IF EXISTS `cities_communes`;
CREATE TABLE `cities_communes` (
  `cod_cit_comm` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cod_city` int(10) unsigned NOT NULL,
  `cod_commune` int(10) unsigned NOT NULL,
  `created_cc` TIMESTAMP NOT NULL,
  `updated_cc` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_cit_comm`),
  KEY `fkcodcitycc_cities_idx` (`cod_city`),
  KEY `fkcodcommunecc_communes_idx` (`cod_commune`),
  CONSTRAINT `fkcodcitycc_cities` FOREIGN KEY (`cod_city`) REFERENCES `cities` (`cod_city`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkcodcommunecc_communes` FOREIGN KEY (`cod_commune`) REFERENCES `communes` (`cod_commune`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
DROP TABLE IF EXISTS `towns`;
CREATE TABLE `towns` (
  `cod_town` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cod_city` int(10) unsigned NOT NULL,
  `name_town` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `created_town` TIMESTAMP NOT NULL,
  `updated_town` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_town`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
DROP TABLE IF EXISTS `villages`;
CREATE TABLE `villages` (
  `cod_village` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cod_town` int(10) unsigned NOT NULL,
  `name_village` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `created_village` TIMESTAMP NOT NULL,
  `updated_village` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_village`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
DROP TABLE IF EXISTS `neighborhood`;
CREATE TABLE `neighborhood` (
  `cod_neighb` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cod_town` int(10) unsigned NULL,
  `cod_commune` int(10) unsigned NULL,
  `name_neighb` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `created_neighb` TIMESTAMP NOT NULL,
  `updated_neighb` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_neighb`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id_user` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cod_user_type` int(10) unsigned NOT NULL,
  `level_user` varchar(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT '0',
  `cod_train_area` int(10) unsigned NULL,
  `cod_know_area` int(10) unsigned NULL,
  `name_user` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `genre_user` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `year_user` int(4) unsigned NOT NULL,
  `month_user` int(2) unsigned NOT NULL,
  `day_user` int(2) unsigned NOT NULL,
  `document_user` int(12) unsigned NOT NULL,
  `email_user` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `pass_user` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `salt_user` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `confir_user` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `cellphone_user` varchar(16) COLLATE utf8_spanish_ci NOT NULL,
  `phone_user` varchar(16) COLLATE utf8_spanish_ci NULL,
  `cod_country` int(10) unsigned NOT NULL,
  `cod_state` int(10) unsigned NOT NULL,
  `cod_city` int(10) unsigned NOT NULL,
  `cod_commune` int(10) unsigned NULL,
  `cod_town` int(10) unsigned NULL,
  `cod_village` int(10) unsigned NULL,
  `cod_neighb` int(10) unsigned NULL,
  `address_user` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `created_user` TIMESTAMP NOT NULL,
  `updated_user` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`id_user`),
  KEY `fkcodusertype_usertype_idx` (`cod_user_type`),
  KEY `fkcodtrainarea_trainingarea_idx` (`cod_train_area`),
  KEY `fkcodknowarea_knowledgearea_idx` (`cod_know_area`),
  KEY `fkcodcountry_countries_idx` (`cod_country`),
  KEY `fkcodstate_states_idx` (`cod_state`),
  KEY `fkcodcity_cities_idx` (`cod_city`),
  KEY `fkcodcommune_communes_idx` (`cod_commune`),
  KEY `fkcodtown_towns_idx` (`cod_town`),
  KEY `fkcodvillage_villages_idx` (`cod_village`),
  KEY `fkcodneighb_neighborhood_idx` (`cod_neighb`),
  CONSTRAINT `fkcodusertype_usertype` FOREIGN KEY (`cod_user_type`) REFERENCES `user_type` (`cod_user_type`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkcodtrainarea_trainingarea` FOREIGN KEY (`cod_train_area`) REFERENCES `training_area` (`cod_train_area`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkcodknowarea_knowledgearea` FOREIGN KEY (`cod_know_area`) REFERENCES `knowledge_area` (`cod_know_area`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkcodcountry_countries` FOREIGN KEY (`cod_country`) REFERENCES `countries` (`cod_country`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkcodstate_states` FOREIGN KEY (`cod_state`) REFERENCES `states` (`cod_state`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkcodcity_cities` FOREIGN KEY (`cod_city`) REFERENCES `cities` (`cod_city`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkcodcommune_communes` FOREIGN KEY (`cod_commune`) REFERENCES `communes` (`cod_commune`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkcodtown_towns` FOREIGN KEY (`cod_town`) REFERENCES `towns` (`cod_town`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkcodvillage_villages` FOREIGN KEY (`cod_village`) REFERENCES `villages` (`cod_village`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkcodneighb_neighborhood` FOREIGN KEY (`cod_neighb`) REFERENCES `neighborhood` (`cod_neighb`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
DROP TABLE IF EXISTS `project_categories`;
CREATE TABLE `project_categories` (
  `cod_pro_cate` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_pro_cate` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `created_pro_cate` TIMESTAMP NOT NULL,
  `updated_pro_cate` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_pro_cate`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
DROP TABLE IF EXISTS `project_status`;
CREATE TABLE `project_status` (
  `cod_pro_sta` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_pro_sta` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `created_pro_sta` TIMESTAMP NOT NULL,
  `updated_pro_sta` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_pro_sta`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
DROP TABLE IF EXISTS `ideas`;
CREATE TABLE `ideas` (
  `cod_idea` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cod_pro_cate` int(10) unsigned NOT NULL,
  `id_user` int(10) unsigned NOT NULL,
  `title_idea` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `detail_idea` text COLLATE utf8_spanish_ci NOT NULL,
  `created_fq` TIMESTAMP NOT NULL,
  `updated_fq` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_idea`),
  KEY `fkcodprocatei_projectcategories_idx` (`cod_pro_cate`),
  KEY `fkiduserfi_users_idx` (`id_user`),
  CONSTRAINT `fkcodprocatei_projectcategories` FOREIGN KEY (`cod_pro_cate`) REFERENCES `project_categories` (`cod_pro_cate`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkiduserfi_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
DROP TABLE IF EXISTS `phases_project`;
CREATE TABLE `phases_project` (
  `cod_pha_pro` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_pha_pro` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `duration_pha_pro` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `created_pha_pro` TIMESTAMP NOT NULL,
  `updated_pha_pro` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_pha_pro`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
  `cod_project` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_project` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `cod_pro_cate` int(10) unsigned NOT NULL,
  `cod_idea` int(10) unsigned NOT NULL,
  `cod_pro_sta` int(10) unsigned NOT NULL,
  `cod_pha_pro` int(10) unsigned NOT NULL,
  `progress_project` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `created_project` TIMESTAMP NOT NULL,
  `updated_project` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_project`),
  KEY `fkcodprocate_projectcategories_idx` (`cod_pro_cate`),
  KEY `fkcodidea_ideas_idx` (`cod_idea`),
  KEY `fkcodprosta_projectstatus_idx` (`cod_pro_sta`),
  KEY `fkcodphapro_phasesproject_idx` (`cod_pha_pro`),
  CONSTRAINT `fkcodprocate_projectcategories` FOREIGN KEY (`cod_pro_cate`) REFERENCES `project_categories` (`cod_pro_cate`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkcodidea_ideas` FOREIGN KEY (`cod_idea`) REFERENCES `ideas` (`cod_idea`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkcodprosta_projectstatus` FOREIGN KEY (`cod_pro_sta`) REFERENCES `project_status` (`cod_pro_sta`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkcodphapro_phasesproject` FOREIGN KEY (`cod_pha_pro`) REFERENCES `phases_project` (`cod_pha_pro`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
DROP TABLE IF EXISTS `class_categories`;
CREATE TABLE `class_categories` (
  `cod_class_cat` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_class_cat` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `created_class_cat` TIMESTAMP NOT NULL,
  `updated_class_cat` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_class_cat`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes` (
  `cod_class` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_class` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `cod_class_cat` int(10) unsigned NOT NULL,
  `created_class` TIMESTAMP NOT NULL,
  `updated_class` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_class`),
  KEY `fkcodclasscat_classcategories_idx` (`cod_class_cat`),
  CONSTRAINT `fkcodclasscat_classcategories` FOREIGN KEY (`cod_class_cat`) REFERENCES `class_categories` (`cod_class_cat`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `projects_classes`;
CREATE TABLE `projects_classes` (
  `cod_project_class` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cod_project` int(10) unsigned NOT NULL,
  `cod_class` int(10) unsigned NOT NULL,
  `created_pc` TIMESTAMP NOT NULL,
  `updated_pc` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_project_class`),
  KEY `fkcodproject_projects_idx` (`cod_project`),
  KEY `fkcodclass_classes_idx` (`cod_class`),
  CONSTRAINT `fkcodproject_projects` FOREIGN KEY (`cod_project`) REFERENCES `projects` (`cod_project`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkcodclass_classes` FOREIGN KEY (`cod_class`) REFERENCES `classes` (`cod_class`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
DROP TABLE IF EXISTS `projects_users`;
CREATE TABLE `projects_users` (
  `cod_project_users` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cod_project` int(10) unsigned NOT NULL,
  `id_user` int(10) unsigned NOT NULL,
  `created_pu` TIMESTAMP NOT NULL,
  `updated_pu` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_project_users`),
  KEY `fkidproject_projects_idx` (`cod_project`),
  KEY `fkiduser_users_idx` (`id_user`),
  CONSTRAINT `fkidproject_projects` FOREIGN KEY (`cod_project`) REFERENCES `projects` (`cod_project`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkiduser_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
DROP TABLE IF EXISTS `project_description`;
CREATE TABLE `project_description` (
  `cod_pro_des` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cod_project` int(10) unsigned NOT NULL,
  `text_pro_des` text COLLATE utf8_spanish_ci NOT NULL,
  `created_pd` TIMESTAMP NOT NULL,
  `updated_pd` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_pro_des`),
  KEY `fkcodprojectd_projects_idx` (`cod_project`),
  CONSTRAINT `fkcodprojectd_projects` FOREIGN KEY (`cod_project`) REFERENCES `projects` (`cod_project`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
DROP TABLE IF EXISTS `subdomains`;
CREATE TABLE `subdomains` (
  `cod_subdomain` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cod_project` int(10) unsigned NOT NULL,
  `url_subdomain` text COLLATE utf8_spanish_ci NOT NULL,
  `created_subdomain` TIMESTAMP NOT NULL,
  `updated_subdomain` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_subdomain`),
  KEY `fkcodprojects_projects_idx` (`cod_project`),
  CONSTRAINT `fkcodprojects_projects` FOREIGN KEY (`cod_project`) REFERENCES `projects` (`cod_project`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
DROP TABLE IF EXISTS `definitions_category`;
CREATE TABLE `definitions_category` (
  `cod_def_cate` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_def_cate` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `created_dc` TIMESTAMP NOT NULL,
  `updated_dc` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_def_cate`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
DROP TABLE IF EXISTS `definitions`;
CREATE TABLE `definitions` (
  `cod_definition` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cod_def_cate` int(10) unsigned NOT NULL,
  `detail_definition` text COLLATE utf8_spanish_ci NOT NULL,
  `created_definition` TIMESTAMP NOT NULL,
  `updated_definition` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_definition`),
  KEY `fkcoddefcate_definitionscategory_idx` (`cod_def_cate`),
  CONSTRAINT `fkcoddefcate_definitionscategory` FOREIGN KEY (`cod_def_cate`) REFERENCES `definitions_category` (`cod_def_cate`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
DROP TABLE IF EXISTS `terms`;
CREATE TABLE `terms` (
  `cod_term` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cod_definition` int(10) unsigned NOT NULL,
  `name_term` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `created_term` TIMESTAMP NOT NULL,
  `updated_term` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_term`),
  KEY `fkcoddefinition_definitions_idx` (`cod_definition`),
  CONSTRAINT `fkcoddefinition_definitions` FOREIGN KEY (`cod_definition`) REFERENCES `definitions` (`cod_definition`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
DROP TABLE IF EXISTS `forums`;
CREATE TABLE `forums` (
  `cod_forum` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cod_project` int(10) unsigned NOT NULL,
  `id_user` int(10) unsigned NOT NULL,
  `name_forum` text COLLATE utf8_spanish_ci NOT NULL,
  `created_forum` TIMESTAMP NOT NULL,
  `updated_forum` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_forum`),
  KEY `fkcodprojectf_projects_idx` (`cod_project`),
  KEY `fkiduserf_users_idx` (`id_user`),
  CONSTRAINT `fkcodprojectf_projects` FOREIGN KEY (`cod_project`) REFERENCES `projects` (`cod_project`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkiduserf_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
DROP TABLE IF EXISTS `forum_questions`;
CREATE TABLE `forum_questions` (
  `cod_for_que` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cod_forum` int(10) unsigned NOT NULL,
  `id_user` int(10) unsigned NOT NULL,
  `question_for_que` text COLLATE utf8_spanish_ci NOT NULL,
  `created_fq` TIMESTAMP NOT NULL,
  `updated_fq` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_for_que`),
  KEY `fkcodforum_forums_idx` (`cod_forum`),
  KEY `fkiduserfq_users_idx` (`id_user`),
  CONSTRAINT `fkcodforum_forums` FOREIGN KEY (`cod_forum`) REFERENCES `forums` (`cod_forum`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkiduserfq_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
DROP TABLE IF EXISTS `images_category`;
CREATE TABLE `images_category` (
  `cod_ima_cate` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_ima_cate` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `created_ima_cate` TIMESTAMP NOT NULL,
  `updated_ima_cate` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_ima_cate`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images` (
  `cod_image` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_image` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `id_user` int(10) unsigned NULL,
  `cod_project` int(10) unsigned NULL,
  `cod_idea` int(10) unsigned NULL,
  `cod_ima_cate` int(10) unsigned NOT NULL,
  `created_image` TIMESTAMP NOT NULL,
  `updated_image` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_image`),
  KEY `fkcodprojectima_projects_idx` (`cod_project`),
  KEY `fkiduserima_users_idx` (`id_user`),
  KEY `fkcodideaima_ideas_idx` (`cod_idea`),
  KEY `fkcodimacate_imagescategory_idx` (`cod_ima_cate`),
  CONSTRAINT `fkcodprojectima_projects` FOREIGN KEY (`cod_project`) REFERENCES `projects` (`cod_project`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkiduserima_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkcodideaima_ideas` FOREIGN KEY (`cod_idea`) REFERENCES `ideas` (`cod_idea`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkcodimacate_imagescategory` FOREIGN KEY (`cod_ima_cate`) REFERENCES `images_category` (`cod_ima_cate`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
