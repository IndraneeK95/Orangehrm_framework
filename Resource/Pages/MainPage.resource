*** Settings ***
Documentation       This handles all menu in orange hrm

Resource            ../Base/CommonFunctionality.resource


*** Variables ***
${MY_INFO_LOCATOR}      id=menu_pim_viewMyDetails

*** Keywords ***
Click on my_info
    Click Element    ${MY_INFO_LOCATOR}
    
    
    

