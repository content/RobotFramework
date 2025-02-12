*** Settings ***
Library           Selenium2Library

*** Test Cases ***
Login
    Open Browser    https://www.saucedemo.com/    Firefox
    Input Text    //*[@id="user-name"]    standard_user
    Input Text    //*[@id="password"]    secret_sauce
    Click Button    //*[@id="login-button"]
    Close Browser

Empty_Username
    Open Browser    https://www.saucedemo.com/    Firefox
    Input Text    //*[@id="user-name"]    ${EMPTY}
    Input Text    //*[@id="password"]    secretsauce
    Click Button    //*[@id="login-button"]
    Element Should Contain    //*[@id="login_button_container"]/div/form/div[3]/h3    Epic sadface: Username is required
    Close Browser

Empty_Password
    Open Browser    https://www.saucedemo.com/    Firefox
    Input Text    //*[@id="user-name"]    standard_user
    Input Text    //*[@id="password"]    ${EMPTY}
    Click Button    //*[@id="login-button"]
    Element Should Contain    //*[@id="login_button_container"]/div/form/div[3]/h3    Epic sadface: Password is required
    Close Browser

Empty_Inputs
    Open Browser    https://www.saucedemo.com/    Firefox
    Input Text    //*[@id="user-name"]    ${EMPTY}
    Input Text    //*[@id="password"]    ${EMPTY}
    Click Button    //*[@id="login-button"]
    Element Should Contain    //*[@id="login_button_container"]/div/form/div[3]/h3    Epic sadface: Username is required
    Close Browser
