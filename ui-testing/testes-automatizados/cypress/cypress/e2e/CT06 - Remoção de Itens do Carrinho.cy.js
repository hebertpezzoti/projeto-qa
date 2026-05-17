
describe('Remoção de Itens do Carrinho', () => {
    it('Passos', () => {
        // Acessando o Site Sauce Demo
        cy.visit('https://www.saucedemo.com/');

        // Lognado
        cy.fixture('usuarios').then((usuarios) => {
            const user = usuarios.error_user;
            cy.login(user.username, user.password);
        })

        // Adicionando um produto no carrinho:
        cy.get('[data-test="add-to-cart-sauce-labs-backpack"]').should('be.visible').click();

        // Verificando o contador de item no carrinho:
        cy.get('[data-test="shopping-cart-badge"]').should('have.text', '1');

        // Removendo item:
        cy.get('[data-test="remove-sauce-labs-backpack"]').should('be.visible').click();

        // Verificando se o contador zerou:
        cy.get('[data-test="shopping-cart-badge"]').should('not.exist');

        // Verificando que a opção "Add to cart" aparece novamente para o produto:
        cy.get('[data-test="add-to-cart-sauce-labs-backpack"]').should('be.visible');

    })
});