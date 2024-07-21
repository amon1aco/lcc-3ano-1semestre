-- Criar utilizador e atribuir permissões
CREATE USER 'Armando Loia'@'localhost' IDENTIFIED BY 'ArmandoSenhor';
CREATE USER 'Florbela Loia'@'localhost' IDENTIFIED BY 'SenhoraFlorbela';
CREATE USER 'Eduardo Cunha'@'localhost' IDENTIFIED BY 'Edu1212';
CREATE USER 'Goncalo Magalhaes'@'localhost' IDENTIFIED BY 'Gonças4532';
CREATE USER 'Miguel Rego'@'localhost' IDENTIFIED BY 'MR22';
CREATE USER 'Fabio Ribeiro'@'localhost' IDENTIFIED BY 'fabrr';
CREATE USER 'Januario Fevereiro'@'localhost' IDENTIFIED BY 'Março';

-- Criar um cargo de Administradores 
CREATE ROLE Administradores;

-- Criar o cargo de Funcionário 
CREATE ROLE Funcionario;

-- Conceder todas as permissões aos utilizadores com cargo de Administradores
GRANT ALL PRIVILEGES ON gestao_eventos.* TO Administradores;

-- Conceder privilégios necessários aos utilizadores
GRANT SELECT, INSERT, UPDATE, DELETE ON gestao_eventos.* TO 'Armando Loia'@'localhost', 'Florbela Loia'@'localhost';

-- Conceder permissões específicas para o cargo de Funcionário
GRANT EXECUTE ON PROCEDURE gestao_eventos.RealizarVenda TO Funcionario;

-- Atribuiçao de utilizadores ao cargo ADMIN
GRANT Administradores TO 'Eduardo Cunha'@'localhost', 'Goncalo Magalhaes'@'localhost',
'Miguel Rego'@'localhost', 'Fabio Ribeiro'@'localhost';

-- Atribuição de utilizadores ao cargo Funcionário
GRANT Funcionario TO 'Januario Fevereiro'@'localhost';

-- ---------------
SELECT user FROM mysql.user;