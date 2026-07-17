# 🔌 API Testing - Testes de API REST (Postman)

![Postman](https://img.shields.io/badge/Postman-Desktop%20%26%20CLI-orange)
![RESTful Booker](https://img.shields.io/badge/API-Restful%20Booker-blue)
![CI/CD](https://img.shields.io/badge/CLI-Ready-green)
![Linux](https://img.shields.io/badge/Linux-Mint_22.3-yellow)

## 📋 Sobre o Módulo

Este módulo contém a suíte de testes para a API **Restful Booker**. Os testes foram projetados para ir além do CRUD básico, abrangendo validação de contrato (JSON Schema), testes de performance (carga e latência), segurança (prevenção a SQL Injection) e automação via CLI para integração em pipelines de CI/CD.

A coleção foi estruturada para demonstrar domínio completo do ciclo de vida de testes de API, desde a autenticação e criação de recursos até a validação de contratos, tratamento de erros e monitoramento de métricas de performance sob carga.

---

## 🔗 Rastreabilidade e Documentação

Os testes automatizados deste módulo não foram criados isoladamente. Eles são a implementação técnica direta dos cenários documentados na pasta `documentation/` (Planilha de Controle de Testes de API). 

Isso garante que:
- Cada request da coleção Postman possui um Caso de Teste (CTAPI) manual correspondente e validado.
- As evidências de falhas ou sucessos estão vinculadas ao ID do caso de teste (ex: `CTAPI01`, `CTAPI15`).
- A lógica de negócio foi validada manualmente antes de ser escalada via automação CLI.

---

## ️ Stack Tecnológica do Módulo

### Ferramentas e Ambiente
- **Ferramenta Principal:** Postman Desktop & Postman CLI
- **API Alvo:** Restful Booker (https://restful-booker.herokuapp.com)
- **Sistema Operacional:** Linux Mint 22.3 (execução via terminal e GUI)
- **Formato de Dados:** JSON (request/response)

### Metodologias Aplicadas
- **Testes Funcionais:** CRUD completo (POST, GET, PUT, PATCH, DELETE).
- **Contract Testing:** Validação de JSON Schema para garantir integridade de contratos.
- **Performance Testing:** Testes de carga com monitoramento de Throughput, Latência Média e P95.
- **Security Testing:** Prevenção a SQL Injection e validação de autenticação em endpoints sensíveis.
- **CI/CD Ready:** Execução automatizada via Postman CLI para integração em pipelines.

---

## 🚀 Destaques de Engenharia & Boas Práticas

- **Contract Testing (Validação de Schema):** Validação rigorosa da estrutura JSON das respostas (CTAPI19), garantindo que contratos de API não sejam quebrados em atualizações futuras.
- **Performance & SLA Monitoring:** Teste de carga com 852 requisições, monitorando métricas reais: Throughput (14.11 req/s), Latência Média (131ms) e P95 (132ms) com 0% de erros (CTAPI15).
- **Security Testing:** Testes de prevenção a SQL Injection em parâmetros de busca (CTAPI16) e validação de autenticação em endpoints sensíveis (CTAPI08, CTAPI17).
- **CI/CD Ready:** Coleção configurada para execução via Postman CLI, permitindo integração direta em pipelines de CI/CD (GitHub Actions, Jenkins, etc.) (CTAPI18).
- **Validação de Dados Críticos:** Identificação de bugs sutis, como inconsistência de datas (check-in vs check-out) e falhas em filtros de busca (CTAPI03, CTAPI10, CTAPI12).
- **Tratamento de Erros Robusto:** Validação de respostas para IDs inexistentes (404), JSON malformado (400) e campos obrigatórios ausentes (CTAPI09, CTAPI13, CTAPI14).

---

##  Estrutura de Pastas

    api-testing/
    ├── collection/                 # Coleção Postman e Environment exportados
    │   ├── QA_Teste_API.postman_collection.json
    │   └── Environment.postman_environment.json
    ├── evidencias/                 # Prints, curls e relatórios HTML
    │   ├── ctapi01/                # Evidências organizadas por ID de caso de teste
    │   ├── ctapi15/                # Ex: Relatórios de performance
    │   ├── ctapi18/                # Ex: Relatórios de execução CLI
    │   └── ...                     # Demais casos de teste
    └── README.md                   # Este arquivo

---

## ⚙️ Guia de Execução Rápida

### Execução Manual (Postman Desktop)
1. Abra o Postman Desktop.
2. Importe a coleção disponível em `api-testing/collection/`.
3. Configure as variáveis de ambiente (ex: `token`, `baseUrl`).
4. Execute os requests individualmente ou via Runner.

### Execução Automatizada (Postman CLI - CI/CD Ready)

    # Instalação do Postman CLI (Linux)
    # Consulte a documentação oficial do Postman para instalação

    # Execução da coleção com geração de relatório HTML
    postman collection run "api-testing/collection/QA_Teste_API.postman_collection.json" \
      --environment "api-testing/collection/Environment.postman_environment.json" \
      --reporters cli,html \
      --reporter-html-export api-testing/evidencias/relatorio-execucao.html

*(Nota: A execução via CLI gera um relatório HTML completo com todos os resultados, pronto para ser anexado em pipelines de CI/CD ou consultado localmente.)*

---

##  Prévia Visual

**Resultado do Teste de Carga (CTAPI15 - Exemplo de Métricas):**

    Total de Requisições: 852
    Throughput: 14.11 req/s
    Latência Média: 131ms
    Latência P95: 132ms
    Taxa de Erro: 0%

*Para evidências visuais completas, incluindo prints de response, arquivos curl de reprodução e relatórios HTML de execução CLI, consulte a pasta `api-testing/evidencias/`.*

---

## 📊 Casos de Teste Implementados

A coleção contempla 19 casos de teste (CTAPI01 a CTAPI19), cobrindo:
- **Autenticação:** Criação de token e validação de credenciais (CTAPI01, CTAPI02).
- **CRUD Completo:** Criar, consultar, atualizar (PUT/PATCH) e deletar reservas (CTAPI03 a CTAPI07).
- **Segurança:** Tentativas de acesso sem autenticação e prevenção a SQL Injection (CTAPI08, CTAPI16, CTAPI17).
- **Validação:** Campos obrigatórios, datas inválidas e filtros de busca (CTAPI09, CTAPI10, CTAPI12).
- **Tratamento de Erros:** IDs inexistentes e JSON malformado (CTAPI13, CTAPI14).
- **Performance:** Teste de carga com monitoramento de SLA (CTAPI15).
- **Automação:** Execução via CLI com geração de relatórios (CTAPI18).
- **Contrato:** Validação de JSON Schema (CTAPI19).

---

## 📝 Nota sobre Documentação

A lógica de negócios, criação dos casos de teste, automação e validação dos resultados foram desenvolvidas integralmente pelo autor. A estruturação, formatação e revisão textual desta documentação contaram com o auxílio de assistentes de IA, utilizados como ferramenta de produtividade para garantir clareza e padronização, sob total supervisão e curadoria técnica.

---

## 👤 Sobre o Autor

Desenvolvido por **Hebert Pezzoti da Silva**
- **GitHub:** [github.com/hebertpezzoti](https://github.com/hebertpezzoti)
- **LinkedIn:** [linkedin.com/in/hebertpezzoti](https://www.linkedin.com/in/hebertpezzoti)