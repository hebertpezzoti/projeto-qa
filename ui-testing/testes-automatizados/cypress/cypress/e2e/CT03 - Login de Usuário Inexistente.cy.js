describe('Login de Usuário Inexistente', () => {
    it('Passos', () => {
        // Acessando o Site Sauce Demo
        cy.visit('https://www.saucedemo.com/');

        // Tentando Logar no Site
        cy.fixture('usuarios').then((usuarios) => {
            const user = usuarios.usuario_inexistente;
            cy.get('[data-test="username"]').should('be.visible').type(user.username);
            cy.get('[data-test="password"]').should('be.visible').type(user.password);
            cy.get('[data-test="login-button"]').click();
        })

        // Verificando se apresenta mensagem de negativa para o login
        cy.get('[data-test="error"]').should('be.visible').and('contain', 'Username and password do not match');
    })
});