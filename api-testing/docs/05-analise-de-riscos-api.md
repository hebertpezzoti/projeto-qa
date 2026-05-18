# Análise de Riscos – API (Restful-Booker) – Testes Manuais

Com base nos resultados e observações registrados na planilha de testes de API, foram identificados os seguintes riscos associados à qualidade, segurança e confiabilidade da API.

## Riscos Identificados

| ID do Risco | Descrição do Risco | Probabilidade | Impacto | Nível | Causa / Relação com os testes | Mitigação / Observação |
|-------------|--------------------|---------------|---------|-------|-------------------------------|------------------------|
| R-API-01 | Inconsistência na data de checkin retornada (2013 em vez de 2025) pode levar a cálculos errados de estadia e confusão no frontend. | Média (reproduzível) | Médio | **Médio** | Bug no CTAPI03: data de checkin retornada diferente da enviada. | Validar e corrigir lógica de persistência de datas. Adicionar teste de regressão. |
| R-API-02 | Ausência de validação de campo obrigatório (`firstname`) causa erro 500, podendo expor falhas internas e indisponibilidade. | Baixa (depende de requisição malformada) | Alto | **Médio** | Bug no CTAPI09: campo obrigatório ausente retorna 500 em vez de 400. | Tratar exceções e retornar erro semanticamente correto (400). Revisar validação de entrada. |
| R-API-03 | API permite criar reserva com `checkin > checkout`, gerando dados inconsistentes e prejudicando a lógica de negócio (ex.: diárias negativas). | Média (reproduzível) | Alto | **Alto** | Bug no CTAPI10: datas inválidas são aceitas. | Implementar validação de regras de negócio antes de persistir. Rejeitar requisições com data inconsistente. |
| R-API-04 | Filtro por data de checkin (`?checkin=`) retorna resultados incorretos (ex.: reservas com outras datas). Usuário pode obter dados errados ao consultar. | Média | Médio | **Médio** | Bug no CTAPI12: filtro por checkin não funciona. | Corrigir lógica do parâmetro de query; garantir que o filtro seja aplicado corretamente no backend. |
| R-API-05 | Tentativa de DELETE sem token retorna 403 (comportamento correto). No entanto, outras operações não autenticadas podem estar vulneráveis se não exigirem token. | Baixa (já validado para DELETE e PUT) | Alto | **Baixo** | CTAPI08 e CTAPI17 passaram (403 esperado). | Manter política de autenticação para todas as operações de escrita (POST, PUT, PATCH, DELETE). Revisar endpoints. |
| R-API-06 | A criação de reserva não exige autenticação (CTAPI03, CTAPI04). Embora documentado, isso pode permitir spam ou criação indevida de reservas. | Média (qualquer um pode criar) | Médio | **Médio** | Observado nos CTs de criação e consulta sem token. | Avaliar necessidade de autenticação para criar reservas; se mantido, implementar rate limiting. |
| R-API-07 | Performance atual é boa (média 131ms, P95 132ms), mas pode degradar com aumento de carga ou dados. | Baixa | Médio | **Baixo** | CTAPI15 passou com folga. | Monitorar em produção; estabelecer baseline de performance. |
| R-API-08 | Injeção de SQL foi tratada corretamente (retornou array vazio), indicando baixo risco de injeção. | Baixa | Alto | **Baixo** | CTAPI16 passou. | Manter práticas de sanitização de entrada e consultas parametrizadas. |

## Matriz de Probabilidade vs Impacto (resumo)

|                | Impacto Baixo | Impacto Médio | Impacto Alto |
|----------------|---------------|---------------|---------------|
| Probabilidade Baixa  | R-API-07, R-API-08 | –             | R-API-02, R-API-05 |
| Probabilidade Média  | –             | R-API-01, R-API-04, R-API-06 | R-API-03       |
| Probabilidade Alta   | –             | –             | –             |

**Riscos de maior nível:** **R-API-03** (data inválida aceita – impacto alto) e **R-API-02** (erro 500 em campo obrigatório – impacto alto, embora probabilidade baixa, pode indicar falha grave).

## Recomendações Gerais

1. **Prioridade crítica:** Corrigir validação de datas (R-API-03) e tratamento de campos obrigatórios (R-API-02) – ambos impactam a integridade dos dados e a robustez da API.
2. **Prioridade alta:** Corrigir inconsistência de data no retorno da criação (R-API-01) e o filtro por data (R-API-04).
3. **Revisão de segurança:** Avaliar a necessidade de autenticação para criação de reservas (R-API-06) e garantir que todas as operações de escrita exijam token (já parcialmente ok).
4. **Monitoramento:** Estabelecer métricas de performance e alertas para possíveis degradações (R-API-07).
5. **Testes adicionais:** Incluir testes de validação de campos obrigatórios, regras de negócio (datas) e filtros nos ciclos de regressão.

---