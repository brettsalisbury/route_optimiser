require 'spec_helper'

describe DriverController do
  render_views

  describe "GET 'index'"
    it "should be successful"

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
