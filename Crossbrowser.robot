*** Settings ***
Library    SeleniumLibrary
Documentation    In deze test zullen we surfen naar de webshop
...              om te kijken of die beschikbaar is. 
...    
...   

*** Variables ***
${Homepage}    https://www.robotframework.belfor-it.nl
${Browser}     gc
${EmailAdres}  test@robot.nl 
${Pwd}         welkom
${LoginMessage}  Welkom op uw account. Hier kunt u al uw persoonlijke gegevens en bestellingen beheren.
${RemoteUrl}	 remote_url=http://localhost:4444/wd/hub  


*** Test Cases ***
Login in als een gebruiker
    Open Browser  				${Homepage}    ${Browser}	${RemoteUrl}
    Maximize Browser Window
    Wait Until Page Contains Element    id=homepage-slider
    Click Element    link=Inloggen
    Wait Until Page Contains Element    login_form
    Input Text    email    ${EmailAdres}
    Input Text    passwd   ${Pwd}
    Click Button    SubmitLogin    
    Wait Until Page Contains    ${LoginMessage}
    Close Browser              
	
*** Keywords ***
Ga naar de webshop
    [Documentation]    Met deze keyword gaan we naar de homepage van de webshop 
    ...                en wachten tot homepage slider zichtbaar is.  
    Open Browser  				${Homepage}
    Maximize Browser Window
    Wait Until Page Contains Element    id=homepage-slider
    
    
    