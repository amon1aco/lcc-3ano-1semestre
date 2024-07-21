# alineaD.py

def aD(ficheiro):
    # Dicionário que a cada pai vai corresponder um set() dos filhos
    pais_filhos_confessados = {}

    try:
        # Tenta abrir o arquivo especificado para leitura
        with open(ficheiro, 'r') as arquivo:
            linhas = arquivo.readlines()  # Lê todas as linhas do arquivo

        for linha in linhas:
            campos = linha.strip().split('::')  # Divide a linha em partes usando '::' como delimitador
            if len(campos) >= 6:    # Certifica-se de que há informações suficientes na linha (NumProc::Data::Confessado::Pai::Mae::Observacoes::)
                nome_pai = campos[3]
                filho_confessado = campos[2]
                
                if nome_pai in pais_filhos_confessados:
                    pais_filhos_confessados[nome_pai].add(filho_confessado)
                else:
                    pais_filhos_confessados[nome_pai] = {filho_confessado}

        # Lista com o numero de pais que possuiem mais de um filho confessado
        pais_com_mais_de_um_filho_confessado = [pai for pai, filhos in pais_filhos_confessados.items() if len(filhos) > 1]
        #print(len(pais_com_mais_de_um_filho_confessado))

        return pais_com_mais_de_um_filho_confessado

    # Caso haja alguma exceção
    except FileNotFoundError:
        return f"O arquivo '{ficheiro}' não foi encontrado."
    except Exception as e:
        return f"Ocorreu um erro ao processar o arquivo: {str(e)}"
    

# Funcao que escreve a resposta para arquivo
def escrever_lista_em_arquivo(lista, nome_arquivo):
    try:
        with open(nome_arquivo, "w") as arquivo:
            for item in lista:
                arquivo.write(f"{item},\n")
    
    # Caso haja exeção
    except IOError as e:
        print(f"Erro ao criar o arquivo '{nome_arquivo}': {e}")

    

