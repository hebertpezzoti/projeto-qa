describe('Ordenação de Produtos A to Z e Z to A', () => {
    beforeEach(() => {
        // Realizando tarefa padrão
        cy.visit('https://www.saucedemo.com/');

        // Lognado
        cy.fixture('usuarios').then((usuarios) => {
            const user = usuarios.problem_user;
            cy.login(user.username, user.password);
        })
    })

    it('Verificando ordens dos itens A-Z', () => {

        // Verificando ordens dos itens
        // Selecioando ordem de A-Z
        cy.validarOrdenacao('AZ');
    })

    it('Verificando ordens dos itens Z-A', () => {

        // Verificando ordens dos itens
        // Selecioando ordem de Z-A
        cy.validarOrdenacao('ZA');
    })


    it('Validar imagens: verifica se NÃO são todas iguais', () => {
        // Validar imagens: verifica se NÃO são todas iguais (o que indicaria bug)
        cy.validarImagensDistintas();
    })
});