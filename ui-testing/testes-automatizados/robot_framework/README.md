# 🤖 Robot Framework — Automação de Testes E2E (UI)

## Sobre esta Suite

Esta suite de automação cobre **10 cenários end-to-end** do site [Sauce Demo](https://www.saucedemo.com/), executados com **Robot Framework** em ambiente Linux. A abordagem combina **BDD (Behavior-Driven Development)** em português, **Page Object Model (POM)** para manutenibilidade, e **gravação de vídeos + screenshots automáticos** para evidências.

Os testes validam funcionalidades críticas de e-commerce — desde autenticação até fluxo de compra completo — incluindo validações de usabilidade, responsividade visual e acessibilidade.

---

## 🧪 Cenários Automatizados

| CT | Cenário | Status |
|:---|:---|:---|
| **CT01** | Login com Sucesso — Standard User | ✅ Passou |
| **CT02** | Login de Usuário Bloqueado — Locked Out User | ✅ Passou |
| **CT03** | Login de Usuário Inexistente | ✅ Passou |
| **CT04** | Ordenação de Produtos (A → Z / Z → A) | ❌ Falhou |
| **CT05** | Fluxo Completo de Compra | ✅ Passou |
| **CT06** | Remoção de Itens do Carrinho | ❌ Falhou |
| **CT07** | Navegação entre Páginas | ❌ Falhou |
| **CT08** | Execução de Logout | ✅ Passou |
| **CT09** | Teste Visual — Responsividade Multi-Viewport | ❌ Falhou |
| **CT10** | Acessibilidade — Contraste de Tela | ❌ Falhou |

> **Resumo:** 5 passaram / 5 falharam — os 5 cenários com falha correspondem aos **bugs identificados** na fase de testes manuais, confirmando reprodutibilidade dos defeitos via automação.

---

## 🛠 Stack Tecnológica

| Camada | Ferramenta / Biblioteca | Função |
|:---|:---|:---|
| **Framework** | Robot Framework | Orquestração de testes e geração de relatórios |
| **Automação Web** | SeleniumLibrary | Interação com elementos da UI via WebDriver |
| **Gravação de Vídeo** | ScreenCapLibrary | Captura de execução em MP4 para evidências |
| **Bibliotecas Auxiliares** | Collections, DateTime, OperatingSystem | Manipulação de dados, timestamps e sistema |
| **Linguagem** | Python 3 | Base de execução do Robot Framework |
| **Navegador** | Chromium 126 | Execução headed (Gráfica) |
| **Ambiente** | Linux Mint 22.3 | Sistema operacional de execução |
| **Metodologia** | BDD (Gherkin em PT-BR) | Legibilidade para stakeholders técnicos e de negócio |
| **Padrão de Projeto** | Page Object Model (POM) | Separação de responsabilidades entre testes e páginas |

---

## 📁 Estrutura do Diretório

```
robot_framework/
├── README.md                          # ← Você está aqui
├── resources/
│   ├── main.robot                     # Configurações globais, imports e keywords compartilhadas
│   ├── pages/
│   │   ├── login_page.robot           # Elementos e ações da página de login
│   │   └── inventory_page.robot       # Elementos e ações da página de produtos/carrinho
│   └── shared/
│       ├── massa_dados.robot          # Variáveis de usuários, senhas e dados de teste
│       └── setup_teardown.robot       # Keywords de inicialização e finalização de sessão
├── testes/
│   ├── CT01 - Login com Sucesso Standard User.robot
│   ├── CT02 - Login de Usuário Bloqueado Locked Out.robot
│   ├── CT03 - Login de Usuário Inexistente.robot
│   ├── CT04 - Ordenação de Produtos A to Z e Z to A.robot
│   ├── CT05 - Fluxo Completo de Compra.robot
│   ├── CT06 - Remoção de Itens do Carrinho.robot
│   ├── CT07 - Navegação entre Páginas.robot
│   ├── CT08 - Execução de Logout.robot
│   ├── CT09 - Teste Visual.robot
│   └── CT10 - Acessibilidade.robot
└── results/
    ├── log.html                       # Log detalhado da execução (nível de keyword)
    ├── report.html                    # Relatório consolidado da suite
    ├── output.xml                     # Saída XML padrão do Robot Framework
    ├── screenshots/                   # Capturas automáticas em caso de falha
    └── videos/                        # Gravações MP4 da execução de cada teste
```

---

## 🚀 Como Executar

### Pré-requisitos

- Python 3.x instalado
- Navegador Chromium (ou Chrome)
- WebDriver compatível no `PATH`

### Instalação das dependências

```bash
pip install robotframework seleniumlibrary robotframework-screencaplibrary
```

### Execução da suite completa

```bash
cd ui-testing/testes-automatizados/robot_framework
robot testes/
```

### Execução de um caso específico

```bash
robot testes/CT01\ -\ Login\ com\ Sucesso\ Standard\ User.robot
```

### Execução headless (sem interface gráfica)

A configuração de headless está parametrizada nos arquivos de setup. Para forçar headless via CLI:

```bash
robot --variable BROWSER:headlesschrome testes/
```

---

## 🎬 Evidências e Relatórios

Esta suite gera **4 camadas de evidência** para total rastreabilidade:

### 1. Relatórios HTML Interativos
- **[`results/log.html`](results/log.html)** — Log passo a passo de cada keyword executada
- **[`results/report.html`](results/report.html)** — Visão consolidada da suite com estatísticas de passo/falha
- **[`results/output.xml`](results/output.xml)** — Saída estruturada para integração com CI/CD

### 2. Vídeos de Execução
- Local: [`results/videos/`](results/videos/)
- Formato: MP4
- Um vídeo por caso de teste, gerado automaticamente pela ScreenCapLibrary

### 3. Screenshots de Falha
- Local: [`results/screenshots/`](results/screenshots/)
- Captura automática do navegador no momento exato da falha

### 4. Massa de Dados Externalizada
- Arquivo: [`resources/shared/massa_dados.robot`](resources/shared/massa_dados.robot)
- Usuários, senhas e cenários parametrizados para fácil manutenção

---

## 🏗 Padrões de Arquitetura Aplicados

### BDD — Gherkin em Português
Cada caso de teste é escrito em linguagem natural técnica, facilitando a leitura por recrutadores e líderes de QA:

```robot
*** Test Cases ***
CT01 - Login com Sucesso Standard User
    Dado que estou na página de login do Sauce Demo
    Quando insiro o usuário "standard_user" e senha "secret_sauce"
    E clico no botão de login
    Então sou redirecionado para a página de produtos
```

### Page Object Model (POM)
A lógica de interação com a UI está isolada em arquivos dedicados por página:
- **`login_page.robot`** — Localizadores e ações de autenticação
- **`inventory_page.robot`** — Localizadores e ações do catálogo/carrinho

Isso garante que uma mudança no layout do site exija alteração em **apenas um arquivo**, não em 10 suites.

### Setup / Teardown Centralizado
- **`setup_teardown.robot`** — Abertura do navegador, definição de viewport, timer de performance
- Cada teste herda `Abrir Navegador` no setup e `Fechar Navegador` no teardown

### Medições de Performance
Keywords customizadas capturam timestamps (`epoch`) para medir tempo de carregamento de página e navegação, evidenciando lentidão quando presente.

---

## 📝 Nota sobre Documentação

A lógica de negócios, criação dos casos de teste, automação e validação dos resultados foram desenvolvidas integralmente pelo autor. A estruturação, formatação e revisão textual desta documentação contaram com o auxílio de assistentes de IA, utilizados como ferramenta de produtividade para melhoria gramatical, apresentação, assertividade e agilidade, sob **total supervisão e curadoria técnica do autor**.

---

## 👤 Autoria

**Hebert Pezzoti**  
🔗 [linkedin.com/in/hebertpezzoti](https://www.linkedin.com/in/hebertpezzoti)  
📧 hebertpezzoti@hotmail.com

---

*Este projeto é uma demonstração técnica de competências em Qualidade de Software. Todo o conteúdo de testes, código e evidências foi produzido e validado manualmente pelo autor.*
