describe('Jungle test product details', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it("should sign up and auto login", () => {
    cy.visit('/signup')
    cy.get('input[name="user[firstname]"]').type("Luna")
    cy.get('input[name="user[lastname]"]').type(`Jin`)
    cy.get('input[name="user[email]"]').type(`test@test.com`)
    cy.get('input[name="user[password]"]').type("123")
    cy.get('input[name="user[password_confirmation]"]').type("123")
    cy.get(".form-submit-btn").click()
    cy.contains("Signed in as Luna Jin ")
    cy.get("a").contains("Logout").click()
  });

  it("should login with the exist user", () => {

    cy.visit("/login")
    cy.get('input[name=email]').type(`test@test.com`)
    cy.get('input[name=password]').type("123")
    cy.get(".form-submit-btn").click()
    // cy.contains("Signed in as Luna Jin ")
  });
})