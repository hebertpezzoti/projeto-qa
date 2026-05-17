const { defineConfig } = require("cypress");

module.exports = defineConfig({
  // Segurança: desabilita a API legada Cypress.env()
  allowCypressEnv: false,

  // Grava vídeos dos testes (formato .mp4)
  video: true,

  // Tira screenshot automaticamente em caso de falha
  screenshotOnRunFailure: true,

  // Limpa vídeos e screenshots antigos antes de cada execução
  trashAssetsBeforeRuns: true,

  // Reporter responsável por gerar o relatório HTML/JSON
  reporter: 'cypress-mochawesome-reporter',

  // Opções do reporter (sem subpasta dinâmica)
  reporterOptions: {
    charts: true,                // Gráficos de pizza no relatório
    embeddedScreenshots: true,  // Insere screenshots (base64) no HTML
    inlineAssets: true,         // Gera um único arquivo HTML autossuficiente
    saveAllAttempts: false,     // Não salva tentativas de retry
    reportDir: 'cypress/reports', // Pasta onde os relatórios serão salvos
    reportFilename: 'relatorio',  // Nome base (timestamp será adicionado automaticamente)
    overwrite: false,             // Não sobrescreve arquivos com mesmo nome
    timestamp: true,              // Adiciona timestamp ao nome do arquivo (ex: relatorio_2026-05-17_15-30-00.html)
    html: true,                   // Garante a geração do HTML
    json: true,                   // Mantém os JSONs para debug
  },

  e2e: {
    setupNodeEvents(on, config) {
      // Registra o plugin do mochawesome (obrigatório)
      require('cypress-mochawesome-reporter/plugin')(on);
      // Não adicione lógica de subpasta datada aqui
      return config;
    },
  },
});