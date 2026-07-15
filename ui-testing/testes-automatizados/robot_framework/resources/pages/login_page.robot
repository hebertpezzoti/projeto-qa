*** Settings ***
Resource    ../main.robot

*** Variables ***
${CAMPO_USUARIO}        id:user-name
${CAMPO_SENHA}          id:password
${BOTAO_LOGIN}          id:login-button
${ALERTA_ERRO_LOGIN}    css:h3[data-test="error"]
${BTN_MENU_LATERAL}     css:#react-burger-menu-btn


*** Keywords ***
Preencher Usuario
    [Arguments]    ${usuario}
    Input Text     ${CAMPO_USUARIO}    ${usuario}


Preencher Senha
    [Arguments]    ${senha}
    Input Text     ${CAMPO_SENHA}      ${senha}


Clicar No Botao Login
    Click Element    ${BOTAO_LOGIN}


Validar Mensagem de Erro de Login
    [Arguments]    ${mensagem_esperada}
    # Verificando se o alerta foi disparado
    Wait Until Element Is Visible    ${ALERTA_ERRO_LOGIN}
    # Valida se o texto exato está correto
    Element Text Should Be           ${ALERTA_ERRO_LOGIN}    ${mensagem_esperada}


# Verificação de logout - Se foi Deslogado
Verificando Se Fui Deslogado
    Wait Until Location Is  ${URL_LOGIN}