*** Settings ***
Library           Selenium2Library

*** Test Cases ***
Register
    Open Browser    https://www.mikrosat.hu/shop_reg.php?overlay=cust_error    Firefox
    Set Window Size    1800    980
    Set Selenium Speed    0.1 seconds
    Execute Javascript    document.querySelector("#ak-widget").remove();
    Input Text    //*[@id="emai"]    legnagyobbemaillegmenobb12@gmail.com
    Input Text    //*[@id="passwd1"]    nyalifali123Password!
    Input Text    //*[@id="passwd2"]    nyalifali123Password!
    Click Element    //*[@id="div_out_company_choose"]/div/div[2]/label
    Input Text    //*[@id="kap_mobile_sub"]    303374821
    Input Text    //*[@id="default_nev"]    nyali fali
    Input Text    //*[@id="default_irany"]    6100
    Input Text    //*[@id="default_utca"]    Legmenőbbek utca 47
    Click Element    //*[@id="cookie_alert_open"]/div/div/div[2]/div/div[2]/div/button
    Click Element    //*[@id="button_reg"]
    Wait For Condition    return document.location.href === "https://www.mikrosat.hu/shop_reg_ok.php?type=reg"
    Close Browser

Login
    Open Browser    https://www.mikrosat.hu/
    Click Element    //*[@id="profile__btn"]
    Input Text    //*[@id="shop_user_login"]    legnagyobbemaillegmenobb10@gmail.com
    Input Text    //*[@id="shop_pass_login"]    nyalifali123Password!
    Click Element    //*[@id="container"]/header/div/div/div[2]/div/div[2]/div[3]/div/div[2]/form/div[1]/button
    Wait For Condition    return document.querySelector(".login-box__loggedin-text.d-none").innerText === "Sikeres Belépés"
    Close Browser
