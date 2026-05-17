# Projeto de Testes - Sauce Demo & Restful-Booker

## 📌 Premissas
- Ambiente de teste: https://www.saucedemo.com/ (UI) e https://restful-booker.herokuapp.com/ (API)
- Dados de teste: usuários padrão (`standard_user`, `locked_out_user` etc.) e reservas de exemplo.
- Execução local com Cypress (UI) e Postman/Newman (API).

## 🛠️ Ferramentas
- Cypress 13+ (testes end-to-end)
- Postman (testes de API)
- Mochawesome (relatórios)
- Git (versionamento)

## ▶️ Como executar

### UI Testing
```bash
cd ui-testing/testes-automatizados/cypress
npm install
npx cypress run
# ou para modo interativo: npx cypress open