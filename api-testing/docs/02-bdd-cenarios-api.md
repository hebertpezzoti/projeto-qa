# Cenários BDD – Testes de API (Restful-Booker)

Este documento apresenta os cenários de teste no formato **BDD (Behavior-Driven Development)**.

---

## CTAPI01 – Autenticação - Criar token (válido)

**Dado** que tenho credenciais válidas (admin/password123)  
**Quando** envio POST para `/auth`  
**Então** recebo um token de autenticação.

---

## CTAPI02 – Autenticação - Credenciais inválidas

**Dado** que tenho credenciais inválidas (admin/123)  
**Quando** envio POST para `/auth`  
**Então** recebo erro 'Bad credentials'.

---

## CTAPI03 – CRUD - Criar reserva

**Dado** que estou autenticado  
**Quando** envio dados válidos de uma reserva  
**Então** a reserva é criada com ID único.

---

## CTAPI04 – CRUD - Consultar reserva por ID

**Dado** que uma reserva existe (ID obtido no POST)  
**Quando** realizo GET para `/booking/{id}`  
**Então** obtenho os detalhes corretos.

---

## CTAPI05 – CRUD - Atualizar reserva (PUT) - autenticado

**Dado** que estou autenticado e uma reserva existe  
**Quando** envio PUT para `/booking/{id}` com dados atualizados  
**Então** a reserva é atualizada.

---

## CTAPI06 – CRUD - Atualizar parcialmente (PATCH)

**Dado** que estou autenticado e uma reserva existe  
**Quando** envio PATCH para `/booking/{id}` com apenas um campo  
**Então** apenas aquele campo é alterado.

---

## CTAPI07 – CRUD - Deletar reserva (autenticado)

**Dado** que estou autenticado e uma reserva existe  
**Quando** envio DELETE para `/booking/{id}`  
**Então** a reserva é removida.

---

## CTAPI08 – CRUD - Tentar deletar sem autenticação

**Dado** que NÃO estou autenticado  
**Quando** envio DELETE para `/booking/{id}`  
**Então** recebo erro de não autorizado.

---

## CTAPI09 – Validação de campos obrigatórios - Criar reserva faltando campo

**Dado** que envio POST para `/booking` sem o campo `firstname`  
**Então** recebo erro de validação.

---

## CTAPI10 – Validação de datas - Checkin posterior a checkout

**Dado** que envio reserva com `checkin` > `checkout`  
**Então** recebo erro de data inválida.

---

## CTAPI11 – Filtros e buscas - Buscar reservas por nome

**Dado** que existem reservas com `firstname` = 'João'  
**Quando** realizo GET para `/booking?firstname=João`  
**Então** retorna apenas as reservas com esse nome.

---

## CTAPI12 – Filtros e buscas - Buscar reservas por data

**Dado** que existem reservas com `checkin` = '2025-06-01'  
**Quando** realizo GET para `/booking?checkin=2025-06-01`  
**Então** retorna apenas as reservas com aquela data.

---

## CTAPI13 – Tratamento de erros - Buscar reserva com ID inexistente

**Dado** que não existe reserva com ID 999999  
**Quando** realizo GET para `/booking/999999`  
**Então** recebo `404 Not Found`.

---

## CTAPI14 – Tratamento de erros - Enviar JSON malformado

**Dado** que envio corpo com JSON inválido (vírgula extra)  
**Quando** envio POST para `/booking`  
**Então** recebo `400 Bad Request`.

---

## CTAPI15 – Performance - Teste de carga em `/booking`

**Dado** que executo teste de carga GET para `/booking` com 2 usuários virtuais durante 1 minuto  
**Quando** total de requisições se aproxima de 100  
**Então** tempo médio < 500ms, P95 < 800ms e erro 0%.

---

## CTAPI16 – Segurança - Injeção de SQL em parâmetro

**Dado** que envio `' OR 1=1 --` como `firstname`  
**Quando** realizo GET para `/booking?firstname=' OR 1=1 --`  
**Então** o sistema deve tratar como string normal e não executar SQL injection.

---

## CTAPI17 – Segurança - Tentativa de acesso sem token em PUT

**Dado** que não informo cookie de autenticação  
**Quando** envio PUT para `/booking/1`  
**Então** recebo `403 Forbidden`.

---

## CTAPI18 – Automação via script - Execução da coleção via Postman CLI

**Dado** que tenho uma collection no Postman  
**Quando** executo o comando `postman collection run` via CLI  
**Então** a suíte de testes é executada e um relatório de execução é gerado.

---

## CTAPI19 – Validação de schema da resposta - Criar reserva

**Dado** que recebo resposta `200 OK` ao criar reserva  
**Quando** valido o schema JSON da resposta  
**Então** o schema está conforme documentado.

---
