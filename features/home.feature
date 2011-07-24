Feature: An application to calculate the most efficent route for a number of people with limited vehicles
In order to save travelling time and fuel costs
The group
Should be able to visit the route optimiser website to determine the optimal passenger grouping and routes for the vehicles and drivers available

Scenario: The application has a home page
  Given I have a Route Optimiser application
  When I visit the home page
  Then I should see the home page
  And I should see some information describing what the site does and how I use it
  And I should not see a 404 page

Scenario: The application home page allows users to start the process
  Given I visit the home page
  When I indicate I want to start the analysis process
  Then I should see the driver entry page
