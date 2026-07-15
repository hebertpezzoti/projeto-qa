*** Settings ***
Resource            ../resources/main.robot

Test Setup          Abrir Navegador e Acessar SauceDemo     # Similar ao beforeEach do cypress
Test Teardown       Fechar o navegador      # Similar ao Test Setup e o beforeEach mas para encerramento.


*** Test Cases ***
# Nome do caso de testes:
CT04 - Ordenação de Produtos A para Z
    Dado que estou logado na página de produtos
    Quando altero o filtro de ordenação A para Z
    Então a lista de produtos deve ser reorganizada corretamente A para Z e as imagens corretas


# Nome do caso de testes:
Ordenação de Produtos Z para A
    Dado que estou logado na página de produtos
    Quando altero o filtro de ordenação Z para A
    Então a lista de produtos deve ser reorganizada corretamente Z para A e as imagens corretas


*** Keywords ***
Dado que estou logado na página de produtos
    # Logando com usuário alvo
    Wait Until Location Is  ${URL_LOGIN}
    Preencher Usuario       ${USER_PROBLEM.usuario} 
    Preencher Senha         ${USER_PROBLEM.senha} 
    Clicar No Botao Login
    # Verificando se estou na página de produtos
    Wait Until Location Is  ${URL_INVENTORY}

Quando altero o filtro de ordenação A para Z
    Ordenar Produtos   az

Então a lista de produtos deve ser reorganizada corretamente A para Z e as imagens corretas
    Validar Que A Lista De Produtos Está Ordenada De A para Z 
    Validar Que As Imagens Dos Produtos Estão Corretas

Quando altero o filtro de ordenação Z para A
    Ordenar Produtos   za

Então a lista de produtos deve ser reorganizada corretamente Z para A e as imagens corretas
    Validar Que A Lista De Produtos Está Ordenada De Z para A
    Validar Que As Imagens Dos Produtos Estão Corretas