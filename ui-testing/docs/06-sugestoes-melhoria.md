# Sugestões de Melhoria – UI (Sauce Demo) – Testes Manuais

Com base nos resultados da execução manual dos casos de teste (CT01 a CT10), conforme registrado na planilha de controle, seguem as sugestões de melhoria para o sistema.

## 1. Correção de funcionalidades quebradas

### 1.1. Ordenação de produtos (A-Z / Z-A)
- **Problema identificado (CT04):** Os filtros "A to Z" e "Z to A" não alteram a ordem dos produtos no usuário `problem_user`.
- **Sugestão:** Revisar a lógica de ordenação no frontend, garantindo que funcione para todos os perfis de usuário.

### 1.2. Imagens dos produtos
- **Problema identificado (CT04):** Todos os produtos exibem a mesma imagem aleatória de um cachorro (usuário `problem_user`).
- **Sugestão:** Corrigir o mapeamento de imagens no código; verificar se o caminho dos assets está correto e se o fallback não é acionado indevidamente.

### 1.3. Remoção de itens do carrinho
- **Problema identificado (CT06):** Após adicionar um produto, o botão "Remove" não remove o item nem atualiza o contador. Erros são exibidos no console (usuário `error_user`).
- **Sugestão:** Corrigir a função de remoção, tratar as exceções e garantir que o estado do carrinho seja atualizado imediatamente.

### 1.4. Performance de navegação
- **Problema identificado (CT07):** Lentidão notável ao voltar da página de detalhes do produto para a lista de produtos (usuário `performance_glitch_user`).
- **Sugestão:** Identificar gargalos (scripts pesados, requisições desnecessárias, falta de cache) e otimizar o carregamento da página.

## 2. Melhorias de UI/UX e responsividade

### 2.1. Layout responsivo (redimensionamento de janela)
- **Problema identificado (CT09):** Ao redimensionar a janela do navegador (desktop), botões, cards e textos ficam completamente desalinhados, quebrando o layout.
- **Sugestão:** Utilizar técnicas CSS modernas (flexbox, grid, media queries) para garantir que os elementos se reorganizem adequadamente em diferentes larguras de tela, mesmo em desktop.

## 3. Melhorias de acessibilidade

### 3.1. Opção de contraste de tela
- **Problema identificado (CT10):** O menu lateral não contém a opção "Contraste de Tela", ausente qualquer recurso de acessibilidade visual.
- **Sugestão (conforme recomendação da planilha):** Criar esta opção para que usuários com deficiência visual possam utilizar. Implementar um botão ou alternador que ative um tema de alto contraste.

## 4. Melhorias no processo de teste e qualidade

### 4.1. Tratamento de erros e logs
- **Problema identificado (CT06):** Erros não tratados aparecem no console do navegador durante a remoção de itens.
- **Sugestão:** Implementar tratamento adequado de exceções e remover logs desnecessários em produção.

### 4.2. Perfis de usuário problemáticos
- **Observação da planilha:** Os bugs estão associados a perfis específicos (`problem_user`, `error_user`, `performance_glitch_user`).
- **Sugestão:** Criar uma suíte de testes de regressão automatizada que cubra esses perfis, garantindo que correções não quebrem outros cenários.

### 4.3. Mensagens de erro de login
- **Nota positiva (CT02 e CT03):** As mensagens de erro são claras e informativas.
- **Sugestão (opcional):** Manter o padrão atual, nenhuma ação necessária.

## 5. Documentação e evidências

### 5.1. Captura de evidências mais detalhadas
- **Observação:** Os GIFs e PNGs já são suficientes, mas seria útil incluir prints do console (CT06) para facilitar a depuração.
- **Sugestão:** Em futuros ciclos, registrar também as mensagens de erro do console quando aplicável.

---