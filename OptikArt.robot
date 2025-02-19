Language: English

*** Settings ***
Library           Selenium2Library

*** Test Cases ***
Login
    Open Browser    https://keprendeles.optikart.hu/login    Firefox
    Input Text    //*[@id="username-5474"]    Mike
    Input Text    //*[@id="user_password-5474"]    AsdWasd1
    Click Button    //*[@id="um-submit-btn"]
    Element Should Contain    //*[@id="post-5477"]/header/h1    Ifjú Mike Philips
    Close Browser

Login_with_empty_username
    Open Browser    https://keprendeles.optikart.hu/login    Firefox
    Input Text    //*[@id="username-5474"]    ${EMPTY}
    Input Text    //*[@id="user_password-5474"]    AsdWasd1
    Click Button    //*[@id="um-submit-btn"]
    Element Should Contain    //*[@id="um-error-for-username-5474"]    Please enter your username or email
    Element Should Contain    //*[@id="um-error-for-user_password-5474"]    Password is incorrect. Please try again.
    Close Browser

Login_with_empty_password
    Open Browser    https://keprendeles.optikart.hu/login    Firefox
    Input Text    //*[@id="username-5474"]    Mike
    Input Text    //*[@id="user_password-5474"]    ${EMPTY}
    Click Button    //*[@id="um-submit-btn"]
    Element Should Contain    //*[@id="um-error-for-user_password-5474"]    Please enter your password
    Close Browser

Login_with_empty_credentials
    Open Browser    https://keprendeles.optikart.hu/login    Firefox
    Input Text    //*[@id="username-5474"]    ${EMPTY}
    Input Text    //*[@id="user_password-5474"]    ${EMPTY}
    Click Button    //*[@id="um-submit-btn"]
    Element Should Contain    //*[@id="um-error-for-username-5474"]    Please enter your username or email
    Element Should Contain    //*[@id="um-error-for-user_password-5474"]    Please enter your password
    Close Browser

Login_with_wrong_username
    Open Browser    https://keprendeles.optikart.hu/login    Firefox
    Input Text    //*[@id="username-5474"]    Wrong
    Input Text    //*[@id="user_password-5474"]    AsdWasd1
    Click Button    //*[@id="um-submit-btn"]
    Element Should Contain    //*[@id="um-error-for-user_password-5474"]    Password is incorrect. Please try again.
    Close Browser

Register
    Open Browser    https://keprendeles.optikart.hu/register/    Firefox
    Input Text    //*[@id="user_login-5473"]    Teszt_User_LOL11
    Input Text    //*[@id="first_name-5473"]    FirstName
    Input Text    //*[@id="last_name-5473"]    LastNameLOL
    Input Text    //*[@id="user_email-5473"]    testemail1@testing.com
    Input Text    //*[@id="user_password-5473"]    SzeretemATejet123
    Input Text    //*[@id="confirm_user_password-5473"]    SzeretemATejet123
    Click Element    //*[@id="um_field_5473_intezmeny_data"]/div[2]/label[1]
    Click Button    //*[@id="um-submit-btn"]
    Page Should Not Contain    The username you entered is incorrect
    Page Should Not Contain    Elnézést, ez az e-mail cím már használatban van!
    Close Browser
