# 🔌 API Testing — Restful-Booker

## Sobre este Módulo

Este módulo documenta **19 casos de teste** realizados na API pública [Restful-Booker](https://restful-booker.herokuapp.com/), abrangendo o ciclo completo de validação de serviços REST: desde o **planejamento e especificação BDD** até a **execução manual via Postman Desktop**, **automação via Postman CLI** e **análise de performance sob carga**.

A abordagem é **híbrida**: a coleção `QA_Teste_API.postman_collection.json` contém requests que foram **executados e validados manualmente** no Postman Desktop (com prints documentados) e **cenários de regressão automatizados** executados via Postman CLI em modo headless. Isso garante cobertura tanto da validação perceptiva e exploratória quanto da execução contínua em pipelines.

A abordagem cobre autenticação, CRUD de reservas, filtros, validação de schema, segurança e testes de performance, com evidências visuais (prints do Postman) e técnicas (comandos curl exportados) para cada cenário.

---

## 🧪 Casos de Teste

| CT | Cenário | Status |
|:---|:---|:---|
| **CTAPI01** | Criar uma nova reserva (POST) | ✅ Passou |
| **CTAPI02** | Consultar reserva por ID (GET) | ✅ Passou |
| **CTAPI03** | Atualizar reserva existente (PUT) | ❌ Falhou |
| **CTAPI04** | Atualização parcial de reserva (PATCH) | ✅ Passou |
| **CTAPI05** | Excluir reserva (DELETE) | ✅ Passou |
| **CTAPI06** | Validação de schema JSON | ✅ Passou |
| **CTAPI07** | Autenticação com token válido | ✅ Passou |
| **CTAPI08** | Autenticação com credenciais inválidas | ✅ Passou |
| **CTAPI09** | Acesso sem token de autenticação | ❌ Falhou |
| **CTAPI10** | Filtro de reservas por nome | ❌ Falhou |
| **CTAPI11** | Filtro de reservas por data de checkin | ✅ Passou |
| **CTAPI12** | Filtro de reservas por data de checkout | ❌ Falhou |
| **CTAPI13** | Teste de limite de caracteres nos campos | ✅ Passou |
| **CTAPI14** | Teste de injeção SQL nos parâmetros | ✅ Passou |
| **CTAPI15** | Teste de envio de payload JSON malformado | ✅ Passou |
| **CTAPI16** | Teste de status code 404 para recurso inexistente | ✅ Passou |
| **CTAPI17** | Teste de método HTTP não permitido | ✅ Passou |
| **CTAPI18** | Teste de performance — carga com 2 VUs por 1 minuto | ✅ Passou |
| **CTAPI19** | Teste de concorrência — múltiplas requisições simultâneas | ✅ Passou |

> **Resumo:** 15 passaram / 4 falharam

---

## 🛠 Stack Tecnológica

| Camada | Ferramenta / Recurso | Função |
|:---|:---|:---|
| **Cliente API (GUI)** | Postman Desktop | Execução manual, inspeção de requests/responses, geração de coleções |
| **Cliente API (CLI)** | Postman CLI | Automação headless dos cenários de regressão, integração com pipelines |
| **Validação de Schema** | tv4 (JSON Schema Validation) | Validação estrutural automática das respostas JSON na coleção |
| **Variáveis** | Coleção + Ambiente | Externalização de baseUrl, tokens e dados dinâmicos |
| **Evidências** | PNG (prints Postman) + curl.txt | Documentação visual e técnica por caso de teste |
| **Relatório CLI** | HTML gerado pelo Postman | Resumo executivo da execução automatizada com métricas de performance |
| **Ambiente** | Linux Mint 22.3 | Sistema operacional de execução |
| **Metodologia** | BDD + Testes de Contrato | Especificação de cenários + validação de schema |

---

## 📁 Estrutura do Diretório

```
api-testing/
├── README.md                                    # ← Você está aqui
├── collection/
│   └── QA_Teste_API.postman_collection.json     # Coleção híbrida: 19 CTs com tests scripts, schema validation e requests manuais + automatizados
├── docs/
│   ├── 01-plano-de-testes-api.md                # Estratégia e escopo de testes da API
│   ├── 02-bdd-cenarios-api.md                   # Cenários BDD (CTAPI01–CTAPI19)
│   ├── 03-casos-de-teste-api.md                 # Detalhamento passo a passo
│   ├── 04-analise-de-bugs-api.md                # 4 bugs documentados com severidade
│   ├── 05-analise-de-riscos-api.md              # Matriz de riscos da API
│   ├── 06-sugestoes-melhoria-api.md             # Sugestões de melhoria no serviço
│   └── Planilha de Controle de Testes de API.xlsx  # Controle executivo
└── evidencias/
    ├── ctapi01/ ... ctapi19/                    # 19 pastas — uma por caso de teste
    │   ├── ctapiXX.png                          # Print do Postman com request/response
    │   └── ctapiXX-curl.txt                     # Comando curl equivalente exportado
    └── ctapi18/
        └── QA_Teste_API-2026-05-15-18-03-43.html # Relatório da execução CLI (performance)
```

---

## 🚀 Como Executar

### Pré-requisitos

- Postman Desktop instalado (para execução manual e edição)
- Postman CLI instalado (para automação headless)
- Linux Mint 22.3 (ambiente de referência)

### Execução manual (Postman Desktop)

Os **testes manuais** dos 19 casos de teste foram executados e validados individualmente no Postman Desktop:

1. Importe a coleção: `collection/QA_Teste_API.postman_collection.json`
2. Configure as variáveis de ambiente (`baseUrl`, `token`)
3. Execute os requests individualmente ou a coleção completa via Collection Runner
4. Valide os responses, status codes, headers e bodies conforme os critérios definidos nos docs

> Os prints de cada execução manual estão documentados em `evidencias/ctapi01/` a `evidencias/ctapi19/`.

### Execução automatizada (Postman CLI)

Os **cenários de regressão automatizados** da coleção são executados em modo headless via Postman CLI:

```bash
cd api-testing/collection
postman collection run QA_Teste_API.postman_collection.json
```

- Executa os cenários de regressão automatizados em modo headless
- Gera relatório HTML com métricas de tempo, status, falhas e throughput
- Ideal para integração com pipelines de CI/CD

---

## 🎬 Evidências e Relatórios

Este módulo gera **3 camadas de evidência** para total rastreabilidade:

### 1. Prints do Postman (Evidência Visual)
- Local: [`evidencias/ctapi01/`](evidencias/ctapi01/) a [`evidencias/ctapi19/`](evidencias/ctapi19/)
- Formato: PNG
- Cada print documenta o request completo (URL, headers, body) e a response (status, body, tempo)

### 2. Comandos curl Exportados (Evidência Técnica)
- Local: [`evidencias/ctapi01/ctapi01-curl.txt`](evidencias/ctapi01/ctapi01-curl.txt) a [`evidencias/ctapi19/ctapi19-curl.txt`](evidencias/ctapi19/ctapi19-curl.txt)
- Permite reprodução do teste fora do Postman, em qualquer terminal

### 3. Relatório de Performance (Execução CLI)
- Local: [`evidencias/ctapi18/QA_Teste_API-2026-05-15-18-03-43.html`](evidencias/ctapi18/QA_Teste_API-2026-05-15-18-03-43.html)
- Métricas reais da execução de carga:

| Métrica | Valor |
|:---|:---|
| **Requisições totais** | 852 |
| **Taxa de throughput** | 14.11 req/s |
| **Tempo médio de resposta** | 131 ms |
| **Percentil 95 (P95)** | 132 ms |
| **Taxa de erro** | 0% |

> A API manteve estabilidade total durante o teste de carga com 2 usuários virtuais por 1 minuto.

---

## 🐛 Bugs Identificados

| ID | Descrição | Severidade | CT |
|:---|:---|:---|:---|
| **BUG-API-01** | Data de checkin é alterada automaticamente pela API após atualização (PUT) | Alta | CTAPI03 |
| **BUG-API-02** | Campo obrigatório ausente retorna erro 500 em vez de 400 | Alta | CTAPI09 |
| **BUG-API-03** | API aceita datas inconsistentes (check-out anterior ao check-in) | Média | CTAPI10 |
| **BUG-API-04** | Filtro por data de checkout não retorna resultados esperados | Média | CTAPI12 |

---

## 🏗 Padrões e Técnicas Aplicados

### Schema Validation (tv4)
Cada resposta da API é validada automaticamente contra um schema JSON definido na coleção, garantindo que campos obrigatórios, tipos de dados e estruturas estejam sempre corretos:

```javascript
// Test script no Postman
var schema = {
  "required": ["bookingid", "booking"],
  "properties": {
    "bookingid": { "type": "integer" },
    "booking": { "type": "object" }
  }
};
var valid = tv4.validate(pm.response.json(), schema);
pm.expect(valid).to.be.true;
```

### Variáveis de Coleção
Dados dinâmicos (token de autenticação, bookingId gerado) são armazenados em variáveis de coleção e reutilizados entre requests, simulando fluxos reais de usuário:

```javascript
// Salvar token para requests subsequentes
pm.collectionVariables.set("auth_token", pm.response.json().token);
```

### Segurança
- **SQL Injection:** Teste de injeção em parâmetros de query string
- **Autenticação:** Validação de acesso sem token (esperado 403)
- **Payload malformado:** Envio de JSON inválido para testar robustez do parser

### Performance
- **Carga:** 2 VUs (usuários virtuais) executando a coleção por 1 minuto
- **Concorrência:** Múltiplas requisições simultâneas para validar consistência de dados

---

## 📝 Nota sobre Documentação

A lógica de negócios, criação dos casos de teste, automação e validação dos resultados foram desenvolvidas integralmente pelo autor. A estruturação, formatação e revisão textual desta documentação contaram com o auxílio de assistentes de IA, utilizados como ferramenta de produtividade para melhoria gramatical, apresentação, assertividade e agilidade, sob **total supervisão e curadoria técnica do autor**.

---

## 👤 Autoria

**Hebert Pezzoti da Silva**
🔗 [linkedin.com/in/hebertpezzoti](https://www.linkedin.com/in/hebertpezzoti)
📧 hebertpezzoti@hotmail.com

---

*Este projeto é uma demonstração técnica de competências em Qualidade de Software. Todo o conteúdo de testes, código e evidências foi produzido e validado manualmente pelo autor.*
