require 'spec_helper'

describe PagesController do
  render_views

  describe "GET 'home'" do

    it "should be successful" do
      get 'home'     
      response.should be_success
    end

    it "should contain the correct title" do
      get 'home'      
      response.should have_selector("title",
                                    :content => "Route Optimiser | Home")
    end

    it "should have a link to the driver details page" do
      get 'home'
      response.should have_selector("a", :href => drivers_path,
                                         :content => "Start now!")
    end
  end

  describe "GET 'drivers'" do
 
    it "should be successful" do
      get 'drivers'
      response.should be_success
    end

    it "should contain the correct title" do
      get 'drivers'
      response.should have_selector("title",
                                    :content => "Route Optimiser | Driver Entry")
    end
  end
end
