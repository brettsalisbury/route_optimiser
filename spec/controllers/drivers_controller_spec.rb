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
      response.should have_selector("h1", :content => @driver.name)
      response.should have_selector("li", :content => @driver.address)
      response.should have_selector("li", :content => @driver.passenger_count.to_s)
    end

    it "should have the name of the driver in the title" do
      get :show, :id => @driver
      response.should have_selector("title", :content => @driver.name)
    end

    it "should contain a link to the edit driver page" do
      get :show, :id => @driver
      response.should have_selector("a", :href => edit_driver_path(@driver), :content => "Edit")
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

    it "should only allow editing of drivers created by this user"
  end

  describe "GET 'create'" do

    describe "failure" do

      before(:each) do
        @attr = {
            :name => "",
            :address => "",
            :passenger_count => ""
        }
      end

      it "should not create a driver" do
        lambda do
          post :create, :driver => @attr
        end.should_not change(Driver, :count)
      end

      it "should have the right title" do
        post :create, :driver => @attr
        response.should have_selector("title", :content=> "Add a new driver")
      end

      it "should render the 'new' page" do
        post :create, :driver => @attr
        response.should render_template('new')
      end

      it "should not require a session id attribute"
    end

    describe "success" do

      before(:each) do
        @attr = {
            :name => "Stanis Batheron",
            :address => "112 Napolean St, Eltham, Victoria",
            :passenger_count => 3
        }
      end

      it "should create a driver" do
        lambda do
          post :create, :driver => @attr
        end.should change(Driver, :count).by(1)
      end

      it "should direct to the driver index" do
        post :create, :driver => @attr
        response.should redirect_to(drivers_path)
      end

      it "should have a 'driver added' message" do
        post :create, :driver => @attr
        flash[:success].should =~/Stanis Batheron has been added to the list of drivers!/i
      end

      it "should not require a session_id attribute"

      it "should be created with the user's session id"

    end
  end

  describe "GET 'edit'" do

    before(:each) do
      @driver = Factory(:driver)
    end

    it "should be successful" do
      get :edit, :id => @driver
      response.should be_success
    end

    it "should have the right title" do
      get :edit, :id => @driver
      response.should have_selector("title", :content => "Edit driver")
    end

    it "should have a name field" do
      get :edit, :id => @driver
      response.should have_selector("input[name='driver[name]'][type='text']", :value => @driver[:name])
    end

    it "should have an address field" do
      get :edit, :id => @driver
      response.should have_selector("input[name='driver[address]'][type='text']", :value => @driver[:address])
    end

    it "should have a passenger count field" do
      get :edit, :id => @driver
      response.should have_selector("input[name='driver[passenger_count]'][type='number']",
                                    :value => @driver[:passenger_count].to_s())
    end

    it "should have a link to update the client" do
      get :edit, :id => @driver
      response.should have_selector("input", :value => "Update driver")
    end

    it "should have a link to return to the driver list" do
      get :edit, :id => @driver
      response.should have_selector("a", :href => drivers_path,
                                    :content => "Cancel")
    end

    it "should only allow editing of drivers created by this user"
  end

  describe "GET 'update'" do

    before(:each) do
      @driver = Factory(:driver)
    end

    describe "failure" do

      before(:each) do
        @attr = {:name => "", :address => "", :passenger_count => ""}
      end

      it "should render the edit page" do
        put :update, :id => @driver, :driver => @attr
        response.should render_template('edit')
      end

      it "should have the right title" do
        put :update, :id => @driver, :driver => @attr
        response.should have_selector("title", :content => "Edit driver")
      end

      it "should not require a session_id attribute"
    end

    describe "success" do

      before(:each) do
        @attr = {:name=> "Renly Batheron", :address=> "12 Porter St, Eltham, Victoria", :passenger_count => 5}
      end

      it "should modify the driver's attributes" do
        put :update, :id => @driver, :driver => @attr
        @driver.reload
        @driver.name.should == @attr[:name]
        @driver.address.should == @attr[:address]
        @driver.passenger_count.should == @attr[:passenger_count]
      end

      it "should redirect to the user show page" do
        put :update, :id => @driver, :driver => @attr
        response.should redirect_to(driver_path(@driver))
      end

      it "should have a flash message" do
        put :update, :id => @driver, :driver => @attr
        flash[:success].should =~ /updated/
      end

      it "should not require a session_id attribute"

    end

  end

  describe "GET 'destroy'" do

    before(:each) do
      @driver = Factory(:driver)
    end

    it "should remove the driver" do
      lambda do
        delete :destroy, :id => @driver
      end.should change(Driver, :count).by(-1)
    end

    it "should redirect to the drivers page" do
      delete :destroy, :id => @driver
      response.should redirect_to(drivers_path)
    end

    it "should have a flash message" do
      delete :destroy, :id => @driver
      flash[:success].should =~ /removed/
    end

    it "should not allow deletion of other users's drivers"

  end

end
