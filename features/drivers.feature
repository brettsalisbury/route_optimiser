Feature: In order to calculate my route correctly
As a user
I want to enter the information for all drivers in my trip

Scenario: Enter driver details
  Given I have navigated to the drivers page
  And I enter the drivers name, address and number of passengers they can carry
  When I press add
  Then the driver information will be captured and displayed on the screen

Scenario: Remove driver
  Given I have previously entered a driver
  When I press remove next to the driver's name
  Then the driver information is removed

Scenario: Complete driver entry
  Given I have entered at least one driver
  When I press next
  Then I will move to the passenger details screen

Scenario: Move to next page without a driver
  Given I have entered no drivers on the driver entry screen
  When I press next
  Then I will return to the driver entry page with an error due to no driver details entered 
