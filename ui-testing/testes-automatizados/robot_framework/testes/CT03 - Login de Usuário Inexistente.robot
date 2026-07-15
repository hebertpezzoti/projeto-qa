*** Settings ***
Resource            ../resources/main.robot

Test Setup          Abrir Navegador e Acessar SauceDemo     # Similar ao beforeEach do cypress
Test Teardown       Fechar o navegador      # Similar ao Test Setup e o beforeEach mas para encerramento.

*** Test Cases ***
# Nome do caso de testes:
CT03 - Login de Usuário Inexistente
    Dado que estou na página de login
    Quando insiro 'caramelo' E senha 'caramelo123'.
    Então visualizo a mensagem de aviso de que o usuário/senha não foram encontrados.


*** Keywords ***
Dado que estou na página de login
    Wait Until Location Is  ${URL_LOGIN}

Quando insiro 'caramelo' E senha 'caramelo123'.
    Preencher Usuario       caramelo
    Preencher Senha         caramelo123 
    Clicar No Botao Login


Então visualizo a mensagem de aviso de que o usuário/senha não foram encontrados.
    Validar Mensagem de Erro de Login    Epic sadface: Username and password do not match any user in this service