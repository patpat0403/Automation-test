*** Settings ***
Documentation    A test suite for sorting
...
...              This test is for sorting cases
... 

Library          SeleniumLibrary

*** Test Cases ***

SortAZ
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
    # should be open in products page
    Element Text Should Be    class:title    PRODUCTS
    #check if sort (A to Z is selected)
    List Selection Should Be    class:product_sort_container    Name (A to Z)
    
    # close browser
    [Teardown]    Close Browser
SortZA
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
    # should be open in products page
    Element Text Should Be    class:title    PRODUCTS
    #Select z to a
    Select From List By Value    class:product_sort_container    za
    #check if sort (Z to A is selected)
    List Selection Should Be    class:product_sort_container    Name (Z to A)
    
    # close browser
    [Teardown]    Close Browser
SortHigh
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
    # should be open in products page
    Element Text Should Be    class:title    PRODUCTS
    #Select high to low
    Select From List By Value    class:product_sort_container    hilo
    #check if sort (High to low) is selected
    List Selection Should Be    class:product_sort_container    Price (high to low)
    
    # close browser
    [Teardown]    Close Browser
SortLow
    # open browser
    Open Browser    https://www.saucedemo.com/    Chrome
    # set window size
    Maximize Browser Window
    Set Selenium Speed    1
    # check if in login page
    Page Should Contain Element    login-button
    # input username
    Input Text    user-name    standard_user
    # input password
    Input Text    password    secret_sauce
    # click login
    Click Button    login-button
    # should be open in products page
    Element Text Should Be    class:title    PRODUCTS
    #Select hight to low
    Select From List By Value    class:product_sort_container    lohi
    #check if sort ((Low to High) is selected
    List Selection Should Be    class:product_sort_container    Price (low to high)
    
    # close browser
    [Teardown]    Close Browser