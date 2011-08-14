class DriversController < ApplicationController
  def index
    @drivers = Driver.all
    @title = "Drivers"
  end

  def show
  end

  def new
    @title = "Driver Entry"
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
