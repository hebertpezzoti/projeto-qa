describe('Acessibilidade (Contraste de Tela)', () => {
  beforeEach(() => {
    cy.visit('https://www.saucedemo.com/');
    cy.fixture('usuarios').then((usuarios) => {
      const user = usuarios.standard_user;
      cy.login(user.username, user.password);
    });
  });

  it('Deve existir a opção "Contraste de Tela" no menu lateral', () => {
    // Abre o menu hambúrguer
    cy.get('#react-burger-menu-btn').should('be.visible').click();

    // Verificando se a opção existe
    cy.contains('Contraste de Tela').should('exist');
  });
});