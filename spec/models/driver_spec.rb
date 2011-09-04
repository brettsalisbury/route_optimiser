require 'spec_helper'

describe Driver do

  before(:each) do
    @attr = {:name => "Robert Baratheron",
             :address => "18 Jamison St, Sydney NSW",
             :passenger_count => "5",
             :session_id => "1"}
  end

  it "should be able to create a driver" do
    driver = Driver.create!(@attr);
  end

  it "should require a name" do
    no_name_person = Driver.new(@attr.merge(:name => ""))
    no_name_person.should_not be_valid
  end

  it "should require an address" do
    no_address_person = Driver.new(@attr.merge(:address => ""))
    no_address_person.should_not be_valid
  end

  it "should require a passenger_count" do
    no_passenger_count_driver = Driver.new(@attr.merge(:passenger_count => ""))
    no_passenger_count_driver.should_not be_valid
  end

  it "should require a session" do
    no_session_driver = Driver.new(@attr.merge(:session_id => ""))
    no_session_driver.should_not be_valid
  end

  it "should accept duplicate names" do
    Driver.create!(@attr)
    person_with_duplicate_name = Driver.create(@attr)
    person_with_duplicate_name.should be_valid
  end

end
