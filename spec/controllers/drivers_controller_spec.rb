require 'spec_helper'

describe DriversController do
  render_views

  describe "GET 'index'" do

    before(:each) do
      @driver = Factory(:driver)
      second = Factory(:driver, :name => "Jon Snow")
      third = Factory(:driver, :name => "Rob Stark")

      @drivers = [@driver, second, third]
    end

    it "should be successful" do
      get :index
      response.should be_success
    end

    it "should contain the names of all drivers on the page" do
      get :index
      @drivers.each do |driver|
        response.should have_selector("li", :content => driver.name)
      end
    end

    it "should show only the drivers created by this user"

  end

  describe "GET 'show'" do

    before(:each) do
      @driver = Factory(:driver)
    end

    it "should be successful" do
      get :show, :id => @driver
      response.should be_success
    end

    it "should contain the details of the driver on the page" do
      get :show, :id => @driver
      response.should have_selector("li", :content => @driver.name)
      response.should have_selector("li", :content => @driver.address)
      response.should have_selector("li", :content => @driver.passenger_count.to_s)
    end

    it "should have the name of the driver in the title" do
      get :show, :id => @driver
      response.should have_selector("title", :content => @driver.name)
    end

    it "should contain a link to the edit driver page" do
      get :show, :id => @driver
      response.should have_selector("a", :href => driver_path(@driver), :content => "Edit")
    end

    it "should show only the drivers created by this user"
  end

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end

    it "should have the right title" do
      get 'new'
      response.should have_selector("title", :content => "Add a new driver")
    end

    it "should have a name field" do
      get 'new'
      response.should have_selector("input[name='driver[name]'][type='text']")
    end

    it "should have an address field" do
      get 'new'
      response.should have_selector("input[name='driver[address]'][type='text']")
    end

    it "should have a passenger count field" do
      get 'new'
      response.should have_selector("input[name='driver[passenger_count]'][type='number']")
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
