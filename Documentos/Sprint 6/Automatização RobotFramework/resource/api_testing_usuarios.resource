*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections

*** Keywords ***
Criar novo usuario
    ${Email_aleatorio}    Generate Random String    length=6    chars=[LETTERS]
    Set Test Variable    ${Email}     ${email_aleatorio}@email.com

Cadastrar o usuario criado
    [Arguments]    ${Email}    ${status_code_desejado}
    ${body}    Create Dictionary
    ...    nome=TesteRobot
    ...    email=${Email}
    ...    password=1234
    ...    administrador=true
    
    Criar Sessão serverest
    ${resposta}    POST On Session
    ...    alias=ServeRest
    ...    url=/usuarios
    ...    json=${body}
    ...    expected_status=${status_code_desejado}

    Log    ${body}
    Set Test Variable    ${ID_USUARIO}    ${resposta.json()['_id']}
    Set Test Variable    ${RESPOSTA}    ${resposta.json()}
Criar Sessão serverest
    ${headers}    Create Dictionary    accept=application/json    Content-Type=application/json
    Create Session    alias=ServeRest    url=https://compassuol.serverest.dev    headers=${headers}

Conferir se o usuario foi criado corretamente
    Log    ${RESPOSTA}
    Dictionary Should Contain Item    ${RESPOSTA}    message    Cadastro realizado com sucesso
    Dictionary Should Contain Key    ${RESPOSTA}    _id

Repetir o cadastro do usuario
    Cadastrar o usuario criado    ${Email}    status_code_desejado=400

Verificar se a API não permitiu o cadastro repetido
    Dictionary Should Contain Item    ${RESPOSTA}    message    Este email já está sendo usado

Consultar os dados do novo usuario
    ${resposta_consulta}    GET On Session    alias=ServeRest    url=/usuarios/${ID_USUARIO}