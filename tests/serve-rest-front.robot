*** Setting ***
Resource        ../resources/serve-rest-front.resource
Suite Teardown  Close Browser  ALL

*** Test Cases ***
login com sucesso serve rest front
    Abrir o navrgador
    Ir para o site SITE_SERVER_REST
    Preencher os dados e cadastrar
    Conferir usuário cadastrado com sucesso