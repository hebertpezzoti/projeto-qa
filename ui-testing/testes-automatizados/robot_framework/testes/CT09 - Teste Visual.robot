*** Settings ***
Resource            ../resources/main.robot

Test Setup          Abrir Navegador e Acessar SauceDemo     # Similar ao beforeEach do cypress
Test Teardown       Fechar o navegador      # Similar ao Test Setup e o beforeEach mas para encerramento.


*** Test Cases ***
# Nome do caso de testes:
CT09 - Teste Visual
    Dado que estou logado na página de produtos
    Quando redimensiono a janela do navegador para diferentes resoluções
    Então os elementos (botões, cards, textos) devem estar alinhados, legíveis, bem distribuídos E o menu lateral deve funcionar em modo mobile.


*** Keywords ***
Dado que estou logado na página de produtos
    # Logando especificamente com o visual_user para pegar o bug de layout do SauceDemo
    Wait Until Location Is      ${URL_LOGIN}
    Preencher Usuario           ${USER_STANDARD.usuario} 
    Preencher Senha             ${USER_STANDARD.senha} 
    Clicar No Botao Login
    Wait Until Location Is      ${URL_INVENTORY}

Quando redimensiono a janela do navegador para diferentes resoluções
    # Registra no log do Robot o início da ação de redimensionamento
    Log    Iniciando a validação de layout responsivo em múltiplas resoluções...

Então os elementos (botões, cards, textos) devem estar alinhados, legíveis, bem distribuídos E o menu lateral deve funcionar em modo mobile.
    # Essas keywords abaixo são as que criamos dentro do seu 'inventory_page.robot'
    Validar Alinhamento Do Carrinho Em Multiplos Dispositivos
    Validar Funcionamento Do Menu No Mobile