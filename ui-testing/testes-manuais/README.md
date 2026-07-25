# 🖐️ Testes Manuais de UI — Sauce Demo

## Sobre este Módulo

Este módulo documenta **10 casos de teste manuais** executados no site [Sauce Demo](https://www.saucedemo.com/), um e-commerce de demonstração amplamente utilizado como alvo de estudo em Qualidade de Software. Os testes foram conduzidos em ambiente desktop com foco em **funcionalidade, usabilidade, performance, segurança e acessibilidade**.

A abordagem manual permite validar comportamentos que a automação não captura sozinha: percepção visual de layout, experiência de navegação real, lentidão subjetiva e contraste de cores. Cada caso de teste possui **evidência visual própria** (GIFs animados e PNGs comparativos) para total rastreabilidade.

## 🧪 Casos de Teste Manuais

| CT | Cenário | Status |
|---|---|---|
| **CT01** | Login com Sucesso — Standard User | ✅ Passou |
| **CT02** | Login de Usuário Bloqueado — Locked Out User | ✅ Passou |
| **CT03** | Login de Usuário Inexistente | ✅ Passou |
| **CT04** | Ordenação de Produtos (A → Z / Z → A) | ❌ Falhou |
| **CT05** | Fluxo Completo de Compra | ✅ Passou |
| **CT06** | Remoção de Itens do Carrinho | ❌ Falhou |
| **CT07** | Navegação entre Páginas | ❌ Falhou |
| **CT08** | Execução de Logout | ✅ Passou |
| **CT09** | Teste Visual — Responsividade Multi-Viewport | ❌ Falhou |
| **CT10** | Acessibilidade — Contraste de Tela | ❌ Falhou |

> **Resumo:** 5 passaram / 5 falharam — os 5 cenários com falha originaram **6 bugs documentados** e **8 riscos mapeados**.

## 🛠 Ambiente de Execução

| Camada | Especificação |
|---|---|
| **Sistema Operacional** | Linux Mint 22.3 |
| **Navegador** | Chromium 126 |
| **Resolução Principal** | 1920×1080 |
| **Resoluções Adicionais (CT09)** | 1366×768, 768×1024, 375×667 |
| **Tipo de Execução** | Manual, interativa |
| **Evidências** | GIFs animados (CT01–CT08, CT10) + PNGs comparativos (CT09) |

## 📁 Estrutura do Diretório

```
testes-manuais/
├── README.md                          # ← Você está aqui
├── ct01/                              # Evidências do CT01
│   └── ct01.gif
├── ct02/
│   └── ct02.gif
├── ct03/
│   └── ct03.gif
├── ct04/
│   └── ct04.gif
├── ct05/
│   └── ct05.gif
├── ct06/
│   └── ct06.gif
├── ct07/
│   └── ct07.gif
├── ct08/
│   └── ct08.gif
├── ct09/                              # CT09 — múltiplos viewports
│   └── ct09.png
└── ct10/
    └── ct10.gif
```

> Cada pasta `ctXX/` contém a evidência visual correspondente ao caso de teste executado.

## 🎬 Evidências Visuais

Este módulo utiliza **GIFs animados** para demonstrar a execução passo a passo de cada cenário, permitindo que recrutadores e líderes de QA visualizem o comportamento real da aplicação sem precisar executar nada localmente.

| CT | Evidência | Tipo | Descrição |
|---|---|---|---|
| CT01 | [`ct01/ct01.gif`](ct01/ct01.gif) | GIF | Login bem-sucedido com standard_user |
| CT02 | [`ct02/ct02.gif`](ct02/ct02.gif) | GIF | Tentativa de login com usuário bloqueado |
| CT03 | [`ct03/ct03.gif`](ct03/ct03.gif) | GIF | Tentativa de login com credenciais inexistentes |
| CT04 | [`ct04/ct04.gif`](ct04/ct04.gif) | GIF | Falha na ordenação de produtos |
| CT05 | [`ct05/ct05.gif`](ct05/ct05.gif) | GIF | Fluxo completo de compra do início ao fim |
| CT06 | [`ct06/ct06.gif`](ct06/ct06.gif) | GIF | Falha na remoção de itens do carrinho |
| CT07 | [`ct07/ct07.gif`](ct07/ct07.gif) | GIF | Lentidão na navegação entre páginas |
| CT08 | [`ct08/ct08.gif`](ct08/ct08.gif) | GIF | Execução de logout com sucesso |
| CT09 | [`ct09/ct09.png`](ct09/ct09.png) | PNG | Comparação de layout em 4 resoluções diferentes |
| CT10 | [`ct10/ct10.gif`](ct10/ct10.gif) | GIF | Falha de contraste em elementos da interface |

## 🐛 Bugs Identificados

| ID | Descrição | Severidade | CT |
|---|---|---|---|
| **BUG-UI-01** | Filtros de ordenação (A-Z / Z-A) não funcionam corretamente | Média | CT04 |
| **BUG-UI-02** | Imagens de produtos incorretas/exibindo imagem de cachorro | Média | CT04 |
| **BUG-UI-03** | Remoção de itens do carrinho não atualiza o contador | Média | CT06 |
| **BUG-UI-04** | Navegação entre páginas apresenta lentidão perceptível (>3s) | Média | CT07 |
| **BUG-UI-05** | Layout responsivo quebra em viewports menores (tablet/mobile) | Média | CT09 |
| **BUG-UI-06** | Ausência de contraste adequado em botões e links | Média | CT10 |

> Todos os bugs foram **reproduzidos posteriormente via automação** (Cypress e Robot Framework), confirmando consistência entre as abordagens manual e automatizada.

## 📊 Documentação de Apoio

Os testes manuais foram estruturados sobre uma base documental robusta, disponível em [`../docs/`](../docs/):

| Documento | Conteúdo |
|---|---|
| [`../docs/01-plano-de-testes.md`](../docs/01-plano-de-testes.md) | Estratégia, escopo, critérios de entrada/saída e ambientes |
| [`../docs/02-bdd-cenarios.md`](../docs/02-bdd-cenarios.md) | Cenários BDD em Gherkin (PT-BR) para CT01–CT10 |
| [`../docs/03-casos-de-teste.md`](../docs/03-casos-de-teste.md) | Detalhamento passo a passo de cada CT com pré-condições, dados e resultados esperados |
| [`../docs/04-analise-de-bugs.md`](../docs/04-analise-de-bugs.md) | Documentação completa dos 6 bugs identificados |
| [`../docs/05-analise-de-riscos.md`](../docs/05-analise-de-riscos.md) | Matriz de riscos com 8 itens mapeados (Probabilidade × Impacto) |
| [`../docs/06-sugestoes-melhoria.md`](../docs/06-sugestoes-melhoria.md) | Sugestões técnicas e de UX para elevação da qualidade |
| [`../docs/Planilha de Controle de Testes - Sauce Demo.xlsx`](../docs/Planilha%20de%20Controle%20de%20Testes%20-%20Sauce%20Demo.xlsx) | Controle executivo com status, datas, responsável e resumo |

> A planilha de controle e os documentos `.md` acima foram utilizados como base para o planejamento, execução e rastreamento dos 10 casos de teste manuais deste módulo.

## 🧪 Massa de Dados Utilizada

| Usuário | Senha | Perfil | Utilizado em |
|---|---|---|---|
| `standard_user` | `secret_sauce` | Usuário padrão | CT01, CT05, CT08 |
| `locked_out_user` | `secret_sauce` | Usuário bloqueado | CT02 |
| `problem_user` | `secret_sauce` | Problemas de imagem | CT04 |
| `performance_glitch_user` | `secret_sauce` | Lentidão | CT07 |
| `error_user` | `secret_sauce` | Erros de interação | CT06 |
| `visual_user` | `secret_sauce` | Problemas visuais | CT09 |
| `caramelo` | `caramelo123` | Inexistente | CT03 |

## 🏗 Metodologia Aplicada

### Ciclo Completo de QA

1. **Planejamento** — Definição de escopo, critérios de aceite e ambientes (baseado no `01-plano-de-testes.md`)
2. **Especificação BDD** — Cenários em linguagem natural técnica (Gherkin) documentados em `02-bdd-cenarios.md`
3. **Execução Manual** — Testes interativos com registro de evidências visuais, acompanhados pela planilha de controle
4. **Análise de Bugs** — Documentação de defeitos com severidade e passos de reprodução (`04-analise-de-bugs.md`)
5. **Mapeamento de Riscos** — Matriz Probabilidade × Impacto com mitigações (`05-analise-de-riscos.md`)
6. **Sugestões de Melhoria** — Propostas técnicas e de UX (`06-sugestoes-melhoria.md`)
7. **Automação de Regressão** — Os mesmos cenários foram posteriormente automatizados em Cypress e Robot Framework

### Critérios de Teste

- **Funcional:** Validação de regras de negócio (login, carrinho, compra)
- **Usabilidade:** Facilidade de navegação e clareza de mensagens
- **Performance:** Tempo de resposta perceptível ao usuário
- **Segurança:** Tratamento de credenciais inválidas e acesso não autorizado
- **Acessibilidade:** Contraste de cores e compatibilidade com leitores de tela
- **Responsividade:** Adaptação de layout em múltiplas resoluções

## 📝 Nota sobre Documentação

A lógica de negócios, criação dos casos de teste, execução manual e validação dos resultados foram desenvolvidas integralmente pelo autor. A estruturação, formatação e revisão textual desta documentação contaram com o auxílio de assistentes de IA, utilizados como ferramenta de produtividade para melhoria gramatical, apresentação, assertividade e agilidade, sob **total supervisão e curadoria técnica do autor**.

## 👤 Autoria

**Hebert Pezzoti da Silva**  
🔗 [linkedin.com/in/hebertpezzoti](https://www.linkedin.com/in/hebertpezzoti)  
📧 hebertpezzoti@hotmail.com

*Este projeto é uma demonstração técnica de competências em Qualidade de Software. Todo o conteúdo de testes, evidências e documentação foi produzido e validado manualmente pelo autor.*
