# 🖥️ UI Testing - Automação de Interface (Cypress & Robot Framework)

![Cypress](https://img.shields.io/badge/Cypress-E2E-blue)
![Robot Framework](https://img.shields.io/badge/Robot%20Framework-BDD-green)
![Selenium](https://img.shields.io/badge/Selenium-WebDriver-orange)
![Node.js](https://img.shields.io/badge/Node.js-20.x_LTS-green)
![Python](https://img.shields.io/badge/Python-3.x-blue)
![Linux](https://img.shields.io/badge/Linux-Mint_22.3-yellow)

## 📋 Sobre o Módulo

Este módulo contém a suíte de testes End-to-End (E2E) e de Interface para a aplicação **Sauce Demo**. A automação foi implementada utilizando duas stacks complementares para demonstrar versatilidade técnica: **Cypress** (focado em performance e integração moderna com Node.js) e **Robot Framework** (focado em BDD, legibilidade de negócios e evidências visuais ricas via Selenium).

Ambos os frameworks foram configurados para gerar relatórios HTML ricos e autossuficientes, com screenshots e vídeos embutidos, além de manterem pastas organizadas com os arquivos de mídia brutos para auditoria detalhada.

---

## 🛠️ Stack Tecnológica do Módulo

### Frameworks e Bibliotecas
- **Cypress:** Framework JavaScript para testes E2E rápidos e confiáveis.
- **Robot Framework + SeleniumLibrary:** Framework de aceitação baseado em Python para automação BDD.
- **ScreenCapLibrary:** Geração automática de vídeos das execuções para evidências.
- **cypress-mochawesome-reporter:** Relatórios HTML avançados com assets embutidos.

### Arquitetura e Metodologia
- **Page Object Model (POM):** Separação de seletores e lógica de página para manutenibilidade.
- **Behavior-Driven Development (BDD):** Uso da linguagem Gherkin (Dado/Quando/Então) para legibilidade de negócios.
- **Testes de Responsividade e Acessibilidade (a11y):** Cobertura além do funcional.

---

## 🚀 Destaques de Engenharia

- **Relatórios Ricos Unificados:** Ambos os frameworks geram relatórios HTML autossuficientes com screenshots e vídeos embutidos (via `cypress-mochawesome-reporter` e `robotframework-screencaplibrary`), além de pastas organizadas com arquivos de mídia brutos para auditoria detalhada.
- **Gestão de Artefatos:** Limpeza automática de assets antigos (`trashAssetsBeforeRuns: true`) e captura automática em falhas (`screenshotOnRunFailure: true`).
- **Cobertura 360º:** Testes funcionais, negativos, de responsividade (redimensionamento de janela) e conscientização sobre acessibilidade (contraste visual).
- **Evidência Visual:** Gravação de vídeo de todas as execuções do Robot Framework para auditoria detalhada.

---

## 📁 Estrutura de Pastas

    ui-testing/
    ├── testes-automatizados/
    │   ├── cypress/
    │   │   ├── e2e/              # Casos de teste (.cy.js)
    │   │   ├── fixtures/         # Dados de teste
    │   │   ├── support/          # Comandos customizados e Page Objects
    │   │   ├── reports/          # Relatórios HTML gerados (Mochawesome)
    │   │   ── cypress.config.js # Configuração avançada do runner
    │   └── robot_framework/
    │       ├── testes/           # Casos de teste (.robot) em Gherkin
    │       ├── resources/        # Keywords e Page Objects
    │       └── results/          # Logs e relatórios do Robot
    └── evidencias/               # GIFs e prints dos testes manuais/automatizados

---

## ⚙️ Guia de Execução Rápida

### Cypress (Node.js)

    cd ui-testing/testes-automatizados/cypress
    npm install

    # Modo GUI (Headed) - Para desenvolvimento e debug visual
    npx cypress open

    # Modo Headless - Para execução rápida e CI/CD
    npx cypress run

### Robot Framework (Python + Selenium)

    cd ui-testing/testes-automatizados/robot_framework
    python3 -m venv venv
    source venv/bin/activate
    pip install -r requirements.txt

    # Execução em modo GUI (Interface) - Foco em evidência visual e BDD
    robot -d results testes/

*(Nota: O Robot Framework foi configurado para execução em modo GUI para maximizar a geração de evidências visuais e vídeos via ScreenCapLibrary. Os relatórios log.html e report.html serão gerados na pasta results/.)*

---

## 📸 Prévia Visual

**Execução Headless (Exemplo de Output no Terminal):**

    ✔  All specs passed!  (5 specs)
    ✔  CT01 - Login com Sucesso
    ✔  CT05 - Fluxo Completo de Compra
    ...
    (Relatório HTML gerado com sucesso em cypress/reports/)

*Para evidências visuais completas, incluindo GIFs de execução, relatórios HTML interativos e vídeos, consulte a pasta `ui-testing/evidencias/`.*

---

## 📝 Nota sobre Documentação

A lógica de negócios, criação dos casos de teste, automação e validação dos resultados foram desenvolvidas integralmente pelo autor. A estruturação, formatação e revisão textual desta documentação contaram com o auxílio de assistentes de IA, utilizados como ferramenta de produtividade para garantir clareza e padronização, sob total supervisão e curadoria técnica.

---

## 👤 Sobre o Autor

Desenvolvido por **Hebert Pezzoti da Silva**
- **GitHub:** [github.com/hebertpezzoti](https://github.com/hebertpezzoti)
- **LinkedIn:** [linkedin.com/in/hebertpezzoti](https://www.linkedin.com/in/hebertpezzoti)