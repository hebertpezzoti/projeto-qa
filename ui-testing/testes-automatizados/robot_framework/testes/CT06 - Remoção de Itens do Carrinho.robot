*** Settings ***
Resource            ../resources/main.robot

Test Setup          Abrir Navegador e Acessar SauceDemo     # Similar ao beforeEach do cypress
Test Teardown       Fechar o navegador      # Similar ao Test Setup e o beforeEach mas para encerramento.


*** Test Cases ***
# Nome do caso de testes:
CT06 - Remoção de Itens do Carrinho
    Dado que estou na página de produtos e tenho um item adicionado ao carrinho
    Quando clico no botão 'Remove'
    Então o item deve ser removido e o contador atualizado


*** Keywords ***
Dado que estou na página de produtos e tenho um item adicionado ao carrinho
    # Logando com usuário alvo
    Wait Until Location Is  ${URL_LOGIN}
    Preencher Usuario       ${USER_ERROR.usuario} 
    Preencher Senha         ${USER_ERROR.senha} 
    Clicar No Botao Login
    # Verificando se estou na página de produtos
    Wait Until Location Is  ${URL_INVENTORY}
    # Adicionando Produtos ao Carrinho
    Adicionando Item No Carrinho
    Verificando Contador do Carrinho

Quando clico no botão 'Remove'
    Remover Item do Carrinho

Então o item deve ser removido e o contador atualizado
    Verificar Remoção de Item e Atualização do Contador do Carrinho
