*** Settings ***

Documentation       This file handles all operation related to login page
Resource        ../Base/CommonFunctionality.resource

*** Variables ***
${USERNAME_LOCATOR}     id=txtUsername
${PASSWORD_LOCATOR}     id=txtPassword
${LOGIN_LOCATOR}       id=btnLogin

*** Keywords ***

Enter Username
    [Arguments]     ${username}
    Input Text    ${USERNAME_LOCATOR}       ${username}

Enter Password
    [Arguments]     ${password}
    Input Text     ${PASSWORD_LOCATOR}   ${password}
    
Click Login
    Click Element    ${LOGIN_LOCATOR}
    
Validate_error_message
    [Arguments]         ${message}
    Page Should Contain    ${message}
