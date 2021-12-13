*** Settings ***
Documentation    A test suite for login
...
...              This test is for login cases
... 

Library          SeleniumLibrary

*** Test Cases ***

Valid login
    # open browser
    Open Browser    https://www.saucedemo.com/    Chrome
    # set window size
    Maximize Browser Window
    Set Selenium Speed    0
    # check if in login page
    Page Should Contain Element    login-button
    # input username
    Input Text    user-name    standard_user
    # input password
    Input Text    password    secret_sauce
    # click login
    Click Button    login-button
    # should be open in passwords page
    Element Text Should Be    class:title    PRODUCTS
    # close browser
    [Teardown]    Close Browser

Locked Out
    # open browser
    Open Browser    https://www.saucedemo.com/    Chrome
    # set window size
    Maximize Browser Window
    Set Selenium Speed    0
    # check if in login page
    Page Should Contain Element    login-button
    # input username
    Input Text    user-name    locked_out_user
    # input password
    Input Text    password    secret_sauce
    # click login
    Click Button    login-button
    # should show error message
    Element Text Should Be    xpath://*[@id="login_button_container"]/div/form/div[3]/h3    Epic sadface: Sorry, this user has been locked out.
    # close browser
    [Teardown]    Close Browser
Invalid 
     # open browser
    Open Browser    https://www.saucedemo.com/    Chrome
    # set window size
    Maximize Browser Window
    Set Selenium Speed    0
    # check if in login page
    Page Should Contain Element    login-button
    # input username
    Input Text    user-name    standard_user
    # input password
    Input Text    password    secret_
    # click login
    Click Button    login-button
    # should show error message
    Element Text Should Be    xpath://*[@id="login_button_container"]/div/form/div[3]/h3    Epic sadface: Username and password do not match any user in this service
    # close browser
    [Teardown]    Close Browser
