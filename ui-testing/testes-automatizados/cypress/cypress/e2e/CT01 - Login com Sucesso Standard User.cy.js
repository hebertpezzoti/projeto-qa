describe('Login com Sucesso Standard User', () => {
    it('Passos', () => {
        // Acessando o Site Sauce Demo
        cy.visit('https://www.saucedemo.com/');

        // Logando
        cy.fixture('usuarios').then((usuarios) => {
            const user = usuarios.standard_user;
            cy.login(user.username, user.password);
        })
    })
});