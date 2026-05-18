# Análise de Bugs – UI (Sauce Demo) – Testes Manuais

Com base na execução dos casos de teste, os seguintes bugs foram identificados:

## Resumo dos Bugs

| ID        | Descrição                                   | Severidade | Caso Associado | Status     |
|-----------|---------------------------------------------|------------|----------------|------------|
| BUG-UI-01 | Filtros de ordenação (A-Z / Z-A) não funcionam | Média      | CT04           | Reportado  |
| BUG-UI-02 | Imagens de produtos incorretas (cachorro)  | Média      | CT04           | Reportado  |
| BUG-UI-03 | Remoção de item do carrinho não funciona    | Alta       | CT06           | Reportado  |
| BUG-UI-04 | Lentidão notável na navegação entre páginas | Média      | CT07           | Reportado  |
| BUG-UI-05 | Elementos visuais desalinhados ao redimensionar (desktop) | Média | CT09 | Reportado |
| BUG-UI-06 | Ausência de opção de contraste de tela      | Média      | CT10           | Reportado  |

---

## Detalhamento dos Bugs

### BUG-UI-01 – Filtros de ordenação (A-Z / Z-A) não funcionam
- **Caso associado:** CT04
- **Severidade:** Média
- **Usuário afetado:** `problem_user`
- **Descrição:** Ao selecionar os filtros "A to Z" ou "Z to A", a ordem dos produtos não se altera. Permanece na ordem padrão.
- **Resultado esperado:** Produtos reorganizados conforme critério escolhido.
- **Resultado atual:** Nenhuma alteração na ordem de exibição.
- **Evidência:** [`ct04.gif`](/ui-testing/evidencias/e2e/testes-manuais/ct04/ct04.gif)

---

### BUG-UI-02 – Imagens de produtos incorretas (cachorro)
- **Caso associado:** CT04
- **Severidade:** Média
- **Usuário afetado:** `problem_user`
- **Descrição:** Todos os produtos exibem a mesma imagem aleatória de um cachorro, em vez das imagens corretas.
- **Resultado esperado:** Cada produto mostra sua respectiva imagem (ex.: mochila, lanterna, etc.).
- **Resultado atual:** Imagem de cachorro em todos os produtos.
- **Evidência:** [`ct04.png`](/ui-testing/evidencias/e2e/testes-manuais/ct04/ct04.png)

---

### BUG-UI-03 – Remoção de item do carrinho não funciona
- **Caso associado:** CT06
- **Severidade:** Alta
- **Usuário afetado:** `error_user`
- **Descrição:** Após adicionar um produto ao carrinho, o botão "Remove" não remove o item. O contador do carrinho permanece com o valor antigo e o item continua na lista. Erros visíveis no console (logs).
- **Resultado esperado:** Item removido, contador atualizado (zerado ou sem badge).
- **Resultado atual:** Nenhuma remoção ocorre; erro nos logs.
- **Evidência:** [`ct06.gif`](/ui-testing/evidencias/e2e/testes-manuais/ct06/ct06.gif)

---

### BUG-UI-04 – Lentidão notável na navegação entre páginas
- **Caso associado:** CT07
- **Severidade:** Média
- **Usuário afetado:** `performance_glitch_user`
- **Descrição:** Ao clicar em um produto e depois em "Back to products", há um atraso perceptível e incômodo no carregamento da página de produtos.
- **Resultado esperado:** Redirecionamento rápido (sem lentidão perceptível).
- **Resultado atual:** Lentidão notável ao voltar para a lista de produtos.
- **Evidência:** [`ct07.gif`](/ui-testing/evidencias/e2e/testes-manuais/ct07/ct07.gif)

---

### BUG-UI-05 – Elementos visuais desalinhados ao redimensionar a janela
- **Caso associado:** CT09
- **Severidade:** Média
- **Descrição:** Ao redimensionar a janela do navegador (mesmo em desktop), os botões, cards de produtos e textos ficam completamente desalinhados, quebrando o layout.
- **Resultado esperado:** Elementos reorganizados de forma responsiva, alinhados e legíveis.
- **Resultado atual:** Layout quebrado, elementos fora de posição.
- **Evidências:** 
  - Modelos positivos: [`modelo positivo - problema visual 01.png`](/ui-testing/evidencias/e2e/testes-manuais/ct09/modelo%20positivo%20-%20problema%20visual%2001.png) e [`modelo positivo - problema visual 02.png`](/ui-testing/evidencias/e2e/testes-manuais/ct09/modelo%20positivo%20-%20problema%20visual%2002.png)
  - Problemas encontrados: [`problema visual 01.png`](/ui-testing/evidencias/e2e/testes-manuais/ct09/problema%20visual%2001.png) e [`problema visual 02.png`](/ui-testing/evidencias/e2e/testes-manuais/ct09/problema%20visual%2002.png)

---

### BUG-UI-06 – Ausência de opção de contraste de tela
- **Caso associado:** CT10
- **Severidade:** Média
- **Descrição:** O menu lateral (hambúrguer) não contém a opção "Contraste de Tela" ou qualquer recurso similar de acessibilidade visual.
- **Resultado esperado:** Opção de contraste disponível e funcionando.
- **Resultado atual:** Opção não encontrada.
- **Recomendação da planilha:** Criar esta opção para que usuários com deficiência visual possam utilizar.
- **Evidência:** [`ct10.gif`](/ui-testing/evidencias/e2e/testes-manuais/ct10/ct10.gif)

---

## Observações Finais
- Todos os bugs foram identificados durante a execução manual dos testes, conforme descrito na planilha.
- Os usuários afetados (`problem_user`, `error_user`, `performance_glitch_user`) são específicos e apresentam comportamentos distintos do `standard_user`.
- Recomenda-se priorizar a correção do **BUG-UI-03** (remoção do carrinho) por ser de severidade alta e impactar diretamente o fluxo de compra.