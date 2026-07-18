# 🤖 Robot Framework - Automação BDD com Python e Selenium

![Robot Framework](https://img.shields.io/badge/Robot%20Framework-7.0+-green)
![Selenium](https://img.shields.io/badge/Selenium-WebDriver-orange)
![Python](https://img.shields.io/badge/Python-3.x-blue)
![BDD](https://img.shields.io/badge/BDD-Gherkin-purple)
![Linux](https://img.shields.io/badge/Linux-Mint_22.3-yellow)

## 📋 Sobre o Módulo

Este módulo contém a suíte de testes End-to-End (E2E) implementada com **Robot Framework**, focada em legibilidade de negócios, manutenção escalável e geração rica de evidências visuais. A automação foi desenvolvida para validar o fluxo completo da aplicação Sauce Demo, utilizando **Behavior-Driven Development (BDD)** com linguagem Gherkin (Dado/Quando/Então) para tornar os casos de teste compreensíveis tanto para técnicos quanto para stakeholders de negócio.

A arquitetura segue o padrão **Page Object Model (POM)** para separar a lógica de interação com o DOM dos casos de teste, garantindo máxima reutilização e manutenibilidade. A execução é realizada em **modo GUI (Interface)** para maximizar a geração de evidências visuais em vídeo via ScreenCapLibrary.

---

## 🔗 Rastreabilidade e Documentação

Os scripts de automação deste módulo são a implementação técnica direta dos cenários documentados na pasta `documentation/` (Planilha de Controle de Testes - Sauce Demo).

Isso garante que:
- Cada arquivo de teste (`.robot`) possui um Caso de Teste (CT) manual correspondente e validado (ex: `CT01` a `CT10`).
- As evidências de falhas ou sucessos estão vinculadas ao ID do caso de teste.
- A lógica de negócio foi validada manualmente antes de ser escalada via automação.

---

## 🛠️ Stack Tecnológica do Módulo

### Frameworks e Bibliotecas
- **Robot Framework:** Framework de aceitação baseado em Python para automação BDD.
- **SeleniumLibrary:** Biblioteca para automação de navegadores via WebDriver.
- **ScreenCapLibrary:** Geração automática de vídeos das execuções para evidências visuais completas.
- **Python 3:** Ambiente de execução com isolamento de dependências via `venv`.

### Arquitetura e Metodologia
- **Behavior-Driven Development (BDD):** Uso da linguagem Gherkin (Dado/Quando/Então) para legibilidade de negócios.
- **Page Object Model (POM):** Separação de seletores e lógica de página para manutenibilidade e reutilização.
- **Execução GUI (Interface):** Foco em evidência visual e debug em tempo real.

---

## 🚀 Destaques de Engenharia

- **Relatórios HTML Nativos e Ricos:** O Robot Framework gera automaticamente dois relatórios HTML completos após cada execução:
  - `log.html`: Log detalhado passo a passo com screenshots embutidos.
  - `report.html`: Visão geral dos resultados com estatísticas e gráficos.
- **Evidências em Vídeo:** Gravação automática de vídeo de todas as execuções via ScreenCapLibrary, permitindo auditoria visual completa de cada teste.
- **BDD com Gherkin:** Casos de teste escritos em linguagem natural (Dado/Quando/Então), facilitando a comunicação entre técnicos e negócios.
- **Page Object Model (POM):** Keywords reutilizáveis organizadas em arquivos separados, evitando duplicação de código e facilitando manutenção.
- **Ambiente Isolado:** Uso de `venv` para garantir que as dependências do projeto não conflitem com o sistema operacional.

---

## 📁 Estrutura de Pastas

    robot_framework/
    ├── testes/                 # Casos de teste (.robot) em linguagem Gherkin
    │   ├── CT01 - Login com Sucesso Standard User.robot
    │   ├── CT02 - Login de Usuário Bloqueado.robot
    │   └── ...
    ├── resources/              # Keywords reutilizáveis e Page Objects
    │   ├── pages/              # Page Objects (seletores e ações)
    │   └── keywords/           # Keywords customizadas
    ├── results/                # Relatórios e vídeos gerados após execução
    │   ├── log.html            # Log detalhado com screenshots
    │   ├── report.html         # Relatório geral com estatísticas
    │   └── *.mp4               # Vídeos das execuções
    ├── requirements.txt        # Dependências Python
    └── venv/                   # Ambiente virtual Python (ignorado no Git)

---

## ⚙️ Guia de Execução Rápida

### Pré-requisitos
- Python 3 instalado.
- Navegador Chromium/Chrome configurado.
- ChromeDriver compatível com a versão do navegador.

### Instalação e Execução

    # Navegar para a pasta do Robot Framework
    cd ui-testing/testes-automatizados/robot_framework

    # Criar e ativar o ambiente virtual Python
    python3 -m venv venv
    source venv/bin/activate

    # Instalar dependências
    pip install -r requirements.txt

    # Executar todos os testes em modo GUI (Interface)
    robot -d results testes/

*(Nota: Após a execução, os relatórios `log.html` e `report.html` serão gerados automaticamente na pasta `results/`, junto com os vídeos das execuções.)*

### Execução de um Teste Específico

    # Executar apenas um caso de teste
    robot -d results testes/CT01\ -\ Login\ com\ Sucesso\ Standard\ User.robot

---

## 📸 Prévia Visual

**Exemplo de Output no Terminal:**

    ==============================================================================
    Testes :: Suite de testes E2E para Sauce Demo
    ==============================================================================
    CT01 - Login com Sucesso Standard User                              | PASS |
    CT02 - Login de Usuário Bloqueado                                   | PASS |
    CT03 - Login de Usuário Inexistente                                 | PASS |
    ...
    ==============================================================================
    Testes :: Suite de testes E2E para Sauce Demo                       | PASS |
    10 tests, 10 passed, 0 failed
    ==============================================================================

*Para evidências visuais completas, incluindo relatórios HTML interativos e vídeos das execuções, consulte a pasta `results/` após a execução.*

---

## 📝 Nota sobre Documentação

A lógica de negócios, criação dos casos de teste, automação e validação dos resultados foram desenvolvidas integralmente pelo autor. A estruturação, formatação e revisão textual desta documentação contaram com o auxílio de assistentes de IA, utilizados como ferramenta de produtividade para garantir clareza e padronização, sob total supervisão e curadoria técnica.

---

## 👤 Sobre o Autor

Desenvolvido por **Hebert Pezzoti da Silva**
- **GitHub:** [github.com/hebertpezzoti](https://github.com/hebertpezzoti)
- **LinkedIn:** [linkedin.com/in/hebertpezzoti](https://www.linkedin.com/in/hebertpezzoti)