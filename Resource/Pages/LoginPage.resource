*** Settings ***

Documentation       This file handles all operation related to login page
Resource        ../Base/CommonFunctionality.resource

*** Variables ***
${USERNAME_LOCATOR}     id=txtUsername
${PASSWORD_LOCATOR}     id=txtPassword

*** Keywords ***

Enter Username
    [Arguments]     ${username}
    Input Text    ${USERNAME_LOCATOR}       ${username}

Enter Password
    [Arguments]     ${password}
    Input Text     ${PASSWORD_LOCATOR}   ${password}
