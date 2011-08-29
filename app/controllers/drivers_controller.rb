class DriversController < ApplicationController
  def index
    @drivers = Driver.all
    @title = "Drivers"
  end

  def show
    @driver = Driver.find(params[:id])
    @title = "Driver " + @driver[:name]
  end

  def new
    @title = "Add a new driver"
    @driver = Driver.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
