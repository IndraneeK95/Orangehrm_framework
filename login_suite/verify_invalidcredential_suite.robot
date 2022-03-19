*** Settings ***
Documentation           This suite will handle all the test cases related
...                     to valid credential test. Test case TC_OH_3

Resource        ../Resource/Base/CommonFunctionality.resource
Resource        ../Resource/Pages/LoginPage.resource


Test Setup      Launch Browser
Test Teardown   Close Browser
Test Template   Verify invalid credential test



*** Test Cases ***
TC1     John        john123     Invalid credentials
TC2     Peter       peter123    Invalid credentials
TC3     ${EMPTY}    admin123    Username cannot be empty
TC4     Admin       ${EMPTY}    Password cannot be empty

*** Keywords ***
Verify invalid credential test
    [Arguments]     ${username}     ${password}     ${error}
    Enter Username      ${username}
    Enter Password      ${password}
    Click Login
    Element Text Should Be    id=spanMessage    ${error}
    Capture Page Screenshot
