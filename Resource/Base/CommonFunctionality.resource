*** Settings ***

Documentation       This file handles browser configuration , reusable scripts


Library     SeleniumLibrary

*** Variables ***
${BROWSER_NAME}  chrome
${URL}          https://opensource-demo.orangehrmlive.com/
*** Keywords ***
Launch Browser
    IF  '${BROWSER_NAME}'=='edge'
        Set Local Variable    ${driver_name}     msedgedriver
    ELSE IF  '${BROWSER_NAME}'== 'ff'
        Set Local Variable    ${driver_name}     geckodriver
    ELSE
        Set Local Variable    ${driver_name}     chromedriver
    END

    Open Browser    browser=${BROWSER_NAME}     executable_path=${EXECDIR}${/}driver${/}${driver_name}
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Set Screenshot Directory    ${EXECDIR}${/}screenshot
    Go To    url=${URL}