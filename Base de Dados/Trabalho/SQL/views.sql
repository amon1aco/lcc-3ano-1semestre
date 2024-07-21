
use gestao_eventos;

-- Bilhetes comprados por um cliente
CREATE OR REPLACE VIEW BilhetesCompradosPorCliente AS
SELECT Cliente.ID AS ClienteID, Bilhete.*
FROM Cliente
JOIN Venda ON Cliente.ID = Venda.Cliente_ID_Venda
JOIN Bilhete ON Venda.Bilhete_QR_Code_Venda = Bilhete.QR_Code;

select * from BilhetesCompradosPorCliente;


-- Bilhetes vendidos para um evento
CREATE OR REPLACE VIEW BilhetesVendidosParaEvento AS
SELECT
    Venda.Bilhete_QR_Code_Venda AS BilheteID,
    Acesso.Evento_ID_Acesso AS EventoID
FROM
    Venda
JOIN
    Acesso ON Venda.Bilhete_QR_Code_Venda = Acesso.Bilhete_QR_Code_Acesso;
    
select * from BilhetesVendidosParaEvento;


-- Vista sobre as vendas feitas por os funcionários
CREATE OR REPLACE VIEW VendasPorFuncionario AS
SELECT Funcionario.ID AS FuncionarioID,
	   Funcionario.Nome AS FuncionarioNome,
       Venda.Cliente_ID_Venda AS ClienteID,
       Venda.Fatura_Referencia_Venda AS ReferenciaVenda
FROM Funcionario
JOIN Venda ON Funcionario.ID = Venda.Funcionario_ID_Venda;

select * from VendasPorFuncionario;


-- Vista sobre os feedbacks de um determinado eventos
CREATE OR REPLACE VIEW FeedbacksDeEvento AS
SELECT Evento.ID AS EventoID, Feedback.observacao
FROM Evento
JOIN Feedback ON Evento.ID = Feedback.Evento_ID_Feedback;

select * from FeedbacksDeEvento; 

