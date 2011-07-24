require 'spec_helper'

describe Person do
  
  before(:each) do
    @attr = { :name => "Robert Baratheron", :address => "18 Jamison St, Sydney NSW" }
  end

  it "should create a new instance given valid attributes" do
    Person.create!(@attr)
  end

  it "should require a name" do
    no_name_person = Person.new(@attr.merge(:name => ""))
    no_name_person.should_not be_valid
  end

  it "should require an address" do
    no_address_person = Person.new(@attr.merge(:address => ""))
    no_address_person.should_not be_valid
  end

  it "should be created as a person" do
    verify_type_person = Person.new(@attr)
    verify_type_person.type = "Person"
  end

  it "should reject duplicate names" do
    #Put a user with the given name in the database
    Person.create!(@attr)
    person_with_duplicate_name = Person.create(@attr)
    person_with_duplicate_name.should_not be_valid
  end

  it "should reject identical names up to case" do
    upcased_name = @attr[:name].upcase
    Person.create!(@attr.merge(:name => upcased_name))
    person_with_duplicate_name = Person.new(@attr)
    person_with_duplicate_name.should_not be_valid
  end

end
