Feature: Site Wide Concerns
  In order for the site to be secure, reliable and maintainable
  As a site owner
  I want to be able to ensure the route optimiser site contains common attributes across all pages

Scenario: Browser Sessions
  Given I want to use the route optimiser site
  When I start the application
  Then all information entered should be visible to me only within the site instance

Scenario: Session data storage
  Given I am within a route optimiser session
  When I enter information
  Then the data is stored on the server side using the session identifier as the index
 
Scenario: Session exit
  Given I am within a route optimiser session
  When I exit the application
  Then all data persisted within that session will be removed from the internal tables

Scenario: Session expiry
  Given I am within a route optimiser session
  When I have not performed any action for 30 minutes
  Then the session will be expired
  And any data persisted will be removed from data storage
