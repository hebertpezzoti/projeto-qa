describe('Navegação entre Páginas', () => {
    it('Passos', () => {
        // Acessando o Site Sauce Demo
        cy.visit('https://www.saucedemo.com/');

        // Lognado
        cy.fixture('usuarios').then((usuarios) => {
            const user = usuarios.performance_glitch_user;
            cy.login(user.username, user.password);
        })

        // Abrir um produto em especifico:
        cy.get('[data-test="item-4-title-link"] > [data-test="inventory-item-name"]').should('be.visible').click();

        // Clicar em "Back to products"
        cy.get('[data-test="back-to-products"]').click();

        const inicio = performance.now();
        cy.get('.inventory_list').should('be.visible').then(() => {
            const tempo = performance.now() - inicio;
            expect(tempo, 'Redirecionamento muito lento').to.be.lessThan(2000); // tolerância 2s
        });
    })
});