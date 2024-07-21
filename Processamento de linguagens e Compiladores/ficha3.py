# Ficha 3 Lex - PLC


import ply.lex as lex

tokens = (
    "ID",   # Identificadores
    "PV",   # Ponto e vírgula
    "VIRG", # Vírgula
    "DP",   # Dois-pontos
    "PT",   # Ponto
    "OPAT", # Operadores aritméticos (+, -, *, /)
    "NUMI", # Números inteiros
    "PRG"   # Palavras
)

t_OPAT = r"\+|-|\*|\/"
"""t_PLUS = r'\+'
t_MINUS = r'-'
t_TIMES = r'\*'
t_DIVIDE = r'/'"""

t_PV = r';'
t_VIRG = r','
t_DP = r':'
t_PT = r'\.'

# Função para números inteiros
def t_NUMI(t):
    r'\d+'
    t.value = int(t.value)
    return t

# Função para identificadores (palavras)
def t_ID(t):
    r'[a-zA-Z_][a-zA-Z_0-9]*'
    return t

# Ignorar espaços em branco e tabulações
t_ignore = ' \t'

# Tratamento de quebra de linha
def t_newline(t):
    r'\n+'
    t.lexer.lineno += len(t.value)

#print(tokens)

def t_error(t):
    print(f"Carater ilegal: {t.value[0]}")
    t.lexer.skip(1)

lexer = lex.lex()

data = "isto é um exemplo. 2+3-1,4"


lexer.input(data)

while True:
    tok = lexer.token()
    if not tok:
        break
    print(tok)













# --------//--------
# JSON

import ply.lex as lex

tokens = (
    'LBRACE',  # {
    'RBRACE',  # }
    'LBRACKET',  # [
    'RBRACKET',  # ]
    'COMMA',  # ,
    'COLON',  # :
    'STRING',  # "..."
    'NUMBER',  # 123
    'TRUE',  # true
    'FALSE',  # false
    'NULL',  # null
)

# Regras para tokens simples
t_LBRACE = r'\{'
t_RBRACE = r'\}'
t_LBRACKET = r'\['
t_RBRACKET = r'\]'
t_COMMA = r','
t_COLON = r':'
t_TRUE = r'true'
t_FALSE = r'false'
t_NULL = r'null'

# Regra para números (inteiros ou decimais)
def t_NUMBER(t):
    r'-?(0(\.\d+)?|[1-9]\d*(\.\d+)?)'
    if '.' in t.value:
        t.value = float(t.value)
    else:
        t.value = int(t.value)
    return t

# Regra para strings
def t_STRING(t):
    r'"[^"]*"'
    t.value = t.value[1:-1]
    return t

# Ignora espaços em branco
t_ignore = ' \t\n\r'

# Trata erros
def t_error(t):
    print(f"Illegal character: {t.value[0]}")
    t.lexer.skip(1)

# Crie o analisador léxico
lexer = lex.lex()

# Exemplo de uso
json_text = '''
{
  "name": "John Doe",
  "age": 21,
  "gender": "male",
  "height": 1.68,
  "address": {
    "street": "123 Main Street",
    "city": "New York",
    "country": "USA",
    "zip": "10001"
  },
  "married": false,
  "hobbies": [
    {
      "name": "reading",
      "books": [
        {
          "title": "Heartstopper: Volume 1",
          "author": "Alice Oseman",
          "genres": ["Graphic Novels", "Romance", "Queer"]
        },
        {
          "title": "1984",
          "author": "George Orwell",
          "genres": ["Science Fiction", "Dystopia", "Politics"]
        }
      ]
    },
    {
      "name": "gaming",
      "games": [
        {
          "title": "Portal 2",
          "platform": ["PC", "PlayStation 3", "Xbox 360"]
        },
        {
          "title": "Synth Riders",
          "platform": ["PSVR", "PSVR2", "PCVR", "Oculus Quest"]
        }
      ]
    }
  ]
}
'''

lexer.input(json_text)
for token in lexer:
    print(f"Token: {token.type}, Value: {token.value}")
