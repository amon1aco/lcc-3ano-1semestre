use gestao_eventos;

-- Índice para consultas que procuram eventos tendo em conta a sua data
CREATE INDEX ind_EventoData ON Evento (Data_Realizacao);

-- Índice para consultas que procuram clientes tendo em conta o seu número de nome
CREATE INDEX ind_ClienteNome ON Cliente (Nome);

-- Índice para acelerar consultas que procuram bilhetes com base em seu tipo de entrada
CREATE INDEX ind_BilheteClienteNome ON Bilhete (Cliente_Nome);

