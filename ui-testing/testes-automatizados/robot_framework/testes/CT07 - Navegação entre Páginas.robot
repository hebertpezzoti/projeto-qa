*** Settings ***
Resource            ../resources/main.robot

Test Setup          Abrir Navegador e Acessar SauceDemo     # Similar ao beforeEach do cypress
Test Teardown       Fechar o navegador      # Similar ao Test Setup e o beforeEach mas para encerramento.


*** Test Cases ***
# Nome do caso de testes:
CT07 - Navegação entre Páginas
    Dado que estou na página de um produto
    Quando clico em "Back to products"
    Então sou direcionado para a página página de produtos


*** Keywords ***
Dado que estou na página de um produto
    # Logando com usuário alvo
    Wait Until Location Is      ${URL_LOGIN}
    Preencher Usuario           ${USER_PERFORMANCE.usuario} 
    Preencher Senha             ${USER_PERFORMANCE.senha} 
    Clicar No Botao Login
    # Verificando se estou na página de produtos
    Wait Until Location Is      ${URL_INVENTORY}
    # Abrindo um produto
    Abrir Página de Um Produto      Sauce Labs Backpack

Quando clico em "Back to products"
    Clicar no Botão "Back to products"

Então sou direcionado para a página página de produtos
    Verificar se Estou na Página do Produto