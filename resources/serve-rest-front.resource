*** Settings ***
Library    Browser
Library    FakerLibrary

*** Variables ***
${BROWSER}             Chromium
${HEADLESS}            ${false}
${SITE_SERVER_REST}    https://front.serverest.dev/


*** Keywords ***

Abrir o navrgador
    New Browser    browser=${BROWSER} 
    ...            headless=${HEADLESS}
    

    New Context    viewport={'width':1200, 'height':800}

Ir para o site SITE_SERVER_REST
    New Page       url=${SITE_SERVER_REST}
    ${title}       Get Title  ==  Front - ServeRest
    Log    ${title}

Preencher os dados e cadastrar
    #Record Selector  Ajuda encontrar o nome do item que precisa ser encontrado no site
    Click            css=.btn-link    #tbm poderia ser utolizado os seguintes comandos text="Cadastre-se" ou css=a[data-testid='cadastrar']
    ${EMAIL}         FakerLibrary.Email
    Fill Text        css=#nome   Victor
    Fill Text        css=#email    ${EMAIL}
    Fill Text        css=input[data-testid='password']    123456
    Check Checkbox   css=input[data-testid='checkbox']
    Click            css=button[data-testid='cadastrar']

Conferir usuário cadastrado com sucesso 
    Wait For Elements State    h1    visible
    Get Text  h1  ==  Bem Vindo Victor
    Get Element States    css=button[data-testid='logout']  validate  value & visible