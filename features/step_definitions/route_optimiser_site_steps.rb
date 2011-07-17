When /I have a (.*) application$/ do |application_name|
  @app_name = application_name
end

When /I visit the home page/ do
  visit root_path
end

When /I should see the home page/ do
  page.should have_content(@app_name)
end

When /I should not see a 404 page/ do
  page.should_not have_content("404")
end
