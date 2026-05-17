# Análise de Bugs – API (Restful-Booker) – Testes Manuais

Com base na execução dos casos de teste (conforme planilha), os seguintes bugs foram identificados:

## Resumo dos Bugs

| ID          | Descrição                                           | Severidade | Caso Associado | Status     |
|-------------|-----------------------------------------------------|------------|----------------|------------|
| BUG-API-01  | Data de checkin retornada diferente da enviada      | Média      | CTAPI03        | Reportado  |
| BUG-API-02  | Campo obrigatório `firstname` ausente causa 500     | Alta       | CTAPI09        | Reportado  |
| BUG-API-03  | Reserva com checkin > checkout é criada (sem erro)  | Alta       | CTAPI10        | Reportado  |
| BUG-API-04  | Filtro por data de checkin não funciona             | Média      | CTAPI12        | Reportado  |

---

## Detalhamento dos Bugs

### BUG-API-01 – Data de checkin retornada diferente da enviada

- **Caso associado:** CTAPI03
- **Severidade:** Média
- **Endpoint:** `POST /booking`
- **Descrição:** Ao criar uma reserva com `checkin: "2025-06-01"`, a API retorna no corpo da resposta `checkin: "2013-06-01"`. O dado é persistido errado.
- **Passos para reproduzir:**
  1. Enviar requisição POST para `/booking` com o JSON:
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
  2. Observar o campo `booking.bookingdates.checkin` na resposta.
- **Resultado esperado:** `checkin` deve ser `2025-06-01` (mesmo valor enviado).
- **Resultado atual:** `checkin` é `2013-06-01`.
- **Evidência:** [PNG](./evidencias/ctapi03/ctapi03.png) | [curl](./evidencias/ctapi03/ctapi03-curl.txt)

---

### BUG-API-02 – Campo obrigatório `firstname` ausente causa 500 Internal Server Error

- **Caso associado:** CTAPI09
- **Severidade:** Alta
- **Endpoint:** `POST /booking`
- **Descrição:** Quando se omite o campo obrigatório `firstname` no corpo da requisição, a API retorna erro 500 em vez de 400 Bad Request.
- **Passos para reproduzir:**
  1. Enviar POST para `/booking` com o JSON (sem `firstname`):
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
  2. Verificar o status code da resposta.
- **Resultado esperado:** 400 Bad Request com mensagem indicando campo obrigatório ausente.
- **Resultado atual:** 500 Internal Server Error.
- **Evidência:** [PNG](./evidencias/ctapi09/ctapi09.png) | [curl](./evidencias/ctapi09/ctapi09-curl.txt)

---

### BUG-API-03 – Reserva com `checkin` posterior a `checkout` é criada indevidamente

- **Caso associado:** CTAPI10
- **Severidade:** Alta
- **Endpoint:** `POST /booking`
- **Descrição:** A API permite criar uma reserva onde a data de check-in é maior que a data de check-out. Não há validação de consistência temporal.
- **Passos para reproduzir:**
  1. Enviar POST para `/booking` com o JSON:
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
  2. Verificar a resposta (status 200 e reserva criada).
- **Resultado esperado:** 400 Bad Request, rejeitando a reserva por data inválida.
- **Resultado atual:** 200 OK e a reserva é persistida com as datas inconsistentes.
- **Evidência:** [PNG](./evidencias/ctapi10/ctapi10.png) | [curl](./evidencias/ctapi10/ctapi10-curl.txt)

---

### BUG-API-04 – Filtro por data de checkin (`?checkin=`) não funciona corretamente

- **Caso associado:** CTAPI12
- **Severidade:** Média
- **Endpoint:** `GET /booking?checkin=2025-06-01`
- **Descrição:** Ao filtrar reservas por uma data de check-in específica, a API retorna reservas que não possuem aquela data. O filtro parece ignorar o parâmetro ou aplicar lógica incorreta.
- **Passos para reproduzir:**
  1. Executar `GET /booking?checkin=2025-06-01`
  2. Examinar os `bookingid` retornados e consultar seus detalhes.
- **Resultado esperado:** Retornar apenas reservas cujo `checkin` seja exatamente `2025-06-01` (ou nenhuma, se não houver).
- **Resultado atual:** Retorna IDs como 8, 72, 292, 345, que possuem checkin em datas diferentes (ex.: ID 8 tem checkin 2025-07-14).
- **Evidência:** [PNG1](./evidencias/ctapi12/ctapi12%20-%20print%2001.png) | [PNG2](./evidencias/ctapi12/ctapi12%20-%20print%2002.png) | [curl](./evidencias/ctapi12/ctapi12-curl.txt)

---

## Observações Finais

- Os bugs **BUG-API-02** e **BUG-API-03** são de alta severidade, pois comprometem a integridade dos dados e a validação de negócio.
- O **BUG-API-04** prejudica a usabilidade da API para consultas por período.
- Recomenda-se priorizar a correção desses problemas antes de novos releases.