# Plano de Testes – API (Restful-Booker) – Testes Manuais

## 1. Objetivo
Executar testes manuais na API **Restful-Booker** para validar os fluxos de autenticação, criação, consulta, atualização, exclusão de reservas, validação de campos obrigatórios, filtros, tratamento de erros, segurança e performance, registrando evidências em capturas de tela e comandos curl.

## 2. Escopo
### Funcionalidades testadas (conforme cenários da API)
- **Autenticação**: criação de token (válido e inválido)
- **CRUD de reservas** (`/booking`):
  - Criar reserva (POST)
  - Consultar reserva por ID (GET)
  - Atualizar reserva total (PUT)
  - Atualizar parcialmente (PATCH)
  - Deletar reserva (DELETE)
- **Validação de dados**:
  - Campos obrigatórios (ex.: `firstname` ausente)
  - Datas inconsistentes (`checkin` > `checkout`)
  - Schema da resposta
- **Filtros e buscas**: por `firstname` e por `checkin`
- **Tratamento de erros**:
  - Buscar ID inexistente (404)
  - JSON malformado (400)
- **Segurança**:
  - Tentativa de DELETE sem token
  - Tentativa de PUT sem token
  - Injeção de SQL em parâmetro de consulta
- **Performance**: teste de carga simples em `/booking`
- **Automação via script**: execução da coleção via Postman CLI

### Fora de escopo
- Testes em outros endpoints não documentados (ex.: `/ping` ou `/health`)
- Ambientes de produção ou staging diferentes do fornecido
- Testes de contrato avançados (além da validação de schema)

## 3. Critérios de Aceite
- Cada caso de teste deve ser executado seguindo o cenário BDD descrito.
- Resultados (passou/falhou) devem ser registrados com observações e evidências.
- Bugs/inconsistências devem ser documentados com reprodução e análise.
- Evidências devem incluir prints do Postman e/ou comandos curl.

## 4. Ambiente de Teste
| Componente         | Configuração                                      |
|--------------------|---------------------------------------------------|
| API base           | https://restful-booker.herokuapp.com              |
| Ferramenta         | Postman Desktop                                   |
| Sistema Operacional| Linux Mint 22.3                                   |
| Outras ferramentas | Postman CLI (para automação via script)           |

## 5. Dados de Teste (resumo)
| Tipo de dado         | Exemplo utilizado                              | Observação                         |
|----------------------|------------------------------------------------|------------------------------------|
| Credenciais válidas  | `username: admin, password: password123`      | Gera token                         |
| Credenciais inválidas| `password: 123`                                | Retorna `Bad credentials`          |
| Reserva válida       | firstname: João, lastname: Silva, totalprice: 150, checkin: 2025-06-01, checkout: 2025-06-05 | Usada em CTAPI03 e derivados |
| Campos obrigatórios  | `firstname` ausente                            | Deveria retornar 400, retornou 500  |
| Data inconsistente   | checkin > checkout (2025-06-10 / 2025-06-05)   | Sistema criou reserva indevidamente |
| SQL injection        | `firstname=' OR 1=1 --`                        | Tratado como string normal          |

## 6. Resumo dos Resultados (extraído da execução)

| ID       | Caso de Teste                                    | Status       |
|----------|--------------------------------------------------|--------------|
| CTAPI01  | Autenticação - Criar token (válido)              | ✅ Passou    |
| CTAPI02  | Autenticação - Credenciais inválidas             | ✅ Passou    |
| CTAPI03  | CRUD - Criar reserva                             | ❌ Falhou    |
| CTAPI04  | CRUD - Consultar reserva por ID                  | ✅ Passou    |
| CTAPI05  | CRUD - Atualizar reserva (PUT) - autenticado     | ✅ Passou    |
| CTAPI06  | CRUD - Atualizar parcialmente (PATCH)            | ✅ Passou    |
| CTAPI07  | CRUD - Deletar reserva (autenticado)             | ✅ Passou    |
| CTAPI08  | CRUD - Tentar deletar sem autenticação           | ✅ Passou    |
| CTAPI09  | Validação - Criar reserva faltando campo         | ❌ Falhou    |
| CTAPI10  | Validação - Checkin posterior a checkout         | ❌ Falhou    |
| CTAPI11  | Filtros - Buscar reservas por nome               | ✅ Passou    |
| CTAPI12  | Filtros - Buscar reservas por data (checkin)     | ❌ Falhou    |
| CTAPI13  | Erros - Buscar reserva com ID inexistente        | ✅ Passou    |
| CTAPI14  | Erros - Enviar JSON malformado                   | ✅ Passou    |
| CTAPI15  | Performance - Teste de carga em /booking         | ✅ Passou    |
| CTAPI16  | Segurança - Injeção de SQL em parâmetro          | ✅ Passou    |
| CTAPI17  | Segurança - Tentativa de acesso sem token (PUT)  | ✅ Passou    |
| CTAPI18  | Automação via script - Execução da coleção via CLI | ✅ Passou  |
| CTAPI19  | Validação de schema da resposta (criar reserva)  | ✅ Passou    |

> O detalhamento completo (passo a passo, resultados esperados/obtidos, evidências) está no arquivo [`casos-de-teste-api.md`](./casos-de-teste-api.md).

## 7. Riscos e Problemas Identificados

| Problema                                         | Severidade | Observação                                             |
|--------------------------------------------------|------------|--------------------------------------------------------|
| Criação de reserva retorna data de checkin alterada (de 2025-06-01 para 2013-06-01) | Média | Inconsistência nos dados retornados (CTAPI03) |
| Ausência de campo obrigatório (`firstname`) retorna 500 em vez de 400 | Alta | Falha de validação no servidor (CTAPI09) |
| Datas inconsistentes (checkin > checkout) são aceitas pela API | Alta | Criação indevida de reserva (CTAPI10) |
| Filtro por data de check-in não funciona (retorna reservas com outras datas) | Média | Retorna IDs que não correspondem ao filtro (CTAPI12) |
| Endpoint de DELETE sem token retorna 403 (correto) | – | Comportamento esperado, sem risco |
| SQL injection tratado corretamente | – | Sem risco identificado |

## 8. Ferramentas Utilizadas
- **Postman Desktop** – criação e execução das requisições
- **Postman CLI** – execução automatizada da coleção
- **Git** – versionamento dos artefatos (evidências, curls, coleção JSON)

## 9. Cronograma (execução manual, baseado na planilha)
| Atividade                                         | Duração estimada |
|---------------------------------------------------|------------------|
| Execução dos 19 casos de teste (incluindo cenários de erro e performance) | 3h |
| Registro de evidências (prints, arquivos curl)    | 1h30             |
| Documentação dos resultados e bugs                | 2h               |
| **Total**                                         | **6h30**         |

---

**Observação final:** Este plano cobre exclusivamente os testes manuais da API Restful-Booker, conforme descrito na documentação de casos de teste. A collection utilizada está disponível em `api-testing/collection/QA_Teste_API.postman_collection.json`.