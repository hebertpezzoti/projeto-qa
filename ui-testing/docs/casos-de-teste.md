# Casos de Teste – UI (Sauce Demo) – Testes Manuais

## Resumo dos Casos de Teste

| ID   | Caso de Teste                           | Status     | Evidência                                      |
|------|-----------------------------------------|------------|------------------------------------------------|
| CT01 | Login com Sucesso Standard User         | ✅ Passou  | [GIF](./evidencias/e2e/testes-manuais/ct01/ct01.gif) |
| CT02 | Login de Usuário Bloqueado Locked Out   | ✅ Passou  | [GIF](./evidencias/e2e/testes-manuais/ct02/ct02.gif) |
| CT03 | Login de Usuário Inexistente            | ✅ Passou  | [GIF](./evidencias/e2e/testes-manuais/ct03/ct03.gif) |
| CT04 | Ordenação de Produtos A to Z e Z to A   | ❌ Falhou  | [GIF](./evidencias/e2e/testes-manuais/ct04/ct04.gif) + [PNG](./evidencias/e2e/testes-manuais/ct04/ct04.png) |
| CT05 | Fluxo Completo de Compra                | ✅ Passou  | [GIF](./evidencias/e2e/testes-manuais/ct05/ct05.gif) |
| CT06 | Remoção de Itens do Carrinho            | ❌ Falhou  | [GIF](./evidencias/e2e/testes-manuais/ct06/ct06.gif) |
| CT07 | Navegação entre Páginas                 | ❌ Falhou  | [GIF](./evidencias/e2e/testes-manuais/ct07/ct07.gif) |
| CT08 | Execução de Logout                      | ✅ Passou  | [GIF](./evidencias/e2e/testes-manuais/ct08/ct08.gif) |
| CT09 | Teste Visual (Responsividade)           | ❌ Falhou  | [PNGs comparativos](./evidencias/e2e/testes-manuais/ct09/) |
| CT10 | Acessibilidade (Contraste de Tela)      | ❌ Falhou  | [GIF](./evidencias/e2e/testes-manuais/ct10/ct10.gif) |

---

## Detalhamento dos Casos de Teste

### CT01 – Login com Sucesso Standard User
- **Tipo(s) de Teste:** Funcional, Positivo
- **Ambiente:** Chromium 126 / Linux Mint 22.3
- **Pré-condição:** Navegador aberto, nenhum usuário logado.
- **Passo a Passo:**
  1. Acessar https://www.saucedemo.com/
  2. Inserir username: `standard_user`
  3. Inserir password: `secret_sauce`
  4. Clicar no botão 'Login'
  5. Validar redirecionamento para página `/inventory.html`
- **Resultado Esperado:** Acesso à página `/inventory.html` com sucesso.
- **Resultado Obtido:** Login realizado com sucesso.
- **Status:** ✅ Passou
- **Evidência:** ![CT01](./evidencias/e2e/testes-manuais/ct01/ct01.gif)

---

### CT02 – Login de Usuário Bloqueado Locked Out
- **Tipo(s) de Teste:** Funcional, Negativo
- **Ambiente:** Chromium 126 / Linux Mint 22.3
- **Pré-condição:** Navegador aberto, nenhum usuário logado.
- **Passo a Passo:**
  1. Acessar https://www.saucedemo.com/
  2. Inserir username: `locked_out_user`
  3. Inserir password: `secret_sauce`
  4. Clicar no botão 'Login'
  5. Validar se aparece mensagem de erro de bloqueio
- **Resultado Esperado:** Não seja possível logar com usuário bloqueado e receba mensagem equivalente.
- **Resultado Obtido:** Mensagem exibida: *"Epic sadface: Sorry, this user has been locked out."*
- **Status:** ✅ Passou
- **Evidência:** ![CT02](./evidencias/e2e/testes-manuais/ct02/ct02.gif)

---

### CT03 – Login de Usuário Inexistente
- **Tipo(s) de Teste:** Funcional, Negativo
- **Ambiente:** Chromium 126 / Linux Mint 22.3
- **Pré-condição:** Navegador aberto, nenhum usuário logado.
- **Passo a Passo:**
  1. Acessar https://www.saucedemo.com/
  2. Inserir username: `caramelo`
  3. Inserir password: `caramelo123`
  4. Clicar no botão 'Login'
  5. Validar se aparece mensagem de erro de usuário/senha inválidos
- **Resultado Esperado:** Não seja possível logar e receba mensagem equivalente.
- **Resultado Obtido:** Mensagem exibida: *"Epic sadface: Username and password do not match any user in this service"*
- **Status:** ✅ Passou
- **Evidência:** ![CT03](./evidencias/e2e/testes-manuais/ct03/ct03.gif)

---

### CT04 – Ordenação de Produtos A to Z e Z to A
- **Tipo(s) de Teste:** Funcional, UI/UX
- **Ambiente:** Chromium 126 / Linux Mint 22.3
- **Pré-condição:** Usuário logado (`problem_user`), na página de produtos (`inventory.html`), produtos carregados na ordem padrão.
- **Passo a Passo:**
  1. Fazer login com usuário e senha válida (usar `problem_user`)
  2. Acessar página de produtos
  3. Localizar botão de ordenação
  4. Selecionar filtro 'A to Z'
  5. Validar se produtos foram reorganizados alfabeticamente
  6. Selecionar filtro 'Z to A'
  7. Validar se produtos foram reorganizados em ordem reversa
  8. Validar se imagens dos produtos são corretas
- **Resultado Esperado:** Produtos ordenados conforme critério selecionado.
- **Resultado Obtido:** 
  - Filtros "A-Z e Z-A" não funcionam, não alteram ordem de exibição.
  - Imagens de produtos erradas (imagem de um cachorro em todos os produtos).
- **Status:** ❌ Falhou
- **Evidências:** 
  - ![GIF CT04](./evidencias/e2e/testes-manuais/ct04/ct04.gif)
  - ![PNG CT04](./evidencias/e2e/testes-manuais/ct04/ct04.png)

---

### CT05 – Fluxo Completo de Compra
- **Tipo(s) de Teste:** Funcional, End-to-End
- **Ambiente:** Chromium 126 / Linux Mint 22.3
- **Pré-condição:** Usuário logado com `standard_user`, carrinho vazio.
- **Passo a Passo:**
  1. Fazer login com `standard_user` e senha válida
  2. Acessar página de produtos
  3. Selecionar um produto e clicar 'Add to cart'
  4. Validar se produto foi adicionado ao carrinho
  5. Clicar no ícone do carrinho
  6. Clicar no botão 'Checkout'
  7. Preencher dados de checkout (First Name, Last Name, Postal Code)
  8. Clicar em 'Continue'
  9. Validar resumo do pedido
  10. Clicar em 'Finish'
  11. Validar mensagem de confirmação de pedido
- **Resultado Esperado:** Seja possível realizar com sucesso todo o processo de compra de um produto.
- **Resultado Obtido:** Sucesso no fluxo completo de compra de produto.
- **Status:** ✅ Passou
- **Evidência:** ![CT05](./evidencias/e2e/testes-manuais/ct05/ct05.gif)

---

### CT06 – Remoção de Itens do Carrinho
- **Tipo(s) de Teste:** Funcional, Negativo
- **Ambiente:** Chromium 126 / Linux Mint 22.3
- **Pré-condição:** Usuário logado (`error_user`), carrinho vazio.
- **Passo a Passo:**
  1. Acessar a página de produtos (vitrine)
  2. Selecionar um produto e clicar no botão "Add to cart"
  3. Validar que o ícone do carrinho exibe a quantidade 1
  4. Clicar no botão "Remove" (que agora substituiu o "Add to cart")
  5. Validar que o ícone do carrinho não exibe mais a quantidade (ou exibe 0 ou some o contador)
- **Resultado Esperado:** Item removido da lista e contador do carrinho atualizado.
- **Resultado Obtido:** Ao clicar "Remove", o sistema não remove e apresenta erro nos logs.
- **Status:** ❌ Falhou
- **Evidência:** ![CT06](./evidencias/e2e/testes-manuais/ct06/ct06.gif)

---

### CT07 – Navegação entre Páginas
- **Tipo(s) de Teste:** Funcional, Performance, Segurança
- **Ambiente:** Chromium 126 / Linux Mint 22.3
- **Pré-condição:** Usuário logado (`performance_glitch_user`), na página de produtos (`inventory.html`).
- **Passo a Passo:**
  1. Fazer login com usuário e senha válida
  2. Acessar página de produtos
  3. Clicar em um produto específico
  4. Clicar no botão 'Back to products'
  5. Validar se foi redirecionado para a página de produtos
  6. Validar se não há lentidão perceptível no carregamento
- **Resultado Esperado:** Redirecionamento para a página de produtos sem lentidão.
- **Resultado Obtido:** Lentidão notável na navegação entre páginas.
- **Status:** ❌ Falhou
- **Evidência:** ![CT07](./evidencias/e2e/testes-manuais/ct07/ct07.gif)

---

### CT08 – Execução de Logout
- **Tipo(s) de Teste:** Funcional
- **Ambiente:** Chromium 126 / Linux Mint 22.3
- **Pré-condição:** Usuário logado com `standard_user`, na página de produtos (`inventory.html`).
- **Passo a Passo:**
  1. Fazer login com `standard_user` e senha válida
  2. Acessar página de produtos
  3. Clicar no menu hambúrguer (menu lateral)
  4. Localizar opção 'Logout' no menu
  5. Clicar em 'Logout'
  6. Validar se foi redirecionado para página de login
  7. Validar se sessão foi encerrada (tentar acessar `/inventory` sem fazer login)
- **Resultado Esperado:** Retorno imediato à página inicial de login.
- **Resultado Obtido:** Sistema permitiu deslogar conforme esperado.
- **Status:** ✅ Passou
- **Evidência:** ![CT08](./evidencias/e2e/testes-manuais/ct08/ct08.gif)

---

### CT09 – Teste Visual (Responsividade)
- **Tipo(s) de Teste:** UI/UX, Responsividade
- **Ambiente:** Chromium 126 / Linux Mint 22.3
- **Pré-condição:** Navegador aberto, nenhum usuário logado.
- **Passo a Passo:**
  1. Acessar https://www.saucedemo.com/
  2. Fazer login com usuário e senha válida
  3. Redimensionar janela do navegador para diferentes tamanhos
  4. Validar se botões estão alinhados corretamente em cada resolução
  5. Validar se cards de produtos estão bem distribuídos
  6. Validar se textos são legíveis em todas as resoluções
  7. Validar se menu lateral funciona em mobile (embora testado apenas em desktop)
  8. Comparar layout com modelos esperados (positivos)
  9. Documentar inconsistências visuais encontradas
- **Resultado Esperado:** Elementos visuais da página apresentem coesão.
- **Resultado Obtido:** Botões, cards e textos completamente desalinhados, tanto em janela maximizada quanto redimensionada.
- **Status:** ❌ Falhou
- **Evidências (comparativos):**
  - Modelos positivos: `modelo positivo - problema visual 01.png`, `modelo positivo - problema visual 02.png`
  - Problemas encontrados: `problema visual 01.png`, `problema visual 02.png`
  - Pasta completa: [`./evidencias/e2e/testes-manuais/ct09/`](./evidencias/e2e/testes-manuais/ct09/)

---

### CT10 – Acessibilidade (Contraste de Tela)
- **Tipo(s) de Teste:** Acessibilidade, Negativo
- **Ambiente:** Chromium 126 / Linux Mint 22.3
- **Pré-condição:** Usuário logado, na página de produtos (`inventory.html`).
- **Passo a Passo:**
  1. Fazer login com usuário e senha válida
  2. Acessar página de produtos (inventory)
  3. Clicar no menu hambúrguer (menu lateral)
  4. Aguardar abertura do menu
  5. Procurar pela opção 'Contraste de Tela' na lista
  6. Validar se opção está visível e habilitada
  7. Se encontrada, clicar e validar se contraste foi aplicado
  8. Validar se textos e elementos ficam mais legíveis
- **Resultado Esperado:** Deva estar disponível opção de contraste visual.
- **Resultado Obtido:** Opção de contraste de tela não foi encontrada.
- **Status:** ❌ Falhou
- **Evidência:** ![CT10](./evidencias/e2e/testes-manuais/ct10/ct10.gif)
- **Recomendação:** Criar esta opção para que usuários com deficiência visual possam utilizar.