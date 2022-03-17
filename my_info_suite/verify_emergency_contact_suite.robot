*** Settings ***

Documentation       This suite handles test cases related to emegency contact

Resource        ../Resource/Base/CommonFunctionality.resource

Test Setup      Launch Browser
Test Teardown   Close Browser
Test Template   Verify Add Emergency Contact Test


*** Test Cases ***
TC1     Admin   admin123    John    Brother     787878
TC2     Admin   admin123    Sandy   Sister      787878


*** Keywords ***
Verify Add Emergency Contact Test
    [Arguments]     ${username}     ${password}     ${emgcontact}       ${emgrelation}      ${emgphone}
    Launch Browser
    Input Text    id=txtUsername    ${username}
    Input Password    id=txtPassword    ${password}
    Click Element    id=btnLogin
    Click Element    id=menu_pim_viewMyDetails
    Click Element    partial link=Emergency Contacts
    Click Element    id=btnAddContact
    Input Text    name=emgcontacts[name]    ${emgcontact}
    Input Text    id=emgcontacts_relationship    ${emgrelation}
    Input Text    id=emgcontacts_homePhone    ${emgphone}
    Click Element    id=btnSaveEContact
    Table Should Contain    id=emgcontact_list    ${emgcontact}
    Table Should Contain    id=emgcontact_list    ${emgphone}