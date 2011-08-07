Given /I want to use the route optimiser site$/ do
  @sessions = ['session_1', 'session_2']
end

Given /I start the application$/ do
end

Given /all information entered should be visible to me only within the site instance$/ do
  @sessions.each do | session |
    in_session(session) do
      #TODO: Refactor the code handling multiple sessions to persist across method invocations,
      # and move these first two part into Given and When statements.
      #visit root_path
      #click_link("Add driver")
      #fill_in "name", :with => session
      #click_button("Add driver")
      pending
    end
  end

  @sessions.each do | session |
    in_session(session) do
      page.should have_selector("name", :value => session)
    end
  end
end

Given /I am within a route optimiser session$/ do
 pending
end
 
Given /I enter information$/ do
 pending
end

Given /the data is stored on the server side using the session identifier as the index$/ do
 pending
end

Given /I exit the application$/ do
 pending
end

Given /all data persisted within that session will be removed from the internal tables$/ do
 pending
end

Given /I have not performed any action for (.[0-9]) minutes$/ do | timeout_min |
 pending
end

Given /the session will be expired$/ do
 pending
end

Given /any data persisted will be removed from data storage$/ do
 pending
end
