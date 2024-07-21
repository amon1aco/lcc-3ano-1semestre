# Função para responder ao pedido da alínea A
# Calcula a frequência de processos por ano (com base no primeiro elemento da data)

def aA(nome_arquivo):
    # Cria um dicionário para armazenar a frequência de processos por ano
    frequencia_ano = {}

    try:
        # Abre o arquivo especificado para leitura
        with open(nome_arquivo, 'r') as arquivo:
            linhas = arquivo.readlines()
            # Itera pelas linhas do arquivo
            for linha in linhas:
                # NumProc::Data::Confessado::Pai::Mae::Observacoes::
                campos = linha.strip().split("::") # Divide a linha em campos usando '::' como separador
                if len(campos) >= 2:
                    data = campos[1]
                    ano = data.split("-")[0] # Obtém o ano a partir da data no formato 'AAAA-MM-DD' # 1894-11-08 
                    # Verifica se o ano já existe no dicionário de frequência
                    if ano in frequencia_ano:
                        frequencia_ano[ano] += 1
                    else:
                        frequencia_ano[ano] = 1
        #print(frequencia_ano)
        return frequencia_ano # Retorna o dicionário com a frequência de processos por ano
    
    # Exception para ficheiro não encontrado
    except FileNotFoundError:
        return f"O arquivo '{nome_arquivo}' não foi encontrado."
    # Outra Exception qualquer:
    except Exception as e:
        return f"Ocorreu um erro ao processar o arquivo: {str(e)}"


# Função que imprime os resultados no terminal e cria um arquivo com a resposta.
def print_alineaA(dict,nome_arquivo):
    for k,v in dict.items():
        print(f"Ano {k}: {v}")

    try:
        with open(nome_arquivo, 'w') as arquivo:
            for k, v in dict.items():
                arquivo.write(f"Ano {k}: {v}\n")
        print(f"Os resultados foram escritos no arquivo '{nome_arquivo}' e no terminal.")
    except IOError as e:
        print(f"Erro ao criar o arquivo '{nome_arquivo}': {e}")
