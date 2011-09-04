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
    @driver = Driver.new(params[:driver])
    @driver.session_id = request.session_options[:id]
    if @driver.save
      flash[:success] = @driver.name + " has been added to the list of drivers!"
      redirect_to Driver
    else
      @title = "Add a new driver"
      render :new
    end
  end

  def edit
    @driver = Driver.find(params[:id])
    @title = "Edit driver"
  end

  def update
    @driver = Driver.find(params[:id])
    if @driver.update_attributes(params[:driver])
      flash[:success] = "Driver updated"
      redirect_to @driver
    else
      @title = "Edit driver"
      render 'edit'
    end
  end

  def destroy
    Driver.find(params[:id]).destroy
    flash[:success] = "Driver removed"
    redirect_to drivers_path
  end

end
