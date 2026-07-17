# ⚡ Cypress E2E - Automação de Interface com JavaScript

![Cypress](https://img.shields.io/badge/Cypress-E2E-blue)
![Node.js](https://img.shields.io/badge/Node.js-20.x_LTS-green)
![Linux](https://img.shields.io/badge/Linux-Mint_22.3-yellow)
![Mochawesome](https://img.shields.io/badge/Reporter-Mochawesome-orange)

## 📋 Sobre o Módulo

Este módulo contém a suíte de testes End-to-End (E2E) implementada com **Cypress**, focada em performance, confiabilidade e integração moderna com o ecossistema Node.js. A automação foi desenvolvida para validar o fluxo completo da aplicação Sauce Demo, desde o login até a finalização de compras.

A arquitetura do projeto segue as melhores práticas idiomáticas do Cypress, utilizando **Custom Commands (Comandos Personalizados)** para abstrair a lógica de interação com o DOM e **Fixtures** para a gestão de dados de teste, garantindo máxima reutilização, legibilidade e manutenibilidade do código.

---

## 🔗 Rastreabilidade e Documentação

Os scripts de automação deste módulo são a implementação técnica direta dos cenários documentados na pasta `documentation/` (Planilha de Controle de Testes - Sauce Demo).

Isso garante que:
- Cada arquivo de teste (`.cy.js`) possui um Caso de Teste (CT) manual correspondente e validado (ex: `CT01` a `CT10`).
- As evidências de falhas ou sucessos estão vinculadas ao ID do caso de teste.
- A lógica de negócio foi validada manualmente antes de ser escalada via automação.

---

## 🛠️ Stack Tecnológica do Módulo

### Frameworks e Bibliotecas
- **Cypress:** Framework JavaScript para testes E2E rápidos e confiáveis.
- **cypress-mochawesome-reporter:** Gerador de relatórios HTML avançados com assets embutidos.
- **Node.js 20.x LTS:** Ambiente de execução e gestão de dependências via NPM.

### Arquitetura e Metodologia
- **Custom Commands e Fixtures:** Abstração de lógica de interação com o DOM e separação de dados de teste, seguindo as melhores práticas nativas do Cypress.
- **Gestão de Artefatos:** Limpeza automática de assets antigos e captura automática de evidências em falhas.
- **Execução Dual:** Suporte completo para modo GUI (Headed) e Headless.

---

## 🚀 Destaques de Engenharia

- **Relatórios HTML Autossuficientes:** Configuração avançada do reporter com `inlineAssets: true` e `embeddedScreenshots: true`, gerando um único arquivo HTML com todos os screenshots e vídeos embutidos (sem dependência de arquivos externos).
- **Configuração de Segurança e Performance:** Uso de `trashAssetsBeforeRuns: true` para manter o ambiente limpo e `allowCypressEnv: false` para gestão segura de variáveis.
- **Fallback Automático de Erros:** `screenshotOnRunFailure: true` e `video: true` garantem que nenhuma falha passe sem evidência visual registrada.
- **Estrutura Modular:** Organização clara entre casos de teste (`e2e/`), dados mockados (`fixtures/`) e comandos customizados (`support/`).

---

## 📁 Estrutura de Pastas

    cypress/
    ├── e2e/                  # Casos de teste (.cy.js) organizados por fluxo
    ├── fixtures/             # Dados de teste (JSON) para mock e validação
    ├── support/              # Comandos customizados e configurações globais
    ├── reports/              # Relatórios HTML gerados (Mochawesome)
    ├── videos/               # Gravações das execuções (Headless)
    ├── screenshots/          # Capturas de tela em caso de falha
    └── cypress.config.js     # Configuração avançada do runner e reporter

---

## ⚙️ Guia de Execução Rápida

### Pré-requisitos
- Node.js 20.x LTS e NPM instalados.
- Navegador Chromium/Chrome configurado.

### Instalação e Execução

    # Navegar para a pasta do Cypress
    cd ui-testing/testes-automatizados/cypress

    # Instalar dependências
    npm install

    # Modo GUI (Headed) - Para desenvolvimento, debug e visualização em tempo real
    npx cypress open

    # Modo Headless - Para execução rápida, performance e CI/CD
    npx cypress run

*(Nota: Após a execução headless, o relatório HTML completo será gerado automaticamente na pasta `cypress/reports/`.)*

---

## 📸 Prévia Visual

**Execução Headless (Exemplo de Output no Terminal):**

    ✔  All specs passed!  (5 specs)
    ✔  CT01 - Login com Sucesso
    ✔  CT05 - Fluxo Completo de Compra
    ...
    (Relatório HTML gerado com sucesso em cypress/reports/)

*Para evidências visuais completas, incluindo GIFs de execução e relatórios HTML interativos, consulte a pasta `ui-testing/evidencias/`.*

---

## 📝 Nota sobre Documentação

A lógica de negócios, criação dos casos de teste, automação e validação dos resultados foram desenvolvidas integralmente pelo autor. A estruturação, formatação e revisão textual desta documentação contaram com o auxílio de assistentes de IA, utilizados como ferramenta de produtividade para garantir clareza e padronização, sob total supervisão e curadoria técnica.

---

## 👤 Sobre o Autor

Desenvolvido por **Hebert Pezzoti da Silva**
- **GitHub:** [github.com/hebertpezzoti](https://github.com/hebertpezzoti)
- **LinkedIn:** [linkedin.com/in/hebertpezzoti](https://www.linkedin.com/in/hebertpezzoti)