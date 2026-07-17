# 🚀 Projeto de Portfólio QA - Demonstração de Competências Técnicas

![Status](https://img.shields.io/badge/Status-Concluído-success)
![Cypress](https://img.shields.io/badge/Cypress-12.0+-blue)
![Robot Framework](https://img.shields.io/badge/Robot%20Framework-7.0+-green)
![Postman](https://img.shields.io/badge/Postman-Desktop%20%26%20CLI-orange)
![Linux](https://img.shields.io/badge/Linux-Mint_22.3-yellow)
![Node.js](https://img.shields.io/badge/Node.js-20.x_LTS-green)
![Python](https://img.shields.io/badge/Python-3.x-blue)

## 📋 Sobre o Projeto

Este repositório é um **Projeto de Portfólio QA** que demonstra a aplicação prática de metodologias de testes manuais e automatizados em aplicações web (UI) e APIs REST. O objetivo é evidenciar domínio técnico em frameworks modernos, arquiteturas de automação escaláveis e boas práticas de engenharia de qualidade, executados em ambiente Linux.

O projeto abrange:
- Testes End-to-End (E2E) e de Interface com **Cypress** e **Robot Framework + Selenium**.
- Testes de API funcionais, de contrato, performance e segurança com **Postman**.
- Documentação detalhada de casos de teste, matrizes de risco e relatórios de bugs.

---

## 🔄 Ciclo Completo de QA (Do Planejamento à Entrega)

Este portfólio foi desenhado para demonstrar domínio de todo o ciclo de vida de qualidade de software, não apenas a codificação de scripts:

1. **Planejamento e Controle:** Elaboração de planos de teste, matrizes de risco e casos de teste detalhados (com abordagem BDD) documentados em planilhas estruturadas.
2. **Execução Manual e Exploratória:** Testes funcionais, de usabilidade (UI/UX), responsividade e conscientização sobre acessibilidade (a11y), com registro técnico e evidenciado de bugs.
3. **Automação Estratégica e Rastreável:** Implementação de suites E2E (Cypress, Robot Framework) e de API (Postman) desenvolvidas estritamente com base nos casos de teste manuais documentados, garantindo cobertura total, alinhamento com requisitos de negócio (BDD) e fácil manutenção (POM).
4. **Monitoramento e Evidências:** Geração de relatórios ricos (HTML com mídias embutidas), análise de métricas de performance (Throughput, P95) e rastreabilidade completa dos defeitos.

---

## 🔗 Rastreabilidade e Documentação

Os testes automatizados deste projeto não foram criados isoladamente. Eles são a implementação técnica direta dos cenários BDD documentados na pasta `documentation/` (Planilhas de Controle de Testes). 

Isso garante que:
- Cada script (`.cy.js`, `.robot` ou Collection do Postman) possui um Caso de Teste (CT) manual correspondente e validado.
- As evidências de falhas ou sucessos estão vinculadas ao ID do caso de teste (ex: `CT01`, `CTAPI05`).
- A lógica de negócio foi validada manualmente antes de ser escalada via automação.

---

## 🛠️ Stack Tecnológica & Metodologias

### Linguagens e Ambientes
- **JavaScript (Node.js 20.x LTS)** e **Python 3 (venv)**
- **Sistema Operacional:** Linux (Linux Mint 22.3)
- **Navegador:** Chromium 126

### Frameworks de Automação
- **UI Testing:** Cypress, Robot Framework + SeleniumLibrary
- **API Testing:** Postman (Desktop & CLI)
- **Relatórios e Evidências:** Geração automática de relatórios HTML ricos em ambos os frameworks (com screenshots e vídeos embutidos via `cypress-mochawesome-reporter` e `robotframework-screencaplibrary`), além de pastas organizadas com arquivos de mídia brutos para auditoria detalhada.

### Arquitetura e Metodologia
- **Page Object Model (POM):** Separação de seletores e lógica de página para manutenibilidade.
- **Behavior-Driven Development (BDD):** Uso da linguagem Gherkin (Dado/Quando/Então) para legibilidade de negócios.
- **Isolamento de Dependências:** Virtual Environments (venv) e gestão segura de variáveis.

---

## 🚀 Destaques de Engenharia & Boas Práticas

- **CI/CD Ready:** Testes de API executáveis via Postman CLI para integração direta em pipelines de CI/CD.
- **Performance Monitoring:** Testes de carga com monitoramento de métricas reais (Throughput, Latência Média e P95).
- **Rich Reporting:** Relatórios HTML autossuficientes e gravação de vídeo das execuções para auditoria visual completa.
- **Security & Contract:** Validação de JSON Schema (Contract Testing) e testes básicos de segurança (ex: prevenção a SQL Injection).
- **DevOps Mindset:** Setup de ambiente isolado, gestão segura de variáveis e configuração de drivers via CLI no Linux.
- **Qualidade 360º:** Cobertura que inclui testes funcionais, de responsividade, performance de navegação e conscientização sobre acessibilidade (a11y).

---

## 📁 Estrutura do Projeto

    projeto-qa/
    ├── ui-testing/                 # Testes de Interface (Cypress e Robot Framework)
    │   ├── testes-automatizados/
    │   │   ├── cypress/            # Automação E2E com Cypress
    │   │   └── robot_framework/    # Automação BDD com Robot + Selenium
    │   └── evidencias/             # GIFs, prints e relatórios de UI
    ├── api-testing/                # Testes de API com Postman
    │   ├── collection/             # Coleção Postman exportada
    │   └── evidencias/             # Prints, curls e relatórios de API
    ├── documentation/              # Planilhas de casos de teste, matrizes de risco e controle de bugs (Testes Manuais)
    └── README.md                   # Este arquivo

---

## ⚙️ Como Executar

### Pré-requisitos
- Node.js 20.x LTS e NPM instalados.
- Python 3 e python3-venv instalados.
- Navegador Chromium/Chrome configurado.

### Testes de UI (Cypress)

    cd ui-testing/testes-automatizados/cypress
    npm install

    # Modo GUI (Headed) - Para desenvolvimento e debug
    npx cypress open

    # Modo Headless - Para performance e CI/CD
    npx cypress run

### Testes de UI (Robot Framework)

    cd ui-testing/testes-automatizados/robot_framework
    python3 -m venv venv
    source venv/bin/activate
    pip install -r requirements.txt

    # Execução em modo GUI (Interface) - Foco em evidência visual e BDD
    robot -d results testes/

*(Nota: O Robot Framework foi configurado para execução em modo GUI para maximizar a geração de evidências visuais e vídeos via ScreenCapLibrary. Os relatórios log.html e report.html serão gerados na pasta results/.)*

### Testes de API (Postman)

    # Execução manual via Postman Desktop
    # Importar a coleção disponível em api-testing/collection/

    # Execução automatizada via CLI (CI/CD Ready)
    postman collection run "api-testing/collection/QA_Teste_API.postman_collection.json" --environment "api-testing/collection/Environment.postman_environment.json"

---

## 📸 Prévia Visual

**Execução Headless (Exemplo de Output no Terminal):**

    ✔  All specs passed!  (5 specs)
    ✔  CT01 - Login com Sucesso
    ✔  CT05 - Fluxo Completo de Compra
    ...
    (Relatório HTML gerado com sucesso em cypress/reports/)

*Para evidências visuais completas, incluindo GIFs de execução, relatórios HTML interativos e vídeos, consulte as pastas específicas em `ui-testing/evidencias/` e `api-testing/evidencias/`.*

---

## 📝 Nota sobre Documentação

A lógica de negócios, criação dos casos de teste, automação e validação dos resultados foram desenvolvidas integralmente pelo autor. A estruturação, formatação e revisão textual desta documentação contaram com o auxílio de assistentes de IA, utilizados como ferramenta de produtividade para garantir clareza e padronização, sob total supervisão e curadoria técnica.

---

## 👤 Sobre o Autor

Desenvolvido por **Hebert Pezzoti da Silva**
- **GitHub:** [github.com/hebertpezzoti](https://github.com/hebertpezzoti)
- **LinkedIn:** [linkedin.com/in/hebertpezzoti](https://www.linkedin.com/in/hebertpezzoti)