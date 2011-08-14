require 'spec_helper'

describe DriversController do
  render_views

  describe "GET 'index'" do

    before(:each) do
      @driver = Factory(:driver)
      second = Factory(:driver, :name => "Jon Snow", :user_id => 2)
      third = Factory(:driver, :name => "Rob Stark", :user_id => 2)

      @drivers = [@driver, second, third]
    end

    it "should be successful" do
      get :index
      response.should
    end

    it "should contain the names of all drivers on the page" do
      get :index
      @drivers.each do |driver|
        response.should have_selector("li"), :content => driver.name
      end
    end

  end

  describe "GET 'show'"
  it "should be successful"

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should have_selector("input", :id => "driver_name")
      response.should have_selector("input", :id => "driver_address")
      response.should have_selector("input", :id => "driver_passenger_count")
    end
  end

  describe "GET 'create'"
  it "should be successful"

  describe "GET 'edit'"
  it "should be successful"

  describe "GET 'update'"
  it "should be successful"

  describe "GET 'destroy'"
  it "should be successful"

end
