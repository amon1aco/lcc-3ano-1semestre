import re

from alineaA import aA, print_alineaA
from alineaB import aB, imprimir_resultados
from alineaC import aC
from alineaD import aD, escrever_lista_em_arquivo
from alineaE import aE

def criar_copia_sem_repetidos(arquivo_original, arquivo_copia):
    # Abre o arquivo original para leitura
    with open(arquivo_original, 'r') as original:
        # Le todas as linhas do arquivo original
        linhas = original.readlines()

    # Remove registos duplicados
    sem_repetidos = set(linhas)
    linhas_sem_repetidos = list(sem_repetidos)

    # Abre o arquivo de copia para escrita
    with open(arquivo_copia, 'w') as copia:
        for linha in linhas_sem_repetidos:
            if not re.match(r'^NumProc::Data::Confessado::Pai::Mae::Observacoes::$', linha.strip()): # Não coloca a primeira linha para não dar erro em acessos ao texto
                copia.write(linha) # escreve no novo file
    

if __name__ == "__main__":
    arquivo_original = "processos.txt"
    arquivo_copia = "copia.txt"

    criar_copia_sem_repetidos(arquivo_original, arquivo_copia)
    
    #A
    alineaA = aA(arquivo_copia)
    print_alineaA(alineaA,"alineaA.txt")
    
    #B
    alineaB_1,alineaB_2 = aB(arquivo_copia)
    imprimir_resultados(alineaB_1,alineaB_2, "alineaB.txt")
    
    #C
    alineaC = aC(arquivo_copia)
    print(F"Frequência de processos que são recomendados por, pelo menos, um Tio: {alineaC}")

    #D
    alineaD = aD(arquivo_copia)
    escrever_lista_em_arquivo(alineaD,"alineaD.txt")
    print(alineaD)

    #E 
    # se a função for executada com o arquivo_copia, imprime sempre uma linha diferente
    aE(arquivo_original)
