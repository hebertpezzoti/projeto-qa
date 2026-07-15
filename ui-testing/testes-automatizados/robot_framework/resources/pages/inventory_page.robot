*** Settings ***
Resource    ../main.robot

*** Variables ***
${ORDENACAO}                css:[data-test="product-sort-container"]
${BTN_ADD_BACKPACK}         css:[data-test="add-to-cart-sauce-labs-backpack"]
${BTN_CARRINHO}             css:[data-test="shopping-cart-link"]
${TXT_NOME_PRODUTO}         css:[data-test="inventory-item-name"]
${BTN_CHECKOUT}             css:[data-test="checkout"]
${INPUT_FIRSTNAME}          css:[data-test="firstName"]
${INPUT_LASTNAME}           css:[data-test="lastName"]
${INPUT_POSTALCODE}         css:[data-test="postalCode"]
${BTN_CONTINUE}             css:[data-test="continue"]
${BTN_FINISH}               css:[data-test="finish"]
${TXT_HEADER_SUCESSO}       css:[data-test="complete-header"]
${QNT_ITEM_CARRINHO}        css:[data-test="shopping-cart-badge"]
${BTN_RMV_ITM_PAG_PROD}     css:[data-test="remove-sauce-labs-backpack"]
${BTN_BACK_TO_PRODUCTS}     css:[data-test="back-to-products"]
${BTN_LOGOUT}               css:[data-test="logout-sidebar-link"]
${BTN_MENU_LATERAL}         css:#react-burger-menu-btn
${BTN_FECHAR_MENU}          id=react-burger-cross-btn

# URLs específicas deste fluxo
${URL_CART}             https://www.saucedemo.com/cart.html
${URL_CHECKOUT_1}       https://www.saucedemo.com/checkout-step-one.html
${URL_CHECKOUT_2}       https://www.saucedemo.com/checkout-step-two.html
${URL_COMPLETE}         https://www.saucedemo.com/checkout-complete.html


*** Keywords ***
# Ordenação de Produtos
Ordenar Produtos 
    [Arguments]    ${opcao_value}
    # Verifica se o elemento de filtro está visível
    Wait Until Element Is Visible    ${ORDENACAO}
    # Seleciona direto pelo value do HTML ('az', 'za', 'lohi', 'hilo')
    Select From List By Value        ${ORDENACAO}    ${opcao_value}



# Validação de ordenação de produtos de A para Z
Validar Que A Lista De Produtos Está Ordenada De A para Z
    # 1. Captura os elementos da tela
    ${elementos}=    Get WebElements    css:[data-test="inventory-item-name"]
    ${lista_nomes}=    Create List
    
    FOR    ${elemento}    IN    @{elementos}
        ${texto}=    Get Text    ${elemento}
        Append To List    ${lista_nomes}    ${texto}
    END
    
    # 2. Cria o gabarito e ordena apenas de A-Z (ordem crescente)
    ${lista_gabarito}=    Copy List    ${lista_nomes}
    Sort List    ${lista_gabarito}
    
    # 3. Compara se a tela seguiu a ordem crescente natural
    Lists Should Be Equal    ${lista_nomes}    ${lista_gabarito}    

# Validação de ordenação de produtos de Z para A
Validar Que A Lista De Produtos Está Ordenada De Z para A
    # 1. Captura todos os elementos de título da tela
    ${elementos}=    Get WebElements    css:[data-test="inventory-item-name"]
    
    # 2. Cria uma lista vazia para guardar os textos
    ${lista_nomes}=    Create List
    
    # 3. Varre os elementos e extrai o texto de cada um jogando na lista
    FOR    ${elemento}    IN    @{elementos}
        ${texto}=    Get Text    ${elemento}
        Append To List    ${lista_nomes}    ${texto}
    END
    
    # 4. Cria uma cópia da lista e ordena de forma reversa (Z-A) via Python
    ${lista_esperada}=    Copy List    ${lista_nomes}
    Sort List    ${lista_esperada}
    Reverse List    ${lista_esperada}
    
    # 5. Compara se a lista da tela é idêntica à lista ordenada logicamente
    Lists Should Be Equal    ${lista_nomes}    ${lista_esperada}


Validar Que As Imagens Dos Produtos Estão Corretas
    # 1. Captura todas as imagens dos produtos
    ${elementos_img}=    Get WebElements    css:.inventory_item_img img
    
    # 2. Varre imagem por imagem checando o link (src)
    FOR    ${img}    IN    @{elementos_img}
        ${src_link}=    Get Element Attribute    ${img}    src
        
        # Se o link contiver 'sl-404', significa que é a imagem do cachorro/erro
        Should Not Contain    ${src_link}    sl-404    msg=Erro: Imagem quebrada do cachorro detectada no produto!
    END


# Adicionando item no carrinho E Finalizando Compra
Adicionando Item No Carrinho
    Click Element   ${BTN_ADD_BACKPACK}

Abrindo Carrinho
    Click Element   ${BTN_CARRINHO} 
    # Verificando se esta na página do carrinho
    Wait Until Location Is  ${URL_CART}

Verificando Carrinho
    # Verificando se o item esta no carrinho
    Wait Until Element Is Visible   ${TXT_NOME_PRODUTO}
    Element Should Contain          ${TXT_NOME_PRODUTO}    Sauce Labs Backpack

Finalizando Compra
    # Clicando em Checkout
    Click Element   ${BTN_CHECKOUT}
    # Verificando redirecionamento para Etapa 1 Página "Checkout: Your Information" - Formulário
    Wait Until Location Is  ${URL_CHECKOUT_1}
    # Preenchendo Fomulário
    Input Text      ${INPUT_FIRSTNAME}   ${FIRST_NAME}
    Input Text      ${INPUT_LASTNAME}    ${LAST_NAME}
    Input Text      ${INPUT_POSTALCODE}  ${ZIP_POSTAL_CODE}
    Click Element   ${BTN_CONTINUE} 
    # Verificando redirecionamento para Etapa 2 Página: "Checkout: Overview"
    Wait Until Location Is          ${URL_CHECKOUT_2}
    Wait Until Element Is Visible   ${TXT_NOME_PRODUTO}
    Element Should Contain          ${TXT_NOME_PRODUTO}    Sauce Labs Backpack
    # Finalizando compra:
    Click Element   ${BTN_FINISH}


# Verificação da Confirmação do Pedido
Confirmando Conclusão do Pedido
    # Verificando se esta na página de confirmação:
    Wait Until Location Is           ${URL_COMPLETE}
    Wait Until Element Is Visible    ${TXT_HEADER_SUCESSO}
    Element Text Should Be           ${TXT_HEADER_SUCESSO}  Thank you for your order!


# Remoção de Item do Carrinho:
Verificando Contador do Carrinho
    Wait Until Element Is Visible   ${QNT_ITEM_CARRINHO}
    Element Text Should Be          ${QNT_ITEM_CARRINHO}    1

Remover Item do Carrinho
    Click Element                   ${BTN_RMV_ITM_PAG_PROD}

Verificar Remoção de Item e Atualização do Contador do Carrinho
    # Verificando o contador
    Element Should Not Contain       ${QNT_ITEM_CARRINHO}    1
    # Verificando se o item não esta no carrinho
    Abrindo Carrinho
    Element Should Not Contain       ${TXT_NOME_PRODUTO}    Sauce Labs Backpack



# Verificação de Performance
Abrir Página de Um Produto
    [Arguments]                       ${nome_produto}
    Click Element                     xpath://*[@data-test="inventory-item-name" and text()="${nome_produto}"]   

Clicar no Botão "Back to products"
    # Pegamos o tempo exato ANTES do clique
    ${tempo_inicial}=    Get Current Date    result_format=epoch
    Set Global Variable    ${TEMPO_INICIAL}    ${tempo_inicial}
    Click Element                     ${BTN_BACK_TO_PRODUCTS}

Verificar se Estou na Página do Produto
    # 1. Aguarda os elementos estarem prontos na tela (o Robot vai esperar o tempo que for preciso)
    Wait Until Location Is            ${URL_INVENTORY}      
    Wait Until Element Is Visible     ${ORDENACAO}          
    Wait Until Element Contains       ${TXT_NOME_PRODUTO}   Sauce Labs Backpack    
    
    # 2. Pegamos o tempo exato DEPOIS que tudo carregou
    ${tempo_final}=    Get Current Date    result_format=epoch
    
    # 3. Calculamos a diferença de tempo real que levou
    ${tempo_decorrido}=    Evaluate    ${tempo_final} - ${TEMPO_INICIAL}
    
    # 4. VALIDAÇÃO RESISTENTE: Se demorou mais de 2 segundos, o teste FALHA!
    # Como o glitch joga 5 segundos de atraso, o Evaluate abaixo vai falhar o teste.
    Should Be True    ${tempo_decorrido} < 2    msg=Erro de Performance: O botão Voltar levou ${tempo_decorrido} segundos para carregar a página (Limite máximo: 2s).


# Verificando Deslogar do Site
Abrindo Menu Lateral (Hambúrguer)
    Wait Until Element Is Visible    ${BTN_MENU_LATERAL}
    Click Element                    ${BTN_MENU_LATERAL}

Deslogando do Site
    Wait Until Element Is Visible    ${BTN_LOGOUT}
    Click Element                    ${BTN_LOGOUT}


# Acessibilidade
Buscando Opção "Contraste de Tela"
    Wait Until Element Is Visible    xpath://*[@class="bm-item-list"]//*[contains(text(), "Contraste de Tela")]     msg=Erro de Acessibilidade: A opção 'Contraste de Tela' não está disponível no menu.


# Teste Visual
Validar Alinhamento Do Carrinho Em Multiplos Dispositivos
    FOR    ${dispositivo}    ${largura}    ${altura}    IN
    ...    desktop           1920          1080
    ...    laptop            1366          768
    ...    tablet            768           1024
    ...    mobile            375           667
        
        Set Window Size    ${largura}    ${altura}
        Sleep              0.5s    # Aumentamos para 0.5s para dar tempo do CSS carregar 100%
        
        # Injeta JS para obter a distância
        ${top}=    Execute Javascript    return document.querySelector('[data-test="shopping-cart-link"]').getBoundingClientRect().top
        
        # Verificando tempo real
        Log To Console    \n[DEBUG] Dispositivo: ${dispositivo} | Topo Real do Carrinho: ${top}px
                
        # Validação matemática
        Should Be True    ${top} < 20    msg=Erro Visual no ${dispositivo}: Ícone do carrinho desalinhado! Distância real: ${top}px (Máximo aceito: 20px)
    END

Validar Funcionamento Do Menu No Mobile
    # Define o tamanho mobile padrão para o menu
    Set Window Size                  375    667
    Sleep                            0.3s
    
    # 1. Garante que o menu hambúrguer está visível e clica
    Wait Until Element Is Visible    ${BTN_MENU_LATERAL}    5s
    Click Element                    ${BTN_MENU_LATERAL}
    
    # 2. Garante que o menu abriu mostrando as opções internas (como Logout)
    Wait Until Element Is Visible    ${BTN_LOGOUT}          5s
    
    # 3. Fecha o menu clicando no 'X'
    Click Element                    ${BTN_FECHAR_MENU}
    
    # 4. Restaura o navegador para o tamanho padrão
    Maximize Browser Window