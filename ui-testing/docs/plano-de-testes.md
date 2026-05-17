# Plano de Testes – UI (Sauce Demo) – Testes Manuais

## 1. Objetivo
Executar testes manuais no site **Sauce Demo** para validar os fluxos funcionais, de interface, responsividade (redimensionamento em desktop) e acessibilidade, registrando evidências em GIFs e capturas de tela, conforme planilha de controle.

## 2. Escopo
### Funcionalidades testadas manualmente (conforme planilha)
- Login com sucesso (`standard_user`)
- Login de usuário bloqueado (`locked_out_user`)
- Login de usuário inexistente
- Ordenação de produtos (A to Z / Z to A)
- Fluxo completo de compra
- Remoção de itens do carrinho
- Navegação entre páginas (produto → detalhes → voltar) – com foco em lentidão
- Logout
- Teste visual (redimensionamento da janela do navegador em desktop)
- Acessibilidade (verificação da opção de contraste de tela)

### Ambiente utilizado (único, conforme planilha)
- **Navegador**: Chromium 126
- **Sistema Operacional**: Linux Mint 22.3
- **Tela**: Desktop (sem testes em tablet ou mobile)

## 3. Critérios de Aceite
- Cada caso de teste manual deve ser executado seguindo exatamente o passo a passo descrito na planilha.
- Resultados (passou/falhou) devem ser registrados com observações detalhadas.
- Evidências (GIFs e/ou PNGs) devem ser anexadas conforme indicado na coluna "Evidência".

## 4. Dados de Teste (conforme planilha)
| Usuário                     | Senha          | Utilizado em          |
|-----------------------------|----------------|-----------------------|
| `standard_user`             | `secret_sauce` | CT01, CT05, CT08      |
| `locked_out_user`           | `secret_sauce` | CT02                  |
| `problem_user`              | `secret_sauce` | CT04                  |
| `performance_glitch_user`   | `secret_sauce` | CT07                  |
| `error_user`                | `secret_sauce` | CT06                  |
| `caramelo` (inexistente)    | `caramelo123`  | CT03                  |

## 5. Resumo dos Resultados (extraído da planilha)
| ID   | Caso de Teste                           | Status       |
|------|-----------------------------------------|--------------|
| CT01 | Login com Sucesso Standard User         | ✅ Passou    |
| CT02 | Login de Usuário Bloqueado Locked Out   | ✅ Passou    |
| CT03 | Login de Usuário Inexistente            | ✅ Passou    |
| CT04 | Ordenação de Produtos A to Z e Z to A   | ❌ Falhou    |
| CT05 | Fluxo Completo de Compra                | ✅ Passou    |
| CT06 | Remoção de Itens do Carrinho            | ❌ Falhou    |
| CT07 | Navegação entre Páginas                 | ❌ Falhou    |
| CT08 | Execução de Logout                      | ✅ Passou    |
| CT09 | Teste Visual (Responsividade)           | ❌ Falhou    |
| CT10 | Acessibilidade (Contraste de Tela)      | ❌ Falhou    |

> O detalhamento completo (passo a passo, resultados esperados/obtidos, evidências) está no arquivo [`casos-de-teste.md`](./casos-de-teste.md).

## 6. Riscos e Problemas Identificados (com base nos resultados da planilha)
| Problema                                 | Severidade | Observação (extraída da planilha)                           |
|------------------------------------------|------------|-------------------------------------------------------------|
| Ordenação Z-A não funciona               | Média      | Filtros não alteram a ordem de exibição (`problem_user`).   |
| Imagens de produtos erradas (cachorro)   | Média      | Todos os produtos mostram uma imagem aleatória de cachorro. |
| Remoção de item do carrinho não funciona | Alta       | Botão "Remove" não remove o item (`error_user`).            |
| Lentidão notável na navegação            | Média      | Atraso perceptível ao voltar para a lista de produtos (`performance_glitch_user`). |
| Elementos visuais desalinhados           | Média      | Botões, cards e textos desalinhados ao redimensionar a janela (desktop). |
| Ausência de opção de contraste de tela   | Média      | Menu lateral não contém a opção de acessibilidade.          |

## 7. Evidências Coletadas (conforme planilha)
- GIFs: `ct01.gif` a `ct08.gif`, `ct10.gif` (pasta `ui-testing/evidencias/e2e/testes-manuais/ctXX/`)
- PNGs: `ct04.png` (imagens erradas) e comparativos visuais do CT09 (modelos positivos/negativos)

## 8. Ferramentas Utilizadas (conforme informado na planilha)
- **Navegador Chromium 126**
- **Sistema operacional Linux Mint 22.3**
- **Git** para versionamento dos artefatos

## 9. Cronograma (execução manual, baseado na planilha)
| Atividade                           | Duração estimada |
|-------------------------------------|------------------|
| Execução dos 10 casos de teste      | 5h               |
| Registro de evidências (GIFs/PNGs)  | 2h               |
| Documentação dos resultados         | 2h               |
| **Total**                           | **8h**           |

---

**Observação final**: Este plano cobre **exclusivamente os testes manuais** executados em desktop.