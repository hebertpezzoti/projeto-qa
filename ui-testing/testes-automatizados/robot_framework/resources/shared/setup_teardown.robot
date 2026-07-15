*** Settings ***
Resource    ../main.robot

*** Keywords ***
Abrir Navegador e Acessar SauceDemo
    # Garante que a pasta de vídeos da Suite exista antes de iniciar a gravação
    Create Directory    ${OUTPUT_DIR}/videos/${SUITE_NAME}

    # Abrindo o Navegador
    Open Browser    ${URL_LOGIN}    browser=chrome
    Maximize Browser Window
    
    # Inicia a gravação usando o caminho absoluto com a variável nativa ${OUTPUT_DIR}
    Start Video Recording    alias=${TEST_NAME}    name=${OUTPUT_DIR}/videos/${SUITE_NAME}/${TEST_NAME}
    

Fechar o navegador
    # Para a gravação de forma segura.
    # Se o Setup falhar, o Robot ignora este comando e não quebra o Teardown com erro de Python!
    Run Keyword And Ignore Error    Stop Video Recording    alias=${TEST_NAME}
    
    # Se o teste falhar, garante que a pasta do print existe e captura a tela
    Run Keyword If Test Failed    Create Directory    ${OUTPUT_DIR}/screenshots/${SUITE_NAME}
    Run Keyword If Test Failed    Capture Page Screenshot    filename=${OUTPUT_DIR}/screenshots/${SUITE_NAME}/${TEST_NAME}.png
    
    # Fechando o Navegador
    Close Browser