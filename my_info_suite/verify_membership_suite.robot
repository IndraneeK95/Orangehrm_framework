*** Settings ***

Documentation       This suite handles test cases related to membership

Resource        ../Resource/Base/CommonFunctionality.resource

Library        DataDriver         file=../test_data/orange_data.xlsx       sheet_name=membership
Library    XML

Test Setup      Launch Browser
Test Teardown   Close Browser
Test Template   Verify Add membership details

*** Test Cases ***
TC1


*** Keywords ***
Verify Add membership details
    [Arguments]     ${username}     ${password}     ${membership}       ${amount}      ${currency}
    Launch Browser
    Set Selenium Speed    2s
    Input Text    id=txtUsername    ${username}
    Input Password    id=txtPassword    ${password}
    Click Element    id=btnLogin
    Click Element    id=menu_pim_viewMyDetails
    Click Element    partial link=Memberships
    Click Element    id=btnAddMembershipDetail
    Select From List By Label    id=membership_membership       ${membership}
    Select From List By Label    id=membership_subscriptionPaidBy   Company
    Input Text    id=membership_subscriptionAmount   ${amount}
    Select From List By Label    id=membership_currency     ${currency}
    Click Element    id=btnSaveMembership
    Log To Console    Added Membership details are
    ${val1}     Get Text    partial link=ACCA
    ${val2}     Get Text    xpath=//td[normalize-space()='Individual']
    ${val3}     Get Text    xpath=//td[normalize-space()='600.00']
    ${val4}     Get Text    xpath=//tbody/tr[1]/td[5]
    Log To Console    ${val1}
    Log To Console    ${val2}
    Log To Console    ${val3}
    Log To Console    ${val4}