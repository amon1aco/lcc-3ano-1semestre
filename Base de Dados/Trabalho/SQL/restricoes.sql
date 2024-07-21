USE gestao_eventos;

-- Restrições e alterações das tabelas

-- De forma a garantir que os numeros de telemovel tenham exatamente 9 digitos
ALTER TABLE Telemovel
ADD CONSTRAINT chk_numero_telefone_length CHECK (LENGTH(Telemovel) = 9);


-- Garantir que os valores são unsigned, pois são sempre positivos e são representados da seguinte forma: xxxxx,xx
ALTER TABLE Bilhete
MODIFY COLUMN Preco DECIMAL(5,2) NOT NULL; -- Unsigned dá warning em valores decimais

-- Para a tabela Fatura
ALTER TABLE Fatura
MODIFY COLUMN Valor DECIMAL(7,2) NOT NULL,
MODIFY COLUMN Nr_Bilhetes INT UNSIGNED NOT NULL;
-- MODIFY COLUMN Referencia INT UNSIGNED; -- Seria necessário alterar a chave estrangeira noutras tabelas

-- Para a tabela Patrocina
ALTER TABLE Patrocina
MODIFY COLUMN Montante DECIMAL(10,2) NOT NULL;

-- Para a tabela Cliente
ALTER TABLE Cliente
MODIFY COLUMN Nr_Da_Porta INT UNSIGNED NOT NULL;

-- Para a tabela Evento
ALTER TABLE Evento
MODIFY COLUMN Lotacao_Max INT UNSIGNED NOT NULL;

-- De forma a garantir que os valores decimais também serão sempre positivos:
ALTER TABLE Bilhete
MODIFY COLUMN Preco DECIMAL(5,2) NOT NULL CHECK (Preco >= 0);

ALTER TABLE Fatura
MODIFY COLUMN Valor DECIMAL(7,2) NOT NULL CHECK (Valor >= 0);

ALTER TABLE Patrocina
MODIFY COLUMN Montante DECIMAL(10,2) NOT NULL CHECK (Montante >= 0);

-- Garantir que o estatuto de um vendedor é: 'Vendedor', 'Marketing', 'Chefe', 'Administrador'
ALTER TABLE Funcionario
ADD CONSTRAINT chk_Estatuto CHECK (Estatuto IN ('Vendedor', 'Marketing', 'Chefe', 'Administrador'));

--  Garante que o tipo da tabela Patrocinador é: Empresa ou Particular
ALTER TABLE Patrocinador
ADD CONSTRAINT chk_tipo CHECK (tipo IN ('Empresa', 'Particular'));

-- Supondo que você deseja remover a chave estrangeira da tabela Cliente
ALTER TABLE Cliente
DROP FOREIGN KEY FK_Cliente_Telemovel;

-- Remover a coluna Telemovel da tabela Cliente
ALTER TABLE Cliente
DROP COLUMN Telemovel;

desc cliente;

ALTER TABLE Telemovel
DROP COLUMN Telemovel,
ADD COLUMN cliente_id INT NOT NULL,
ADD CONSTRAINT fk_telemovel_cliente
FOREIGN KEY (cliente_id) REFERENCES Cliente(ID);

ALTER TABLE Telemovel
ADD CONSTRAINT chk_numero_telefone_length CHECK (LENGTH(Telemovel_Pk) = 9);

desc telemovel;

-- Garantir que tipo de entrada em Bilhete é: Normal, VIP, Grupo
ALTER TABLE Bilhete
MODIFY COLUMN Tipo_Entrada VARCHAR(20) CHECK (Tipo_Entrada IN ('Normal', 'VIP', 'Grupo'));

-- Remoção da data_evento da tabela bilhete:
ALTER TABLE Bilhete
DROP COLUMN Data_Evento;

desc bilhete;
-- Fim das restrições
