describe('example to-do app', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

})