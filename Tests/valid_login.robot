*** Settings ***
Documentation    A test suite for login
...
...              This test for login
... 

Library          SeleniumLibrary

*** Test Cases ***

Valid login
    # open browser
    Open Browser    https://www.saucedemo.com/    Chrome
    # set window size
    Maximize Browser Window
    # check if in login page
    Page Should Contain Element    login-button
    # input username
    Input Text    user-name    standard-user
    # input password
    Input Text    password    secret_sauce
    # click login
    Click Button    login-button
    # should be open in passwords page
    Element Text Should Be    class:title    PRODUCTS
    # close browser
    [Teardown]    Close Browser
