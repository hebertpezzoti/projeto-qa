
// Comando personalizado para Login
Cypress.Commands.add('login', (username, password) => {
    // Logando no Site
    cy.get('[data-test="username"]').should('be.visible').type(username);
    cy.get('[data-test="password"]').should('be.visible').type(password);
    cy.get('[data-test="login-button"]').click();

    // Verificando se fomos direcionado para a página de produtos
    cy.url().should('eq', 'https://www.saucedemo.com/inventory.html');
});


// Validações

// Validação de filtro de produto de A-Z ou Z-A
Cypress.Commands.add('validarOrdenacao', (tipo) => {
  const value = tipo === 'ZA' ? 'za' : 'az';
  cy.get('[data-test="product-sort-container"]').select(value);
  cy.get('.inventory_item_name').then(($els) => {
    const nomes = [...$els].map(el => el.innerText);
    const ordenados = tipo === 'ZA' ? [...nomes].sort().reverse() : [...nomes].sort();
    expect(nomes).to.deep.equal(ordenados);
  });
});

// Validando imagens não idênticas
Cypress.Commands.add('validarImagensDistintas', () => {
  cy.get('.inventory_item_img img').then(($imgs) => {
    const srcs = [...$imgs].map(img => img.src);
    const allSame = srcs.every(src => src === srcs[0]);
    expect(allSame).to.be.false;
  });
});


// ***********************************************
// This example commands.js shows you how to
// create various custom commands and overwrite
// existing commands.
//
// For more comprehensive examples of custom
// commands please read more here:
// https://on.cypress.io/custom-commands
// ***********************************************
//
//
// -- This is a parent command --
// Cypress.Commands.add('login', (email, password) => { ... })
//
//
// -- This is a child command --
// Cypress.Commands.add('drag', { prevSubject: 'element'}, (subject, options) => { ... })
//
//
// -- This is a dual command --
// Cypress.Commands.add('dismiss', { prevSubject: 'optional'}, (subject, options) => { ... })
//
//
// -- This will overwrite an existing command --
// Cypress.Commands.overwrite('visit', (originalFn, url, options) => { ... })