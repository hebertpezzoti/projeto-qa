describe('Execução de Logout', () => {
    it('Passos', () => {
        // Acessando o Site Sauce Demo
        cy.visit('https://www.saucedemo.com/');

        // Logando
        cy.fixture('usuarios').then((usuarios) => {
            const user = usuarios.standard_user;
            cy.login(user.username, user.password);
        })

        // Abrindo menu
        cy.get('#react-burger-menu-btn').should('be.visible').click();

        // Deslogando:
        cy.get('[data-test="logout-sidebar-link"]').should('be.visible').click();

        // Verificando se foi direcionados para a tela de login:
    cy.url().should('eq', 'https://www.saucedemo.com/');
    })
});