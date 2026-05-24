describe('Login de Usuário Bloqueado Locked Out', () => {
    it('Passos', () => {
        // Acessando o Site Sauce Demo
        cy.visit('https://www.saucedemo.com/');

        // Tentando Logar no Site
        cy.fixture('usuarios').then((usuarios) => {
            const user = usuarios.locked_out_user;
            cy.get('[data-test="username"]').should('be.visible').type(user.username);
            cy.get('[data-test="password"]').should('be.visible').type(user.password);
            cy.get('[data-test="login-button"]').click();
        })

        // Verificando se apresenta mensagem negativa para o login
        cy.get('[data-test="error"]').should('be.visible').and('contain', 'Epic sadface: Sorry, this user has been locked out.');
    })
});