*** Settings ***
Resource            ../resources/main.robot

Test Setup          Abrir Navegador e Acessar SauceDemo     # Similar ao beforeEach do cypress
Test Teardown       Fechar o navegador      # Similar ao Test Setup e o beforeEach mas para encerramento.


*** Test Cases ***
# Nome do caso de testes:
CT08 - Execução de Logout
    Dado que estou logado no sistema
    Quando clico no menu lateral e seleciono 'Logout'
    #Então sou desconectado.


*** Keywords ***
Dado que estou logado no sistema
    # Logando com usuário alvo
    Wait Until Location Is      ${URL_LOGIN}
    Preencher Usuario           ${USER_STANDARD.usuario} 
    Preencher Senha             ${USER_STANDARD.senha} 
    Clicar No Botao Login
    # Verificando se estou na página de produtos
    Wait Until Location Is      ${URL_INVENTORY}

Quando clico no menu lateral e seleciono 'Logout'
    Abrindo Menu Lateral (Hambúrguer)
    Deslogando do Site

Então sou desconectado.
    Verificando Se Fui Deslogado