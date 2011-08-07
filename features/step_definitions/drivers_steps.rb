Given /I have navigated to the drivers page$/ do
  visit root_path
  click_link("Start")
end

Given /I enter the drivers name, address and number of passengers they can carry$/ do
  fill_in "driver_name", :with => "Eddark Stark"
  fill_in "driver_address", :with => "321 Kent St, Sydney 2000"
  fill_in "driver_passenger_count", :with => "4"
end

Given /I press (.*)$/ do | button_id |
  click_button(button_id)
end

Given /the driver information will be captured and displayed on the screen$/ do
  pending
  #page.should have_selector("Drivers Name", :content => "Eddard Stark")
  #page.should have_selector("Drivers Address", :content => "321 Kent St, Sydney 2000")
  #page.should have_selector("Passenger Count", :content =>"4")
end

Given /I have previously entered a driver$/ do
  pending
end

Given /the driver information is removed$/ do
  pending
end

Given /I have entered at least one driver$/ do
  pending
end

Given /I will move to the passenger details screen$/ do
  pending
end

Given /I have entered no drivers on the driver entry screen$/ do
  pending
end

Given /I will return to the driver entry page with an error due to no driver details entered$/ do
  pending
end
