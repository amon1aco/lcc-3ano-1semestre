CREATE DATABASE  IF NOT EXISTS `gestao_eventos` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gestao_eventos`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: gestao_eventos
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `bilhetesvendidosparaevento`
--

DROP TABLE IF EXISTS `bilhetesvendidosparaevento`;
/*!50001 DROP VIEW IF EXISTS `bilhetesvendidosparaevento`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `bilhetesvendidosparaevento` AS SELECT 
 1 AS `BilheteID`,
 1 AS `EventoID`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `feedbacksdeevento`
--

DROP TABLE IF EXISTS `feedbacksdeevento`;
/*!50001 DROP VIEW IF EXISTS `feedbacksdeevento`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `feedbacksdeevento` AS SELECT 
 1 AS `EventoID`,
 1 AS `observacao`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `bilhetescompradosporcliente`
--

DROP TABLE IF EXISTS `bilhetescompradosporcliente`;
/*!50001 DROP VIEW IF EXISTS `bilhetescompradosporcliente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `bilhetescompradosporcliente` AS SELECT 
 1 AS `ClienteID`,
 1 AS `QR_Code`,
 1 AS `Tipo_Entrada`,
 1 AS `Cliente_Nome`,
 1 AS `Preco`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vendasporfuncionario`
--

DROP TABLE IF EXISTS `vendasporfuncionario`;
/*!50001 DROP VIEW IF EXISTS `vendasporfuncionario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vendasporfuncionario` AS SELECT 
 1 AS `FuncionarioID`,
 1 AS `FuncionarioNome`,
 1 AS `ClienteID`,
 1 AS `ReferenciaVenda`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `bilhetesvendidosparaevento`
--

/*!50001 DROP VIEW IF EXISTS `bilhetesvendidosparaevento`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bilhetesvendidosparaevento` AS select `venda`.`Bilhete_QR_Code_Venda` AS `BilheteID`,`acesso`.`Evento_ID_Acesso` AS `EventoID` from (`venda` join `acesso` on((`venda`.`Bilhete_QR_Code_Venda` = `acesso`.`Bilhete_QR_Code_Acesso`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `feedbacksdeevento`
--

/*!50001 DROP VIEW IF EXISTS `feedbacksdeevento`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `feedbacksdeevento` AS select `evento`.`ID` AS `EventoID`,`feedback`.`Observacao` AS `observacao` from (`evento` join `feedback` on((`evento`.`ID` = `feedback`.`Evento_ID_Feedback`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `bilhetescompradosporcliente`
--

/*!50001 DROP VIEW IF EXISTS `bilhetescompradosporcliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bilhetescompradosporcliente` AS select `cliente`.`ID` AS `ClienteID`,`bilhete`.`QR_Code` AS `QR_Code`,`bilhete`.`Tipo_Entrada` AS `Tipo_Entrada`,`bilhete`.`Cliente_Nome` AS `Cliente_Nome`,`bilhete`.`Preco` AS `Preco` from ((`cliente` join `venda` on((`cliente`.`ID` = `venda`.`Cliente_ID_Venda`))) join `bilhete` on((`venda`.`Bilhete_QR_Code_Venda` = `bilhete`.`QR_Code`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vendasporfuncionario`
--

/*!50001 DROP VIEW IF EXISTS `vendasporfuncionario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vendasporfuncionario` AS select `funcionario`.`ID` AS `FuncionarioID`,`funcionario`.`Nome` AS `FuncionarioNome`,`venda`.`Cliente_ID_Venda` AS `ClienteID`,`venda`.`Fatura_Referencia_Venda` AS `ReferenciaVenda` from (`funcionario` join `venda` on((`funcionario`.`ID` = `venda`.`Funcionario_ID_Venda`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'gestao_eventos'
--

--
-- Dumping routines for database 'gestao_eventos'
--
/*!50003 DROP FUNCTION IF EXISTS `GanhosBrutosEvento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GanhosBrutosEvento`(eventoID INT) RETURNS decimal(10,2)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE GanhosF DECIMAL(10, 2);
    DECLARE GanhosP DECIMAL(10, 2);
    DECLARE dataRealizacao DATE;

    -- Obter a data de realização do evento
    SELECT Data_Realizacao INTO dataRealizacao
    FROM Evento
    WHERE ID = eventoID;

    -- Verificar se o evento já aconteceu
    IF dataRealizacao > CURDATE() THEN
        -- o evento ainda não ocorreu
        RETURN 0;
    ELSE
        -- Calcular os ganhos brutos para o evento
		SELECT 
            COALESCE(SUM(B.Preco), 0) INTO GanhosF 
            -- COALESCE para retornar 0 caso a soma seja nula
        FROM 
            Bilhete B
        JOIN 
            Venda V ON B.QR_Code = V.Bilhete_QR_Code_Venda
        JOIN 
            Acesso A ON B.QR_Code = A.Bilhete_QR_Code_Acesso
        WHERE 
            A.Evento_ID_Acesso = eventoID;

        SELECT 
            COALESCE(SUM(P.Montante), 0) INTO GanhosP
            -- COALESCE para retornar 0 caso a soma seja nula
        FROM 
            Patrocina P
        WHERE 
            P.Evento_ID_patrocina = eventoID;
    END IF;
    RETURN GanhosF + GanhosP;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `LotacaoOcupadaAntesEvento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `LotacaoOcupadaAntesEvento`(eventoID INT) RETURNS decimal(5,2)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE capacidadeMaxima INT;
    DECLARE lotacaoOcupada INT;
    DECLARE percentagemOcupada DECIMAL(5, 2);

    -- capacidade máxima do evento
    SELECT Lotacao_Max INTO capacidadeMaxima
    FROM Evento
    WHERE ID = eventoID;

    -- lotação ocupada para o evento
    SELECT COUNT(*) INTO lotacaoOcupada
    FROM Bilhete B
    JOIN Venda V ON B.QR_Code = V.Bilhete_QR_Code_Venda
    JOIN Acesso A ON B.QR_Code = A.Bilhete_QR_Code_Acesso
    WHERE A.Evento_ID_Acesso = eventoID;

    -- lotação ocupada em percentagem
	SET percentagemOcupada = (lotacaoOcupada / capacidadeMaxima) * 100;
    
    RETURN percentagemOcupada;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ClienteQueComprouMaisBilhetes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ClienteQueComprouMaisBilhetes`()
BEGIN
    SELECT
        C.ID AS Cliente_ID,
        C.Nome AS NomeCliente,
        SUM(F.Nr_Bilhetes) AS BilhetesComprados
    FROM
        Cliente C
    JOIN
        Venda V ON C.ID = V.Cliente_ID_Venda
    JOIN
        Fatura F ON V.Fatura_Referencia_Venda = F.Referencia
    GROUP BY
        Cliente_ID
    ORDER BY
        BilhetesComprados DESC
    LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ClienteQueMaisGastou` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ClienteQueMaisGastou`()
BEGIN
    SELECT
        C.ID AS Cliente_ID,
        C.Nome AS NomeCliente,
        SUM(F.Valor) AS TotalGasto
    FROM
        Cliente C
    JOIN
        Venda V ON C.ID = V.Cliente_ID_Venda
    JOIN
        Fatura F ON V.Fatura_Referencia_Venda = F.Referencia
    GROUP BY
        Cliente_ID
    ORDER BY
        TotalGasto DESC
    LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CriarBilhetesParaEvento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarBilhetesParaEvento`(IN EventoID INT, IN PrecoBilhete INT, IN K INT)
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE CapacidadeAtual INT;
    DECLARE CapacidadeMaxima INT;
    DECLARE DataRealizacaoEvento DATE;
    DECLARE novoQRCode INT;

    START TRANSACTION;

    -- Obter a capacidade máxima do evento e a data de realização
    SELECT Lotacao_Max, Data_Realizacao INTO CapacidadeMaxima, DataRealizacaoEvento
    FROM Evento
    WHERE ID = EventoID;

    -- Lotação atual
    SELECT COUNT(*) INTO CapacidadeAtual
    FROM Acesso
    WHERE Evento_ID_Acesso = EventoID;

    -- Verifica se o evento ainda não se realizou
    IF DataRealizacaoEvento > CURDATE() THEN
        -- Verificar se há capacidade para criar mais bilhetes
        IF (CapacidadeAtual + K) <= CapacidadeMaxima THEN
            -- Cria K bilhetes para o evento
            WHILE i <= K DO
                INSERT INTO Bilhete (QR_Code, Tipo_Entrada, Preco)
                VALUES (DEFAULT, 'Normal', PrecoBilhete);

                -- Inserir na tabela de acessos
                SET novoQRCode = LAST_INSERT_ID();
                INSERT INTO Acesso (Bilhete_QR_Code_Acesso, Evento_ID_Acesso)
                VALUES (novoQRCode, EventoID);

                SET i = i + 1;
            END WHILE;

            SELECT 'Bilhetes criados com sucesso!' AS Resultado;

        ELSE
            -- Caso não haja capacidade suficiente
            ROLLBACK;
            SELECT 'Esse número de Bilhetes já ultrapassa a lotação máxima do evento' AS Resultado;
        END IF;

    ELSE
        -- Caso o evento já tenha ocorrido
        ROLLBACK;
        SELECT 'O Evento selecionado já aconteceu!' AS Resultado;
    END IF;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CriarClienteComTelemovel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarClienteComTelemovel`(
    IN DataNascimentoCliente DATE,
    IN NomeCliente VARCHAR(75),
    IN EmailCliente VARCHAR(75),
    IN NrCCCliente CHAR(8),
    IN RuaCliente VARCHAR(50),
    IN CodigoPostalCliente CHAR(8),
    IN NrPortaCliente INT,
    IN TelemovelNr INT
)
BEGIN
    DECLARE novoClienteID INT;

    -- Criar o novo cliente
    INSERT INTO Cliente (ID, Data_De_Nascimento, Nome, Email, Nr_CC, Rua, Codigo_Postal, Nr_da_Porta)
    VALUES (DEFAULT, DataNascimentoCliente, NomeCliente, EmailCliente, NrCCCliente, RuaCliente, CodigoPostalCliente, NrPortaCliente);

    -- Inserir o numero na tabela telemovel
    SET novoClienteID = LAST_INSERT_ID();
    INSERT INTO Telemovel (Telemovel_Pk, Cliente_id)
    VALUES (TelemovelNr, novoClienteID);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CriarFuncionarioEConhecimento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarFuncionarioEConhecimento`(
    IN NomeFuncionario VARCHAR(75),
    IN PasswordFuncionario VARCHAR(30),
    IN UsernameFuncionario VARCHAR(30),
    IN EstatutoFuncionario VARCHAR(50)
)
BEGIN
	DECLARE novoFuncionarioID INT;
    
    INSERT INTO Funcionario (ID, Nome, Password, Username, Estatuto)
    VALUES (DEFAULT, NomeFuncionario, PasswordFuncionario, UsernameFuncionario, EstatutoFuncionario);

    -- ID atribuido ao funcionario
    SET novoFuncionarioID = LAST_INSERT_ID();

    -- Garantir que o funcionário conhece todos os eventos
    INSERT INTO Conhece(Funcionario_ID_Conhece, Evento_ID_Conhece)
    SELECT novoFuncionarioID, ID
    FROM Evento;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CriarNovoBilheteEAccessos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CriarNovoBilheteEAccessos`(
	IN EventoID INT,
    IN EventoDataRealizacao DATE,
    IN EventoLotacaoMax INT,
    IN EventoTipo VARCHAR(30),
    IN EventoHoraInicio TIME,
    IN EventoHoraFim TIME,
    IN EventoConvidadosEspeciais VARCHAR(500),
    IN PrecoAcesso DOUBLE
)
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE novoQRCode INT;
    
    -- Criar Novo Evento
    INSERT INTO Evento (ID, Data_Realizacao, Lotacao_Max, Tipo, Hora_Inicio, Hora_Fim, Convidados_Especiais)
    VALUES (
		EventoID,
        EventoDataRealizacao,
        EventoLotacaoMax,
        EventoTipo,
        EventoHoraInicio,
        EventoHoraFim,
        EventoConvidadosEspeciais
    );
    -- Criar 10 bilhetes que dão acesso ao mesmo evento
    WHILE i <= 10 DO
        INSERT INTO Bilhete (QR_Code, Tipo_Entrada, Preco)
        VALUES (DEFAULT, 'Normal', PrecoAcesso);
        -- infelizmente não definimos o QR_Code com autoincremente e não podemos usar o atributo
        -- default, desta forma decidimos fazer um mini arranjo, mas que não é o 100% correto...
		-- VALUES (EventoID * 1000 + i, 'Normal', PrecoAcesso);
		
        -- Inserir na tabela de acessos
        SET novoQRCode = LAST_INSERT_ID();
        INSERT INTO Acesso (Bilhete_QR_Code_Acesso, Evento_ID_Acesso)
        VALUES (novoQRCode, EventoID);
        
        SET i = i + 1;
    END WHILE;
		
	-- Garante que todos os funcionários continuam a conhecer o novo evento
    INSERT INTO Conhece (Funcionario_ID_Conhece, Evento_ID_Conhece)
    SELECT ID, EventoID
    FROM Funcionario;
    
    SELECT 'Novo Evento criado com sucesso!' AS Resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeixarFeedback` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeixarFeedback`(IN ClienteID INT, IN EventoID INT,IN Observacao VARCHAR(500))
BEGIN
    DECLARE HaBilhete INT;
    DECLARE DataEvento DATE;

    -- Inicio da transação
    START TRANSACTION;

    -- Data do Evento em questão
    SELECT Data_Realizacao INTO DataEvento
    FROM Evento
    WHERE ID = EventoID;

	IF DataEvento < CURDATE() THEN
		-- Verificar se o cliente comprou um bilhete que dá acesso ao evento
		SELECT COUNT(*) INTO HaBilhete
		FROM Venda v
		INNER JOIN Acesso a ON v.Bilhete_QR_Code_Venda = a.Bilhete_QR_Code_Acesso
		WHERE v.Cliente_ID_Venda = ClienteID
		  AND a.Evento_ID_Acesso = EventoID;
	
		IF HaBilhete > 0 THEN
			BEGIN
			-- Inserir feedback na tabela
			INSERT INTO Feedback (Cliente_ID_Feedback, Evento_ID_Feedback, Observacao)
			VALUES (ClienteID, EventoID, Observacao);
		END;
        ELSE
            -- Se o cliente não tiver um bilhete válido, realizar rollback
            ROLLBACK;
            SELECT 'O cliente não possui um bilhete válido para este evento.' AS Resultado;
        END IF;
    ELSE
        -- Se a data do evento não passou, realizar rollback
        ROLLBACK;
        SELECT 'Não é possível deixar feedback porque o evento que ainda não ocorreu.' AS Resultado;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `FuncionariosMaisVendedores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `FuncionariosMaisVendedores`(IN dataInicio DATE, IN dataFim DATE)
BEGIN
    SELECT
        V.Funcionario_ID_Venda AS Funcionario_ID,
        Fu.Nome AS NomeFuncionario,
        COUNT(*) AS NumeroVendas
    FROM
        Venda V
    JOIN
        Funcionario Fu ON V.Funcionario_ID_Venda = Fu.ID
    JOIN
        Fatura FT ON V.Fatura_Referencia_Venda = FT.Referencia
    WHERE
        FT.Data_Compra BETWEEN dataInicio AND dataFim
    GROUP BY
        Funcionario_ID
    ORDER BY
        NumeroVendas DESC
    -- LIMIT CEIL(0.2 * (SELECT COUNT(DISTINCT Funcionario_ID) FROM Funcionario));
    LIMIT 3; -- Não está a ser possivel usar floats para o limit nem funções de arredondamento 
-- Não incluimos a condição de estatuto = vendedor pois todos podem realizar vendas 
-- e por norma os vendedores terão mais vendas que os demais
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `FuncionariosMenosVendedores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `FuncionariosMenosVendedores`(IN dataInicio DATE, IN dataFim DATE)
BEGIN
    SELECT
        F.ID AS Funcionario_ID,
        F.Nome AS NomeFuncionario,
        COUNT(V.Funcionario_ID_Venda) AS NumeroVendas
    FROM
        Funcionario F
    LEFT JOIN -- left join para incluir todos os funcionarios, mesmo que eles não tenham vendas
        Venda V ON F.ID = V.Funcionario_ID_Venda
    LEFT JOIN
        Fatura FT ON V.Fatura_Referencia_Venda = FT.Referencia AND FT.Data_Compra BETWEEN dataInicio AND dataFim
    WHERE
        F.Estatuto = 'vendedor' -- Garantimos que o seu estatuto é de vendedor, embora todos possam realizar vendas
    GROUP BY
        Funcionario_ID
    ORDER BY
        NumeroVendas ASC
    -- LIMIT CEIL(0.1 * (SELECT COUNT(DISTINCT Funcionario_ID) FROM Funcionario));
    LIMIT 3; -- Não está a ser possivel usar floats para o limit nem funções de arredondamento 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListaBilhetesVendidosParaEvento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ListaBilhetesVendidosParaEvento`(IN eventoID INT)
BEGIN
    SELECT
        B.QR_Code,
        B.Tipo_Entrada,
        B.Cliente_Nome,
        B.Preco
    FROM
        Bilhete B
    JOIN
        Venda V ON B.QR_Code = V.Bilhete_QR_Code_Venda
    JOIN
        Acesso A ON B.QR_Code = A.Bilhete_QR_Code_Acesso
    WHERE
        A.Evento_ID_Acesso = eventoID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObterFaturasPorData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObterFaturasPorData`(IN dataInicio DATE, IN dataFim DATE)
BEGIN
    SELECT
        Referencia,
        Valor,
        Nr_Bilhetes,
        Data_Compra,
        Funcionario_Nome
    FROM
        Fatura
    WHERE
        Data_Compra BETWEEN dataInicio AND dataFim;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObterHistoricoCompras` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObterHistoricoCompras`(IN idCliente INT)
BEGIN
    SELECT
        V.Funcionario_ID_Venda AS Funcionario_ID,
        V.Fatura_Referencia_Venda AS Fatura_Referencia,
        V.Bilhete_QR_Code_Venda AS Bilhete_QRCode,
        F.Valor,
        F.Data_Compra
    FROM
        Venda V
    JOIN
        Fatura F ON V.Fatura_Referencia_Venda = F.Referencia
    WHERE
        V.Cliente_ID_Venda = idCliente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PatrocinadoresMaisContribuidores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PatrocinadoresMaisContribuidores`()
BEGIN
    SELECT
        P.Patrocinador_Nome_Patrocina AS Patrocinador_Nome,
        SUM(P.Montante) AS TotalContribuido
    FROM
        Patrocina P
    GROUP BY
        Patrocinador_Nome
    ORDER BY
        TotalContribuido DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PatrocinadoresMaisFrequentes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PatrocinadoresMaisFrequentes`()
BEGIN
    SELECT
        P.Patrocinador_Nome_Patrocina AS Patrocinador_Nome,
        COUNT(*) AS TotalContribuicoes
    FROM
        Patrocina P
    GROUP BY
        Patrocinador_Nome
    ORDER BY
        TotalContribuicoes DESC, Patrocinador_Nome ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RealizarVenda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RealizarVenda`(IN FuncionarioID INT, IN ClienteID INT, IN BilheteQRCode INT)
BEGIN
    DECLARE ValorBilhete DECIMAL(5,2);
    DECLARE NrBilhetesVendidos INT;
    DECLARE DataCompra DATE;
    DECLARE FuncionarioNome VARCHAR(75);
    DECLARE NomeClienteAssociado VARCHAR(75);

    -- Inicia a transação
    START TRANSACTION;

    -- Obter o nome do cliente associado ao bilhete
    SELECT Cliente_Nome INTO NomeClienteAssociado
    FROM Bilhete
    WHERE QR_Code = BilheteQRCode;

    -- Verificar se o bilhete escolhido possui NULL como "nome_comprador"
    IF NomeClienteAssociado IS NULL THEN
        -- Preço do bilhete
        SELECT Preco INTO ValorBilhete
        FROM Bilhete
        WHERE QR_Code = BilheteQRCode;

        -- Nome do funcionário
        SELECT Nome INTO FuncionarioNome
        FROM Funcionario
        WHERE ID = FuncionarioID;

        -- Data da compra é o dia atual
        SET DataCompra = CURDATE();

        -- Criar Fatura
        INSERT INTO Fatura (Referencia, Valor, Nr_Bilhetes, Data_Compra, Funcionario_Nome)
        VALUES (BilheteQRCode + 5555, ValorBilhete, 1, DataCompra, FuncionarioNome);
        -- Valor da Fatura deveria de ser ValorBilhete * Nr_Bilhetes mas como se trata
        -- de um procedimento que efetua a venda de apenas um bilhete, considerando o IVA
        -- incluido no preço do bilhete, apenas se tem que colocar Valor = ValorBilhete
		
        -- Criar Venda
        INSERT INTO Venda (Funcionario_ID_Venda, Cliente_ID_Venda, Fatura_Referencia_Venda, Bilhete_QR_Code_Venda)
        VALUES (FuncionarioID, ClienteID, BilheteQRCode + 5555, BilheteQRCode);

        -- Atualizar nome do cliente na tabela Bilhete
        UPDATE Bilhete
        SET Cliente_Nome = (SELECT Nome FROM Cliente WHERE ID = ClienteID)
        WHERE QR_Code = BilheteQRCode;

        -- Confirmar a transação
        COMMIT;
        SELECT 'Venda realizada com sucesso.' AS Resultado;
    ELSE
        -- Se o bilhete já tem um cliente associado, realizar rollback
        ROLLBACK;
        SELECT 'O bilhete já possui um cliente associado. Não é possível realizar a venda.' AS Resultado;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registoClientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registoClientes`()
BEGIN
    SELECT c.ID, c.nome, c.email, t.Telemovel_Pk
    FROM Cliente c
    JOIN Telemovel t ON c.ID = t.Cliente_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RelatorioEventosMaisVendidos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RelatorioEventosMaisVendidos`()
BEGIN
    SELECT
        E.ID AS EventoID,
        E.Data_Realizacao,
        E.Tipo,
        COUNT(V.Bilhete_QR_Code_Venda) AS BilhetesVendidos
    FROM
        Evento E
    INNER JOIN Acesso A ON E.ID = A.Evento_ID_Acesso
    INNER JOIN Venda V ON A.Bilhete_QR_Code_Acesso = V.Bilhete_QR_Code_Venda
    GROUP BY
        E.ID
    ORDER BY
        BilhetesVendidos DESC, E.Data_Realizacao
    LIMIT 5;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RelatorioEventosMenosVendidos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RelatorioEventosMenosVendidos`()
BEGIN
    SELECT
        E.ID AS EventoID,
        E.Data_Realizacao,
        E.Tipo,
        COUNT(V.Bilhete_QR_Code_Venda) AS BilhetesVendidos
    FROM
        Evento E
    LEFT JOIN Acesso A ON E.ID = A.Evento_ID_Acesso
    LEFT JOIN Venda V ON A.Bilhete_QR_Code_Acesso = V.Bilhete_QR_Code_Venda
    GROUP BY
        E.ID
    ORDER BY
        BilhetesVendidos ASC, 
        E.Data_Realizacao 
    LIMIT 5; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-14 16:30:25
