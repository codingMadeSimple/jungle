
  describe('example to-do app', () => {
    beforeEach(() => {
      cy.visit('/')
    })
  
    // Should I use first() and click()?
    it("Clicks on a product", () => {
      cy.get(".products article").should("be.visible");
      // cy.get('[alt="Scented Blade"]').click() //SHould I change this to select based on first() and click()
      cy.get('.products')
      .find('a').first().click()
      cy.contains('in stock at')
    });
  
  });