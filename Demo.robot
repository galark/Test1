*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${email}          khushboogalar@gmail.com
${password}       Sharanya@12

*** Test Cases ***
testCase1
    login to Application

*** Keywords ***
login to Application
    Open Browser    https://google.com    gc
    Maximize Browser Window
    sleep    5s
    Click Element    //a[@id='gb_70']
    Wait Until Element Is Visible    //input[@id='identifierId']
    Click Element    //input[@id='identifierId']
    Input Text    //input[@id='identifierId']    ${email}
    Sleep    5s
    Click Element    //span[@class='RveJvd snByac']
    Wait Until Element Is Visible    //input[@name='password']
    Input Text    //input[@name='password']    ${password}
    sleep     3s
    Click Element    //span[contains(text(),'Next')]
