/// <reference types="cypress" />

describe('Jungle test product details', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
  
  it("should navigate to product details page after click on an product", () => {
    cy.get(".products article")
      .first()
      .click()
    cy.contains("Scented Blade")


  });
  
})
