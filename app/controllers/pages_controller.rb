class PagesController < ApplicationController
  def home
    @title = "Home"
  end

  def drivers
    @title = "Driver Entry"
  end
end
