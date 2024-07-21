# alinea e)

def aE(ficheiro):
    
    try:
        with open(ficheiro, 'r') as arquivo: # Abre o file para leitura
            linhas = arquivo.readlines()
            
            if len(linhas) > 0:
                primeira_linha = linhas[1] # linha[0] == NumProc::Data::Confessado::Pai::Mae::Observacoes::
                #print(primeira_linha)
                campo = primeira_linha.strip().split('::') # remove os espaços no inicio e fim da string e divide a mesma onde encontrar "::"
                #print(campo)
                if len(campo) >= 6: # na primeira linha cumpre sempre
                    # registo da primeira linha
                    registro = {
                        "numProc": campo[0],
                        "data": campo[1],
                        "confessado": campo[2],
                        "pai": campo[3],
                        "mae": campo[4],
                        "observacao": campo[5]
                    }

                    # impressão sob a forma JSON valid
                    print("{")
                    for chave, valor in registro.items():
                        if chave != list(registro.keys())[-1]: # ultima linha não possui "," no final
                            print(f'    "{chave}": "{valor}",')
                        else:
                            print(f'    "{chave}": "{valor}"')
                    print("}")

                else:
                    print("A primeira linha apresenta número insuficiente de dados.")
            else:
                print("O arquivo está vazio.")
            return None

    # Caso haja alguma exceção
    except FileNotFoundError:
        return f"O arquivo '{ficheiro}' não foi encontrado."
    except Exception as e:
        return f"Ocorreu um erro ao processar o arquivo: {str(e)}"