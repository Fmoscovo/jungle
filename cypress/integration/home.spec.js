describe("Home Page", () => {

  beforeEach(() => {
    cy.visit('/');
    cy.viewport(1280, 720); // Set the viewport size, adjust as needed.
  });

  // Test to check if products are visible on the home page
  it("There are products on the page", () => {
    // Wait for 5 seconds to give asynchronous elements time to render (not ideal for all scenarios, but a start for debugging)
    cy.wait(5000);
    cy.get('.products article').should('exist'); // Checking for existence first
    cy.get('.products article').should('be.visible'); // Then check for visibility
  });

  // Test to check if the exact number of products are displayed on the home page
  it("There are 2 products on the page", () => {
    cy.wait(5000); // Wait again, adjust or remove as needed.
    cy.get('.products article').should('have.length', 2);
  });

  // If still failing, this test will provide more insight
  it("Debug the product articles", () => {
    cy.wait(5000);
    cy.get('.products article').debug();
  });

  // Take a screenshot for manual review
  it("Capture a screenshot", () => {
    cy.screenshot('home_page_products');
  });
});
