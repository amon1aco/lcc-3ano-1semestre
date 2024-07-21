-- Inserir elementos nas tabelas

-- Funcionários: (9 funcionários)
INSERT INTO Funcionario (ID, Nome, Username, Password, Estatuto) VALUES
  (DEFAULT, 'Eduardo Cunha', 'eduasc', '1234', 'Chefe'),
  (DEFAULT, 'Fabio Ribeiro', 'fabinho', 'semsenha', 'Marketing'),
  (DEFAULT, 'Goncalo Magalhaes', 'guga', 'senhasegura', 'Marketing'),
  (DEFAULT, 'Miguel Rego', 'miguelito', 'senhamuitosegura', 'Chefe'),
  (DEFAULT, 'Felizberto', 'happyberto', '0000', 'Vendedor'),
  (DEFAULT, 'Armando Loia', 'loiabenfica', 'benfica', 'Administrador'),
  (DEFAULT, 'Florbela Loia', 'beautyflower', 'mulherdoarmando', 'Administrador'),
  (DEFAULT, 'Januario Fevereiro', 'janu', 'januario', 'Vendedor'),
  (DEFAULT, 'Ruizinho Lampreia', 'cegonha', 'pato', 'Vendedor');

-- select * from funcionario;

-- 10 Patrocinadores
INSERT INTO Patrocinador (nome, tipo) VALUES
('José Carlos', 'Particular'),
('Maça', 'Empresa'),
('Super Bock', 'Empresa'),
('Red Bull', 'Empresa'),
('AlbertoMusical', 'Particular'),
('Farfetch', 'Empresa'),
('Meo', 'Empresa'),
('Catering da nela', 'Particular'),
('Eristoff', 'Empresa'),
('João Fidalogo', 'Particular');

-- select * from patrocinador;


-- 6 Eventos:
INSERT INTO Evento (data_realizacao, lotacao_max, tipo, hora_inicio, hora_fim, convidados_especiais) VALUES
('2024-6-22', 5000, 'Concerto', '23:00:00', NULL, 'Quim Barreiros , Marisa'),
('2024-2-20', 10000, 'Concerto', '18:00:00', '21:30:00', 'Bob Dylan, Artic Monkeys'),
('2024-1-30', 10000, 'Festival', '15:00:00', NULL, 'Kura, Steve Aoki, Central Cee, The Weeknd e muito mais...'),
('2023-12-26', 200, 'Procissão de Velas', '20:00:00', '21:30:00', NULL),
('2023-12-1', 64, 'Torneio de Sueca', '15:00:00', '21:00:00', NULL),
('2023-10-16', 200, 'Show de Comédia', '21:30:00', '23:00:00', 'Pedro Teixeira da Mota');

-- select * from evento;


-- 50 Clientes:
INSERT INTO Cliente (data_de_nascimento, nome, email, Nr_CC, rua, codigo_postal, nr_da_porta) VALUES
('1990-05-15', 'Carlos Pereira', 'carloscarlos1990@email.com', '12345678', 'Rua da Cruz', '1000-001', 12),
('1985-08-20', 'Isabel Oliveira', 'belinha208@email.com', '87654321', 'Rua das Candeias', '2000-002', 22),
('1995-02-10', 'Rui Martins', 'ruimartinez@email.com', '56781234', 'Avenida da Boavista', '3000-003', 32),
('1990-05-20', 'José Andrade', 'joseAndrss@email.com', '84212482', 'Rua da Noca', '1120-001', 122),
('1965-08-20', 'João Joana André', 'jjandre@gmail.com', '87659221', 'Rua do joão', '2012-022', 322),
('1990-05-15', 'João Ferrari', 'vrummmm@email.com', '12347859', 'Rua da jojoca', '9000-021', 12),
('1985-08-20', 'Nelinha Barbosa', 'nelinha101@email.com', '87634321', 'Rua das oliveiras', '2400-202', 222),
('1935-12-12', 'Joâo Pedro', 'jonymaccarroni@email.com', '56201234', 'Avenida da Joaquina', '3000-025', 101),
('1999-09-22', 'Miguel Rego ', 'mr1999@email.com', '12245678', 'Avenida Brooklyn', '1962-211', 122),
('1985-08-20', 'Sara Barbosa', 'sarabrbs@gmail.com', '20654321', 'Rua dos peões', '2220-102', 150),
('2000-02-14', 'Miguel Neiva', 'miguelneiva22@email.com', '56782222', 'Avenida junior', '3022-123', 54),
('1998-09-29', 'Katia Mesquita', 'kitkat@email.com', '12356222', 'Avenida Senior', '9242-210', 95),
('1998-03-25', 'Jessica Marte', 'joarte22@email.com', '17611321', 'Avenida das Lilases', '1750-214', 72),
('1995-11-10', 'Matt Moon', 'tothemoon@email.com', '56723234', 'Avenida das Costuras', '3291-023', 32),
('1990-05-15', 'Carlos Pedreira', 'partepedra10@email.com', '75626984', 'Rua da Cruzada', '8420-029', 42),
('1921-09-20', 'Sergio Porto', 'portolove@email.com', '82269321', 'Rua do Cavaleiro', '2921-692', 35),
('1998-12-21', 'Rosa Star', 'estrelinha@hotmail.com', '92314356', 'Rotunda da Anémona', '2942-241', 72),
('1995-02-10', 'Charlie Sky', 'fullofstars@live.mail.com', '96626621', 'Rua dos Peões', '8354-142', 68),
('2000-08-28', 'Eva Ferreira', 'evaferros@email.com', '86731456', 'Avenida de Brooklyn', '1092-901', 91),
('2022-01-20', 'Lia Mesquita', 'babymsm@gmail.com', '90123478', 'Avenida da Joaquina', '9834-122', 99),
('1920-10-10', 'Rui Chibarias', 'paezinhos@email.com', '67672323', 'Rua do jojoca', '1000-003', 56),
('1990-02-22', 'Elisabete Cruz', 'Jesus00@email.com', '90562390', 'Rua da Noitada', '2819-221', 45),
('1985-08-20', 'Rui Pilar', 'ruisemabrigo@email.com', '87654531', 'Rua da Praia', '2220-222', 22),
('1920-10-07', 'Andre Belo', 'ballins@email.com', '43217843', 'Rua do Trovão', '1000-420', 29),
('1996-09-21', 'Norberto Mesquita', 'norberto96@email.com', '87103321', 'Rua das Costuras', '2209-728', 2),
('1982-02-10', 'Juan Desanta', 'juanmartinez@email.com', '78342109', 'Avenida da Boavista', '3000-829', 5),
('1974-05-15', 'Kelly Barbosa', 'Kellylkes@email.com', '55334466', 'Rua da Cruz', '2192-221', 12),
('1985-11-22', 'Beatriz Oliviera', 'Beatricee@email.com', '99234492', 'Rua do Joaquina', '9821-422', 4),
('1996-02-19', 'Delfim Ribeiro ', 'Jkrowww@email.com', '89218923', 'Avenida Bitcoin', '6521-211', 6),
('1999-05-05', 'Joaquim Ferreira', 'pedrabaixa@email.com', '77722277', 'Avenida dos Perdedores', '9871-221', 98),
('1985-01-23', 'Vitoria Vitoria', 'acabouahistoria@email.com', '88218822', 'Avenida Junior', '2090-022', 2),
('1991-04-10', 'João Tales', 'taliscas@email.com', '89217621', 'Avenida da Noitada', '3421-271', 1),
('1992-05-15', 'Micael Litoral', 'micas@email.com', '09262352', 'Rua da Nortada', '9021-821', 221),
('1981-08-20', 'Don Olivier', 'mrfrancois@email.com', '89232123', 'Rua do Trovão', '2229-122', 9),
('1968-03-10', 'Lester Nyggard', 'Lesterthemoles@email.com', '85412671', 'Rua do Chinatown ', '3042-096', 32),
('1993-02-10', 'Paco Taco', 'pacmans1@email.com', '92011231', 'Avenida Do Benfica', '2123-852', 271),
('1990-05-15', 'João Maria', 'nomenome@email.com', '85526743', 'Rua do jojoca', '9281-021', 1),
('2001-12-20', 'Boa Morte', 'mavida@email.com', '94621262', 'Rua da Praia', '2022-002', 121),
('1990-05-15', 'Cristiano Ronaldo', 'siuuuuuuu@email.com', '21097821', 'Rua da Cruz', '9821-021', 9),
('1982-08-20', 'António Costa', 'amops@email.com', '89218221', 'Avenida da Liberdade', '2221-212', 98),
('1992-02-10', 'Rui Amares', 'amarorui@email.com', '89218218', 'Avenida da Boavista', '3000-003', 33),
('1990-05-15', 'Marco Rites', 'poloo@email.com', '78217242', 'Rua da Bitcoin', '1221-521', 7),
('1970-10-08', 'Paula Solar', 'queimaduras@email.com', '89221289', 'Rua das Candeias', '2000-002', 22),
('1995-02-10', 'Paula Seixo', 'pedrada@email.com', '67421321', 'Avenida do Canto', '9212-720', 7),
('1990-05-15', 'Francisco Pedro', 'pedrofrancisco@email.com', '88112321', 'Avenida do Benfica', '6721-782', 9),
('1985-08-20', 'Becky Ribeiro', 'binarybecky@email.com', '87224321', 'Avenida da Noitada', '8921-222', 10),
('1995-02-10', 'João Sopa', 'canjaesopa@email.com', '85272142', 'Avenida da Liberdade', '5829-339', 8),
('1990-05-15', 'Andre Roberto', 'amopeixes@email.com', '98083212', 'Avenida da Bitcoin', '7842-212', 42),
('1985-08-20', 'Miguel Oliveira', 'motassaofixes@email.com', '78532304', 'Rua da Pista', '8532-858', 21),
('1995-02-10', 'Max Verstappen', 'dutchs@email.com', '75262621', 'Avenida da Cruz', '1972-192', 41);

-- select * from cliente;

-- 60 Telemoveis:
INSERT INTO Telemovel (cliente_id, telemovel_Pk) VALUES
(1, 912575273),
(2, 963079948),
(3, 965444287),
(4, 932942528),
(5, 969605951),
(6, 994428010),
(7, 932823504),
(8, 953279044),
(9, 924382679),
(10, 941477823),
(11, 958738728),
(12, 917387998),
(13, 972273204),
(14, 942186403),
(15, 906435155),
(16, 975118392),
(17, 969151459),
(18, 985945117),
(19, 997631193),
(20, 945164478),
(21, 952166808),
(22, 937367497),
(23, 965353511),
(24, 956704393),
(25, 999709404),
(26, 915608034),
(27, 995641048),
(28, 998650746),
(29, 997338152),
(30, 940066670),
(31, 918850434),
(32, 960065476),
(33, 993986778),
(34, 956643697),
(35, 983887104),
(36, 981529319),
(37, 902534848),
(38, 945156437),
(39, 981429512),
(40, 927814806),
(41, 989668748),
(42, 954425341),
(43, 941159659),
(44, 915096420),
(45, 970935310),
(46, 923814813),
(47, 996749077),
(48, 933711634),
(49, 959059085),
(50, 983301367),
(1, 912575543),
(1, 963079111),
(3, 965441111),
(4, 932111111),
(5, 969222222),
(6, 994222222),
(7, 932333333),
(8, 953233333),
(9, 924384444),
(10, 941555543);

-- select * from telemovel;

-- 20 Bilhetes:
INSERT INTO Bilhete (qr_code, tipo_entrada, cliente_Nome, preco) VALUES
(1001, 'Normal', NULL, 25.0),
(1002, 'Normal', NULL, 15.0),
(1003, 'VIP', NULL, 40.0),
(1004, 'VIP', NULL, 35.0),
(1005, 'Grupo', NULL, 20.0),
(1006, 'VIP', NULL, 50.0),
(1007, 'Normal', NULL, 30.0),
(1008, 'Grupo', NULL, 25.0),
(1009, 'Grupo', NULL, 45.0),
(1010, 'Normal', 'Miguel Oliveira', 20.0),
(1011, 'VIP', NULL, 55.0),
(1012, 'Normal', NULL, 15.0),
(1013, 'Normal', NULL, 28.0),
(1014, 'VIP', NULL, 60.0),
(1015, 'Normal', NULL, 18.0),
(1016, 'Normal', NULL, 22.0),
(1017, 'VIP', 'Andre Belo', 48.0),
(1018, 'Normal', 'Rui Martins', 30.0),
(1019, 'Normal', NULL, 25.0),
(1020, 'Grupo', NULL, 70.0);

select * from bilhete;

-- 3 Faturas:
-- Bastante complicado pois é necessário a coerencia de varios dados
INSERT INTO Fatura (referencia, valor, nr_bilhetes, data_compra, funcionario_nome) VALUES
(123, 55.0, 1, '2023-11-30', 'Januario Fevereiro'),
(223, 22.0, 1, '2023-11-29', 'Januario Fevereiro'),
(323, 30.0, 1, '2023-11-28', 'Ruizinho Lampreia');

-- select * from fatura;

-- 3 Vendas:
-- Bastante complicado pois é necessário a coerencia de varios dados
INSERT INTO Venda (funcionario_ID_venda, cliente_ID_venda, fatura_referencia_venda, bilhete_qr_code_venda) VALUES
(8, 49, 123, 1010),
(8, 24, 223, 1017),
(9, 3, 323, 1018);

-- select * from venda;


-- Todos os funcionários iniciais conhecem todos os eventos inicias:
INSERT INTO Conhece (Funcionario_ID_Conhece, Evento_ID_Conhece)
SELECT Funcionario.ID, Evento.ID
FROM Funcionario, Evento;

-- select * from conhece;
 

-- Feedbacks inicialmente vazios, futuramente serão adicionados com procedimentos, de forma a garantir que o cliente frequentou o evento


-- 3 Patrocinios:
INSERT INTO patrocina (patrocinador_nome_patrocina, evento_ID_patrocina, montante, observações) VALUES
('Meo', 1, 5000.0, NULL),
('Red Bull', 2, 1000, 'Exigimos cartaz publicitário na entrada'),
('AlbertoMusical', 2, 250, NULL);

-- select * from patrocina;


-- Atribuição de acesso dos 20 bilhetes aos 6 eventos existentes:
INSERT INTO acesso (bilhete_qr_code_acesso, evento_ID_acesso)
VALUES
(1001, 1),
(1002, 2),
(1003, 3),
(1004, 2),
(1005, 4),
(1006, 3),
(1007, 1),
(1008, 4),
(1009, 5),
(1010, 2),
(1011, 6),
(1012, 1),
(1013, 1),
(1014, 6),
(1015, 3),
(1016, 4),
(1017, 5),
(1018, 1),
(1019, 4),
(1020, 6);

-- select * from acesso;