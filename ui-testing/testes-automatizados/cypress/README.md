# ⚡ Cypress — Automação de Testes E2E (UI)

## Sobre esta Suite

Esta suite de automação cobre **10 cenários end-to-end** do site [Sauce Demo](https://www.saucedemo.com/) utilizando **Cypress** em ambiente Linux. A abordagem combina **JavaScript moderno**, **Custom Commands** para reutilização de código, **Fixtures** para externalização de massa de dados, e **relatórios visuais interativos** via Mochawesome.

Os testes validam funcionalidades críticas de e-commerce — desde autenticação até fluxo de compra completo — incluindo validações de usabilidade, responsividade visual e acessibilidade, com execução tanto em modo **headed (interativo)** quanto **headless (CI/CD)**.

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
| **Framework** | Cypress ^15.15.0 | Orquestração, execução e debugging de testes E2E |
| **Reporter** | cypress-mochawesome-reporter ^4.0.2 | Geração de relatórios HTML/JSON interativos |
| **Linguagem** | JavaScript (ES6+) | Escrita dos specs e custom commands |
| **Navegador** | Chromium 126 | Execução headed (interativa) e headless |
| **Ambiente** | Linux Mint 22.3 / Node.js 20.x LTS | Sistema operacional e runtime |
| **Metodologia** | E2E End-to-End | Validação de fluxos completos do usuário |
| **Padrões** | Custom Commands + Fixtures | Reutilização de código e externalização de dados |

---

## 📁 Estrutura do Diretório

```
cypress/
├── README.md                          # ← Você está aqui
├── cypress.config.js                  # Configuração global do Cypress
├── package.json                       # Dependências: Cypress + Mochawesome Reporter
└── cypress/
    ├── e2e/                           # 10 specs de teste
    │   ├── CT01 - Login com Sucesso Standard User.cy.js
    │   ├── CT02 - Login de Usuário Bloqueado Locked Out.cy.js
    │   ├── CT03 - Login de Usuário Inexistente.cy.js
    │   ├── CT04 - Ordenação de Produtos A to Z e Z to A.cy.js
    │   ├── CT05 - Fluxo Completo de Compra.cy.js
    │   ├── CT06 - Remoção de Itens do Carrinho.cy.js
    │   ├── CT07 - Navegação entre Páginas.cy.js
    │   ├── CT08 - Execução de Logout.cy.js
    │   ├── CT09 - Teste Visual.cy.js
    │   └── CT10 - Acessibilidade.cy.js
    ├── fixtures/
    │   └── usuarios.json              # Massa de dados: usuários, senhas e perfis
    ├── support/
    │   ├── commands.js                # Custom Commands reutilizáveis
    │   └── e2e.js                     # Configurações globais de execução
    ├── screenshots/                   # Capturas automáticas em caso de falha
    ├── videos/                        # Gravações MP4 da execução de cada spec
    └── reports/                       # Relatórios HTML/JSON do Mochawesome
```

---

## 🚀 Como Executar

### Pré-requisitos

- Node.js 20.x LTS instalado
- Navegador Chromium (ou Chrome)

### Instalação das dependências

```bash
cd ui-testing/testes-automatizados/cypress
npm install
```

### Execução headless (linha de comando / CI)

```bash
npx cypress run
```

- Executa todos os specs em modo headless
- Gera screenshots em falha, vídeos MP4 e relatórios Mochawesome automaticamente

### Execução headed (modo interativo)

```bash
npx cypress open
```

- Abre o Cypress Test Runner para debugging visual
- Permite execução spec por spec com inspeção de DOM em tempo real

### Execução de um spec específico

```bash
npx cypress run --spec "cypress/e2e/CT01 - Login com Sucesso Standard User.cy.js"
```

---

## 🎬 Evidências e Relatórios

Esta suite gera **4 camadas de evidência** para total rastreabilidade:

### 1. Relatórios HTML/JSON Interativos (Mochawesome)
- Local: [`cypress/reports/`](cypress/reports/)
- Formato: HTML responsivo + JSON estruturado
- Inclui: timeline de execução, screenshots embutidos, stack trace de falhas

### 2. Vídeos de Execução
- Local: [`cypress/videos/`](cypress/videos/)
- Formato: MP4
- Um vídeo por spec, gerado automaticamente em execuções headless

### 3. Screenshots de Falha
- Local: [`cypress/screenshots/`](cypress/screenshots/)
- Captura automática no momento exato da falha, com nome do spec e step

### 4. Massa de Dados Externalizada
- Arquivo: [`cypress/fixtures/usuarios.json`](cypress/fixtures/usuarios.json)
- Usuários, senhas e perfis parametrizados para fácil manutenção e reutilização entre specs

---

## 🏗 Padrões de Arquitetura Aplicados

### Custom Commands
Keywords reutilizáveis centralizadas em [`support/commands.js`](cypress/support/commands.js), eliminando duplicação entre specs:

```javascript
// Login parametrizado
Cypress.Commands.add('login', (usuario, senha) => {
    cy.get('[data-test="username"]').type(usuario);
    cy.get('[data-test="password"]').type(senha);
    cy.get('[data-test="login-button"]').click();
});

// Validação de ordenação de produtos
Cypress.Commands.add('validarOrdenacao', (ordem) => { ... });

// Validação de imagens distintas entre produtos
Cypress.Commands.add('validarImagensDistintas', () => { ... });
```

Uso nos specs:
```javascript
cy.login('standard_user', 'secret_sauce');
```

### Fixtures — Massa de Dados
Dados de teste externalizados em JSON para fácil manutenção:

```json
{
  "standard_user": { "usuario": "standard_user", "senha": "secret_sauce" },
  "locked_out_user": { "usuario": "locked_out_user", "senha": "secret_sauce" },
  ...
}
```

Uso nos specs:
```javascript
cy.fixture('usuarios').then((dados) => {
    cy.login(dados.standard_user.usuario, dados.standard_user.senha);
});
```

### Configuração Centralizada
- **`cypress.config.js`** — Define `baseUrl`, timeouts, viewport padrão, e integração com o Mochawesome Reporter
- **`support/e2e.js`** — Importa commands globais e configura comportamentos padrão de execução

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
