<div align="center">

# 🎯 Projeto de Portfólio QA
### Demonstração de Competências Técnicas em Qualidade de Software

[![Cypress](https://img.shields.io/badge/Cypress-17202C?style=for-the-badge&logo=cypress&logoColor=white)](https://www.cypress.io/)
[![Robot Framework](https://img.shields.io/badge/Robot%20Framework-000000?style=for-the-badge&logo=robot-framework&logoColor=white)](https://robotframework.org/)
[![Selenium](https://img.shields.io/badge/Selenium-43B02A?style=for-the-badge&logo=selenium&logoColor=white)](https://www.selenium.dev/)
[![BDD](https://img.shields.io/badge/BDD-Gherkin-23D96C?style=for-the-badge&logo=cucumber&logoColor=white)]()
[![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript)
[![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)
[![Linux](https://img.shields.io/badge/Linux_Mint-87CF3E?style=for-the-badge&logo=linux&logoColor=black)](https://linuxmint.com/)
[![Chromium](https://img.shields.io/badge/Chromium-4285F4?style=for-the-badge&logo=google-chrome&logoColor=white)](https://www.chromium.org/)

</div>

---

## 📌 Sobre o Projeto

Este repositório é uma **demonstração técnica completa** de competências em Qualidade de Software, estruturado como um projeto de portfólio profissional. A abordagem é **híbrida e estratificada**: integra testes manuais interativos com evidências visuais, automação de regressão em múltiplos frameworks e documentação executiva robusta — tudo aplicado ao site [Sauce Demo](https://www.saucedemo.com/), um e-commerce de demonstração amplamente utilizado como alvo de estudo em QA.

> **Objetivo:** Demonstrar domínio do ciclo completo de Qualidade de Software — do planejamento estratégico à execução manual, da especificação BDD à automação de ponta a ponta, da análise de bugs ao mapeamento de riscos — com total rastreabilidade entre requisitos, evidências e defeitos.

---

## 🛠 Stack Tecnológica

| Camada | Ferramentas / Tecnologias |
|--------|---------------------------|
| **Automação UI (JavaScript)** | Cypress — testes E2E com relatórios, screenshots e videos |
| **Automação UI (Python)** | Robot Framework + SeleniumLibrary + BDD (Gherkin) — testes E2E com relatórios HTML/XML |
| **Linguagens** | JavaScript, Python |
| **Navegador** | Chromium 126 |
| **Ambiente de Execução** | Linux Mint 22.3 (execuções Headless e Headed) |
| **Metodologia** | BDD (Behavior-Driven Development) |
| **Evidências** | GIFs animados, vídeos, PNGs comparativos, relatórios HTML/XML |

---

## 📦 Módulos do Portfólio

| Módulo | Tecnologias | Escopo | Status |
|--------|-------------|--------|--------|
| **UI Testing — Testes Manuais** | Chromium 126, Linux Mint 22.3 | 10 casos de teste interativos (funcional, usabilidade, performance, segurança, acessibilidade, responsividade) | 5 ✅ Passaram / 5 ❌ Falharam |
| **UI Testing — Cypress** | Cypress, JavaScript | Automação E2E dos cenários críticos identificados nos testes manuais | ✅ Executável |
| **UI Testing — Robot Framework** | Robot Framework, Selenium, Python, BDD/Gherkin | Automação E2E dos cenários críticos com especificação BDD | ✅ Executável |

---

## 📊 Métricas e Resultados de Destaque

<div align="center">

| Indicador | Valor |
|-----------|-------|
| 🧪 Casos de Teste Manuais | **10** |
| ✅ Passaram | **5** |
| ❌ Falharam | **5** |
| 🐛 Bugs Documentados | **6** (com severidade, passos de reprodução e evidências) |
| ⚠️ Riscos Mapeados | **8** (matriz Probabilidade × Impacto) |
| 🤖 Frameworks de Automação | **2** (Cypress + Robot Framework) |
| 📄 Documentos de Apoio | **6** arquivos `.md` + **1** planilha Excel de controle |
| 🔗 Rastreabilidade | BDD → Caso de Teste → Bug → Evidência → Automação |

</div>

---

## 📁 Estrutura do Repositório

```
projeto-qa/
│
├── ui-testing/
│   ├── docs/                                    # Documentação de apoio
│   │   ├── 01-plano-de-testes.md
│   │   ├── 02-bdd-cenarios.md
│   │   ├── 03-casos-de-teste.md
│   │   ├── 04-analise-de-bugs.md
│   │   ├── 05-analise-de-riscos.md
│   │   ├── 06-sugestoes-melhoria.md
│   │   └── Planilha de Controle de Testes - Sauce Demo.xlsx
│   │
│   ├── testes-manuais/                          # 10 CTs manuais com evidências
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
│   │   ├── cypress/                             # Projeto Cypress completo
│   │   │   ├── cypress/
│   │   │   │   ├── e2e/                       # Specs de teste
│   │   │   │   ├── fixtures/                  # Massa de dados
│   │   │   │   └── support/                   # Comandos customizados
│   │   │   ├── cypress.config.js
│   │   │   ├── package.json
│   │   │   └── README.md
│   │   │
│   │   └── robot_framework/                     # Projeto Robot Framework completo
│   │       ├── resources/
│   │       │   ├── keywords.robot             # Keywords customizadas
│   │       │   └── variables.robot            # Variáveis globais
│   │       ├── tests/
│   │       │   └── *.robot                    # Suites de teste BDD
│   │       ├── results/                       # Relatórios e logs
│   │       └── README.md
│   │
│   └── README.md                                # Visão geral do módulo UI
│
└── README.md                                    # ← Você está aqui
```

> A estrutura acima reflete o estado real do repositório. Nenhuma pasta ou arquivo foi inventado.

---

## 🚀 Como Executar

### 🔷 Cypress

```bash
cd ui-testing/testes-automatizados/cypress

# Modo interativo (headed — abre o Test Runner)
npx cypress open

# Modo headless (CI/CD — gera videos, screenshots e relatórios)
npx cypress run
```

> Relatórios, screenshots e videos em `cypress/screenshots/`, `cypress/videos/` e `cypress/reports/`.

### 🤖 Robot Framework

```bash
cd ui-testing/testes-automatizados/robot_framework

# Execução completa com geração de relatórios HTML e logs XML
robot --outputdir results/ tests/

# Execução de uma suite específica
robot --outputdir results/ tests/nome_da_suite.robot
```

> Relatórios `report.html` e `log.html` gerados automaticamente em `results/`.

---

## 📚 Documentação de Apoio

A documentação centralizada em `ui-testing/docs/` sustenta todas as frentes de teste, garantindo **única fonte de verdade**:

| Documento | Conteúdo |
|-----------|----------|
| [`ui-testing/docs/01-plano-de-testes.md`](ui-testing/docs/01-plano-de-testes.md) | Estratégia, escopo, critérios de entrada/saída e ambientes |
| [`ui-testing/docs/02-bdd-cenarios.md`](ui-testing/docs/02-bdd-cenarios.md) | Cenários BDD em Gherkin (PT-BR) para CT01–CT10 |
| [`ui-testing/docs/03-casos-de-teste.md`](ui-testing/docs/03-casos-de-teste.md) | Detalhamento passo a passo com pré-condições, dados e resultados esperados |
| [`ui-testing/docs/04-analise-de-bugs.md`](ui-testing/docs/04-analise-de-bugs.md) | Documentação completa dos 6 bugs identificados |
| [`ui-testing/docs/05-analise-de-riscos.md`](ui-testing/docs/05-analise-de-riscos.md) | Matriz de riscos com 8 itens (Probabilidade × Impacto) |
| [`ui-testing/docs/06-sugestoes-melhoria.md`](ui-testing/docs/06-sugestoes-melhoria.md) | Sugestões técnicas e de UX |
| [`ui-testing/docs/Planilha de Controle de Testes - Sauce Demo.xlsx`](ui-testing/docs/Planilha%20de%20Controle%20de%20Testes%20-%20Sauce%20Demo.xlsx) | Controle executivo com status, datas, responsável e resumo |

---

## 🏗 Metodologia Aplicada

### Ciclo Completo de QA

1. **Planejamento** — Definição de escopo, critérios de aceite e ambientes (`01-plano-de-testes.md`)
2. **Especificação BDD** — Cenários em linguagem natural técnica (Gherkin) documentados em `02-bdd-cenarios.md`
3. **Execução Manual** — Testes interativos com registro de evidências visuais (GIFs, vídeos, PNGs) e planilha de controle
4. **Análise de Bugs** — Documentação de defeitos com severidade, passos de reprodução e usuários afetados (`04-analise-de-bugs.md`)
5. **Mapeamento de Riscos** — Matriz Probabilidade × Impacto com mitigações (`05-analise-de-riscos.md`)
6. **Sugestões de Melhoria** — Propostas técnicas e de UX (`06-sugestoes-melhoria.md`)
7. **Automação de Regressão** — Cenários críticos automatizados em **Cypress** e **Robot Framework** para validação contínua

### Critérios de Teste Aplicados

- **Funcional** — Validação de regras de negócio (login, carrinho, checkout)
- **Usabilidade** — Facilidade de navegação e clareza de mensagens
- **Performance** — Tempo de resposta perceptível ao usuário
- **Segurança** — Tratamento de credenciais inválidas e acesso não autorizado
- **Acessibilidade** — Contraste de cores e compatibilidade com recursos assistivos
- **Responsividade** — Adaptação de layout em múltiplas resoluções

---

## 📝 Nota sobre Documentação

A lógica de negócios, criação dos casos de teste, automação, execução manual e validação dos resultados foram desenvolvidas integralmente pelo autor. A estruturação, formatação e revisão textual desta documentação contaram com o auxílio de assistentes de IA, utilizados como ferramenta de produtividade para garantir clareza e padronização, sob **total supervisão e curadoria técnica do autor**.

---

## 👤 Autoria

<div align="center">

**Hebert Pezzoti Pezzoti da Silva**

🔗 [linkedin.com/in/hebertpezzoti](https://www.linkedin.com/in/hebertpezzoti)  
📧 hebertpezzoti@hotmail.com

*Este projeto é uma demonstração técnica de competências em Qualidade de Software. Todo o conteúdo de testes, evidências, automação e documentação foi produzido e validado pelo autor.*

</div>
