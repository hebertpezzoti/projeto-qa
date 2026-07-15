*** Settings ***
Resource            ../resources/main.robot

Test Setup          Abrir Navegador e Acessar SauceDemo     # Similar ao beforeEach do cypress
Test Teardown       Fechar o navegador      # Similar ao Test Setup e o beforeEach mas para encerramento.

*** Test Cases ***
CT01 - Login com Sucesso Standard User
    Dado que estou na página de login
    Quando insiro 'standard_user' E senha válida
    Então sou redirecionado para a página de produtos

*** Keywords ***
Dado que estou na página de login
    Wait Until Location Is  ${URL_LOGIN}

Quando insiro 'standard_user' E senha válida
    Preencher Usuario       ${USER_STANDARD.usuario} 
    Preencher Senha         ${USER_STANDARD.senha} 
    Clicar No Botao Login

Então sou redirecionado para a página de produtos
    Wait Until Location Is  ${URL_INVENTORY}