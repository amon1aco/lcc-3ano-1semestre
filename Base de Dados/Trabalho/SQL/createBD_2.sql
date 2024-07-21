-- ESTE COMMANDO REMOVE A BASE DE DADOS (PARA TESTAR O POPULATOR)
 DROP DATABASE IF EXISTS gestao_eventos;
 
-- Criar base de dados
CREATE DATABASE IF NOT EXISTS gestao_eventos;

-- Selecionar a base de dados
USE gestao_eventos;

-- Criar Tabela Funcionario
CREATE TABLE IF NOT EXISTS `Funcionario` (
  `ID` INT NOT NULL AUTO_INCREMENT, -- Auto increment para não ser necessário especificar quando inserir novo funcionario
  `Nome` VARCHAR(75) NOT NULL,
  `Password` VARCHAR(30) NOT NULL,
  `Username` VARCHAR(30) NOT NULL,
  `Estatuto` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE = InnoDB;

-- Criar Tabela Fatura
CREATE TABLE IF NOT EXISTS `Fatura` (
  `Referencia` INT NOT NULL,
  `Valor` DOUBLE NOT NULL,
  `Nr_Bilhetes` INT NOT NULL,
  `Data_Compra` DATE NOT NULL,
  `Funcionario_Nome` VARCHAR(75) NOT NULL,
  PRIMARY KEY (`Referencia`)
) ENGINE = InnoDB;

-- Criar Tabela Bilhete
CREATE TABLE IF NOT EXISTS `Bilhete` (
  `QR_Code` INT NOT NULL AUTO_INCREMENT,
  `Tipo_Entrada` VARCHAR(20) NOT NULL,
  `Cliente_Nome` VARCHAR(75),
  `Data_Evento` DATE NOT NULL,
  `Preco` DOUBLE NOT NULL,
  PRIMARY KEY (`QR_Code`)
) ENGINE = InnoDB;

-- Criar Tabela Evento
CREATE TABLE IF NOT EXISTS `Evento` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Data_Realizacao` DATE NOT NULL,
  `Lotacao_Max` INT NOT NULL,
  `Tipo` VARCHAR(30) NOT NULL,
  `Hora_Inicio` TIME NOT NULL,
  `Hora_Fim` TIME,
  `Convidados_Especiais` VARCHAR(500),
  PRIMARY KEY (`ID`)
) ENGINE = InnoDB;

-- Criar Tabela Patrocinador
CREATE TABLE IF NOT EXISTS `Patrocinador` (
  `Nome` VARCHAR(45) NOT NULL,
  `Tipo` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`Nome`)
) ENGINE = InnoDB;

-- Criar Tabela Telemovel
CREATE TABLE IF NOT EXISTS `Telemovel` (
  `Telemovel_Pk` INT NOT NULL,
  `Telemovel` INT NOT NULL,
  PRIMARY KEY (`Telemovel_Pk`)
) ENGINE = InnoDB;

-- Criar Tabela Cliente
CREATE TABLE IF NOT EXISTS `Cliente` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Data_De_Nascimento` DATE NOT NULL,
  `Nome` VARCHAR(75) NOT NULL,
  `Email` VARCHAR(75) NOT NULL,
  `Nr_CC` CHAR(8),
  `Telemovel` INT NOT NULL,
  `Rua` VARCHAR(50) NOT NULL,
  `Codigo_Postal` CHAR(8) NOT NULL,
  `Nr_da_Porta` INT NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_Cliente_Telemovel`
    FOREIGN KEY (`Telemovel`)
    REFERENCES `Telemovel` (`Telemovel_Pk`)
    ON DELETE CASCADE
) ENGINE = InnoDB;

-- Criar Tabela Conhece
CREATE TABLE IF NOT EXISTS `Conhece` (
  `Funcionario_ID_Conhece` INT NOT NULL,
  `Evento_ID_Conhece` INT NOT NULL,
  CONSTRAINT `funcionario_ID`
    FOREIGN KEY (`Funcionario_ID_Conhece`)
    REFERENCES `Funcionario` (`ID`),
  CONSTRAINT `Evento_ID`
    FOREIGN KEY (`Evento_ID_Conhece`)
    REFERENCES `Evento` (`ID`)
) ENGINE = InnoDB;

-- Criar Tabela Venda
CREATE TABLE IF NOT EXISTS `Venda` (
  `Funcionario_ID_Venda` INT NOT NULL,
  `Cliente_ID_Venda` INT NOT NULL,
  `Fatura_Referencia_Venda` INT NOT NULL,
  `Bilhete_QR_Code_Venda` INT NOT NULL,
  CONSTRAINT `Funcionario_ID_Venda`
    FOREIGN KEY (`Funcionario_ID_Venda`)
    REFERENCES `Funcionario` (`ID`),
  CONSTRAINT `Cliente_ID_Venda`
    FOREIGN KEY (`Cliente_ID_Venda`)
    REFERENCES `Cliente` (`ID`),
  CONSTRAINT `Referencia_Fatura_Venda`
    FOREIGN KEY (`Fatura_Referencia_Venda`)
    REFERENCES `Fatura` (`Referencia`),
  CONSTRAINT `Referencia_Bilhete_Venda`
    FOREIGN KEY (`Bilhete_QR_Code_Venda`)
    REFERENCES `Bilhete` (`QR_Code`)
) ENGINE = InnoDB;

-- Criar Tabela Feedback
CREATE TABLE IF NOT EXISTS `Feedback` (
  `Cliente_ID_Feedback` INT NOT NULL,
  `Evento_ID_Feedback` INT NOT NULL,
  `Observacao` VARCHAR(500),
  CONSTRAINT `Cliente_ID_Evento`
    FOREIGN KEY (`Cliente_ID_Feedback`)
    REFERENCES `Cliente` (`ID`),
  CONSTRAINT `Evento_ID_Cliente`
    FOREIGN KEY (`Evento_ID_Feedback`)
    REFERENCES `Evento` (`ID`)
) ENGINE = InnoDB;

-- Criar Tabela Acesso
CREATE TABLE IF NOT EXISTS `Acesso` (
  `Bilhete_QR_Code_Acesso` INT NOT NULL,
  `Evento_ID_Acesso` INT NOT NULL,
  CONSTRAINT `Bilhete_QR_Code_Evento`
    FOREIGN KEY (`Bilhete_QR_Code_Acesso`)
    REFERENCES `Bilhete` (`qr_code`),
  CONSTRAINT `Evento_ID_Bilhete`
    FOREIGN KEY (`Evento_ID_Acesso`)
    REFERENCES `Evento` (`ID`)
) ENGINE = InnoDB;

-- Criar Tabela Patrocina
CREATE TABLE IF NOT EXISTS `Patrocina` (
  `Patrocinador_Nome_Patrocina` VARCHAR(45) NOT NULL,
  `Evento_ID_patrocina` INT NOT NULL,
  `Montante` DOUBLE NOT NULL,
  `Observações` VARCHAR(500),
  CONSTRAINT `Patrocinador_Nome_Evento`
    FOREIGN KEY (`Patrocinador_Nome_Patrocina`)
    REFERENCES `Patrocinador` (`Nome`),
  CONSTRAINT `Evento_ID_Patrocinador`
	FOREIGN KEY (`Evento_ID_patrocina`)
	REFERENCES `Evento` (`ID`)
) ENGINE = InnoDB;

