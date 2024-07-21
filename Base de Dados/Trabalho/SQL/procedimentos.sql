-- Algumas funções / procedimentos necessários

-- Venda de um único bilhete
-- Dado um funcionário, cliente e bilhete -> cria uma venda e gera uma fatura
-- Transação garante que o bilhete comprado ainda não foi comprado, ou seja
-- se possui o "nome_comprador" == NULL
-- Não garante que o evento não tenha ocorrido!
DELIMITER $$
CREATE PROCEDURE RealizarVenda(IN FuncionarioID INT, IN ClienteID INT, IN BilheteQRCode INT)
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
END $$

DELIMITER ;

select * from fatura;
select * from venda;
select * from cliente;
select * from bilhete;

CALL RealizarVenda(9, 41, 1019);

-- Rollback
CALL RealizarVenda(9, 42, 1019);


-- -------------------------
-- Deixar feedback
-- Procedimento com transição de forma a garantir que o cliente frequentou o evento
-- e que o mesmo já aconteceu
DELIMITER $$
CREATE PROCEDURE DeixarFeedback(IN ClienteID INT, IN EventoID INT,IN Observacao VARCHAR(500))
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
END $$
DELIMITER ;

select * from evento;
select * from venda;
select * from acesso;
select * from bilhete;

CALL DeixarFeedback(41, 4,'Gostei Bastante');

-- Rollbacks
CALL DeixarFeedback(41, 6,'Gostei Bastante');
CALL DeixarFeedback(41, 1,'Gostei Bastante');

select * from feedback;


-- -------------------------
-- Procedimento que cria um novo evento e juntamente com isso cria mais 10 bilhetes que
-- dão acesso ao mesmo
-- Para facilitar o código assumimos que é dado o ID do Evento como parametro
DELIMITER $$
CREATE PROCEDURE CriarNovoBilheteEAccessos(
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
END $$
DELIMITER ;

select * from bilhete;
select * from evento;
select * from acesso;

CALL CriarNovoBilheteEAccessos(
	7, 				-- EventoID	
    '2024-10-20', 	-- EventoDataRealizacao (exemplo de data)
    200,            -- EventoLotacaoMax
    'Concerto',     -- EventoTipo
    '21:30:00',     -- EventoHoraInicio
    NULL,     		-- EventoHoraFim
    'T-Rex, Zola', 	-- EventoConvidadosEspeciais
    15          	-- PrecoAcesso
);

-- DROP PROCEDURE IF EXISTS CriarNovoBilheteEAccessos;


-- -----------------
-- Procedimento que cria K bilhetes
-- Criado como transação de forma a evitar que sejam criados mais bilhetes que capacidade do evento
DELIMITER $$
CREATE PROCEDURE CriarBilhetesParaEvento(IN EventoID INT, IN PrecoBilhete INT, IN K INT)
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
END $$

DELIMITER ;

select * from bilhete;
select * from acesso;
select * from evento;

CALL CriarBilhetesParaEvento(3, 10, 2);

-- Rollbacks
CALL CriarBilhetesParaEvento(5, 11, 2);
CALL CriarBilhetesParaEvento(3, 10, 100000000);

-- DROP PROCEDURE IF EXISTS CriarBilhetesParaEvento;


-- ---------------------------------
-- Procedimento que cria um novo funcionário mas garante que este passa a conhecer todos
-- os eventos existentes

desc Funcionario;

DELIMITER $$
CREATE PROCEDURE CriarFuncionarioEConhecimento(
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
END $$
DELIMITER ;

select * from funcionario;

CALL CriarFuncionarioEConhecimento('Mona Lisa Paulo', 'monasemlisa', 'Mona Paulo', 'Vendedor');

select * from conhece;


-- ----------------------
-- Procedimento que cria um novo cliente, garantido que é adicionado também o seu numero de 
-- telemovel
-- Caso o cliente queira associar mais que um nr, isso resolve-se facilmente com um insert
-- na tabela telemovel, portanto não consideramos o caso

desc cliente;
desc telemovel;

DELIMITER $$
CREATE PROCEDURE CriarClienteComTelemovel(
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

END $$
DELIMITER ;

CALL CriarClienteComTelemovel('1990-01-01', 'Jony Macarrony', 'jonasmacarrones@gmail.com', '34895744', 'Rua do Caires Brazil', '1235-678', 7, 935337883);

select * from cliente;

select * from telemovel;

