*** Settings ***
Resource  resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Browser

*** Test Cases ***
When counter is set to a specific value it reflects the new value
    Go To  ${HOME_URL}
    Input Text  name=new_value    42
    Click Button  Aseta 
    Page Should Contain  nappia painettu 42 kertaa

When counter is set to a large value it reflects the new value
    Go To  ${HOME_URL}
    Input Text  name=new_value    1000000
    Click Button  Aseta
    Page Should Contain  nappia painettu 1000000 kertaa

When counter is set to a value and reset it returns to zero
    Go To  ${HOME_URL}
    Input Text  name=new_value    42
    Click Button  Aseta  
    Page Should Contain  nappia painettu 42 kertaa
    Click Button  Nollaa
    Page Should Contain  nappia painettu 0 kertaa