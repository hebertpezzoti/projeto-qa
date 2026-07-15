*** Settings ***
Library    SeleniumLibrary  run_on_failure=Nothing  # Biblioteca para teste Web / Erro tratado no Teardown
Library     OperatingSystem                         # Importante: Biblioteca nativa para gerenciar pastas!
Library    ScreenCapLibrary                         # Biblioteca para Gravação de Videos de Testes
Library    Collections                              # Biblioteca nativa necessária para manipular listas
Library    DateTime                                 # Para teste de Performance

Resource    shared/setup_teardown.robot
Resource    pages/login_page.robot
Resource    shared/massa_dados.robot
Resource    pages/inventory_page.robot



*** Variables ***
# URLs
${URL_LOGIN}             https://www.saucedemo.com/
${URL_INVENTORY}         https://www.saucedemo.com/inventory.html