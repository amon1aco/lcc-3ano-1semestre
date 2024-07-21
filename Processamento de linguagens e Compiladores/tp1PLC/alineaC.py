# alineaC
# Importa o módulo 're' para lidar com expressões regulares
import re

def aC(arquivo_copia):
    try:
        # Abre o arquivo para leitura
        with open(arquivo_copia, 'r') as copia:
            linhas = copia.readlines()
            frequencia = 0 # Contador 

            # Percorre as linhas do arquivo
            for linha in linhas:
                campos = linha.strip().split("::") # Divide a linha em partes usando '::' como delimitador e remove espaços em branco (strip)
                if len(campos) >= 6:
                    observacoes = campos[5] # Obtém as observações da linha, assumindo que estão na sexta posição

                    if re.search(r'Tio', observacoes): # Utiliza uma expressão regular para verificar se a palavra 'Tio' está presente nas observações
                        frequencia += 1 # Se 'Tio' for encontrado, incrementa o contador de frequência
 
        return frequencia
    
    # Caso haja exceções
    except FileNotFoundError:
        return f"O arquivo '{arquivo_copia}' não foi encontrado."
    except Exception as e:
        return f"Ocorreu um erro ao processar o arquivo: {str(e)}"