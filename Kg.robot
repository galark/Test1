*** Settings ***
Library           SeleniumLibrary
Library           String

*** Variables ***
${part_Number}    160
${enter-key}      \\13
${tab}            \\09
${part_Number2}    123

*** Test Cases ***
TC-VKON2-16
    [Documentation]    - Open the URL provided-http://vobes-ng03.david-bs.de:9095/vobescons/app/home
    ...    - User should select the part number which they want
    ...    - Click on the particular task
    ...    - Search some letter in the search field
    ...    - The result will display.
    ...    - If it will not match the word then "Your search is invalid" message will appear on the screen.
    OpenApllication
    VerifyPartNoDropdown
    SelectDropdowninTab
    GenerateRandomWord
    [Teardown]    CloseBrowser

TC-VKON2-272
    [Documentation]    - Open the URL provided(http://vobes-ng03.david-bs.de:9095/vobescons/app/home)
    ...    - See weather serach field is there on the screen
    ...    - Pass the key to search and press enter
    ...    - If there is no matching data
    OpenApllication
    SearchField
    [Teardown]    CloseBrowser

TC-VKON2-271
    [Documentation]    - Open the URL provided(http://vobes-ng03.david-bs.de:9095/vobescons/app/home)
    ...    - User should select the part number which they want
    ...    - Click on task
    OpenApllication
    SelectDropdowninTab
    [Teardown]    CloseBrowser

*** Keywords ***
OpenApllication
    Open Browser    http://vobes-ng03.david-bs.de:9095/vobescons/app/home?vehicleProjectName=dv15    gc
    Maximize Browser Window
    Sleep    3s
    Click Element    //div[@class='sidebar-item selected']//div[@class='sidebar-icon']

VerifyPartNoDropdown
    Sleep    10s
    Wait Until Element Is Visible    //div[@class='ant-select-selection__placeholder ng-tns-c23-6 ng-star-inserted']
    Element Should Be Visible    //div[@class='ant-select-selection__placeholder ng-tns-c23-6 ng-star-inserted']
    Sleep    5s
    Capture Page Screenshot

SelectDropdowninTab
    Sleep    2s
    Click Element    //cons-change-construction-filter-toolbar[@class='p-2']//nz-select[2]//div
    Comment    Sleep    3s
    Comment    Select All From List    //cons-change-construction-filter-toolbar[@class='p-2']//nz-select[2]//div[1]//div//ul//li[2]
    Input Text    //cons-change-construction-filter-toolbar[@class='p-2']//nz-select[2]//div[1]//div//ul//li//input    ${part_Number}
    Sleep    5s
    Press Key    //cons-change-construction-filter-toolbar[@class='p-2']//nz-select[2]//div[1]//div//ul//li//input    ${enter-key}
    Sleep    3s
    Press Key    //cons-change-construction-filter-toolbar[@class='p-2']//nz-select[2]//div[1]//div//ul//li//input    ${tab}
    Wait Until Element Is Visible    //cons-change-construction-filter-toolbar[@class='p-2']//nz-select[2]//div[1]//div//ul//li//input
    Click Element    //span[contains(text(),'AEM-00000')]
    Sleep    3s
    Click Element    //button[@class='button-blue ml-2 ant-btn ant-btn-default ant-btn-sm']
    Capture Page Screenshot

GenerateRandomWord
    Sleep    3s
    ${Random_Text}    Generate Random String    1    [NUMBERS]
    Sleep    3s
    Input Text    //input[@placeholder='Suchen']    ${Random_Text}
    Sleep    3s
    Press Key    //input[@placeholder='Suchen']    ${enter-key}
    Sleep    3s
    Input Text    //input[@placeholder='Suchen']    //q
    Press Key    //input[@placeholder='Suchen']    ${enter-key}
    Sleep    3s
    Element Should Be Visible    //div[@class='ag-root-wrapper-body ag-layout-normal']//div//div[6]//div//div[contains(text(),'Ihre Suche ergab keinen Treffer')]

CloseBrowser
    Close All Browsers

SearchField
    ${Random_Text}    Generate Random String    1    [NUMBERS]
    Sleep    3s
    Input Text    //input[@placeholder='Suchen']    ${Random_Text}
    Sleep    3s
    Press Key    //input[@placeholder='Suchen']    ${enter-key}
    Sleep    3s
    Input Text    //input[@placeholder='Suchen']    //q
    Press Key    //input[@placeholder='Suchen']    ${enter-key}
    Element Should Be Visible    //div[@class='ag-root-wrapper-body ag-layout-normal']//div//div[6]//div//div[contains(text(),'Ihre Suche ergab keinen Treffer')]

SelectDropDown
    Sleep    2s
    Click Element    //cons-change-construction-filter-toolbar[@class='p-2']//nz-select[2]//div
    Input Text    //cons-change-construction-filter-toolbar[@class='p-2']//nz-select[2]//div[1]//div//ul//li//input    ${part_Number}
    Sleep    5s
    Input Text    //cons-change-construction-filter-toolbar[@class='p-2']//nz-select[2]//div[1]//div//ul//li//input    ${part_Number2}
    Sleep    5s
    Press Key    //cons-change-construction-filter-toolbar[@class='p-2']//nz-select[2]//div[1]//div//ul//li//input    ${enter-key}
    Sleep    3s
    Press Key    //cons-change-construction-filter-toolbar[@class='p-2']//nz-select[2]//div[1]//div//ul//li//input    ${tab}
    Wait Until Element Is Visible    //cons-change-construction-filter-toolbar[@class='p-2']//nz-select[2]//div[1]//div//ul//li//input
    Click Element    //span[contains(text(),'AEM-00000')]
    Sleep    3s
    Click Element    //button[@class='button-blue ml-2 ant-btn ant-btn-default ant-btn-sm']
    Capture Page Screenshot
