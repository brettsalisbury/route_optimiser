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
  end

end