*** Settings ***
Documentation           This suite will handle all the test cases related
...                     to valid credential test. Test case TC_OH_3

Resource        ../Resource/Base/CommonFunctionality.resource

Test Setup      Launch Browser
Test Teardown   Close Browser
Test Template   Verify invalid credential test



*** Test Cases ***
TC1     John        john123     Invalid credentials
TC2     Peter       peter123    Invalid credentials

*** Keywords ***
Verify invalid credential test
    [Arguments]     ${username}     ${password}     ${error}
    Input Text    id=txtUsername    Ind123      ${username}
    Input Password      id=txtPassword    apass123      ${password}
    Click Element    id=btnLogin
    Element Text Should Be    id=spanMessage    Invalid credentials     ${error}