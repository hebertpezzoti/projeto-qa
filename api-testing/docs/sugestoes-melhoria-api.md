# Sugestões de Melhoria – Testes do Sistema (Backend)

Com base nos resultados da execução dos casos de teste, seguem sugestões de melhoria para o sistema.

## 1. Correção de inconsistências de dados

### 1.1. Data de check‑in retornada incorreta
- **Problema identificado (CTAPI03):** Ao criar uma reserva com `checkin: "2025-06-01"`, o sistema retorna `checkin: "2013-06-01"` na resposta, persistindo o valor errado.
- **Sugestão:** Revisar a lógica de armazenamento e recuperação de datas, garantindo que o valor enviado seja o mesmo retornado. Adicionar testes de consistência para os campos de data.

## 2. Melhorias na validação de dados

### 2.1. Tratamento de campos obrigatórios ausentes
- **Problema identificado (CTAPI09):** A omissão do campo `firstname` (obrigatório) resulta em erro `500 Internal Server Error`, em vez de `400 Bad Request`.
- **Sugestão:** Implementar validação de esquema na camada de entrada, retornando erros semânticos (400) com mensagem clara sobre o campo faltante. Evitar expor detalhes internos da exceção.

### 2.2. Validação de regras de negócio (datas)
- **Problema identificado (CTAPI10):** O sistema permite criar reservas onde `checkin > checkout`, gerando dados inconsistentes (ex.: entrada depois da saída).
- **Sugestão:** Adicionar validação de regra de negócio que rejeite requisições com `checkin` posterior a `checkout`, retornando `400 Bad Request` com a descrição do erro.

## 3. Correção de filtros e buscas

### 3.1. Filtro por data de check‑in
- **Problema identificado (CTAPI12):** O parâmetro `checkin` na listagem de reservas retorna registros que não correspondem à data informada (ex.: ID com checkin 2025-07-14 retornado ao filtrar por 2025-06-01).
- **Sugestão:** Revisar a lógica de construção da query de filtro, garantindo que a condição seja aplicada corretamente no banco de dados. Adicionar testes automatizados para cada parâmetro de filtro.

## 4. Melhorias de segurança e autenticação

### 4.1. Autenticação para criação de reservas
- **Observação (CTAPI03 e CTAPI04):** Atualmente é possível criar e consultar reservas sem qualquer token de autenticação. Embora documentado, isso pode permitir spam ou manipulação indevida.
- **Sugestão:** Avaliar a necessidade de exigir token para operações de escrita (POST, PUT, PATCH, DELETE). Caso a decisão seja manter aberto, implementar rate limiting e monitoramento.

### 4.2. Consistência da política de autenticação
- **Observação (CTAPI08 e CTAPI17):** DELETE e PUT sem token retornam `403 Forbidden`, comportamento correto. Manter essa política para todos os endpoints de modificação.

## 5. Melhorias de performance e monitoramento

### 5.1. Baseline de desempenho
- **Observação (CTAPI15):** O sistema respondeu com média de 131ms e P95 de 132ms para `/booking` sob carga moderada (2 VUs, 1 minuto).
- **Sugestão:** Estabelecer um baseline de performance (ex.: média < 500ms, P95 < 800ms) e monitorar continuamente em ambiente de produção para detectar degradações.

## 6. Melhorias gerais no processo de teste

### 6.1. Testes de esquema e contrato
- **Observação (CTAPI19):** A validação de schema da resposta passou mesmo com a data inconsistente (pois apenas verifica estrutura, não valores).
- **Sugestão:** Complementar os testes de schema com asserções de valor para regras de negócio (ex.: garantir que o `checkin` retornado é igual ao enviado).

### 6.2. Automação contínua
- **Observação (CTAPI18):** A execução via CLI do Postman foi bem‑sucedida.
- **Sugestão:** Integrar a coleção de testes a um pipeline de CI/CD (ex.: GitHub Actions, GitLab CI) para execução automática a cada commit.

### 6.3. Documentação de erros
- **Sugestão:** Melhorar a documentação (ex.: Swagger/OpenAPI) descrevendo os códigos de erro esperados (400, 403, 404, 500) e os respectivos cenários.

## 7. Sugestões de baixa prioridade (nice‑to‑have)

- Adicionar logging estruturado para requisições malformadas (CTAPI09, CTAPI14) facilitando depuração.
- Retornar mensagens de erro mais informativas (ex.: "campo 'firstname' é obrigatório") em vez de erros genéricos.
- Implementar cache para consultas frequentes (`GET /booking`) a fim de reduzir carga no banco de dados.

---