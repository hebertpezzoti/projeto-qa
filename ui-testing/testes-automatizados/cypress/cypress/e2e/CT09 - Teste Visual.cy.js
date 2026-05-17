describe('Teste Visual (Carrinho deslocado)', () => {
  const viewports = [
    { width: 1920, height: 1080, name: 'desktop' },
    { width: 1366, height: 768, name: 'laptop' },
    { width: 768, height: 1024, name: 'tablet' },
    { width: 375, height: 667, name: 'mobile' }
  ];

  beforeEach(() => {
    cy.visit('https://www.saucedemo.com/');
    cy.fixture('usuarios').then((usuarios) => {
      const user = usuarios.visual_user;  // ou standard_user
      cy.login(user.username, user.password);
    });
  });

  viewports.forEach((vp) => {
    it(`Carrinho deve estar no topo em ${vp.name}`, () => {
      cy.viewport(vp.width, vp.height);
      cy.wait(300);
      cy.get('[data-test="shopping-cart-link"]').then(($cart) => {
        const top = $cart[0].getBoundingClientRect().top;
        expect(top, 'Ícone do carrinho muito abaixo do topo (bug visual)').to.be.lessThan(20);
      });
    });
  });
});