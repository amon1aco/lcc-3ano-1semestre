-- Requesitos de Exploração

USE gestao_eventos;

-- 1
-- No fim de cada ano, o sistema deve apresentar um relatório de acessos, 
-- apresentando os eventos com mais e menos bilhetes vendidos, de modo a transparecer 
-- quais os que revelaram mais interesse ao publico
-- Mais Vendidos:
DELIMITER $$
CREATE PROCEDURE RelatorioEventosMaisVendidos()
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
END $$
DELIMITER ;

CALL RelatorioEventosMaisVendidos();
-- DROP PROCEDURE IF EXISTS RelatorioEventosMaisVendidos;

-- Menos Vendido:
DELIMITER $$
CREATE PROCEDURE RelatorioEventosMenosVendidos()
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
END $$
DELIMITER ;

CALL RelatorioEventosMenosVendidos();


-- PROCEDIMENTO 2
-- Registros de todos os clientes (ID, nome, email, telemovel)
-- Todos os clientes que tem mais de um numero de telemovel associado aparecem repetidos 
-- na tabela com diferentes numeros de telemovel
DELIMITER $$
CREATE PROCEDURE registoClientes()
BEGIN
    SELECT c.ID, c.nome, c.email, t.Telemovel_Pk
    FROM Cliente c
    JOIN Telemovel t ON c.ID = t.Cliente_ID;
END $$
DELIMITER ;

CALL registoClientes();


-- PROCEDIMENTO 3
-- O sistema deve conseguir ter acesso ao histórico de compras de um determinado cliente
DELIMITER $$
CREATE PROCEDURE ObterHistoricoCompras(IN idCliente INT)
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
END $$
DELIMITER ;

-- DROP PROCEDURE IF EXISTS ObterHistoricoCompras;

CALL ObterHistoricoCompras(3);



-- PROCEDIMENTO 4
-- faturas geradas em determinado intervalo de datas
DELIMITER $$
CREATE PROCEDURE ObterFaturasPorData(IN dataInicio DATE, IN dataFim DATE)
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
END $$
DELIMITER ;

CALL ObterFaturasPorData('2022-01-01', '2023-12-31');


-- PROCEDIMENTO 5
-- O sistema deve conseguir calcular o cliente que mais gastou, assim como o cliente 
-- que mais bilhetes comprou

-- Cliente que mais gastou
DELIMITER $$
CREATE PROCEDURE ClienteQueMaisGastou()
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
END $$
DELIMITER ;

CALL ClienteQueMaisGastou();

-- Cliente que mais bilhetes comprou
DELIMITER $$
CREATE PROCEDURE ClienteQueComprouMaisBilhetes()
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
END $$
DELIMITER ;

CALL ClienteQueComprouMaisBilhetes();


-- PROCEDIMENTO 6
-- O sistema deve conseguir determinar quais foram os 10% dos funcionários que menos 
-- venderam entre duas determinadas datas, assim como os 20% de funcionários com mais 
-- vendas, entre duas determinadas datas; 

-- 10% dos funcionarios com menos vendas entre 2 datas
DELIMITER $$
CREATE PROCEDURE FuncionariosMenosVendedores(IN dataInicio DATE, IN dataFim DATE)
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
END $$
DELIMITER ;

-- DROP PROCEDURE IF EXISTS FuncionariosMenosVendedores;

CALL FuncionariosMenosVendedores('2022-01-01', '2023-12-31');

-- os 20% de funcionários com mais vendas, entre duas determinadas datas
DELIMITER $$
CREATE PROCEDURE FuncionariosMaisVendedores(IN dataInicio DATE, IN dataFim DATE)
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
END $$
DELIMITER ;

CALL FuncionariosMaisVendedores('2022-01-01', '2023-12-31');


-- PROCEDIMENTO 7
-- O sistema deve conseguir determinar quais foram os patrocinadores que mais 
-- contribuíram monetariamente para um grupo de eventos; 

-- Não conseguimos criar o procedimento de forma a receber varios Eventos.ID desta forma 
-- decidimos criar um procedimento que mostra os patrocinadores que mais contribuiram 
-- para todos os eventos
DELIMITER $$
CREATE PROCEDURE PatrocinadoresMaisContribuidores()
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
END $$
DELIMITER ;

-- DROP PROCEDURE IF EXISTS PatrocinadoresMaisContribuidoresGlobal;

CALL PatrocinadoresMaisContribuidores();

-- PROCEDIMENTO 8
-- O sistema deve conseguir determinar quais foram os patrocinadores que mais vezes 
-- contribuíram para todos os eventos 
DELIMITER $$
CREATE PROCEDURE PatrocinadoresMaisFrequentes()
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
END $$
DELIMITER ;

-- DROP PROCEDURE IF EXISTS PatrocinadoresMaisFrequentes;

CALL PatrocinadoresMaisFrequentes();


-- PROCEDIMENTO 9
-- Deve ser possível também obter uma lista com todos os bilhetes vendidos 
-- para um determinado evento
DELIMITER $$
CREATE PROCEDURE ListaBilhetesVendidosParaEvento(IN eventoID INT)
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
END $$
DELIMITER ;

-- DROP PROCEDURE IF EXISTS ListaBilhetesVendidosParaEvento;

CALL ListaBilhetesVendidosParaEvento(5);


-- PROCEDIMENTO 10
-- A cada momento antes da realização de um evento o sistema deve ser capaz de imprimir 
-- a lotação ocupada sob a forma de percentagem; 

-- Decidimos criar como função visto que retorna um valor
DELIMITER $$
CREATE FUNCTION LotacaoOcupadaAntesEvento(eventoID INT) 
RETURNS DECIMAL(5, 2) DETERMINISTIC READS SQL DATA
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
END $$
DELIMITER ;

-- DROP FUNCTION IF EXISTS LotacaoOcupadaAntesEvento;

SELECT LotacaoOcupadaAntesEvento(1) AS Percentagem_Ocupada;


-- PROCEDIMENTO 11 
-- Após a realização de um dado evento deverá ser possível obter os ganhos brutos do mesmo

-- decidimos criar também em função de forma a retornar o valor dos ganhos brutos
DELIMITER $$
CREATE FUNCTION GanhosBrutosEvento(eventoID INT) 
RETURNS DECIMAL(10, 2) DETERMINISTIC READS SQL DATA
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
END $$
DELIMITER ;

-- DROP FUNCTION IF EXISTS GanhosBrutosEvento;

SELECT GanhosBrutosEvento(6); 
-- Certo we guess.
