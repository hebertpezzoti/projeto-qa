*** Settings ***
Resource            ../resources/main.robot

Test Setup          Abrir Navegador e Acessar SauceDemo     # Similar ao beforeEach do cypress
Test Teardown       Fechar o navegador      # Similar ao Test Setup e o beforeEach mas para encerramento.


*** Test Cases ***
# Nome do caso de testes:
CT10 - Acessibilidade
    Dado que estou logado na página de produtos de produtos
    Quando eu clico no menu lateral ("Hamburguer")
    Então devo visualizar a opção de "Contraste de Tela" disponível na lista de itens do menu


*** Keywords ***
Dado que estou logado na página de produtos de produtos
    # Logando com usuário alvo
    Wait Until Location Is      ${URL_LOGIN}
    Preencher Usuario           ${USER_STANDARD.usuario} 
    Preencher Senha             ${USER_STANDARD.senha} 
    Clicar No Botao Login
    # Verificando se estou na página de produtos
    Wait Until Location Is      ${URL_INVENTORY}

Quando eu clico no menu lateral ("Hamburguer")
    Abrindo Menu Lateral (Hambúrguer)

Então devo visualizar a opção de "Contraste de Tela" disponível na lista de itens do menu
    Buscando Opção "Contraste de Tela"