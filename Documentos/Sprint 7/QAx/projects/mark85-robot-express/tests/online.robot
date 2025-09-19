*** Settings ***
Documentation    Online

Resource    ../resources/base.robot
Library    FakerLibrary

*** Test Cases ***
webapp deve estar online
    
    Start Session
    Get Title    equal    Mark85 by QAx
