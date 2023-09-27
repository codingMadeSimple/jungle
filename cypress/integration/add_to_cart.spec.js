describe('To click on the add to cart button for a product', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
    // I didn't want to use force:true but 
    cy.get(".products button.btn").contains("Add").click({force: true})
    // cy.get('.products button.btn').scrollIntoView({ offset: { top: -500, left: 0 } })
    cy.contains('My Cart (1)')
  });

})