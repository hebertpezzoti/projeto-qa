*** Settings ***
Resource            ../resources/main.robot

Test Setup          Abrir Navegador e Acessar SauceDemo     # Similar ao beforeEach do cypress
Test Teardown       Fechar o navegador      # Similar ao Test Setup e o beforeEach mas para encerramento.


*** Test Cases ***
# Nome do caso de testes:
CT02 - Login de Usuário Bloqueado Locked Out
    Dado que estou na página de login
    Quando insiro 'locked_out_user' E senha valida
    Então visualizo a mensagem de aviso de bloqueio



*** Keywords ***
Dado que estou na página de login
    Wait Until Location Is  ${URL_LOGIN}

Quando insiro 'locked_out_user' E senha valida
    Preencher Usuario       ${USER_LOCKED.usuario} 
    Preencher Senha         ${USER_LOCKED.senha} 
    Clicar No Botao Login

Então visualizo a mensagem de aviso de bloqueio
   Validar Mensagem de Erro de Login    Epic sadface: Sorry, this user has been locked out. 
