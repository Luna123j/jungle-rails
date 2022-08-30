describe('Jungle test product details', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  
  it("should add item to cart if click add cart button", () => {
    cy.get(".product-button")
      .first()
      .contains("Add")
      .click({force: true})

    cy.get(".nav-link")
      .contains("My Cart (1)")
      
    

  });
  
})