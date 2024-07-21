import ply.yacc as yacc
from lex import *   # Import do nosso ficheiro criado 

# Imports para manipulação de files necessários
import sys
import os

# Programa apenas com declarações ou atribuições
def p_Programa_Empty(p):
    '''
    Programa : Decls
             | Atrib
    '''
    parser.assembly = f'{p[1]}'

# Programa com corpo pós declarações e atribuições
def p_Programa(p):
    '''
    Programa : Decls Corpo
             | Atrib Corpo
    '''
    parser.assembly = f'{p[1]}START\n{p[2]}STOP\n'

# Programa -> Corpo
def p_Programa_Corpo(p):
    '''
    Programa : Corpo
    '''
    parser.assembly = f"START\n{p[1]}STOP\n"

# Corpo -> Codigo
def p_Corpo(p):
    '''
    Corpo : Codigo
    '''
    p[0] = f"{p[1]}"

# Codigo recursivamente
def p_Codigo_Rec(p):
    '''
    Codigo : Proc Codigo
           | Decls Codigo
           | Atrib Codigo
           | COMENTARIO Codigo
    '''
    p[0] = f"{p[1]}{p[2]}"

# Codigo pode ser um processo, atribuicao, declaracao ou um comentario
def p_Codigo(p):
    '''
    Codigo : Proc
           | Atrib
           | Decls
           | COMENTARIO
    '''
    p[0] = f"{p[1]}"

# declaracao unica terminada em ponto e virgula
def p_Decls(p):
    "Decls : Decl PONTOVIRGULA"
    p[0] = f'{p[1]}'

# declaração recursiva separada por virgulas
def p_DeclsRec(p):
    "Decls : Decl VIRGULA Decls"
    p[0] = f'{p[1]}{p[3]}'

# expr pode ser arit ou relativa
def p_expr_arit(p):
    '''
    expr : exprArit
         | exprRel
    '''
    p[0] = p[1]

# procedimento pode ser um if,while ou um print
def p_Proc(p):
    '''
    Proc : IF
         | WHILE
         | PRINTAR
    '''
    p[0] = p[1]


# Declaração de uma variavel sem valor
def p_Decl(p):
    "Decl : INT ID"
    varName = p[2]

    # é verificado no dicionario de variaveis se ela ja existe
    if varName not in parser.variaveis:
        parser.variaveis[varName] = (parser.stackPointer, None)
        p[0] = "PUSHI 0\n"                  # Atribuido valor 0 por definição
        parser.stackPointer += 1
    else:
        parser.exito = False
        parser.error = f"Variável com o nome {varName} já existe"
    

# Declaração de uma variável com atribuição de um valor
def p_Atrib_expr(p):
    "Atrib : INT ID IGUAL expr PONTOVIRGULA"
    varName = p[2]

    # é verificado no dicionario de variaveis se ela ja existe
    if varName not in parser.variaveis:
        value = p[4]
        parser.variaveis[varName] = (parser.stackPointer, None)
        p[0] = f"{value}STOREG {parser.stackPointer}\n"
        parser.stackPointer += 1
    else:
        parser.exito = False
        parser.error = f"Variável com o nome {varName} já existe"
    

# Atribuição de uma variavel ja declarada
def p_Atrib_sem_decl(p):
    "Atrib : ID IGUAL expr PONTOVIRGULA"
    varName = p[1]

    # Verifica se a tal variavel já existe mesmo
    if varName in parser.variaveis:
        value = p[3]
        parser.variaveis[varName] = (parser.stackPointer, None)
        p[0] = f"{value}STOREG {parser.stackPointer}\n"
        parser.stackPointer += 1
    else:
        parser.exito = False
        parser.error = f"Variável com o nome {varName} não existe"
    


# Altera valor de um variável
def p_alterna_var(p):
    "Atrib : ALTERA ID IGUAL expr PONTOVIRGULA"
    varName = p[2]

    # verifica se a variavel ja existe mesmo
    if varName in parser.variaveis:
        p[0] = f"{p[4]}STOREG {parser.variaveis[varName][0]}\n"
    

# expr pode ser um simples valor
def p_expr(p):
    "expr : NUM"
    p[0] = f"PUSHI {int(p[1])}\n"

# expr pode ser uma variavel
def p_expr_var(p):
    "expr : ID"
    varName = p[1]
    if varName in parser.variaveis:
        p[0] = f"PUSHG {parser.variaveis[varName][0]}\n"

# expr pode receber input
def p_expr_input(p):
    "expr : INPUT"
    p[0] = f"READ\nATOI\n"


# Declara lista com tamanho INT
def p_DeclLista_Size(p):
    '''Decl : LISTA INT NUM VIRGULA ID''' # lista int 5, arr;
    listName = p[5]
    size = int(p[3])

    # verifica se esse nome já não esta a ser usado noutra variavel
    if listName not in parser.variaveis:
        # tamanho obrigatoriamente maior que 0
        if size > 0:
            parser.variaveis[listName] = (parser.stackPointer, size)
            p[0] = f"PUSHN {size}\n"
            parser.stackPointer += size
        else:
            parser.error = f"Impossível declarar um array de tamanho {size}"
            parser.exito = False
    else:
        parser.error = (
            f"Variável com o nome {listName} já definida anteriormente.")
        parser.exito = False
   


# Altera valor de um indice da lista
def p_AlteraLista_elem(p):
    "Atrib : ALTERA ID LPAREN_RETO expr RPAREN_RETO IGUAL expr PONTOVIRGULA" # altera arr[3] = 4;
    varName = p[2]
    
    # garante que a lista esta declarada
    if varName in parser.variaveis:
        p[0] = f"PUSHGP\nPUSHI {parser.variaveis[varName][0]}\nPADD\n{p[4]}{p[7]}STOREN\n"
    else:
        parser.error = f"Variável com o nome {varName} não definida"
        parser.exito = False
    

# Função que vai buscar o valor do indice na lista
def p_AtribBusca_Lista(p):
    "expr : ID LPAREN_RETO expr RPAREN_RETO" # x = arr[4];
    varName = p[1]
    indice = p[3]
    
    # garante que a lista existe
    if varName in parser.variaveis:
        p[0] = f"PUSHGP\nPUSHI {parser.variaveis[varName][0]}\nPADD\n{indice}LOADN\n"
    else:
        parser.error = (
            f"Variável com o nome {varName} não definida anteriormente.")
        parser.exito = False
   

# Declara matriz com tamanho INT INT
def p_DeclMatriz(p):
    "Decl : MATRIZ INT NUM NUM VIRGULA ID" # matriz int 3 2, mat;
    listName = p[6]
    size = int(p[3])
    size1 = int(p[4])

    # Garante que o nome escolhido já não esta a ser usado
    if listName not in parser.variaveis:
        parser.variaveis[listName] = (parser.stackPointer, size, size1)
        p[0] = f"PUSHN {size*size1}\n"
        parser.stackPointer += size*size1
    else:
        parser.error = (
            f"Variável com o nome {listName} já definida anteriormente.")
        parser.exito = False
   

# Função que altera o valor de um indice da matriz por outro
def p_AtribMatriz_comExpr(p):
    "Atrib : ALTERA ID LPAREN_RETO expr RPAREN_RETO LPAREN_RETO expr RPAREN_RETO IGUAL expr PONTOVIRGULA" # altera mat[0][1] = 2;
    matName = p[2]
    indice1 = p[4]
    indice2 = p[7]
    valor = p[10]

    # Garante que a matriz existe
    if matName in parser.variaveis:
        if len(parser.variaveis[matName]) == 3:
            p[0] = f"PUSHGP\nPUSHI {parser.variaveis[matName][0]}\nPADD\n{indice1}PUSHI {parser.variaveis[matName][2]}\nMUL\nPADD\n{indice2}{valor}STOREN\n"
        else:
            parser.error = f"Operação inválida, variável {matName} não é uma matriz"
            parser.exito = False
    else:
        parser.error = f"Variável não declarada anteriormente"
        parser.exito = False
  

# Função que vai buscar o valor do indice na matriz
def p_AtribBusca_Matriz(p):
    "expr : ID LPAREN_RETO expr RPAREN_RETO LPAREN_RETO expr RPAREN_RETO"                   # para usar tipo x = mat[1][2]
    varName = p[1]
    indice1 = p[3]
    indice2 = p[6]
    
    # garante que a matriz existe
    if varName in parser.variaveis:
        p[0] = f"PUSHGP\nPUSHI {parser.variaveis[varName][0]}\nPADD\n{indice1}PUSHI {parser.variaveis[varName][2]}\nMUL\nPADD\n{indice2}LOADN\n"
    else:
        parser.error = f"Variável com o nome {varName} não definida"
        parser.exito = False
   

# Expressão Aritmética da soma
def p_PLUS(p):
    "exprArit : exprArit PLUS term"
    p[0] = f"{p[1]}{p[3]}ADD\n"

# Expressão Aritmética sub
def p_MINUS(p):
    "exprArit : exprArit MINUS term"
    p[0] = f"{p[1]}{p[3]}SUB\n"

# Expressao Atrimética pode ser um termo apenas
def p_expr_arit_term(p):
    '''exprArit : term'''
    p[0] = p[1]

# Expressão Aritmética da mult
def p_TIMES(p):
    "term : term TIMES factor"
    p[0] = f"{p[1]}{p[3]}MUL\n"

# Expressão Aritmética da div
def p_DIVIDE(p):
    "term : term DIVIDE factor"
    p[0] = f"{p[1]}{p[3]}DIV\n"

# term pode ser um factor
def p_term(p):
    "term : factor"
    p[0] = p[1]

# um factor pode ser um numero
def p_factor_num(p):
    '''factor : NUM'''
    p[0] = f"PUSHI {int(p[1])}\n"

# um factor tmb pode ser uma variavel
def p_factor_id(p):
    '''factor : ID'''
    varName = p[1]

    # garante que a var existe
    if varName in parser.variaveis:
        p[0] = f"PUSHG {parser.variaveis[varName][0]}\n"

# Expressão Relativa do igual
def p_IGUALIGUAL(p):
    "exprRel : expr IGUALIGUAL expr"
    p[0] = f"{p[1]}{p[3]}EQUAL\n"

# Expressão Relativa da diff (!=)
def p_DIFERENTE(p):
    "exprRel : expr DIFERENTE expr"
    p[0] = f"{p[1]}{p[3]}NOT\nEQUAL\n"

# Expressão Relativa menor
def p_MENOR(p):
    "exprRel : expr MENOR expr"
    p[0] = f"{p[1]}{p[3]}INF\n"

# Expressão Relativa menor ou igual
def p_MENOROUIGUAL(p):
    "exprRel : expr MENOROUIGUAL expr"
    p[0] = f"{p[1]}{p[3]}INFEQ\n"

# Expressão Relativa maior
def p_MAIOR(p):
    "exprRel : expr MAIOR expr"
    p[0] = f"{p[1]}{p[3]}SUP\n"

# Expressão Relativa maior ou igual
def p_MAIOROUIGUAL(p):
    "exprRel : expr MAIOROUIGUAL expr"
    p[0] = f"{p[1]}{p[3]}SUPEQ\n"

# Expressão Relativa EE (and)
def p_EE(p):
    "exprRel : expr EE expr" 
    p[0] = f"{p[1]}{p[3]}ADD\nPUSHI 2\nEQUAL\n"

# Expressão Relativa "OU" (or)
def p_OU(p):
    "exprRel : expr OU expr"
    p[0] = f"{p[1]}{p[3]}ADD\nPUSHI 1\nSUPEQ\n"

# Controlo de fluxo (if then)
def p_IF_THEN(p):
    "IF : SE LPAREN exprRel RPAREN ENTAO Codigo FIM_COND PONTOVIRGULA"
    p[0] = f"{p[3]}JZ l{parser.labels}\n{p[6]}l{parser.labels}: NOP\n"  # NOP não faz nada na vm
    parser.labels += 1
  

# Controlo de fluxo (if then else)
def p_IF_THEN_ELSE(p):
    "IF : SE LPAREN exprRel RPAREN ENTAO Codigo SENAO Codigo FIM_COND PONTOVIRGULA"
    p[0] = f"{p[3]}JZ l{parser.labels}\n{p[6]}JUMP l{parser.labels}f\nl{parser.labels}: NOP\n{p[8]}l{parser.labels}f: NOP\n" # NOP não faz nada na vm
    parser.labels += 1
  

# Ciclo While
def p_WHILE(p):
    "WHILE : ENQUANTO LPAREN exprRel RPAREN FAZ Codigo FIM_ENQUANTO PONTOVIRGULA"
    p[0] = f'l{parser.labels}c: NOP\n{p[3]}JZ l{parser.labels}f\n{p[6]}JUMP l{parser.labels}c\nl{parser.labels}f: NOP\n' # NOP não faz nada na vm
    parser.labels += 1
   

# Print duma frase (string)
def p_PRINTAR_ID(p):
    '''PRINTAR : IMPRIMIR LPAREN FRASE RPAREN PONTOVIRGULA'''
    p[0] = f'PUSHS {p[3]}\nWRITES\n'
  

# print do valor de uma variavel
def p_PRINTAR_var(p):
    '''PRINTAR : IMPRIMIR LPAREN ID RPAREN PONTOVIRGULA'''
    p[0] = f'PUSHG {parser.variaveis[p[3]][0]}\nWRITEI\n'


# Codigo Comentado
def p_COMENTARIO(p):
    '''COMENTARIO : COMENTADO'''
    p[0] = "NOP\n" # NOP não faz nada na vm

def p_error(p):
    print(f"Erro de sintaxe na entrada: {p.value}")


##
parser = yacc.yacc()
parser.exito = True
parser.error = ""
parser.assembly = ""        # Codigo pra VM que vai sendo gerado
parser.variaveis = {}       # dicionario que armazena as variaveis declaradas
parser.stackPointer = 0     # necessario para a gestão da Stack da VM
parser.labels = 0

assembly = ""           # codigo para a VM final


if len(sys.argv) == 2:
    inputFileName = sys.argv[1]
    if inputFileName[-4:] == ".plc":            # ficheiro de entrada precisa da extensão ".plc"
        file = open(inputFileName, "r")
        content = file.read()
        parser.parse(content)
        if parser.exito:
            assembly += parser.assembly         # Atribuição do codigo para a VM
            print(parser.variaveis)
        else:
            print("Erro:")
            print(parser.error)
            print(parser.variaveis)
            sys.exit()
        file.close()
        outputFileName = "a.vm"                 # cria um file chamado "a.vm" para rodar na VM

        # Verifica se o arquivo de saída já existe e o remove antes de criar um novo
        if os.path.exists(outputFileName):
            os.remove(outputFileName)

        outputFile = open(outputFileName, "w")
        outputFile.write(assembly)              # Escrita do codigo para a VM Final
        outputFile.close()

        print("File saved successfully")

    else:
        print("Invalid file extension")