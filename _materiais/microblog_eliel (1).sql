-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10-Out-2023 às 16:48
-- Versão do servidor: 10.4.28-MariaDB
-- versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `microblog_eliel`
--
CREATE DATABASE IF NOT EXISTS `microblog_eliel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `microblog_eliel`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `id` smallint(6) NOT NULL,
  `nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `noticias`
--

CREATE TABLE `noticias` (
  `id` mediumint(9) NOT NULL,
  `data` datetime NOT NULL DEFAULT current_timestamp(),
  `titulo` varchar(150) NOT NULL,
  `texto` text NOT NULL,
  `resumo` tinytext NOT NULL,
  `imagem` varchar(45) NOT NULL,
  `destaque` enum('sim','nao') NOT NULL,
  `usuario_id` smallint(6) DEFAULT NULL,
  `categoria_id` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` smallint(6) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `tipo` enum('admin','editor') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `tipo`) VALUES
(1, 'mocoto', 'mocoto@pocoto.com', '$2y$10$AhAKBRLHO31w9q0vO3yETOA.AvWWCWi/uvgBhJJszL.enAu3OrgqO', 'editor'),
(2, 'eliel', 'eliellpf@hotmail.com', '$2y$10$OqLdk9xeihHxtrx1jCMfb.gAXXcVRe1KGM8QE/MVh4QUrl6RFTa5C', 'admin');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_noticias_usuarios` (`usuario_id`),
  ADD KEY `fk_noticias_categorias` (`categoria_id`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `noticias`
--
ALTER TABLE `noticias`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `noticias`
--
ALTER TABLE `noticias`
  ADD CONSTRAINT `fk_noticias_categorias` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_noticias_usuarios` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;