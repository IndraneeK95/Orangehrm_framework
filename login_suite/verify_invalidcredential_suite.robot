*** Settings ***
Documentation           This suite will handle all the test cases related
...                     to valid credential test. Test case TC_OH_3

Resource        ../Resource/Base/CommonFunctionality.resource

Test Setup      Launch Browser
Test Teardown   Close Browser



*** Test Cases ***
Verify invalid credential test

    Input Text    id=txtUsername    Ind123
    Input Password      id=txtPassword    apass123
    Click Element    id=btnLogin
    Element Text Should Be    id=spanMessage    Invalid credentials