*** Settings ***
Documentation           This suite will handle all the test cases related
...                     to valid credential test. Test case TC_OH_2

Resource        ../Resource/Base/CommonFunctionality.resource
Resource        ../Resource/Pages/LoginPage.resource
Test Teardown   Close Browser



*** Test Cases ***
Verify valid credential test
    Launch Browser
    Enter Username    Admin
    Enter Password    admin123
    Click Element    id=btnLogin
    Page Should Contain    My Info