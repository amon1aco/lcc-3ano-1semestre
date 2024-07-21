lista1 = " [ 1,5, palavra, False ,3.14, 0, fim] "
lista2 = " ( afaf, teu, true, avô, avó, pai, Mãe )"
lista3 = " [ +12, -123, -89,+43, 45 ] "

import ply.lex as lex
import sys

tokens = (
    'LPAREN',
    'RPAREN',
    'VIRG',
    'ID',
    'NUM',
    'TRUE',
    'FALSE'
)

t_LPAREN = r'\[|\('
t_RPAREN = r'\]|\)'
t_VIRG   = r','

def t_TRUE(t):
    r'(?i:true)'
    return t
def t_FALSE(t):
    r'(?i:false)'
    return t
def t_ID(t):
    r'(?i:[a-záéóúíàãõêô]+)'
    return t

def t_NUM(t):
    r'[+\-]?\d+'
    t.value = int(t.value)
    return t

t_ignore = ' \r\n\t'

def t_error(t):
    print('Illegal character: ' + t.value[0])
    return

lexer = lex.lex()

# Reading input
for linha in sys.stdin:
    lexer.input(linha)
    tok = lexer.token()
    while tok:
        print(tok)
        tok = lexer.token()