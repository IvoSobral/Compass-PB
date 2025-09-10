*** Settings ***
Resource    ../resource/api_testing_usuarios.resource

*** Variables ***



*** Test Cases ***
Cenário 01: Cadastrar um novo usuario com sucesso
    Criar novo usuario
    Cadastrar o usuario criado    ${Email}    status_code_desejado=201
    Conferir se o usuario foi criado corretamente

Cenario 02: Cadastrar um usuario ja existente
    Criar novo usuario
    Cadastrar o usuario criado    ${Email}    status_code_desejado=201
    Repetir o cadastro do usuario
    Verificar se a API não permitiu o cadastro repetido

Cenario 03: Buscar um usuario pelo id
    Criar novo usuario
    Cadastrar o usuario criado    ${Email}    status_code_desejado=201
    Consultar os dados do novo usuario
    #Conferir os dados retornados