-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24/04/2026 às 13:24
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sportlife`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `agenda`
--

CREATE TABLE `agenda` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_usuario` int(10) UNSIGNED DEFAULT NULL,
  `id_servico` int(10) UNSIGNED DEFAULT NULL,
  `id_plano` int(10) UNSIGNED DEFAULT NULL,
  `data_hora` datetime NOT NULL,
  `status` enum('Agendado','Cancelado','Concluído') NOT NULL DEFAULT 'Agendado',
  `observacoes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `agenda`
--

INSERT INTO `agenda` (`id`, `id_usuario`, `id_servico`, `id_plano`, `data_hora`, `status`, `observacoes`) VALUES
(1, 1, 1, 1, '2026-04-01 10:00:00', 'Agendado', 'Treino funcional matinal.'),
(2, 2, 4, 1, '2026-04-01 14:00:00', 'Agendado', 'Aula de natação avançada.'),
(3, 1, 2, 2, '2026-04-02 18:00:00', 'Agendado', 'Treino de spinning.'),
(4, 3, 3, NULL, '2026-04-03 16:00:00', 'Agendado', 'Treino de Jiu-Jitsu com grupo.'),
(5, 2, NULL, 3, '2026-04-05 09:00:00', 'Agendado', 'Consulta de plano anual.');

-- --------------------------------------------------------

--
-- Estrutura para tabela `horarios`
--

CREATE TABLE `horarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `unidade` enum('Curitiba','Pinhais','Batel') NOT NULL,
  `dia_semana` enum('SEG','TER','QUA','QUI','SEX','SAB','DOM') NOT NULL,
  `hora` time NOT NULL,
  `modalidade` varchar(50) NOT NULL,
  `instrutor` varchar(50) NOT NULL,
  `status` enum('active','highlight','empty') NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `horarios`
--

INSERT INTO `horarios` (`id`, `unidade`, `dia_semana`, `hora`, `modalidade`, `instrutor`, `status`) VALUES
(1, 'Curitiba', 'SEG', '06:00:00', 'GAP', 'Prof. Ana', 'active'),
(2, 'Curitiba', 'SEG', '06:00:00', 'Spinning', 'Prof. Leo', 'highlight'),
(3, 'Curitiba', 'SEG', '06:00:00', 'Yoga', 'Prof. Bia', 'active'),
(4, 'Curitiba', 'SEG', '06:00:00', 'Cross', 'Prof. Caio', 'highlight'),
(5, 'Curitiba', 'SEG', '06:00:00', '--', '--', 'empty');

-- --------------------------------------------------------

--
-- Estrutura para tabela `planos`
--

CREATE TABLE `planos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome_plano` varchar(50) NOT NULL,
  `descricao` text DEFAULT NULL,
  `preco` decimal(10,2) NOT NULL,
  `duracao` varchar(50) NOT NULL,
  `status` enum('Ativo','Inativo') NOT NULL DEFAULT 'Ativo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `planos`
--

INSERT INTO `planos` (`id`, `nome_plano`, `descricao`, `preco`, `duracao`, `status`) VALUES
(1, 'Plano Mensal', 'Acesso completo à academia e aulas online.', 300.00, 'Mensal', 'Ativo'),
(2, 'Plano Trimestral', 'Acesso completo à academia e aulas online por 3 meses.', 850.00, 'Trimestral', 'Ativo'),
(3, 'Plano Anual', 'Acesso completo à academia e aulas online por 12 meses.', 3200.00, 'Anual', 'Ativo');

-- --------------------------------------------------------

--
-- Estrutura para tabela `planos_v2`
--

CREATE TABLE `planos_v2` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(50) NOT NULL,
  `tag` varchar(20) DEFAULT NULL,
  `preco_atual` decimal(8,2) NOT NULL,
  `preco_antigo` decimal(8,2) DEFAULT NULL,
  `desconto` varchar(50) DEFAULT NULL,
  `beneficios` text NOT NULL,
  `destaque` tinyint(1) DEFAULT 0,
  `botao_texto` varchar(50) DEFAULT NULL,
  `botao_link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `planos_v2`
--

INSERT INTO `planos_v2` (`id`, `nome`, `tag`, `preco_atual`, `preco_antigo`, `desconto`, `beneficios`, `destaque`, `botao_texto`, `botao_link`) VALUES
(1, 'Plano Black', 'PREMIUM', 99.90, 159.90, 'MELHOR CUSTO-BENEFÍCIO', 'Acesso a todas as unidades|Leve 5 amigos por mês|Área VIP e Relax|Camiseta exclusiva|Acesso total ao app|Bebida isotônica liberada', 1, 'Assinar Agora', '#');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome_produto` varchar(100) NOT NULL,
  `categoria` enum('Academia','Ciclismo','Luta','Natação','Acessórios') NOT NULL,
  `preco` decimal(10,2) NOT NULL DEFAULT 0.00,
  `quantidade` int(10) NOT NULL DEFAULT 0,
  `descricao` text NOT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nome_produto`, `categoria`, `preco`, `quantidade`, `descricao`, `imagem`, `data_criacao`) VALUES
(1, 'Whey Protein Elite', 'Academia', 199.90, 25, 'Suplemento proteico de alta qualidade para ganho de massa.', 'whey_elite.jpg', '2026-03-30 11:02:34'),
(2, 'Luva de Boxe Profissional', 'Luta', 149.90, 50, 'Luva resistente para treinos de boxe e artes marciais.', 'luva_boxe.jpg', '2026-03-30 11:02:34'),
(3, 'Bicicleta Speed 21', 'Ciclismo', 2999.90, 5, 'Bicicleta de estrada leve e aerodinâmica para performance.', 'bike_speed21.jpg', '2026-03-30 11:02:34'),
(4, 'Touca de Natação', 'Natação', 29.90, 100, 'Touca confortável e resistente para treinos de piscina.', 'touca_nata.jpg', '2026-03-30 11:02:34');

-- --------------------------------------------------------

--
-- Estrutura para tabela `servicos`
--

CREATE TABLE `servicos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome_servico` varchar(100) NOT NULL,
  `categoria` enum('Spinning','Cross','Boxe','Ritmos','Musculação','Zumba','Funcional','GAP','Pilates') NOT NULL,
  `preco` decimal(10,2) NOT NULL DEFAULT 0.00,
  `duracao` varchar(50) NOT NULL,
  `descricao` text DEFAULT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `servicos`
--

INSERT INTO `servicos` (`id`, `nome_servico`, `categoria`, `preco`, `duracao`, `descricao`, `data_criacao`) VALUES
(1, 'Protocolo de Performance', 'Musculação', 120.00, '60 MIN', 'Treino avançado com foco em hipertrofia e resistência.', '2026-03-30 11:02:33'),
(2, 'Treino Funcional Total', 'Funcional', 90.00, '50 MIN', 'Rotinas completas de funcional com acompanhamento personalizado.', '2026-03-30 11:02:33'),
(3, 'Aula de Zumba Elite', 'Zumba', 70.00, '45 MIN', 'Aulas energéticas com foco em condicionamento e diversão.', '2026-03-30 11:02:33'),
(4, 'Spinning Avançado', 'Spinning', 110.00, '50 MIN', 'Pedaladas intensas com métricas de performance.', '2026-03-30 11:02:33');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome_completo` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `modalidade` enum('BODYBUILDING / ACADEMIA','PERFORMANCE CICLISMO','ARTES MARCIAIS','NATAÇÃO DE ELITE') NOT NULL,
  `nivel_acesso` enum('Atleta','Treinador','Admin') NOT NULL DEFAULT 'Atleta',
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome_completo`, `email`, `senha`, `modalidade`, `nivel_acesso`, `data_criacao`) VALUES
(1, 'Lucas Silva', 'lucas@exemplo.com', 'senha123', 'BODYBUILDING / ACADEMIA', 'Atleta', '2026-03-30 11:02:33'),
(2, 'Mariana Costa', 'mariana@exemplo.com', 'senha123', 'NATAÇÃO DE ELITE', 'Atleta', '2026-03-30 11:02:33'),
(3, 'Carlos Oliveira', 'carlos@exemplo.com', 'senha123', 'PERFORMANCE CICLISMO', 'Treinador', '2026-03-30 11:02:33'),
(4, 'Ana Souza', 'ana@exemplo.com', 'senha123', 'ARTES MARCIAIS', 'Admin', '2026-03-30 11:02:33');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_agenda_usuario` (`id_usuario`),
  ADD KEY `fk_agenda_servico` (`id_servico`),
  ADD KEY `fk_agenda_plano` (`id_plano`);

--
-- Índices de tabela `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `planos`
--
ALTER TABLE `planos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `planos_v2`
--
ALTER TABLE `planos_v2`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `servicos`
--
ALTER TABLE `servicos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `agenda`
--
ALTER TABLE `agenda`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `horarios`
--
ALTER TABLE `horarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `planos`
--
ALTER TABLE `planos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `planos_v2`
--
ALTER TABLE `planos_v2`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `servicos`
--
ALTER TABLE `servicos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `agenda`
--
ALTER TABLE `agenda`
  ADD CONSTRAINT `fk_agenda_plano` FOREIGN KEY (`id_plano`) REFERENCES `planos` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_agenda_servico` FOREIGN KEY (`id_servico`) REFERENCES `servicos` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_agenda_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
