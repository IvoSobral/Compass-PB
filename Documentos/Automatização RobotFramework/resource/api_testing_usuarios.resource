*** Settings ***
Library    RequestsLibrary
Library    String

*** Keywords ***
Criar novo usuario
    ${Nome_Aleatoria}    Generate Random String    length=6    chars=[LETTERS]
    Set Test Variable    ${Nome_Aleatoria}
    ${Senha_Aleatoria}    Generate Random String    length=10    chars=[NUMBERS]
    Set Test Variable    ${Senha_Aleatoria}
    Log    ${Senha_Aleatoria}
    Log    ${Nome_Aleatoria}

Cadastrar o usuario criado
    ${body}    Create Dictionary
    ...    username=${Nome_Aleatoria} 
    ...    password=${Senha_Aleatoria}

    Log    ${body}

    Criar Sessão restful-booker

    ${resposta}    POST On Session
    ...    alias=RestfulBooker
    ...    url=/auth
    ...    json=${body}
    
    Log    ${resposta.json()}
Criar Sessão restful-booker
    ${headers}    Create Dictionary    Content-Type=application/json
    Create Session    RestfulBooker    url=https://restful-booker.herokuapp.com    headers=${headers}

# Relatório de Code Review
# Nome Revisor:
#     Maycon Douglas da Silva
# Nome do autor do Código:
#     Ivo Sobral dos Santos Junior 
#  Link do Repositório e Branch:
#     https://github.com/IvoSobral/Compass-PB.git (main)
# Melhorias :
#     Implementar validações
# O cenário de teste está tentando cadastrar um usuário por meio do endpoint /auth. O endpoint 
# /auth na API Restful-Booker é usado para autenticação (gerar um token), não para criação de usuário.



