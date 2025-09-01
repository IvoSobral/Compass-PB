*** Settings ***
Resource    ../resource/api_testing_usuarios.resource

*** Variables ***



*** Test Cases ***
Cenário 01: Cadastrar um novo usuario com sucesso
    Criar novo usuario
    Cadastrar o usuario criado
    # Conferir se o usuario foi cadastrado corretamente
