# Cenários BDD – Testes Manuais UI (Sauce Demo)

Este documento apresenta os cenários de teste no formato **BDD (Behavior-Driven Development)**.

---

## CT01 – Login com Sucesso Standard User

**Dado** que estou na página de login  
**Quando** insiro 'standard_user' e senha válida  
**Então** sou redirecionado para a página de produtos.

---

## CT02 – Login de Usuário Bloqueado Locked Out

**Dado** que estou na página de login  
**Quando** insiro 'locked_out_user' e senha válida  
**Então** visualizo a mensagem de aviso de bloqueio.

---

## CT03 – Login de Usuário Inexistente

**Dado** que estou na página de login  
**Quando** insiro 'caramelo' e senha 'caramelo123'  
**Então** visualizo a mensagem de aviso de que o usuário/senha não foram encontrados.

---

## CT04 – Ordenação de Produtos A to Z e Z to A

**Dado** que estou logado na página de produtos  
**Quando** altero o filtro de ordenação  
**Então** a lista de produtos deve ser reorganizada corretamente.

---

## CT05 – Fluxo Completo de Compra

**Dado** que adicionei produtos ao carrinho  
**Quando** preencho os dados de checkout e finalizo  
**Então** visualizo a confirmação do pedido.

---

## CT06 – Remoção de Itens do Carrinho

**Dado** que estou na página de produtos e tenho um item adicionado ao carrinho  
**Quando** clico no botão 'Remove'  
**Então** o item deve ser removido e o contador atualizado.

---

## CT07 – Navegação entre Páginas

**Dado** que estou na página de um produto  
**Quando** clico em "Back to products"  
**Então** sou direcionado para a página de produtos.

---

## CT08 – Execução de Logout

**Dado** que estou logado no sistema  
**Quando** clico no menu lateral e seleciono 'Logout'  
**Então** sou desconectado.

---

## CT09 – Teste Visual

**Dado** que estou logado na página de produtos  
**Quando** redimensiono a janela do navegador para diferentes resoluções  
**Então** os elementos (botões, cards, textos) devem estar alinhados, legíveis e bem distribuídos, e o menu lateral deve funcionar em modo mobile.

---

## CT10 – Acessibilidade

**Dado** que estou logado na página de produtos  
**Quando** clico no menu lateral ("Hambúrguer")  
**Então** devo visualizar a opção de "Contraste de Tela" disponível na lista de itens do menu.

---