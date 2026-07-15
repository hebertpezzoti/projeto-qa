*** Settings ***
Resource            ../resources/main.robot

Test Setup          Abrir Navegador e Acessar SauceDemo     # Similar ao beforeEach do cypress
Test Teardown       Fechar o navegador      # Similar ao Test Setup e o beforeEach mas para encerramento.


*** Test Cases ***
# Nome do caso de testes:
CT05 - Fluxo Completo de Compra
    Dado que adicionei produtos ao carrinho
    Quando preencho os dados de checkout E finalizo
    Então visualizo a confirmação do pedido


*** Keywords ***
Dado que adicionei produtos ao carrinho
    # Logando com usuário alvo
    Wait Until Location Is  ${URL_LOGIN}
    Preencher Usuario       ${USER_STANDARD.usuario} 
    Preencher Senha         ${USER_STANDARD.senha} 
    Clicar No Botao Login
    # Verificando se estou na página de produtos
    Wait Until Location Is  ${URL_INVENTORY}
    # Adicionando Produtos ao Carrinho
    Adicionando Item No Carrinho
    Abrindo Carrinho
    Verificando Carrinho

Quando preencho os dados de checkout E finalizo
    Finalizando Compra

Então visualizo a confirmação do pedido
    Confirmando Conclusão do Pedido