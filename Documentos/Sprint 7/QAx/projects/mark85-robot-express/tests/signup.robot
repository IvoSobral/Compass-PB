*** Settings ***
Documentation    Cenarios de testes cadastro de usuarios

Resource    ../resources/base.robot


*** Test Cases ***
Deve poder cadastar um novo usuario

    ${name}    Set Variable    Ivo Sobral
    ${email}    Set Variable    ivo@hotmail.com
    ${password}    Set Variable    senha1234

    Remove user from database    ${email} 

    Start Session

    Go To    http://localhost:3000/signup

    #Checkpoint
    Wait For Elements State    css=h1    visible    5
    Get Text    css=h1    equal    Faça seu cadastro

    Fill Text    id=name     ${name}
    Fill Text    id=email    ${email}
    Fill Text    id=password    ${password}
    
    Click    id=buttonSignup

    Wait For Elements State    css=.notice p    visible
    Get Text    css=.notice p    equal    Boas vindas ao Mark85, o seu gerenciador de tarefas.


