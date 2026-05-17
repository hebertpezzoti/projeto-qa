describe('Fluxo Completo de Compra', () => {
    it('Passos', () => {
        // Acessando o Site Sauce Demo
        cy.visit('https://www.saucedemo.com/');

        // Lognado
        cy.fixture('usuarios').then((usuarios) => {
            const user = usuarios.standard_user;
            cy.login(user.username, user.password);
        })

        // Adicionando um produto no carrinho:
        cy.get('[data-test="add-to-cart-sauce-labs-backpack"]').should('be.visible').click();

        // Abrindo carrinho:
        cy.get('[data-test="shopping-cart-link"]').should('be.visible').click();

        // Verificando se o item escolhido esta no carrinho:
        cy.get('[data-test="inventory-item-name"]').should('be.visible');

        // Avançando:
        cy.get('[data-test="checkout"]').should('be.visible').click();

        // Informando dados pessoais para compra:
        cy.get('[data-test="firstName"]').should('be.visible').type('João');
        cy.get('[data-test="lastName"]').should('be.visible').type('Silva');
        cy.get('[data-test="postalCode"]').should('be.visible').type('08330700');

        // Avançando:
        cy.get('[data-test="continue"]').should('be.visible').click();

        // Verificando se o item escolhido esta aqui:
        cy.get('[data-test="inventory-item-name"]').should('be.visible');

        // Finalizando a compra:
        cy.get('[data-test="finish"]').should('be.visible').click();

        // Verificando mensagem de confirmação:
        cy.get('[data-test="complete-header"]').should('be.visible');
    })
});