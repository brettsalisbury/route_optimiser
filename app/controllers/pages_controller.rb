class PagesController < ApplicationController
  def home
    @title = "Home"
  end

  def drivers
    @title = "Drivers Details"
  end
end
