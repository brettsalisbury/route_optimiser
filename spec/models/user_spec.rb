require 'spec_helper'

describe User do

  before(:each) do
    @attr = {:key => "this is a unique key"}
  end

  it "should be able to create a user" do
    user = User.create!(@attr);
  end

  it "should require a key" do
    no_key_user = User.new(@attr.merge(:key => ""))
    no_key_user.should_not be_valid
  end

  it "should reject duplicate keys" do
    User.create!(@attr)
    user_with_duplicate_key = User.create(@attr)
    user_with_duplicate_key.should_not be_valid
  end
end
