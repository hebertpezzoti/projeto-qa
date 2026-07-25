<div align="center">

# 🎯 Projeto de Portfólio QA
### Demonstração de Competências Técnicas em Qualidade de Software

[![Cypress](https://img.shields.io/badge/Cypress-17202C?style=for-the-badge&logo=cypress&logoColor=white)](https://www.cypress.io/)
[![Robot Framework](https://img.shields.io/badge/Robot%20Framework-000000?style=for-the-badge&logo=robot-framework&logoColor=white)](https://robotframework.org/)
[![Selenium](https://img.shields.io/badge/Selenium-43B02A?style=for-the-badge&logo=selenium&logoColor=white)](https://www.selenium.dev/)
[![Postman](https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=postman&logoColor=white)](https://www.postman.com/)
[![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript)
[![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)
[![Linux](https://img.shields.io/badge/Linux_Mint-87CF3E?style=for-the-badge&logo=linux&logoColor=black)](https://linuxmint.com/)
[![Chromium](https://img.shields.io/badge/Chromium-4285F4?style=for-the-badge&logo=google-chrome&logoColor=white)](https://www.chromium.org/)

</div>

---

## 📌 Sobre o Projeto

Este repositório é uma **demonstração técnica completa** de competências em Qualidade de Software, estruturado como um projeto de portfólio profissional. A abordagem é **híbrida e estratificada**: integra testes manuais interativos com evidências visuais, automação de regressão em múltiplos frameworks, testes de API REST (manuais e automatizados) e documentação executiva robusta.

Os alvos de teste são:
- **Sauce Demo** — e-commerce de demonstração para testes de interface (UI)
- **Restful-Booker** — API pública REST para testes de serviços (API)

> **Objetivo:** Demonstrar domínio do ciclo completo de Qualidade de Software — do planejamento estratégico à execução manual, da especificação BDD à automação de ponta a ponta, da análise de bugs ao mapeamento de riscos — com total rastreabilidade entre requisitos, evidências e defeitos, cobrindo tanto **testes de interface (UI)** quanto **testes de API REST**.

---

## 🛠 Stack Tecnológica

| Camada | Ferramentas / Tecnologias |
|--------|---------------------------|
| **Automação UI (JavaScript)** | Cypress — testes E2E com relatórios, screenshots e videos |
| **Automação UI (Python)** | Robot Framework + SeleniumLibrary + BDD (Gherkin) — testes E2E com relatórios HTML/XML |
| **Testes de API (GUI + CLI)** | Postman Desktop + Postman CLI — execução manual e automação headless de coleções REST |
| **Validação de Schema API** | tv4 (JSON Schema Validation) — validação estrutural automática das respostas JSON |
| **Linguagens** | JavaScript, Python |
| **Navegador** | Chromium 126 |
| **Ambiente de Execução** | Linux Mint 22.3 (execuções Headless e Headed) |
| **Metodologia** | BDD (Behavior-Driven Development) + Testes de Contrato |
| **Evidências** | GIFs animados, vídeos, PNGs comparativos, screenshots, relatórios HTML/XML, prints Postman, comandos curl |

---

## 📦 Módulos do Portfólio

### 🖥️ UI Testing — Sauce Demo

| Submódulo | Tecnologias | Escopo | Status |
|-----------|-------------|--------|--------|
| **Testes Manuais** | Chromium 126, Linux Mint 22.3 | 10 casos de teste interativos (funcional, usabilidade, performance, segurança, acessibilidade, responsividade) | 5 ✅ / 5 ❌ |
| **Cypress** | Cypress, JavaScript | Automação E2E dos cenários críticos identificados nos testes manuais | ✅ Executável |
| **Robot Framework** | Robot Framework, Selenium, Python, BDD/Gherkin | Automação E2E dos cenários críticos com especificação BDD | ✅ Executável |

### 🔌 API Testing — Restful-Booker

| Submódulo | Tecnologias | Escopo | Status |
|-----------|-------------|--------|--------|
| **Testes Manuais + Automatizados** | Postman Desktop, Postman CLI, tv4 | 19 casos de teste (CRUD, autenticação, schema, segurança, performance, concorrência) | 15 ✅ / 4 ❌ |

---

## 📊 Métricas e Resultados de Destaque

<div align="center">

| Indicador | UI Testing | API Testing | Total |
|-----------|:----------:|:-----------:|:-----:|
| 🧪 Casos de Teste | **10** | **19** | **29** |
| ✅ Passaram | **5** | **15** | **20** |
| ❌ Falharam | **5** | **4** | **9** |
| 🐛 Bugs Documentados | **6** | **4** | **10** |
| ⚠️ Riscos Mapeados | **8** | *(matriz na doc)* | — |
| 🤖 Frameworks de Automação | **2** (Cypress + Robot) | **1** (Postman CLI) | **3** |
| 📄 Documentos de Apoio | **6** `.md` + **1** planilha | **6** `.md` + **1** planilha | **12** `.md` + **2** planilhas |
| 🔗 Rastreabilidade | BDD → CT → Bug → Evidência → Automação | BDD → CT → Bug → Evidência → Automação | — |

</div>

---

## 📁 Estrutura do Repositório

```
projeto-qa/
│
├── ui-testing/
│   ├── docs/
│   │   ├── 01-plano-de-testes.md
│   │   ├── 02-bdd-cenarios.md
│   │   ├── 03-casos-de-teste.md
│   │   ├── 04-analise-de-bugs.md
│   │   ├── 05-analise-de-riscos.md
│   │   ├── 06-sugestoes-melhoria.md
│   │   └── Planilha de Controle de Testes - Sauce Demo.xlsx
│   │
│   ├── testes-manuais/
│   │   ├── README.md
│   │   ├── ct01/ → ct01.gif
│   │   ├── ct02/ → ct02.gif
│   │   ├── ct03/ → ct03.gif
│   │   ├── ct04/ → ct04.gif + ct04.png
│   │   ├── ct05/ → ct05.gif
│   │   ├── ct06/ → ct06.gif
│   │   ├── ct07/ → ct07.gif
│   │   ├── ct08/ → ct08.gif
│   │   ├── ct09/ → PNGs comparativos
│   │   └── ct10/ → ct10.gif
│   │
│   ├── testes-automatizados/
│   │   ├── cypress/
│   │   │   ├── cypress/
│   │   │   │   ├── e2e/               # Specs de teste
│   │   │   │   ├── fixtures/          # Massa de dados
│   │   │   │   └── support/           # Comandos customizados
│   │   │   ├── cypress.config.js
│   │   │   ├── package.json
│   │   │   └── README.md
│   │   │
│   │   └── robot_framework/
│   │       ├── resources/
│   │       │   ├── keywords.robot     # Keywords customizadas
│   │       │   └── variables.robot    # Variáveis globais
│   │       ├── tests/
│   │       │   └── *.robot            # Suites de teste BDD
│   │       ├── results/               # Relatórios e logs
│   │       └── README.md
│   │
│   └── README.md
│
├── api-testing/
│   ├── README.md
│   ├── collection/
│   │   └── QA_Teste_API.postman_collection.json
│   ├── docs/
│   │   ├── 01-plano-de-testes-api.md
│   │   ├── 02-bdd-cenarios-api.md
│   │   ├── 03-casos-de-teste-api.md
│   │   ├── 04-analise-de-bugs-api.md
│   │   ├── 05-analise-de-riscos-api.md
│   │   ├── 06-sugestoes-melhoria-api.md
│   │   └── Planilha de Controle de Testes de API.xlsx
│   └── evidencias/
│       ├── ctapi01/ → ctapi01.png + ctapi01-curl.txt
│       ├── ctapi02/ → ctapi02.png + ctapi02-curl.txt
│       ├── ...
│       ├── ctapi19/ → ctapi19.png + ctapi19-curl.txt
│       └── ctapi18/ → relatório HTML de performance
│
└── README.md                          # ← Você está aqui
```

> A estrutura acima reflete o estado real do repositório. Nenhuma pasta ou arquivo foi inventado.

---

## 🚀 Como Executar

### 🔷 Cypress (UI)

```bash
cd ui-testing/testes-automatizados/cypress

# Modo interativo (headed — abre o Test Runner)
npx cypress open

# Modo headless (CI/CD — gera videos, screenshots e relatórios)
npx cypress run
```

> Evidências geradas automaticamente: `cypress/screenshots/`, `cypress/videos/`, `cypress/reports/`.

### 🤖 Robot Framework (UI)

```bash
cd ui-testing/testes-automatizados/robot_framework

# Execução completa com geração de relatórios HTML e logs XML
robot --outputdir results/ tests/

# Execução de uma suite específica
robot --outputdir results/ tests/nome_da_suite.robot
```

> Relatórios gerados automaticamente: `results/report.html`, `results/log.html`, `results/output.xml`.

### 📡 Postman CLI (API)

```bash
cd api-testing/collection

# Execução automatizada headless da coleção completa (19 CTs)
postman collection run QA_Teste_API.postman_collection.json
```

> Gera relatório HTML com métricas de tempo, status, falhas e throughput — ideal para integração com pipelines de CI/CD.

---

## 📚 Documentação de Apoio

A documentação é organizada em **dois núcleos independentes**, cada um com 6 documentos `.md` e 1 planilha Excel de controle executivo:

### UI Testing — `ui-testing/docs/`

| Documento | Conteúdo |
|-----------|----------|
| [`ui-testing/docs/01-plano-de-testes.md`](ui-testing/docs/01-plano-de-testes.md) | Estratégia, escopo, critérios de entrada/saída e ambientes |
| [`ui-testing/docs/02-bdd-cenarios.md`](ui-testing/docs/02-bdd-cenarios.md) | Cenários BDD em Gherkin (PT-BR) para CT01–CT10 |
| [`ui-testing/docs/03-casos-de-teste.md`](ui-testing/docs/03-casos-de-teste.md) | Detalhamento passo a passo com pré-condições, dados e resultados esperados |
| [`ui-testing/docs/04-analise-de-bugs.md`](ui-testing/docs/04-analise-de-bugs.md) | Documentação completa dos 6 bugs identificados |
| [`ui-testing/docs/05-analise-de-riscos.md`](ui-testing/docs/05-analise-de-riscos.md) | Matriz de riscos com 8 itens (Probabilidade × Impacto) |
| [`ui-testing/docs/06-sugestoes-melhoria.md`](ui-testing/docs/06-sugestoes-melhoria.md) | Sugestões técnicas e de UX |
| [`ui-testing/docs/Planilha de Controle de Testes - Sauce Demo.xlsx`](ui-testing/docs/Planilha%20de%20Controle%20de%20Testes%20-%20Sauce%20Demo.xlsx) | Controle executivo com status, datas, responsável e resumo |

### API Testing — `api-testing/docs/`

| Documento | Conteúdo |
|-----------|----------|
| [`api-testing/docs/01-plano-de-testes-api.md`](api-testing/docs/01-plano-de-testes-api.md) | Estratégia e escopo de testes da API |
| [`api-testing/docs/02-bdd-cenarios-api.md`](api-testing/docs/02-bdd-cenarios-api.md) | Cenários BDD (Gherkin) para CTAPI01–CTAPI19 |
| [`api-testing/docs/03-casos-de-teste-api.md`](api-testing/docs/03-casos-de-teste-api.md) | Detalhamento passo a passo de cada caso de teste de API |
| [`api-testing/docs/04-analise-de-bugs-api.md`](api-testing/docs/04-analise-de-bugs-api.md) | 4 bugs documentados com severidade e passos de reprodução |
| [`api-testing/docs/05-analise-de-riscos-api.md`](api-testing/docs/05-analise-de-riscos-api.md) | Matriz de riscos da API |
| [`api-testing/docs/06-sugestoes-melhoria-api.md`](api-testing/docs/06-sugestoes-melhoria-api.md) | Sugestões de melhoria no serviço REST |
| [`api-testing/docs/Planilha de Controle de Testes de API.xlsx`](api-testing/docs/Planilha%20de%20Controle%20de%20Testes%20de%20API.xlsx) | Controle executivo com status, datas, responsável e resumo |

---

## 🏗 Metodologias e Padrões Aplicados

### Ciclo Completo de QA

1. **Planejamento** — Definição de escopo, critérios de aceite e ambientes
2. **Especificação BDD** — Cenários em linguagem natural técnica (Gherkin) documentados em `02-bdd-cenarios*.md`
3. **Execução Manual** — Testes interativos com registro de evidências visuais (GIFs, vídeos, PNGs, prints Postman) e planilhas de controle
4. **Análise de Bugs** — Documentação de defeitos com severidade, passos de reprodução e usuários afetados
5. **Mapeamento de Riscos** — Matriz Probabilidade × Impacto com mitigações
6. **Sugestões de Melhoria** — Propostas técnicas e de UX
7. **Automação de Regressão** — Cenários críticos automatizados em **Cypress**, **Robot Framework** e **Postman CLI** para validação contínua

### Padrões Técnicos nas Automações

| Framework | Padrão / Técnica | Descrição |
|-----------|-----------------|-----------|
| **Cypress** | E2E Headless/Headed | Execução em modo visual e CI/CD com geração automática de screenshots, videos e relatórios HTML |
| **Cypress** | **Commands Customizados** | Comandos reutilizáveis em `support/commands.js` para abstração de ações repetitivas (login, navegação, asserções) |
| **Cypress** | **Fixtures** | Massa de dados externalizada em arquivos JSON em `cypress/fixtures/`, permitindo reuso e manutenção centralizada |
| **Robot Framework** | **BDD + Selenium** | Especificação Gherkin integrada à automação, com keywords customizadas, variáveis globais e relatórios HTML/XML |
| **Robot Framework** | **Page Object Model (POM)** | Separação de responsabilidades entre páginas (locators), ações (keywords) e fluxos de teste (suites `.robot`), garantindo manutenibilidade e reuso |
| **Postman** | Schema Validation (tv4) | Validação estrutural automática de respostas JSON contra schema definido, garantindo contrato da API |
| **Postman** | Variáveis de Coleção | Externalização de tokens, bookingIds e dados dinâmicos, simulando fluxos reais de usuário entre requests |
| **Postman** | Testes de Performance | Carga com 2 VUs por 1 minuto e testes de concorrência, com relatório HTML de throughput e latência |

### Critérios de Teste Aplicados

- **Funcional** — Validação de regras de negócio (login, carrinho, checkout, CRUD de reservas)
- **Usabilidade** — Facilidade de navegação e clareza de mensagens
- **Performance** — Tempo de resposta perceptível ao usuário e métricas de throughput/latência sob carga
- **Segurança** — Tratamento de credenciais inválidas, acesso não autorizado, SQL Injection e payload malformado
- **Acessibilidade** — Contraste de cores e compatibilidade com recursos assistivos
- **Responsividade** — Adaptação de layout em múltiplas resoluções
- **Contrato** — Validação de schema JSON e consistência de campos obrigatórios/tipos de dados

---

## 📝 Nota sobre Documentação

A lógica de negócios, criação dos casos de teste, automação, execução manual e validação dos resultados foram desenvolvidas integralmente pelo autor. A estruturação, formatação e revisão textual desta documentação contaram com o auxílio de assistentes de IA, utilizados como ferramenta de produtividade para garantir clareza e padronização, sob **total supervisão e curadoria técnica do autor**.

---

## 👤 Autoria

<div align="center">

**Hebert Pezzoti da Silva**

🔗 [linkedin.com/in/hebertpezzoti](https://www.linkedin.com/in/hebertpezzoti)  
📧 hebertpezzoti@hotmail.com

*Este projeto é uma demonstração técnica de competências em Qualidade de Software. Todo o conteúdo de testes, evidências, automação e documentação foi produzido e validado pelo autor.*

</div>

---

## 🏷️ Tags

`#qa` `#quality-assurance` `#testes-de-software` `#software-testing` `#automation-testing` `#testes-automatizados` `#cypress` `#robot-framework` `#selenium` `#bdd` `#gherkin` `#postman` `#api-testing` `#rest-api` `#json-schema` `#e2e-testing` `#ui-testing` `#regression-testing` `#testes-manuais` `#manual-testing` `#bug-report` `#risk-analysis` `#test-plan` `#portfolio-qa` `#javascript` `#python` `#linux` `#chromium` `#ci-cd` `#performance-testing` `#load-testing` `#security-testing` `#accessibility-testing` `#responsive-design` `#restful-booker` `#sauce-demo`
