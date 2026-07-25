# 🖥️ UI Testing — Portfólio QA

## Sobre este Módulo

Este módulo reúne a demonstração completa de competências em **testes de interface (UI)** aplicados ao site [Sauce Demo](https://www.saucedemo.com/), um e-commerce de demonstração amplamente utilizado como alvo de estudo em Qualidade de Software.

A abordagem é **híbrida e estratificada**: começa com testes manuais interativos para validação perceptiva (layout, usabilidade, performance subjetiva e acessibilidade), evolui para automação de regressão com **Cypress** (JavaScript) e **Robot Framework + Selenium + BDD** (Python), e é sustentada por uma documentação robusta que cobre planejamento, especificação BDD, casos de teste detalhados, análise de bugs, matriz de riscos e sugestões de melhoria.

> **Objetivo:** Demonstrar domínio do ciclo completo de QA — do planejamento à execução manual, da automação à documentação executiva — com total rastreabilidade entre evidências, defeitos e requisitos.

---

## 🛠 Stack Tecnológica

| Camada | Ferramentas / Tecnologias |
|--------|---------------------------|
| **Automação UI (JavaScript)** | Cypress |
| **Automação UI (Python)** | Robot Framework + SeleniumLibrary + BDD (Gherkin) |
| **Linguagens** | JavaScript, Python |
| **Navegador** | Chromium 126 |
| **Ambiente de Execução** | Linux Mint 22.3 (execuções Headless e Headed) |
| **Metodologia** | BDD (Behavior-Driven Development) |
| **Evidências** | GIFs animados, PNGs comparativos, Vídeos, relatórios HTML/XML |

---

## 📁 Estrutura do Diretório

```
ui-testing/
├── docs/                                    # Documentação de apoio
│   ├── 01-plano-de-testes.md
│   ├── 02-bdd-cenarios.md
│   ├── 03-casos-de-teste.md
│   ├── 04-analise-de-bugs.md
│   ├── 05-analise-de-riscos.md
│   ├── 06-sugestoes-melhoria.md
│   └── Planilha de Controle de Testes - Sauce Demo.xlsx
│
├── testes-manuais/                          # 10 CTs manuais com evidências visuais
│   ├── README.md
│   ├── ct01/
│   │   └── ct01.gif
│   ├── ct02/
│   │   └── ct02.gif
│   ├── ct03/
│   │   └── ct03.gif
│   ├── ct04/
│   │   └── ct04.gif
│   ├── ct05/
│   │   └── ct05.gif
│   ├── ct06/
│   │   └── ct06.gif
│   ├── ct07/
│   │   └── ct07.gif
│   ├── ct08/
│   │   └── ct08.gif
│   ├── ct09/
│   │   └── ct09.png
│   └── ct10/
│       └── ct10.gif
│
├── testes-automatizados/
│   ├── cypress/                             # Projeto Cypress completo
│   │   ├── cypress/
│   │   │   ├── e2e/                       # Specs de teste
│   │   │   ├── fixtures/                  # Massa de dados
│   │   │   └── support/                   # Comandos customizados
│   │   ├── cypress.config.js
│   │   ├── package.json
│   │   └── README.md
│   │
│   └── robot_framework/                     # Projeto Robot Framework completo
│       ├── resources/
│       │   ├── keywords.robot             # Keywords customizadas
│       │   └── variables.robot            # Variáveis globais
│       ├── tests/
│       │   └── *.robot                    # Suites de teste BDD
│       ├── results/                       # Relatórios e logs
│       └── README.md
│
└── README.md                                # ← Você está aqui
```

> A estrutura acima reflete o estado real do repositório. Nenhuma pasta ou arquivo foi inventado.

---

## 🔗 Submódulos

Cada submódulo possui seu próprio README com detalhamento técnico, evidências e instruções de execução:

| Submódulo | README | Descrição |
|-----------|--------|-----------|
| **Testes Manuais** | [`./testes-manuais/README.md`](./testes-manuais/README.md) | 10 casos de teste interativos com GIFs/PNGs, bugs documentados e riscos mapeados |
| **Cypress** | [`./testes-automatizados/cypress/README.md`](./testes-automatizados/cypress/README.md) | Automação E2E em JavaScript com relatórios, screenshots e videos |
| **Robot Framework** | [`./testes-automatizados/robot_framework/README.md`](./testes-automatizados/robot_framework/README.md) | Automação E2E em Python com BDD/Gherkin, relatórios HTML e logs XML |

---

## 📊 Documentação de Apoio

A documentação centralizada em [`./docs/`](./docs/) sustenta todas as três frentes de teste (manual, Cypress e Robot Framework), garantindo **única fonte de verdade** para requisitos, cenários e critérios de aceite:

| Documento | Conteúdo |
|-----------|----------|
| [`./docs/01-plano-de-testes.md`](./docs/01-plano-de-testes.md) | Estratégia, escopo, critérios de entrada/saída e ambientes |
| [`./docs/02-bdd-cenarios.md`](./docs/02-bdd-cenarios.md) | Cenários BDD em Gherkin (PT-BR) para CT01–CT10 |
| [`./docs/03-casos-de-teste.md`](./docs/03-casos-de-teste.md) | Detalhamento passo a passo de cada CT com pré-condições, dados e resultados esperados |
| [`./docs/04-analise-de-bugs.md`](./docs/04-analise-de-bugs.md) | Documentação completa dos 6 bugs identificados |
| [`./docs/05-analise-de-riscos.md`](./docs/05-analise-de-riscos.md) | Matriz de riscos com 8 itens mapeados (Probabilidade × Impacto) |
| [`./docs/06-sugestoes-melhoria.md`](./docs/06-sugestoes-melhoria.md) | Sugestões técnicas e de UX para elevação da qualidade |
| [`./docs/Planilha de Controle de Testes - Sauce Demo.xlsx`](./docs/Planilha%20de%20Controle%20de%20Testes%20-%20Sauce%20Demo.xlsx) | Controle executivo com status, datas, responsável e resumo |

---

## 📈 Resumo de Resultados

### Testes Manuais

| Métrica | Valor |
|---------|-------|
| Casos de Teste | 10 |
| Passaram | 5 |
| Falharam | 5 |
| Bugs Documentados | 6 |
| Riscos Mapeados | 8 |

### Automação (Cypress + Robot Framework)

Os mesmos cenários críticos identificados nos testes manuais foram posteriormente automatizados em ambos os frameworks, confirmando **consistência entre as abordagens manual e automatizada**. Os 6 bugs documentados foram reproduzidos via scripts de automação, garantindo rastreabilidade e replicabilidade.

| Framework | Tipo | Status |
|-----------|------|--------|
| Cypress | E2E — JavaScript | ✅ Executável |
| Robot Framework | E2E — Python + BDD | ✅ Executável |

---

## 🚀 Como Executar

### Cypress

Navegue até a pasta do projeto Cypress e execute:

```bash
cd ui-testing/testes-automatizados/cypress

# Modo interativo (headed — abre o Test Runner)
npx cypress open

# Modo headless (CI/CD — gera videos, screenshots e relatórios)
npx cypress run
```

> Os relatórios, screenshots e videos gerados ficam em `cypress/screenshots/`, `cypress/videos/` e `cypress/reports/`.

### Robot Framework

Navegue até a pasta do projeto Robot Framework e execute:

```bash
cd ui-testing/testes-automatizados/robot_framework

# Execução completa com geração de relatórios HTML e logs XML
robot --outputdir results/ tests/

# Execução de uma suite específica
robot --outputdir results/ tests/nome_da_suite.robot
```

> Os relatórios `report.html` e `log.html` são gerados automaticamente dentro de `results/`.

---

## 🏗 Metodologia Aplicada

### Ciclo Completo de QA no Módulo UI

1. **Planejamento** — Definição de escopo, critérios de aceite e ambientes (`01-plano-de-testes.md`)
2. **Especificação BDD** — Cenários em linguagem natural técnica (Gherkin) documentados em `02-bdd-cenarios.md`
3. **Execução Manual** — Testes interativos com registro de evidências visuais e planilha de controle
4. **Análise de Bugs** — Documentação de defeitos com severidade e passos de reprodução (`04-analise-de-bugs.md`)
5. **Mapeamento de Riscos** — Matriz Probabilidade × Impacto com mitigações (`05-analise-de-riscos.md`)
6. **Sugestões de Melhoria** — Propostas técnicas e de UX (`06-sugestoes-melhoria.md`)
7. **Automação de Regressão** — Cenários críticos automatizados em Cypress e Robot Framework para validação contínua

---

## 📝 Nota sobre Documentação

A lógica de negócios, criação dos casos de teste, automação, execução manual e validação dos resultados foram desenvolvidas integralmente pelo autor. A estruturação, formatação e revisão textual desta documentação contaram com o auxílio de assistentes de IA, utilizados como ferramenta de produtividade para garantir clareza e padronização, sob **total supervisão e curadoria técnica do autor**.

---

## 👤 Autoria

**Hebert Pezzoti**  
🔗 [linkedin.com/in/hebertpezzoti](https://www.linkedin.com/in/hebertpezzoti)  
📧 hebertpezzoti@hotmail.com

*Este projeto é uma demonstração técnica de competências em Qualidade de Software. Todo o conteúdo de testes, evidências, automação e documentação foi produzido e validado pelo autor.*
