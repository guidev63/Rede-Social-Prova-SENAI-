-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22/06/2024 às 02:28
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `guilhermeaugusto_banco`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `comentario`
--

CREATE TABLE `comentario` (
  `Cod` int(11) NOT NULL,
  `cod_foto` int(11) NOT NULL,
  `cod_usuario` int(11) NOT NULL,
  `texto_comentario` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `comentario`
--

INSERT INTO `comentario` (`Cod`, `cod_foto`, `cod_usuario`, `texto_comentario`) VALUES
(1, 2, 1, 'cbascsa'),
(2, 4, 1, 'sadassd'),
(3, 1, 1, 'asdsdsada'),
(4, 3, 1, 'sadadadas'),
(5, 6, 1, 'sdadasda'),
(6, 2, 1, 'asdadasdasdadad'),
(7, 1, 1, 'sadadasd');

-- --------------------------------------------------------

--
-- Estrutura para tabela `foto`
--

CREATE TABLE `foto` (
  `Cod` int(11) NOT NULL,
  `cod_usuario` int(11) NOT NULL,
  `nomefoto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `foto`
--

INSERT INTO `foto` (`Cod`, `cod_usuario`, `nomefoto`) VALUES
(1, 1, 'Everest.jpg'),
(2, 1, 'MonteFuji.jpg'),
(3, 1, 'AlpesSuiços.jpg'),
(4, 1, 'GrandCanyon.jpg'),
(5, 1, 'MonteBranco.jpg'),
(6, 1, 'MonteElbrus.jpg'),
(7, 1, 'PicoPikes.jpg'),
(8, 1, 'Huandoy.jpg');

-- --------------------------------------------------------

--
-- Estrutura para tabela `reacao`
--

CREATE TABLE `reacao` (
  `Cod` int(11) NOT NULL,
  `cod_foto` int(11) NOT NULL,
  `cod_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `cod` int(1) NOT NULL,
  `nome` varchar(9) DEFAULT NULL,
  `nick_name` varchar(5) DEFAULT NULL,
  `email` varchar(14) DEFAULT NULL,
  `telefone` bigint(11) DEFAULT NULL,
  `senha` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`cod`, `nome`, `nick_name`, `email`, `telefone`, `senha`) VALUES
(1, 'Usuario 1', 'user1', 'user1@user.com', 11111111111, 'usuario1111'),
(2, 'Usuario 2', 'user2', 'user2@user.com', 22222222222, 'usuario2222'),
(3, 'Usuario 3', 'user3', 'user3@user.com', 33333333333, 'usuario3333'),
(4, 'Usuario 4', 'user4', 'user4@user.com', 44444444444, 'usuario4444'),
(5, 'Usuario 5', 'user5', 'user5@user.com', 55555555555, 'usuario5555'),
(6, 'Usuario 6', 'user6', 'user6@user.com', 66666666666, 'usuario6666'),
(7, 'Usuario 7', 'user7', 'user7@user.com', 77777777777, 'usuario7777'),
(8, 'Usuario 8', 'user8', 'user8@user.com', 88888888888, 'usuario8888'),
(9, 'Usuario 9', 'user9', 'user9@user.com', 99999999999, 'usuario9999');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`Cod`),
  ADD KEY `cod_foto` (`cod_foto`),
  ADD KEY `cod_usuario` (`cod_usuario`);

--
-- Índices de tabela `foto`
--
ALTER TABLE `foto`
  ADD PRIMARY KEY (`Cod`),
  ADD KEY `cod_usuario` (`cod_usuario`);

--
-- Índices de tabela `reacao`
--
ALTER TABLE `reacao`
  ADD PRIMARY KEY (`Cod`),
  ADD KEY `cod_foto` (`cod_foto`),
  ADD KEY `cod_usuario` (`cod_usuario`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`cod`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `comentario`
--
ALTER TABLE `comentario`
  MODIFY `Cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `foto`
--
ALTER TABLE `foto`
  MODIFY `Cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `reacao`
--
ALTER TABLE `reacao`
  MODIFY `Cod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `cod` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`cod_foto`) REFERENCES `foto` (`Cod`),
  ADD CONSTRAINT `comentario_ibfk_2` FOREIGN KEY (`cod_usuario`) REFERENCES `usuarios` (`cod`);

--
-- Restrições para tabelas `foto`
--
ALTER TABLE `foto`
  ADD CONSTRAINT `foto_ibfk_1` FOREIGN KEY (`cod_usuario`) REFERENCES `usuarios` (`cod`);

--
-- Restrições para tabelas `reacao`
--
ALTER TABLE `reacao`
  ADD CONSTRAINT `reacao_ibfk_1` FOREIGN KEY (`cod_foto`) REFERENCES `foto` (`Cod`),
  ADD CONSTRAINT `reacao_ibfk_2` FOREIGN KEY (`cod_usuario`) REFERENCES `usuarios` (`cod`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
