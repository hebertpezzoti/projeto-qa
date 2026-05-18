# Projeto de Testes – Sauce Demo (UI) + Restful-Booker (API)

Este projeto reúne **testes manuais e automatizados** para duas aplicações de referência:  
- **UI**: Sauce Demo (funcional, usabilidade, acessibilidade)  
- **API**: Restful-Booker (CRUD, autenticação, validação, performance, segurança)  

O objetivo é demonstrar uma abordagem completa de **Qualidade de Software**, incluindo planejamento, execução, análise de bugs, riscos e melhorias.

---

## Cobertura

| Tipo               | Quantidade | Escopo                                                         |
|--------------------|------------|----------------------------------------------------------------|
| Manuais (UI)       | 10 cenários | Login, carrinho, checkout, ordenação, responsividade, contraste |
| Automatizados (UI) | 10 cenários | Mesmos cenários manuais (Cypress + Mochawesome)                |
| Manuais (API)      | 19 cenários | Autenticação, CRUD, validação de campos/datas, filtros, injeção SQL, performance |
| Automatizados (API)| 2 cenários (amostra) | Executados via Postman CLI (relatório HTML gerado)             |

---

## Ferramentas utilizadas

- **Cypress** – automação end‑to‑end dos testes de UI  
- **Postman** – criação e execução manual da coleção de API  
- **Mochawesome** – geração de relatórios HTML com vídeos por caso  
- **Git + GitHub** – versionamento completo
- **Sistema Operacional Diferenciado: Linux**  
- **Markdown** – documentação padronizada  

---

## Metodologia e diferenciais

- **BDD** – cenários escritos em Dado/Quando/Então (`02-bdd-cenarios.md`)  
- **Mesmo cenário, duas abordagens** – cada caso funcional foi executado manualmente e depois automatizado  
- **Evidências ricas** – GIFs animados, PNGs, vídeos MP4, arquivos curl, relatório HTML  
- **Análises complementares** – bugs (severidade, reprodução), riscos (matriz), sugestões de melhoria acionáveis  
- **Teste de carga na API** – 852 requisições em 1 minuto (média 131ms, P95 132ms, erro 0%)  

---

## Estrutura do repositório

    projeto-qa/
    ├── README.md
    ├── .gitignore
    ├── ui-testing/
    │   ├── docs/                 # planos, casos, BDD, bugs, riscos, melhorias + planilha
    │   ├── evidencias/           # GIFs, PNGs das execuções manuais
    │   └── testes-automatizados/cypress/   # scripts + README específico
    ├── api-testing/
    │   ├── collection/           # Postman collection JSON
    │   ├── docs/                 # documentação análoga + planilha
    │   └── evidencias/           # prints, arquivos curl, relatório HTML

---

## Como executar (resumo)

- **Manuais** – siga os passos em `03-casos-de-teste.md` (dentro de `ui-testing/docs/` ou `api-testing/docs/`).  
- **Automação UI** – acesse `ui-testing/testes-automatizados/cypress/` e siga o `README.md` local (comandos completos de instalação e execução).  
- **API** – importe a collection `api-testing/collection/QA_Teste_API.postman_collection.json` no Postman e execute as requisições.

---

## Resultados em resumo

| Módulo | Aprovados | Falhas | Principais achados                                           |
|--------|-----------|--------|--------------------------------------------------------------|
| UI     | 5/10      | 5/10   | Ordenação quebrada, remoção do carrinho, lentidão, falta de contraste |
| API    | 15/19     | 4/19   | Datas inconsistentes, campo obrigatório retorna 500, filtro por data inválido |

Todos os bugs estão documentados com evidências e sugestões de correção.

---

**Autor:** Hebert Pezzoti da Silva 
**GitHub:** https://github.com/hebertpezzoti
**Linkdin:** www.linkedin.com/in/hebertpezzoti