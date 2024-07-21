# Ficha 2 PLC


# 0
import re

print("Informação dum aluno no formato: NumAl; NomeCompl; N1; ...; Nn")
inputFromUser = input(">> ")
while inputFromUser != "":
    lista = re.split(r';', inputFromUser)
    #print(lista)
    nota = 0
    for i in range(2,len(lista)):
        nota += int(lista[i])
    
    nr_notas = len(lista) - 2
    med = nota/nr_notas

    print("O aluno com número ", lista[0], " e nome ", lista[1], " tem média: ", med)
    inputFromUser = input(">> ")


# 1 -- REVER
import re

def iso_8601(match):
    day, month, year = match.groups()
    iso_date = f"{year}-{month}-{day}"
    return iso_date

texto = """A 03/01/2022, Pedro viajou para a praia com a sua família.
Eles ficaram hospedados num hotel e aproveitaram o sol e o mar durante toda a semana.
Mais tarde, no dia 12/01/2022, Pedro voltou para casa e começou a trabalhar num novo projeto.
Ele passou muitas horas no escritório, mas finalmente terminou o projeto a 15/01/2022."""

pattern = r"(\d{2})/(\d{2})/(\d{4})"
res = re.sub(pattern, iso_8601, texto)

print(res)


# 2 -- REVER -- Não sei se está 100% correto..
file_names = [
  "document.txt", # válido
  "file name.docx", # inválido
  "image_001.jpg", # válido
  "script.sh.txt", # válido
  "test_file.txt", # válido
  "file_name.", # inválido
  "my_resume.docx", # válido
  ".hidden-file.txt", # válido
  "important-file.text file", # inválido
  "file%name.jpg" # inválido
]

import re

def val(lista):
  ret = []
  for name in lista:
    if re.match(r"^[a-zA-Z0-9_\-\.]+(\.[a-zA-Z0-9]+)+$",name):
      ret.append(name)

  return ret 

print(val(file_names))


# 3 -- REVER
file_names = [
  "document.txt", # válido
  "file name.docx", # inválido
  "image_001.jpg", # válido
  "script.sh.txt", # válido
  "test_file.txt", # válido
  "file_name.", # inválido
  "my_resume.docx", # válido
  ".hidden-file.txt", # válido
  "important-file.text file", # inválido
  "file%name.jpg" # inválido
]

import re

def is_valid_file_name(file_name):
    # O padrão regular verifica se o nome do arquivo contém apenas caracteres alfanuméricos, hífens, underscores ou pontos,
    # seguidos por uma ou mais extensões válidas.
    pattern = r"^[a-zA-Z0-9_\-\.]+(\.[a-zA-Z0-9]+)+$"
    if re.match(pattern, file_name):
        return True
    else:
        return False

# Dicionário para armazenar os arquivos agrupados por extensão
file_dict = {}

for file_name in file_names:
    if is_valid_file_name(file_name):
        # Extrai a extensão do nome do arquivo
        extension = file_name.split('.')[-1]
        if extension in file_dict:
            file_dict[extension].append(file_name)
        else:
            file_dict[extension] = [file_name]

print("Nomes de arquivo válidos agrupados por extensão:")
for extension, files in file_dict.items():
    print(f"Extensão: {extension}")
    for file in files:
        print(f"  - {file}")



# 4
import re
lista = [
    "4700-000", # válido
    "4715-012", # válido
    "987-6543", # inválido
    "1234-567", # válido
    "8x41-5a3", # inválido
    "84234-12", # inválido
    "4583--321", # inválido
    "4583-321", # válido
    "9481-025" # válido
]

res = []
for val in lista:
    if re.match("\d{4}-\d{3}",val):
        res.append(val)

ret = []
for val in res:
    val1,val2 = re.split(r"-",val)
    ret.append((val1,val2))

print(ret)


# 5 -- REVER
abreviaturas = {
    "UM": "Universidade do Minho",
    "LEI": "Licenciatura em Engenharia Informática",
    "UC": "Unidade Curricular",
    "PL": "Processamento de Linguagens",
    "MV" : "Maria Vitória",
    "mt" : "muito",
    "tb" : "também",
    "mb" : "muito bem",
    "cqd" : "como queriamos demonstrar"
}

import re
texto1 = "A /UU de /PL é muito fixe! É uma /UC que acrescenta muito ao curso de /LEI da /UM."
texto2 = """
- Eu gosto /mt de manga.
- Fixe! Eu e /tu /tb!
Fim da história /MV.
   /cqd.
   /mb para terminar!
"""
texto = texto1+"\n"+texto2

def expande(pal):
  if (pal.group(1) in abreviaturas):
    res = abreviaturas[pal.group(1)]
  else:
    res = "/"+pal.group(1)
  return res

txtExpandido = re.sub(r"/([A-Za-z]+)",expande,texto)
print(txtExpandido)


# 6
matriculas = [
    "AA-AA-AA", # inválida
    "LR-RB-32", # válida
    "1234LX", # inválida
    "PL 22 23", # válida
    "ZZ-99-ZZ", # válida
    "54-tb-34", # inválida
    "12 34 56", # inválida
    "42-HA BQ" # válida, mas inválida com o requisito extra
]

ret = []
for mat in matriculas:
  #print(mat)
  if re.match(r"[0-9]{2}-[0-9]{2}-[A-Z]{2}|[0-9]{2}-[A-Z]{2}-[0-9]{2}|[A-Z]{2}-[0-9]{2}-[0-9]{2}|[0-9]{2}-[A-Z]{2}-[A-Z]{2}|[A-Z]{2}-[0-9]{2}-[A-Z]{2}|[A-Z]{2}-[A-Z]{2}-[0-9]{2}", mat):
    ret.append(mat)
  elif re.match(r"[0-9]{2} [0-9]{2} [A-Z]{2}|[0-9]{2} [A-Z]{2} [0-9]{2}|[A-Z]{2} [0-9]{2} [0-9]{2}|[0-9]{2} [A-Z]{2} [A-Z]{2}|[A-Z]{2} [0-9]{2} [A-Z]{2}|[A-Z]{2} [A-Z]{2} [0-9]{2}", mat):
    ret.append(mat)
print(ret)


# 7
texto = """Num lindo dia de [ESTAÇÃO DO ANO], [NOME DE PESSOA] foi passear com o seu [EXPRESSÃO DE PARENTESCO MASCULINA].
Quando chegaram à [NOME DE LOCAL FEMININO], encontraram um [OBJETO MASCULINO] muito [ADJETIVO MASCULINO].
Ficaram muito confusos, pois não conseguiam identificar a função daquilo.
Seria para [VERBO INFINITIVO]? Tentaram perguntar a [NOME DE PESSOA FAMOSA], que também não sabia.
Desanimados, pegaram no objeto e deixaram-no no [NOME DE LOCAL MASCULINO] mais próximo.
Talvez os [NOME PLURAL MASCULINO] de lá conseguissem encontrar alguma utilidade para aquilo."""


import re

def expande(pal):
  res = input(pal.group(1)+" ? ")
  return(res)

txtExpandido = re.sub(r'\[([^\]]+)\]', expande, texto)
print(txtExpandido)


# 8
import re

frase = input()
while frase != "":
  frase = re.sub(r'(\w+)(\s+\1)+', r'\1', frase)
  print(frase)
  frase = input()


# 9
import re

texto= "EU = Pedro Henriques.\nele = Beltrão Coelho.\nEu: Bom dia, como está? tudo bem consigo? qual o seu nome?\nele:eu chamo-me Beltrão Coelho e estou muito bem. e qual o seu nome?\nEU:Pedro um seu criado! Ele é o Zezinho.\nELE: Ah ok muito bem. Prazer Zezinho, eu: não o conhecia. eu: vamos então começar a entrevista que ele quer começar a filmar.\nEu =Nuno Fernandes.\nEle= Alberto Coelho.\nEu: Bom dia, como está? tudo bem consigo? qual o seu nome?\nele: eu chamo-me Alberto Coelho e estou muito bem. e qual o seu nome?\nEU: Pedro um seu criado! Ele é o Zezinho.\nELE: Ah ok muito bem. Prazer Zezinho, eu não o conhecia.\neu: vamos então começar a entrevista que ele quer começar a filmar.\nELE = Ana Camacho.\nEu: Bom dia, como está? tudo bem consigo? qual o seu nome?\nele: sim tudo otimo!"


eu = 'Eduardo: '
ele = 'Guga: '

#f = open("entrevista.txt", "r", encoding="utf-8")
#f.close()

texto = re.sub(r"(?i:eu) =|(?i:eu):|(?i:eu)=",eu,texto)
texto = re.sub(r"(?i:ele) =|(?i:ele)|(?i:ele)=:",ele,texto)

print(texto)


