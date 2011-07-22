Feature: Site Wide Concerns
  In order for the site to be secure, reliable and maintainable
  As a site owner
  I want to be able to ensure the route optimiser site contains common attributes across all pages

Scenario: Browser Sessions
  Given I want to use the route optimiser site
  When I start the application
  Then all information entered should be visible to me only within the site instance
