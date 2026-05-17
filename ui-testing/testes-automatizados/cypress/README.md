# Testes Automatizados com Cypress – Sauce Demo

Este diretório contém os scripts de automação dos testes funcionais e de interface do site **Sauce Demo**, utilizando o framework **Cypress**. Os cenários automatizados são exatamente os mesmos 10 casos de teste definidos nos testes manuais (CT01 a CT10).

## 📌 Premissas

- Os testes foram desenvolvidos com base nos casos de teste manuais (planilha de controle de testes).
- Cada script automatizado corresponde a um CT (ex.: `CT01 - Login com Sucesso Standard User.cy.js`).
- O ambiente alvo é a URL `https://www.saucedemo.com/`.
- Os testes podem ser executados em modo headless (linha de comando) ou interativo (com navegador).

## 🛠️ Ferramentas utilizadas

- **Cypress** (versão 13+) – framework de testes end-to-end.
- **Node.js** (versão 18+) – ambiente de execução.
- **Mochawesome** – geração de relatórios HTML (via `cypress-mochawesome-reporter`).
- **Git** – versionamento dos scripts e evidências.

## 🔧 Preparação do ambiente (Linux)

### 1. Python (ambiente virtual – opcional)

Caso queira isolar dependências Python (alguns projetos utilizam), crie e ative um ambiente virtual:

    sudo apt install python3-venv -y
    cd ~/diretorio_aqui   # ajuste o caminho para seu projeto
    python3 -m venv venv
    source venv/bin/activate
    # Para desativar depois: deactivate

### 2. Instalar Node.js (versão LTS 20.x)

Caso ainda não tenha Node.js instalado:

    curl -fsSL https://deb.nodesource.com/setup_20.x | sudo bash -
    sudo apt install -y nodejs

Verifique as versões:

    node -v
    npm -v

### 3. Instalar o Cypress e dependências

No diretório do projeto de automação (ex.: `ui-testing/testes-automatizados/cypress/`), execute:

    npm init -y               # cria package.json (se não existir)
    npm install cypress --save-dev
    npm install --save-dev cypress-mochawesome-reporter

## 🔧 Preparação do ambiente (Windows)

### 1. Instalar Node.js

- Baixe o instalador LTS (versão 20.x) em [nodejs.org](https://nodejs.org/).
- Execute o instalador e siga as instruções (marque a opção de adicionar ao PATH).
- Abra o **Prompt de Comando** ou **PowerShell** e verifique:

    node -v
    npm -v

### 2. Instalar o Cypress e dependências

No diretório do projeto de automação, execute:

    npm init -y
    npm install cypress --save-dev
    npm install --save-dev cypress-mochawesome-reporter

## ▶️ Como executar os testes

### Abrir o Cypress no modo interativo (com navegador)

    npx cypress open

### Executar todos os testes em modo headless (linha de comando)

    npx cypress run

- Os relatórios HTML (Mochawesome) serão gerados na pasta `cypress/reports/`.
- Vídeos das execuções ficam em `cypress/videos/`.
- Screenshots de falhas ficam em `cypress/screenshots/`.

## 🧪 Estrutura dos testes

Os scripts estão organizados na pasta `cypress/e2e/` e seguem a nomenclatura:

    CT01 - Login com Sucesso Standard User.cy.js
    CT02 - Login de Usuário Bloqueado Locked Out.cy.js
    CT03 - Login de Usuário Inexistente.cy.js
    CT04 - Ordenação de Produtos A to Z e Z to A.cy.js
    CT05 - Fluxo Completo de Compra.cy.js
    CT06 - Remoção de Itens do Carrinho.cy.js
    CT07 - Navegação entre Páginas.cy.js
    CT08 - Execução de Logout.cy.js
    CT09 - Teste Visual.cy.js
    CT10 - Acessibilidade.cy.js

Cada script reproduz fielmente os passos descritos nos testes manuais, utilizando os mesmos dados de teste (`standard_user`, `locked_out_user`, `problem_user`, `performance_glitch_user`, `error_user` e `caramelo`).

## 📊 Resultados da última execução (resumo)

| Caso | Cenário                                 | Status (Automação) | Observação                                               |
|------|-----------------------------------------|--------------------|----------------------------------------------------------|
| CT01 | Login com sucesso                       | ✅ Passou          | Redirecionamento e validação OK                          |
| CT02 | Login usuário bloqueado                 | ✅ Passou          | Mensagem de erro correta                                 |
| CT03 | Login usuário inexistente               | ✅ Passou          | Mensagem de erro correta                                 |
| CT04 | Ordenação de produtos (A-Z / Z-A)       | ❌ Falhou          | Mesmo bug do manual: ordenação não funciona + imagens erradas |
| CT05 | Fluxo completo de compra                | ✅ Passou          | Checkout finalizado com sucesso                          |
| CT06 | Remoção de itens do carrinho            | ❌ Falhou          | Bug reproduzido: botão "Remove" não funciona             |
| CT07 | Navegação entre páginas                 | ❌ Falhou          | Lentidão notável (reproduzido)                           |
| CT08 | Logout                                  | ✅ Passou          | Sessão encerrada corretamente                            |
| CT09 | Teste visual (responsividade)           | ❌ Falhou          | Desalinhamento de elementos (reproduzido)                |
| CT10 | Acessibilidade (contraste de tela)      | ❌ Falhou          | Opção de contraste não encontrada (reproduzido)          |

> Vídeos das execuções podem ser encontrados em `cypress/videos/` e capturas de tela de falhas em `cypress/screenshots/`.

## 🔁 Relação com os testes manuais

- Todos os cenários falhos na automação **já haviam sido identificados nos testes manuais**, confirmando a consistência entre as duas abordagens.
- A planilha de controle de testes manuais continua sendo a **fonte primária** dos passos e resultados detalhados.

## 📁 Artefatos gerados

| Tipo          | Local                                        |
|---------------|----------------------------------------------|
| Relatório HTML| `cypress/reports/`                           |
| Vídeos        | `cypress/videos/`                            |
| Screenshots   | `cypress/screenshots/`                       |
| Código fonte  | `cypress/e2e/`                               |

## 🧹 Limpeza de artefatos

**Linux / macOS:**

    rm -rf cypress/reports/* cypress/videos/* cypress/screenshots/*

**Windows (PowerShell):**

    Remove-Item -Recurse -Force cypress/reports/*, cypress/videos/*, cypress/screenshots/*

## 📝 Observações finais

- Os testes foram escritos e executados no ambiente **Linux Mint 22.3, Chromium 126**.
- A automação utiliza os mesmos dados de teste e validações descritos nos casos manuais.
- O relatório Mochawesome pode ser visualizado diretamente no navegador e anexado como evidência.
- Para maiores detalhes sobre os cenários, consulte a documentação dos testes manuais em `ui-testing/docs/`.

---