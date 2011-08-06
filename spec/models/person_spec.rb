require 'spec_helper'

describe Person do
  
  before(:each) do
    @attr = { :name => "Robert Baratheron", :address => "18 Jamison St, Sydney NSW", :user_id => "1344" }
  end

  it "should not be directly instancable at the base object level" do
    invalid_person = Person.new(@attr)
    invalid_person.should_not be_valid
  end

  it "should require a name" do
    no_name_person = Passenger.new(@attr.merge(:name => ""))
    no_name_person.should_not be_valid
  end

  it "should require an address" do
    no_address_person = Passenger.new(@attr.merge(:address => ""))
    no_address_person.should_not be_valid
  end

  it "should require a user_id" do
    no_id_person = Passenger.new(@attr.merge(:user_id => ""))
    no_id_person.should_not be_valid
  end

  it "should reject duplicate names" do
    #Put a user with the given name in the database
    Passenger.create!(@attr)
    person_with_duplicate_name = Passenger.create(@attr)
    person_with_duplicate_name.should_not be_valid
  end

  it "should reject identical names up to case" do
    upcased_name = @attr[:name].upcase
    Passenger.create!(@attr.merge(:name => upcased_name))
    person_with_duplicate_name = Passenger.new(@attr)
    person_with_duplicate_name.should_not be_valid
  end
end

describe "Driver" do

  before(:each) do
    @attr = {  :name => "Jamie Lannister", 
               :address => "40 Quarter Sessions Rd, Westleigh, NSW", 
               :passenger_count => "5",
               :user_id => "2134" }
  end

  it "should be created as a Driver" do
    verify_type_driver = Driver.new(@attr)
    verify_type_driver.type.should == "Driver"
  end

  it "should require a passenger_count field as a numeric value" do
    no_passenger_count_driver = Driver.new(@attr.merge(:passenger_count => "ten"))
    no_passenger_count_driver.should_not be_valid
  end

  it "should reject duplicate names with other people" do
    @person_attr = {  :name => @attr[:name], 
                      :address => @attr[:address],
                      :user_id => @attr[:user_id] }
    Passenger.create!(@person_attr)
    duplicate_name = Driver.create(@attr)
    duplicate_name.should_not be_valid
  end
end

describe "Passenger" do

  before(:each) do
     @attr = { :name => "Cerci Lannister", 
               :address => "18 Jamison St, Sydney, NSW",
               :user_id => "1234" }
  end

  it "should be created as a Passenger" do
    verify_type_passenger = Passenger.new(@attr)
    verify_type_passenger.type.should == "Passenger"
  end
end
