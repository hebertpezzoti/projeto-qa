
```markdown
# Casos de Teste – API (Restful-Booker) – Testes Manuais

## Resumo dos Casos

| ID       | Caso de Teste                                    | Status     | Evidências                                    |
|----------|--------------------------------------------------|------------|-----------------------------------------------|
| CTAPI01  | Autenticação - Criar token (válido)              | ✅ Passou  | [PNG](./evidencias/ctapi01/ctapi01.png) / [curl](./evidencias/ctapi01/ctapi01-curl.txt) |
| CTAPI02  | Autenticação - Credenciais inválidas             | ✅ Passou  | [PNG](./evidencias/ctapi02/ctapi02.png) / [curl](./evidencias/ctapi02/ctapi02-curl.txt) |
| CTAPI03  | CRUD - Criar reserva                             | ❌ Falhou  | [PNG](./evidencias/ctapi03/ctapi03.png) / [curl](./evidencias/ctapi03/ctapi03-curl.txt) |
| CTAPI04  | CRUD - Consultar reserva por ID                  | ✅ Passou  | [PNG](./evidencias/ctapi04/ctapi04.png) / [curl](./evidencias/ctapi04/ctapi04-curl.txt) |
| CTAPI05  | CRUD - Atualizar reserva (PUT) - autenticado     | ✅ Passou  | [PNG](./evidencias/ctapi05/ctapi05.png) / [curl](./evidencias/ctapi05/ctapi05-curl.txt) |
| CTAPI06  | CRUD - Atualizar parcialmente (PATCH)            | ✅ Passou  | [PNG](./evidencias/ctapi06/ctapi06.png) / [curl](./evidencias/ctapi06/ctapi06-curl.txt) |
| CTAPI07  | CRUD - Deletar reserva (autenticado)             | ✅ Passou  | [PNG1](./evidencias/ctapi07/ctapi07%20-%20print%2001.png) / [PNG2](./evidencias/ctapi07/ctapi07%20-%20print%2002.png) / [curl](./evidencias/ctapi07/ctapi07-curl.txt) |
| CTAPI08  | CRUD - Tentar deletar sem autenticação           | ✅ Passou  | [PNG](./evidencias/ctapi08/ctapi08.png) / [curl](./evidencias/ctapi08/ctapi08-curl.txt) |
| CTAPI09  | Validação - Criar reserva faltando campo         | ❌ Falhou  | [PNG](./evidencias/ctapi09/ctapi09.png) / [curl](./evidencias/ctapi09/ctapi09-curl.txt) |
| CTAPI10  | Validação - Checkin posterior a checkout         | ❌ Falhou  | [PNG](./evidencias/ctapi10/ctapi10.png) / [curl](./evidencias/ctapi10/ctapi10-curl.txt) |
| CTAPI11  | Filtros - Buscar reservas por nome               | ✅ Passou  | [PNG1](./evidencias/ctapi11/ctapi11%20-%20print%2001.png) / [PNG2](./evidencias/ctapi11/ctapi11%20-%20print%2002.png) / [curl](./evidencias/ctapi11/ctapi11-curl.txt) |
| CTAPI12  | Filtros - Buscar reservas por data (checkin)     | ❌ Falhou  | [PNG1](./evidencias/ctapi12/ctapi12%20-%20print%2001.png) / [PNG2](./evidencias/ctapi12/ctapi12%20-%20print%2002.png) / [curl](./evidencias/ctapi12/ctapi12-curl.txt) |
| CTAPI13  | Erros - Buscar reserva com ID inexistente        | ✅ Passou  | [PNG](./evidencias/ctapi13/ctapi13.png) / [curl](./evidencias/ctapi13/ctapi13-curl.txt) |
| CTAPI14  | Erros - Enviar JSON malformado                   | ✅ Passou  | [PNG](./evidencias/ctapi14/ctapi14.png) / [curl](./evidencias/ctapi14/ctapi14-curl.txt) |
| CTAPI15  | Performance - Teste de carga em /booking         | ✅ Passou  | [PNG](./evidencias/ctapi15/ctapi15.png) |
| CTAPI16  | Segurança - Injeção de SQL em parâmetro          | ✅ Passou  | [PNG](./evidencias/ctapi16/ctapi16.png) / [curl](./evidencias/ctapi16/ctapi16-curl.txt) |
| CTAPI17  | Segurança - Tentativa de acesso sem token (PUT)  | ✅ Passou  | [PNG](./evidencias/ctapi17/ctapi17.png) / [curl](./evidencias/ctapi17/ctapi17-curl.txt) |
| CTAPI18  | Automação via script - Execução da coleção via CLI | ✅ Passou | [PNG1](./evidencias/ctap18/ctapi18%20-%20print%2001.png) / [PNG2](./evidencias/ctap18/ctapi18%20-%20print%2002.png) / [Relatório](./evidencias/ctap18/QA_Teste_API-2026-05-15-18-03-43.html) |
| CTAPI19  | Validação de schema da resposta (criar reserva)  | ✅ Passou  | [PNG](./evidencias/ctapi19/ctapi19.png) / [curl](./evidencias/ctapi19/ctapi19-curl.txt) |

---

## Detalhamento por Caso de Teste

### CTAPI01 – Autenticação - Criar token (válido)

- **Tipo(s) de Teste:** Funcional, Positivo
- **Ambiente:** Postman Desktop / Linux Mint 22.3
- **Endpoint:** `POST https://restful-booker.herokuapp.com/auth`
- **Headers:** `Content-Type: application/json`
- **Body (request):**

~~~json
{
  "username": "admin",
  "password": "password123"
}
~~~

- **Status Esperado:** 200 OK
- **Resultado Esperado:** Token retornado não vazio, campo 'token' existe.
- **Response Obtido:**

~~~json
{
  "token": "817550487be5447"
}
~~~

- **Status Final:** ✅ Passou
- **Resultado / Observações:** Nos conformes.
- **Evidências:** [PNG](./evidencias/ctapi01/ctapi01.png) | [curl](./evidencias/ctapi01/ctapi01-curl.txt)

---

### CTAPI02 – Autenticação - Credenciais inválidas

- **Tipo(s) de Teste:** Funcional, Negativo
- **Ambiente:** Postman Desktop / Linux Mint 22.3
- **Endpoint:** `POST https://restful-booker.herokuapp.com/auth`
- **Headers:** `Content-Type: application/json`
- **Body (request):**

~~~json
{
  "username": "admin",
  "password": "123"
}
~~~

- **Status Esperado:** 200 OK (mas com erro no corpo)
- **Resultado Esperado:** Corpo com `"reason": "Bad credentials"`
- **Response Obtido:**

~~~json
{
  "reason": "Bad credentials"
}
~~~

- **Status Final:** ✅ Passou
- **Resultado / Observações:** Nos conformes.
- **Evidências:** [PNG](./evidencias/ctapi02/ctapi02.png) | [curl](./evidencias/ctapi02/ctapi02-curl.txt)

---

### CTAPI03 – CRUD - Criar reserva

- **Tipo(s) de Teste:** Funcional, Contrato
- **Ambiente:** Postman Desktop / Linux Mint 22.3
- **Endpoint:** `POST https://restful-booker.herokuapp.com/booking`
- **Headers:** `Content-Type: application/json`
- **Body (request):**

~~~json
{
  "firstname": "João",
  "lastname": "Silva",
  "totalprice": 150,
  "depositpaid": true,
  "bookingdates": {
    "checkin": "2025-06-01",
    "checkout": "2025-06-05"
  },
  "additionalneeds": "Breakfast"
}
~~~

- **Status Esperado:** 200 OK
- **Resultado Esperado:** Retorna `bookingid` e os dados enviados.
- **Response Obtido:**

~~~json
{
  "bookingid": 287,
  "booking": {
    "firstname": "João",
    "lastname": "Silva",
    "totalprice": 150,
    "depositpaid": true,
    "bookingdates": {
      "checkin": "2013-06-01",
      "checkout": "2025-06-05"
    },
    "additionalneeds": "Breakfast"
  }
}
~~~

- **Status Final:** ❌ Falhou
- **Resultado / Observações:** Bug: A data de checkin retornada (2013-06-01) não é a mesma que foi enviada (2025-06-01).
- **Evidências:** [PNG](./evidencias/ctapi03/ctapi03.png) | [curl](./evidencias/ctapi03/ctapi03-curl.txt)

---

### CTAPI04 – CRUD - Consultar reserva por ID

- **Tipo(s) de Teste:** Funcional, Consulta
- **Ambiente:** Postman Desktop / Linux Mint 22.3
- **Endpoint:** `GET https://restful-booker.herokuapp.com/booking/4036`
- **Headers:** `Content-Type: application/json`
- **Status Esperado:** 200 OK
- **Resultado Esperado:** Dados retornados conferem com os criados.
- **Response Obtido:**

~~~json
{
  "firstname": "João",
  "lastname": "Silva",
  "totalprice": 150,
  "depositpaid": true,
  "bookingdates": {
    "checkin": "2013-06-01",
    "checkout": "2025-06-05"
  },
  "additionalneeds": "Breakfast"
}
~~~

- **Status Final:** ✅ Passou
- **Resultado / Observações:** Nos conformes. Observação: seria recomendado poder fazer esta ação apenas com token válido, mas conforme documentação da API não utiliza.
- **Evidências:** [PNG](./evidencias/ctapi04/ctapi04.png) | [curl](./evidencias/ctapi04/ctapi04-curl.txt)

---

### CTAPI05 – CRUD - Atualizar reserva (PUT) - autenticado

- **Tipo(s) de Teste:** Funcional, Autenticação
- **Ambiente:** Postman Desktop / Linux Mint 22.3
- **Endpoint:** `PUT https://restful-booker.herokuapp.com/booking/4036`
- **Headers:** `Content-Type: application/json`, `Cookie: token={token}`
- **Body (request):**

~~~json
{
  "firstname": "Maria",
  "lastname": "Santos",
  "totalprice": 200,
  "depositpaid": false,
  "bookingdates": {
    "checkin": "2025-07-01",
    "checkout": "2025-07-10"
  },
  "additionalneeds": "Dinner"
}
~~~

- **Status Esperado:** 200 OK
- **Resultado Esperado:** Campos atualizados corretamente.
- **Response Obtido:**

~~~json
{
  "firstname": "Maria",
  "lastname": "Santos",
  "totalprice": 200,
  "depositpaid": false,
  "bookingdates": {
    "checkin": "2026-05-10",
    "checkout": "2026-05-10"
  },
  "additionalneeds": "Dinner"
}
~~~

- **Status Final:** ✅ Passou
- **Resultado / Observações:** Nos conformes.
- **Evidências:** [PNG](./evidencias/ctapi05/ctapi05.png) | [curl](./evidencias/ctapi05/ctapi05-curl.txt)

---

### CTAPI06 – CRUD - Atualizar parcialmente (PATCH)

- **Tipo(s) de Teste:** Funcional
- **Ambiente:** Postman Desktop / Linux Mint 22.3
- **Endpoint:** `PATCH https://restful-booker.herokuapp.com/booking/1648`
- **Headers:** `Content-Type: application/json`, `Cookie: token={token}`
- **Body (request):**

~~~json
{
  "firstname": "Ana"
}
~~~

- **Status Esperado:** 200 OK
- **Resultado Esperado:** Somente `firstname` alterado, demais campos intactos.
- **Response Obtido:**

~~~json
{
  "firstname": "Ana",
  "lastname": "Silva",
  "totalprice": 150,
  "depositpaid": true,
  "bookingdates": {
    "checkin": "2013-06-01",
    "checkout": "2025-06-05"
  },
  "additionalneeds": "Breakfast"
}
~~~

- **Status Final:** ✅ Passou
- **Resultado / Observações:** Nos conformes.
- **Evidências:** [PNG](./evidencias/ctapi06/ctapi06.png) | [curl](./evidencias/ctapi06/ctapi06-curl.txt)

---

### CTAPI07 – CRUD - Deletar reserva (autenticado)

- **Tipo(s) de Teste:** Funcional, Autenticação
- **Ambiente:** Postman Desktop / Linux Mint 22.3
- **Endpoint:** `DELETE https://restful-booker.herokuapp.com/booking/1648`
- **Headers:** `Cookie: token={token}`
- **Status Esperado:** 201 Created
- **Resultado Esperado:** Ao tentar GET do mesmo ID retorna 404 Not Found.
- **Response Obtido (DELETE):** 201 Created
- **Response Obtido (GET pós-deleção):** `Not Found` (404)
- **Status Final:** ✅ Passou
- **Resultado / Observações:** Nos conformes. Confirmado com consulta posterior.
- **Evidências:** [PNG1](./evidencias/ctapi07/ctapi07%20-%20print%2001.png) | [PNG2](./evidencias/ctapi07/ctapi07%20-%20print%2002.png) | [curl](./evidencias/ctapi07/ctapi07-curl.txt) | [complemento](./evidencias/ctapi07/ctapi04-curl%20-%20complemento.txt)

---

### CTAPI08 – CRUD - Tentar deletar sem autenticação

- **Tipo(s) de Teste:** Segurança, Negativo
- **Ambiente:** Postman Desktop / Linux Mint 22.3
- **Endpoint:** `DELETE https://restful-booker.herokuapp.com/booking/4534`
- **Headers:** N/A (sem Cookie)
- **Status Esperado:** 403 Forbidden
- **Resultado Esperado:** Mensagem de erro ou status proibido.
- **Response Obtido:** 403 Forbidden
- **Status Final:** ✅ Passou
- **Resultado / Observações:** Nos conformes.
- **Evidências:** [PNG](./evidencias/ctapi08/ctapi08.png) | [curl](./evidencias/ctapi08/ctapi08-curl.txt)

---

### CTAPI09 – Validação - Criar reserva faltando campo (firstname)

- **Tipo(s) de Teste:** Validação, Negativo
- **Ambiente:** Postman Desktop / Linux Mint 22.3
- **Endpoint:** `POST https://restful-booker.herokuapp.com/booking`
- **Headers:** `Content-Type: application/json`
- **Body (request - sem firstname):**

~~~json
{
  "lastname": "Silva",
  "totalprice": 100,
  "depositpaid": true,
  "bookingdates": {
    "checkin": "2025-06-01",
    "checkout": "2025-06-05"
  }
}
~~~

- **Status Esperado:** 400 Bad Request
- **Resultado Esperado:** Mensagem indicando campo obrigatório ausente.
- **Response Obtido:** 500 Internal Server Error
- **Status Final:** ❌ Falhou
- **Resultado / Observações:** Bug: A API retornou 500 Internal Server Error quando deveria retornar 400 Bad Request.
- **Evidências:** [PNG](./evidencias/ctapi09/ctapi09.png) | [curl](./evidencias/ctapi09/ctapi09-curl.txt)

---

### CTAPI10 – Validação - Checkin posterior a checkout

- **Tipo(s) de Teste:** Validação, Negativo
- **Ambiente:** Postman Desktop / Linux Mint 22.3
- **Endpoint:** `POST https://restful-booker.herokuapp.com/booking`
- **Headers:** `Content-Type: application/json`
- **Body (request - checkin > checkout):**

~~~json
{
  "firstname": "João",
  "lastname": "Silva",
  "totalprice": 150,
  "depositpaid": true,
  "bookingdates": {
    "checkin": "2025-06-10",
    "checkout": "2025-06-05"
  },
  "additionalneeds": "WiFi"
}
~~~

- **Status Esperado:** 400 Bad Request
- **Resultado Esperado:** Validação falha: checkin deve ser anterior a checkout.
- **Response Obtido:** 200 OK (reserva criada indevidamente)
- **Status Final:** ❌ Falhou
- **Resultado / Observações:** Bug: A API retornou sucesso na criação de uma reserva com data de entrada maior que a data de saída. Deveria retornar erro.
- **Evidências:** [PNG](./evidencias/ctapi10/ctapi10.png) | [curl](./evidencias/ctapi10/ctapi10-curl.txt)

---

### CTAPI11 – Filtros - Buscar reservas por nome

- **Tipo(s) de Teste:** Funcional, Consulta
- **Ambiente:** Postman Desktop / Linux Mint 22.3
- **Endpoint:** `GET https://restful-booker.herokuapp.com/booking?firstname=João`
- **Headers:** N/A
- **Status Esperado:** 200 OK
- **Resultado Esperado:** Lista contém apenas bookings com `firstname=João`.
- **Response Obtido:**

~~~json
[
  {
    "bookingid": 4977
  }
]
~~~

- **Status Final:** ✅ Passou
- **Resultado / Observações:** Nos conformes.
- **Evidências:** [PNG1](./evidencias/ctapi11/ctapi11%20-%20print%2001.png) | [PNG2](./evidencias/ctapi11/ctapi11%20-%20print%2002.png) | [curl](./evidencias/ctapi11/ctapi11-curl.txt) | [complemento](./evidencias/ctapi11/ctapi04-curl%20-%20complementar.txt)

---

### CTAPI12 – Filtros - Buscar reservas por data (checkin)

- **Tipo(s) de Teste:** Funcional, Negativo
- **Ambiente:** Postman Desktop / Linux Mint 22.3
- **Endpoint:** `GET https://restful-booker.herokuapp.com/booking?checkin=2025-06-01`
- **Headers:** N/A
- **Status Esperado:** 200 OK
- **Resultado Esperado:** Filtrar corretamente as reservas com aquela data de checkin.
- **Response Obtido:**

~~~json
[
  {
    "bookingid": 8
  },
  {
    "bookingid": 72
  },
  {
    "bookingid": 292
  },
  {
    "bookingid": 345
  }
]
~~~

- **Status Final:** ❌ Falhou
- **Resultado / Observações:** Bug: O filtro por data de check-in não funciona. A requisição retornou reservas que não correspondem à data informada (ex: ID 8 com checkin 2025-07-14).
- **Evidências:** [PNG1](./evidencias/ctapi12/ctapi12%20-%20print%2001.png) | [PNG2](./evidencias/ctapi12/ctapi12%20-%20print%2002.png) | [curl](./evidencias/ctapi12/ctapi12-curl.txt) | [complemento](./evidencias/ctapi12/ctapi04-curl%20-%20complementar.txt)

---

### CTAPI13 – Erros - Buscar reserva com ID inexistente

- **Tipo(s) de Teste:** Tratamento de erros, Negativo
- **Ambiente:** Postman Desktop / Linux Mint 22.3
- **Endpoint:** `GET https://restful-booker.herokuapp.com/booking/999999`
- **Headers:** N/A
- **Status Esperado:** 404 Not Found
- **Resultado Esperado:** Mensagem 'Not Found' ou corpo vazio.
- **Response Obtido:** 404 Not Found
- **Status Final:** ✅ Passou
- **Resultado / Observações:** Nos conformes.
- **Evidências:** [PNG](./evidencias/ctapi13/ctapi13.png) | [curl](./evidencias/ctapi13/ctapi13-curl.txt)

---

### CTAPI14 – Erros - Enviar JSON malformado

- **Tipo(s) de Teste:** Tratamento de erros, Negativo
- **Ambiente:** Postman Desktop / Linux Mint 22.3
- **Endpoint:** `POST https://restful-booker.herokuapp.com/booking`
- **Headers:** `Content-Type: application/json`
- **Body (request - JSON inválido):**

~~~json
{
  "firstname": "João",
}
~~~

- **Status Esperado:** 400 Bad Request
- **Resultado Esperado:** Mensagem de erro de parsing.
- **Response Obtido:** 400 Bad Request
- **Status Final:** ✅ Passou
- **Resultado / Observações:** Nos conformes.
- **Evidências:** [PNG](./evidencias/ctapi14/ctapi14.png) | [curl](./evidencias/ctapi14/ctapi14-curl.txt)

---

### CTAPI15 – Performance - Teste de carga em /booking

- **Tipo(s) de Teste:** Performance, Carga
- **Ambiente:** Postman Desktop / Linux Mint 22.3
- **Endpoint:** `GET https://restful-booker.herokuapp.com/booking`
- **Configuração:** 2 usuários virtuais durante 1 minuto.
- **Métricas obtidas:**
  - Total de requisições: 852
  - Throughput: 14.11 req/s
  - Média: 131ms
  - P95: 132ms
  - Erro: 0%
- **Critérios:** Média < 500ms, P95 < 800ms, erro 0% → ✅ Atendidos
- **Status Final:** ✅ Passou
- **Resultado / Observações:** Nos conformes.
- **Evidência:** [PNG](./evidencias/ctapi15/ctapi15.png)

---

### CTAPI16 – Segurança - Injeção de SQL em parâmetro

- **Tipo(s) de Teste:** Segurança, Negativo
- **Ambiente:** Postman Desktop / Linux Mint 22.3
- **Endpoint:** `GET https://restful-booker.herokuapp.com/booking?firstname=' OR 1=1 --`
- **Headers:** N/A
- **Status Esperado:** 200 OK
- **Resultado Esperado:** Resposta sem dados extras nem erro de banco, tratado como string normal.
- **Response Obtido:** `[]` (array vazio)
- **Status Final:** ✅ Passou
- **Resultado / Observações:** Nos conformes (API trata como string normal).
- **Evidências:** [PNG](./evidencias/ctapi16/ctapi16.png) | [curl](./evidencias/ctapi16/ctapi16-curl.txt)

---

### CTAPI17 – Segurança - Tentativa de acesso sem token (PUT)

- **Tipo(s) de Teste:** Segurança, Autenticação
- **Ambiente:** Postman Desktop / Linux Mint 22.3
- **Endpoint:** `PUT https://restful-booker.herokuapp.com/booking/1374`
- **Headers:** `Content-Type: application/json` (sem Cookie)
- **Body (request):**

~~~json
{
  "firstname": "Test"
}
~~~

- **Status Esperado:** 403 Forbidden
- **Resultado Esperado:** Sem autenticação, operação negada.
- **Response Obtido:** 403 Forbidden
- **Status Final:** ✅ Passou
- **Resultado / Observações:** Nos conformes.
- **Evidências:** [PNG](./evidencias/ctapi17/ctapi17.png) | [curl](./evidencias/ctapi17/ctapi17-curl.txt)

---

### CTAPI18 – Automação via script - Execução da coleção via CLI

- **Tipo(s) de Teste:** Automação, CLI
- **Ambiente:** Postman Desktop + Postman CLI (terminal) / Linux Mint 22.3
- **Comando:** `postman collection run` (detalhes no relatório)
- **Resultado Esperado:** 0 falhas, relatório gerado.
- **Resultado Obtido:** Suite executada com sucesso, relatório gerado.
- **Status Final:** ✅ Passou
- **Resultado / Observações:** Nos conformes.
- **Evidências:** [PNG1](./evidencias/ctap18/ctapi18%20-%20print%2001.png) | [PNG2](./evidencias/ctap18/ctapi18%20-%20print%2002.png) | [Relatório HTML](./evidencias/ctap18/QA_Teste_API-2026-05-15-18-03-43.html)

---

### CTAPI19 – Validação de schema da resposta (criar reserva)

- **Tipo(s) de Teste:** Validação, Contrato
- **Ambiente:** Postman Desktop / Linux Mint 22.3
- **Endpoint:** `POST https://restful-booker.herokuapp.com/booking`
- **Headers:** `Content-Type: application/json`
- **Body (request):**

~~~json
{
  "firstname": "João",
  "lastname": "Silva",
  "totalprice": 150,
  "depositpaid": true,
  "bookingdates": {
    "checkin": "2013-06-01",
    "checkout": "2025-06-05"
  },
  "additionalneeds": "Breakfast"
}
~~~

- **Status Esperado:** 200 OK
- **Resultado Esperado:** Schema JSON válido (bookingid, booking.*)
- **Response Obtido:** 200 OK, schema conforme esperado.
- **Status Final:** ✅ Passou
- **Resultado / Observações:** Nos conformes (validação de schema passou mesmo com a data inconsistente – validação estrutural apenas).
- **Evidências:** [PNG](./evidencias/ctapi19/ctapi19.png) | [curl](./evidencias/ctapi19/ctapi19-curl.txt)

---

**Nota final:** Os detalhes completos de cada requisição (headers, body, respostas) estão documentados nos prints e arquivos curl anexados. A collection utilizada está disponível em `api-testing/collection/QA_Teste_API.postman_collection.json`.
```

---