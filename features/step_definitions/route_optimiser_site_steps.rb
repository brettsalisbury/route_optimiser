When /I have a (.*) application$/ do |application_name|
  @app_name = application_name
end

When /I visit the home page/ do
  visit root_path
end

When /I should see the home page/ do
  page.should have_selector("title", :content => @app_name)
end

When /I should see some information describing what the site does and how I use it$/ do
  pending
end

When /I should not see a 404 page/ do
  page.should_not have_content("404")
end

When /I want to start the analysis process$/ do
  click_link("Start")
end

When /I should see the driver entry page$/ do
  page.should have_content("Driver Entry")
end
