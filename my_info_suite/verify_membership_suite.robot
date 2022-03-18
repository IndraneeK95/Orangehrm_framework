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
    [Arguments]     ${username}     ${password}     ${membership}       ${amount}      ${currency}      ${date1}   ${date2}
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
    Input Text    id=membership_subscriptionCommenceDate    ${date1}
    Input Text    id=membership_subscriptionRenewalDate     ${date2}
    Click Element    id=btnSaveMembership
    Table Should Contain        xpath=//table[@class='table hover']     ${membership}
    Table Should Contain    xpath =//table[@class='table hover']   Company
    Table Should Contain    xpath=//table[@class='table hover']    ${amount}