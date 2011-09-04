require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end

  end

  describe "GET 'destroy'" do
    it "should be successful" do
      pending("Need to find out why this is failing")
      get 'destroy'
      response.should be_success
    end
  end

end
