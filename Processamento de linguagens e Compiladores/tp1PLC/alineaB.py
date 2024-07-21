#Função para resolver a alinea B)
#Calcular a frequência de Nomes Próprios (o primeiro em cada nome) e Apelidos (o último em cada nome) por séculos, analisando o nome do Confessado, do seu pai e da sua mãe;

import re

def aB(nome_arquivo):
    # Dicionários para armazenar a frequência de Nomes Próprios e Apelidos por século
    nomes_proprios_seculo = {}
    apelidos_seculo = {}
    
    try:
        # Abre o arquivo especificado para leitura
        with open(nome_arquivo, 'r') as arquivo:
            linhas = arquivo.readlines()
            # Itera pelas linhas do arquivo
            for linha in linhas:
                campos = linha.strip().split("::") # Divide a linha em campos usando '::' como separador
                if len(campos) >= 6:
                    data = campos[1]
                    if data != 'Data':
                        ano = int(data.split("-")[0]) # data sob a forma de "AAAA-MM-DD"
                        seculo = (ano - 1) // 100 + 1 # calcula o seculo

                        nome_completo_confessado = campos[2]
                        partes_nomes_confessado = nome_completo_confessado.split()
                        if len(partes_nomes_confessado) >= 2:
                            nome_proprio_confessado = partes_nomes_confessado[0]

                            if re.search(r",",partes_nomes_confessado[-1]): # no caso de ter o nome e a seguir o seu estado (solteiro,trabalhador...)
                                apelido_partido = partes_nomes_confessado[-1].split(",")
                                apelido_confessado = apelido_partido[0]
                            else:
                                apelido_confessado = partes_nomes_confessado[-1]

                            # Verifica se o século já existe nos dicionários de Nomes Próprios e Apelidos
                            if seculo not in nomes_proprios_seculo:
                                nomes_proprios_seculo[seculo] = {}
                            if seculo not in apelidos_seculo:
                                apelidos_seculo[seculo] = {}

                            # Verifica se o Nome Próprio e Apelido já existem no século
                            if nome_proprio_confessado not in nomes_proprios_seculo[seculo]:
                                nomes_proprios_seculo[seculo][nome_proprio_confessado] = 0
                            if apelido_confessado not in apelidos_seculo[seculo]:
                                apelidos_seculo[seculo][apelido_confessado] = 0

                            # Atualiza a contagem de ocorrências de Nome Próprio e Apelido no século
                            nomes_proprios_seculo[seculo][nome_proprio_confessado] += 1
                            apelidos_seculo[seculo][apelido_confessado] += 1


                        nome_completo_pai = campos[3]
                        partes_nomes_pai = nome_completo_pai.split()
                        if len(partes_nomes_pai) >= 2:
                            nome_proprio_pai = partes_nomes_pai[0]
                            if re.search(r",",partes_nomes_pai[-1]): # no caso de ter o nome e a seguir o seu estado (solteiro,trabalhador...)
                                apelido_pai_partido = partes_nomes_pai[-1].split(",")
                                apelido_pai = apelido_pai_partido[0]
                            else:
                                apelido_pai = partes_nomes_pai[-1]

                            # Verifica se o Nome Próprio e Apelido já existem no século
                            if nome_proprio_pai not in nomes_proprios_seculo[seculo]:
                                nomes_proprios_seculo[seculo][nome_proprio_pai] = 0
                            if apelido_pai not in apelidos_seculo[seculo]:
                                apelidos_seculo[seculo][apelido_pai] = 0

                            # Atualiza a contagem de ocorrências de Nome Próprio e Apelido no século
                            nomes_proprios_seculo[seculo][nome_proprio_pai] += 1
                            apelidos_seculo[seculo][apelido_pai] += 1

                        nome_completo_mae = campos[4]
                        partes_nomes_mae = nome_completo_mae.split()
                        #print(partes_nomes_mae)
                        if len(partes_nomes_mae) >= 2:
                            nome_proprio_mae = partes_nomes_mae[0]
                            #if "," in partes_nomes_mae:
                            if re.search(r",",partes_nomes_mae[-1]): # no caso de ter o nome e a seguir o seu estado (solteira,trabalhadora...)
                                apelido_mae_partido = partes_nomes_mae[-1].split(",")
                                #print(apelido_mae_partido)
                                apelido_mae = apelido_mae_partido[0]
                            else:
                                apelido_mae = partes_nomes_mae[-1]

                            # Verifica se o Nome Próprio e Apelido já existem no século
                            if nome_proprio_mae not in nomes_proprios_seculo[seculo]:
                                nomes_proprios_seculo[seculo][nome_proprio_mae] = 0
                            if apelido_mae not in apelidos_seculo[seculo]:
                                apelidos_seculo[seculo][apelido_mae] = 0
                                
                            # Atualiza a contagem de ocorrências de Nome Próprio e Apelido no século
                            nomes_proprios_seculo[seculo][nome_proprio_mae] += 1
                            apelidos_seculo[seculo][apelido_mae] += 1

        #imprimir_resultados(nomes_proprios_seculo, apelidos_seculo)
        return nomes_proprios_seculo,apelidos_seculo

    # Caso haja exeções
    except FileNotFoundError:
        return f"O arquivo '{nome_arquivo}' não foi encontrado."
    except Exception as e:
        return f"Ocorreu um erro ao processar o arquivo: {str(e)}"


# Função para imprimir os resultados de forma mais organizada
def imprimir_resultados(nomes_proprios_seculo, apelidos_seculo, nome_arquivo):
    # Imprime no terminal
    for seculo, nomes_seculo in nomes_proprios_seculo.items(): # Loop através dos séculos e nomes próprios
        print("")
        print(f"Século {seculo} - Nomes Próprios:")
        for nome, ocorrencias in nomes_seculo.items():
            print(f"\t{nome} - {ocorrencias} ocorrência(s)")
        print("")
        print(f"Século {seculo} - Apelidos:")
        apelidos_seculo_seculo = apelidos_seculo.get(seculo, {})
        for apelido, ocorrencias in apelidos_seculo_seculo.items():
            print(f"\t{apelido} - {ocorrencias} ocorrência(s)")
        print("")

    # Escreve em ficheiro
    try:
        with open(nome_arquivo, "w") as arquivo:
            for seculo, nomes_seculo in nomes_proprios_seculo.items(): # Loop através dos séculos e nomes próprios
                arquivo.write(f"\nSéculo {seculo} - Nomes Próprios:\n")
                for nome, ocorrencias in nomes_seculo.items():
                    arquivo.write(f"\t{nome} - {ocorrencias} ocorrência(s)\n")
                arquivo.write(f"\nSéculo {seculo} - Apelidos:\n")
                apelidos_seculo_seculo = apelidos_seculo.get(seculo, {})
                for apelido, ocorrencias in apelidos_seculo_seculo.items():
                    arquivo.write(f"\t{apelido} - {ocorrencias} ocorrência(s)\n")
                arquivo.write("\n")
    
    # Caso haja uma exceção
    except IOError as e:
        print(f"Erro ao criar o arquivo '{nome_arquivo}': {e}")

