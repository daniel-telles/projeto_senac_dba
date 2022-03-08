create database projeto_integrador_senac;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

create table `tb_usuario_admin` (
  `id_usuario_admin` int(11) not null,
  `cod_pessoas` int(11) not null,
  `cod_categoria` int(11) not null,
  `email_usuario_admin` varchar(30) not null,
  `senha_usuario_admin` longtext not null,
  `confirmar_senha_admin` longtext not null 
) engine=InnoDB default charset=utf8;


create table `tb_contatos` (
`nome_contatos` varchar(40) collate utf8_unicode_ci default null,
`id_contatos` int(11) not null,
`cod_usuario_admin` int(11) not null,
`cod_tipo_contato` int(11) not null
) engine=InnoDB default charset=utf8 collate=utf8_unicode_ci;


create table `tb_tipo_contato` (
  `id_tipo_contato` int(11) not null,
  `nome_tipo_contato` varchar(40) COLLATE utf8_unicode_ci not null,
  `icone_tipo_contato` char(60) COLLATE utf8_unicode_ci default null,
  `excluido` int(1) not null default '0' comment '[hidden'
) engine=InnoDB default charset=utf8 collate=utf8_unicode_ci;


create table `tb_pessoas` (
  `nome_pessoas` varchar(50) not null,
  `data_nascimento_pessoas` date default null,
  `sexo_pessoas` int(1) default null,
  `email_pessoas` longtext not null,
  `celular_pessoas` varchar(15) default null,
  `profissao_pessoas` varchar(80) default null,
  `id_pessoas` int(11) not null,
  `endereco_pessoas` longtext,
  `bairro_pessoas` longtext,
  `cep_pessoas` char(10) default null,
  `estado_pessoas` int(2) default null,
  `cidade_pessoas` int(11) default null,
  `excluido` int(1) NOT NULL DEFAULT '0',
  `datahoraautomatica_pessoas` datetime default null
) engine=InnoDB default charset=utf8;


create table `tb_cidade` (
 `nome_cidade` varchar(30) not null,
  `id_cidade` int(11) not null,
  `cod_estado` int(2) not null,
  `excluido` int(1) not null default '0' comment 'hidden'
) engine=InnoDB default charset=utf8;


create table `tb_estado` (
`nome_estado` varchar(20) character set utf8 not null,
`id_estado` int(10) not null,
`cod_pais` smallint(2) not null,
`excluido` int(1) not null default '0' comment 'hidden'
) engine=InnoDB default charset=utf8mb4;


create table `tb_menu` (
  `id_menu` int(11) not null,
  `nome_menu` varchar(80) not null,
  `icone_menu` varchar(60) not null,
  `cod_menu` int(11) DEFAULT '0',
  `tabela_menu` varchar(60) not null,
  `colunas_menu` longtext,
  `check_conectores_menu` int(1) not null default '1',
  `check_emailenviar_menu` int(1) not null default '0',
  `excluido` int(1) not null default '0' comment 'Excluido[inativo'
) engine=InnoDB default charset=utf8;


create table `tb_categoria` (
  `nome_categoria` varchar(80) not null,
  `id_categoria` int(11) not null,
  `excluido` int(1) not null default '0'
) engine=InnoDB default charset=utf8;


create table `tb_categoria_menu` (
  `id_categoria_menu` int(11) not null,
  `cod_categoria` int(11) not null,
  `cod_menu` int(11) not null,
  `check_inserir_menu` int(1) not null default  '0',
  `check_alterar_menu` int(1) not null default '0',
  `check_delete_menu` int(1) not null default '0',
  `check_visualizar_menu` int(1) not null default '1',
  `excluido` int(11) not null default '0' comment 'Excluido[inativo'
) engine=InnoDB default charset=utf8;


insert into `tb_tipo_contato` (`id_tipo_contato`, `nome_tipo_contato`, `icone_tipo_contato`, `excluido`) values
(1, 'Telefone', '<i class=\"fa-3x fa-solid fa-square-phone\"></i>', 0),
(2, 'E-mail', '<i class=\"fa-3x fa-solid fa-envelope\"></i>', 0),
(3, 'WhatsApp ', '<i class=\"fa-3x fa-brands fa-whatsapp\"></i>', 0),
(4, 'Facebook', '<i class=\"fa-3x fa-brands fa-facebook\"></i>', 0),
(5, 'Instagram', '<i class=\"fa-3x fa-brands fa-instagram\"></i>', 0),
(6, 'Twitter', '<i class=\"fa-3x fa-brands fa-twitter\"></i>', 0),
(7, 'YouTube ', '<i class=\"fa-3x fa-brands fa-youtube\"></i>', 0),
(8, 'LinkedIn ', '<i class=\"fa-3x fa-brands fa-linkedin\"></i>', 0),
(9, 'TikTok', '<i class=\"fa-3x material-icons\">tiktok</i>', 0),
(10, 'Telegram', '<i class=\"fa-3x fa-brands fa-telegram\"></i>', 0),
(11, 'Site', '<i class=\"fa-3x fa-solid fa-globe\"></i>', 0),
(12, 'Currículo ', '<i class=\"fa-3x fa-solid fa-copy\"></i>', 0),
(13, 'Outros', '<i class=\"fa-3x fa-solid fa-square-share-nodes\"></i>', 0);


ALTER TABLE `tb_usuario_admin`
ADD PRIMARY KEY (`id_usuario_admin`),
ADD KEY `cod_pessoas` (`cod_pessoas`),
ADD KEY `cod_categoria` (`cod_categoria`);
  
  
ALTER TABLE `tb_pessoas`
ADD PRIMARY KEY (`id_pessoas`),
ADD KEY `cidade_pessoas` (`cidade_pessoas`);
  
  
ALTER TABLE `tb_contatos`
ADD PRIMARY KEY (`id_contatos`),
ADD KEY `cod_usuario_admin` (`cod_usuario_admin`),
ADD KEY `cod_tipo_contato` (`cod_tipo_contato`);
  
  
ALTER TABLE `tb_cidade`
ADD PRIMARY KEY (`id_cidade`),
ADD KEY `cod_estado` (`cod_estado`);


ALTER TABLE `tb_cidade`
MODIFY `id_cidade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5729;


ALTER TABLE `tb_estado`
ADD PRIMARY KEY (`id_estado`);
  

ALTER TABLE `tb_categoria`
ADD PRIMARY KEY (`id_categoria`);


ALTER TABLE `tb_categoria_menu`
ADD PRIMARY KEY (`id_categoria_menu`),
ADD KEY `cod_categoria` (`cod_categoria`),
ADD KEY `cod_menu` (`cod_menu`);


ALTER TABLE `tb_menu`
ADD PRIMARY KEY (`id_menu`);


ALTER TABLE `tb_tipo_contato`
ADD PRIMARY KEY (`id_tipo_contato`);


ALTER TABLE `tb_usuario_admin`
ADD CONSTRAINT `tb_usuario_adm_ibfk_1` FOREIGN KEY (`cod_pessoas`) REFERENCES `tb_pessoas` (`id_pessoas`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `tb_usuario_adm_ibfk_2` FOREIGN KEY (`cod_categoria`) REFERENCES `tb_categoria` (`id_categoria`) ON DELETE NO ACTION ON UPDATE CASCADE;


ALTER TABLE `tb_usuario_admin`
MODIFY `id_usuario_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;


ALTER TABLE `tb_contatos`
ADD CONSTRAINT `tb_contatos_ibfk_1` FOREIGN KEY (`cod_tipo_contato`) REFERENCES `tb_tipo_contato` (`id_tipo_contato`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `tb_contatos_ibfk_2` FOREIGN KEY (`cod_usuario_adm`) REFERENCES `tb_usuario_admin` (`id_usuario_admin`) ON DELETE NO ACTION ON UPDATE CASCADE;


ALTER TABLE `tb_categoria_menu`
ADD CONSTRAINT `tb_categoria_menu_ibfk_1` FOREIGN KEY (`cod_menu`) REFERENCES `tb_menu` (`id_menu`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `tb_categoria_menu_ibfk_2` FOREIGN KEY (`cod_categoria`) REFERENCES `tb_categoria` (`id_categoria`) ON DELETE NO ACTION ON UPDATE CASCADE;


ALTER TABLE `tb_contatos`
MODIFY `id_contatos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;


ALTER TABLE `tb_pessoas`
MODIFY `id_pessoas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;


ALTER TABLE `tb_tipo_contato`
MODIFY `id_tipo_contato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;


ALTER TABLE `tb_cidade`
ADD CONSTRAINT `tb_cidade_ibfk_1` FOREIGN KEY (`cod_estado`) REFERENCES `tb_estado` (`id_estado`);


ALTER TABLE `tb_categoria`
MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


ALTER TABLE `tb_categoria_menu`
MODIFY `id_categoria_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;


ALTER TABLE `tb_menu`
MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;


COMMIT;
