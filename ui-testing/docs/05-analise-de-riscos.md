# Análise de Riscos – UI (Sauce Demo) – Testes Manuais

Foram identificados os seguintes riscos associados à qualidade, usabilidade e segurança do sistema.

## Riscos Identificados

| ID do Risco | Descrição do Risco | Probabilidade | Impacto | Nível | Causa / Relação com os testes | Mitigação / Observação |
|-------------|--------------------|---------------|---------|-------|-------------------------------|------------------------|
| R-UI-01 | Usuário pode não conseguir ordenar produtos corretamente, afetando a experiência de busca. | Média (ocorre com `problem_user`) | Médio | **Médio** | Bug identificado no CT04: filtros "A to Z" e "Z to A" não alteram a ordem. | Priorizar correção do filtro; testar com outros perfis. |
| R-UI-02 | Exposição de imagens incorretas (cachorro) pode causar confusão e descredibilidade do site. | Média (ocorre com `problem_user`) | Médio | **Médio** | Bug no CT04: imagens de todos os produtos são de um cachorro. | Corrigir mapeamento de imagens; revisar assets. |
| R-UI-03 | O usuário não consegue remover itens do carrinho, impossibilitando a gestão do pedido antes do checkout. | Baixa (ocorre com `error_user`) | Alto | **Médio** | Bug no CT06: botão "Remove" não funciona; erro no console. | Corrigir com alta prioridade; testar funcionalidade de remoção em regressão. |
| R-UI-04 | Lentidão na navegação pode levar à frustração e abandono do fluxo de compra. | Baixa (ocorre com `performance_glitch_user`) | Médio | **Baixo** | Bug no CT07: atraso perceptível ao voltar da página do produto para a lista. | Investigar causa da lentidão (scripts, requisições) e otimizar. |
| R-UI-05 | Layout quebrado ao redimensionar a janela (desktop) prejudica a usabilidade em diferentes resoluções. | Alta (qualquer usuário) | Médio | **Alto** | Bug no CT09: botões, cards e textos desalinhados. | Adotar CSS responsivo; testar em múltiplos tamanhos de tela. |
| R-UI-06 | Ausência de opção de contraste de tela exclui usuários com deficiência visual, violando diretrizes de acessibilidade. | Alta (site inteiro) | Médio | **Médio** | Bug no CT10: opção de contraste não encontrada no menu lateral. | Incluir recurso de alto contraste como requisito de acessibilidade. |
| R-UI-07 | Dependência de usuários fixos para testes (`problem_user`, `error_user`, etc.) pode limitar a cobertura de cenários reais. | Média | Médio | **Médio** | Observado nos CT04, CT06, CT07. | Criar massa de dados mais variada ou permitir configuração de perfis. |
| R-UI-08 | Erros não tratados no console (CT06) podem indicar falhas de código que impactam outras funcionalidades. | Baixa | Médio | **Baixo** | Mencionado no CT06: "em logs apresenta erro". | Coletar logs detalhados e corrigir exceções. |

## Matriz de Probabilidade vs Impacto (resumo)

|                | Impacto Baixo | Impacto Médio | Impacto Alto |
|----------------|---------------|---------------|---------------|
| Probabilidade Baixa  | R-UI-04, R-UI-08 | R-UI-03       | –             |
| Probabilidade Média  | –             | R-UI-01, R-UI-02, R-UI-06, R-UI-07 | – |
| Probabilidade Alta   | –             | R-UI-05       | –             |

**Risco de maior nível:** **R-UI-05** (Layout quebrado ao redimensionar) – probabilidade alta e impacto médio, afeta todos os usuários.

## Recomendações Gerais

1. **Prioridade crítica:** Corrigir a remoção de itens do carrinho (R-UI-03) – impacto alto no fluxo principal.
2. **Prioridade alta:** Corrigir layout responsivo (R-UI-05) – afeta a experiência geral em diferentes resoluções.
3. **Melhorias de acessibilidade:** Implementar opção de contraste (R-UI-06).
4. **Revisão de código:** Investigar erros no console (R-UI-08) e ordenação (R-UI-01).
5. **Testes adicionais:** Incluir os usuários `problem_user`, `error_user` e `performance_glitch_user` nos ciclos de regressão.

---
