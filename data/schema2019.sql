-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.3.10-MariaDB-1:10.3.10+maria~bionic - mariadb.org binary distribution
-- OS do Servidor:               debian-linux-gnu
-- HeidiSQL Versão:              9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura para tabela crud_jquery.clients
CREATE TABLE IF NOT EXISTS `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_bin NOT NULL,
  `email` varchar(45) COLLATE utf8_bin NOT NULL,
  `cpf` varchar(11) COLLATE utf8_bin NOT NULL,
  `phone` varchar(11) COLLATE utf8_bin NOT NULL,
  `birthday` date NOT NULL,
  `marital_status` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela crud_jquery.clients: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` (`id`, `name`, `email`, `cpf`, `phone`, `birthday`, `marital_status`) VALUES
	(1, 'Cliente 1', 'cliente1@schoolofnet.com', '00000000000', '00000000000', '2017-07-08', 1),
	(2, 'Cliente 2', 'cliente2@schoolofnet.com', '11111111111', '11111111111', '2017-07-09', 2),
	(3, 'Cliente 3', 'cliente3@schoolofnet.com', '22222222222', '22222222222', '2017-07-10', 3),
	(4, 'Cliente 4', 'cliente4@schoolofnet.com', '33333333333', '33333333333', '2017-07-11', 1),
	(5, 'Cliente 5', 'cliente5@schoolofnet.com', '44444444444', '44444444444', '2017-07-12', 2),
	(6, 'Cliente 6', 'cliente6@schoolofnet.com', '55555555555', '55555555555', '2017-07-13', 3),
	(7, 'Cliente 7', 'cliente7@schoolofnet.com', '66666666666', '66666666666', '2017-07-14', 1),
	(8, 'Cliente 8', 'cliente8@schoolofnet.com', '77777777777', '77777777777', '2017-07-15', 2),
	(9, 'Renato Lucena', 'cpdrenato@gmail.com', '88888888888', '62984306136', '2019-08-07', 2);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;

-- Copiando estrutura para tabela crud_jquery.contexto_tipo
CREATE TABLE IF NOT EXISTS `contexto_tipo` (
  `contexto_id` int(11) NOT NULL,
  `tipo_id` int(11) NOT NULL,
  `tesao_id` int(11) NOT NULL,
  `pasta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela crud_jquery.contexto_tipo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `contexto_tipo` DISABLE KEYS */;
INSERT INTO `contexto_tipo` (`contexto_id`, `tipo_id`, `tesao_id`, `pasta_id`) VALUES
	(2, 1, 2, 5);
/*!40000 ALTER TABLE `contexto_tipo` ENABLE KEYS */;

-- Copiando estrutura para tabela crud_jquery.tipos
CREATE TABLE IF NOT EXISTS `tipos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(55) COLLATE utf8_bin NOT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  `possui_validade` tinyint(1) DEFAULT NULL,
  `descricao` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `ascendente` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela crud_jquery.tipos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tipos` DISABLE KEYS */;
INSERT INTO `tipos` (`id`, `nome`, `ativo`, `possui_validade`, `descricao`, `ascendente`) VALUES
	(21, 'Laudo de opacidade', 0, 0, '\\N', 27),
	(22, 'Ap?lice de seguro RCF-V', 0, 0, '\\N', 27),
	(23, 'Cart?o Livre Tr?nsito', 0, 0, '\\N', 27),
	(24, 'Certificado de Vigil?ncia Sanit?ria', 0, 0, '\\N', 27),
	(25, 'EXAME TOXICOL?GICO', 0, 0, '\\N', 26),
	(26, 'Para Motorista', 0, 0, '\\N', 0),
	(27, 'Para Ve?culo', 0, 0, '\\N', 0),
	(28, 'Para Documenta??o', 0, 0, '\\N', 0),
	(29, 'Ap?lice RCTR-C', 0, 0, '\\N', 28),
	(30, 'Ap?lice RC Ambiental', 0, 0, '\\N', 28),
	(31, 'Ap?lice ALL RISKS/LMI', 0, 0, '\\N', 28),
	(32, 'Consulta pontua??o CNH', 0, 0, '\\N', 26),
	(33, 'Para Motorista', 0, 0, '\\N', 0),
	(34, 'Para Ve?culo', 0, 0, '\\N', 0),
	(35, 'CNPJ', 0, 0, '\\N', 33),
	(36, 'INSCRI??O ESTADUAL', 0, 0, '\\N', 33),
	(37, 'CONTRATO SOCIAL', 0, 0, '\\N', 33),
	(38, 'ASO', 0, 0, '\\N', 33),
	(39, 'PPRA', 0, 0, '\\N', 33),
	(40, 'PCMSO', 0, 0, '\\N', 33),
	(41, 'C?PIA DE LIVRO DE REGISTRO DE FUNCION?RIO', 0, 0, '\\N', 33),
	(42, 'CTPS', 0, 0, '\\N', 33),
	(43, 'TESTE PSICOL?GICO', 0, 0, '\\N', 33),
	(44, 'COMPROVANTE DE RESID?NCIA', 0, 0, '\\N', 33),
	(45, 'TREINAMENTO COLETA DE AMOSTRA', 0, 0, '\\N', 33),
	(46, 'TERMO ETIL?METRO', 0, 0, '\\N', 33),
	(47, 'EXAME TOXICOL?GICO', 0, 0, '\\N', 33),
	(48, 'CONTROLE MENSAL PONTUA??O CNH', 0, 0, '\\N', 33),
	(49, 'COMPROVANTE ?LTIMO PAGAMENTO DE SAL?RIOS', 0, 0, '\\N', 33),
	(50, 'CERTID?O SECRETARIA DA FAZENDA ESTADUAL', 0, 0, '\\N', 33),
	(51, 'CERTID?O RECEITA FEDERAL', 0, 0, '\\N', 33),
	(52, 'CERTID?O FGTS', 0, 0, '\\N', 33),
	(53, 'CERTID?O INSS', 0, 0, '\\N', 33),
	(54, 'COMPROVANTE ?LTIMO RECOLHIMENTO INSS', 0, 0, '\\N', 33),
	(55, 'COMPROVANTE ?LTIMO RECOLHIMENTO FGTS', 0, 0, '\\N', 33),
	(56, 'CRLV', 0, 0, '\\N', 34),
	(57, 'RNTRC', 0, 0, '\\N', 34),
	(58, 'CONTRATO ARRENDAMENTO VE?CULO', 0, 0, '\\N', 34),
	(59, 'LAUDO DO INMETRO PARA CRONOTAC?GRAFO', 0, 0, '\\N', 34),
	(60, 'AP?LICE RCF-V (TERCEIROS)', 0, 0, '\\N', 34),
	(61, 'CART?O LIVRE TR?NSITO', 0, 0, '\\N', 34),
	(62, 'CERTIFICADO VIGIL?NCIA SANIT?RIA', 0, 0, '\\N', 34),
	(63, 'CONTRATO COMODATO', 0, 0, '\\N', 34),
	(64, 'CIC', 0, 0, '\\N', 0),
	(65, 'Averba??o', 0, 0, '\\N', 0),
	(66, 'Manifesto', 0, 0, '\\N', 0),
	(67, 'Nota Fiscal', 0, 0, '\\N', 0),
	(68, 'Ordem de Coleta/Entrega', 0, 0, '\\N', 0),
	(69, 'Ocorr?ncia Policial', 0, 0, '\\N', 0),
	(70, 'FEDERAL ST', 0, 0, '\\N', 0),
	(71, 'FICHA DE REGISTRO', 0, 0, '\\N', 70),
	(72, 'CTPS', 0, 0, '\\N', 70),
	(73, 'CONTRATO DE TRABALHO', 0, 0, '\\N', 70),
	(74, 'CNH', 0, 0, '\\N', 70),
	(75, 'RG', 0, 0, '\\N', 70),
	(76, 'CPF', 0, 0, '\\N', 70),
	(77, 'COMPROVANTE DE ENDERE?O', 0, 0, '\\N', 70),
	(78, 'ASO', 0, 0, '\\N', 70),
	(79, 'ORDEM DE SERVI?O', 0, 0, '\\N', 70),
	(80, 'FICHA DE EPI\'s e CA', 0, 0, '\\N', 70),
	(81, 'COMPROVANTE ESCOLARIDADE', 0, 0, '\\N', 70),
	(82, 'CRACHA COLABORADOR', 0, 0, '\\N', 70),
	(83, 'TREINAMENTO PERTINENTES', 0, 0, '\\N', 70),
	(84, 'DECLARA?AO DE EMERG?NCIA', 0, 0, '\\N', 70),
	(85, 'RESERVISTA', 0, 0, '\\N', 70),
	(86, 'CERTIDAO NASCIMENTO FILHOS', 0, 0, '\\N', 70),
	(87, 'CARTAO DO PIS', 0, 0, '\\N', 70),
	(88, 'DADOS BANCARIOS', 0, 0, '\\N', 70),
	(89, 'CURRICULO', 0, 0, '\\N', 70),
	(90, 'TITULO DE ELEITOR', 0, 0, '\\N', 70),
	(91, 'CERTIDAO DE CASAMENTO', 0, 0, '\\N', 70),
	(92, 'ADVERTENCIA', 0, 0, '\\N', 70),
	(93, 'CARTAO DE VACINA FILHOS', 0, 0, '\\N', 70),
	(94, 'DECLARA?AO SERV. NESTLE', 0, 0, '\\N', 70),
	(95, 'REQ. QUALID. SEG. ALIEMENTOS', 0, 0, '\\N', 70),
	(96, 'TERMOS DE ENTREGA CELULAR', 0, 0, '\\N', 70),
	(97, 'TERMOS DE ENTREGA CHIP', 0, 0, '\\N', 70),
	(98, 'TERMOS DE ENTREGA LAPTOP', 0, 0, '\\N', 70),
	(99, 'MEMORANDO CIRCULAR', 0, 0, '\\N', 70),
	(100, 'CARTAO CIDADAO', 0, 0, '\\N', 70),
	(101, 'ALVARA DE FUNCIONAMENTO', 0, 0, '\\N', 70),
	(102, 'CERTIDAO NEGATIVA DE FGTS', 0, 0, '\\N', 70),
	(103, 'CERTIDAO NEGATIVA DE INSS', 0, 0, '\\N', 70),
	(104, 'CONTRATO SOCIAL', 0, 0, '\\N', 70),
	(105, 'CARTAO CNPJ', 0, 0, '\\N', 70),
	(106, 'CONTRIBUI?AO SINDICAL PATRONAL', 0, 0, '\\N', 70),
	(107, 'PPRA', 0, 0, '\\N', 70),
	(108, 'PCMSO', 0, 0, '\\N', 70),
	(109, 'GUIA RECOLHIMENTO FGTS', 0, 0, '\\N', 70),
	(110, 'GUIA RECOLHIMENTO INSS', 0, 0, '\\N', 70),
	(111, 'CERTIDAO CND FEDERAL', 0, 0, '\\N', 70),
	(112, 'CERTIDAO CND MUNICIPAL', 0, 0, '\\N', 70),
	(113, 'SIMPLES NACIONAL', 0, 0, '\\N', 70),
	(114, 'FOTO 3X4', 0, 0, '\\N', 70),
	(115, 'Consulta Klios', 0, 0, '\\N', 0),
	(116, 'CNH', 0, 0, '\\N', 115),
	(117, 'CTPS (Identifica??o)', 0, 0, '\\N', 115),
	(118, 'CTPS (?ltimo Registro)', 0, 0, '\\N', 115),
	(119, 'Comprovante de Resid?ncia', 0, 0, '\\N', 115),
	(120, 'CRLV Caminh?o OU Cavalo-Trator', 0, 0, '\\N', 115),
	(121, 'CRLV Carreta 1', 0, 0, '\\N', 115),
	(122, 'CRLV Carreta 2', 0, 0, '\\N', 115),
	(123, 'Resultado da An?lise', 0, 0, '\\N', 115),
	(124, 'Consulta Pontua??o CNH', 0, 0, '\\N', 115),
	(125, 'Contrato ? Agregado', 0, 0, '\\N', 26),
	(126, 'Contrato ? Agregado', 0, 0, '\\N', 27),
	(127, 'Consulta RNTRC', 0, 0, '\\N', 27),
	(128, 'AP?LICE RCTR-C', 0, 0, '\\N', 28),
	(129, 'AP?LICE RCF-DC', 0, 0, '\\N', 28),
	(130, 'AP?LICE RC-AMBIENTAL', 0, 0, '\\N', 28),
	(131, 'GFIP OU CARTA DO RH', 0, 0, '\\N', 28),
	(132, 'CAPACITA??ES MENSAIS', 0, 0, '\\N', 28),
	(133, 'TERMO DE ACEITE NPGR', 0, 0, '\\N', 28),
	(134, 'Consulta RNTRC', 0, 0, '\\N', 34),
	(135, 'CONSULTA RNTRC', 0, 0, '\\N', 34),
	(136, 'TERMO MOTORISTA RUMO SEGURO', 0, 0, '\\N', 26),
	(137, 'CRLV', 0, 0, '\\N', 34),
	(138, ' LAUDO DE AFERI??O DO CRONOTAC?GRAFO', 0, 0, '\\N', 27);
/*!40000 ALTER TABLE `tipos` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
