class PagesController < ApplicationController
  def home
    @title = "Home"
  end

  def drivers
    @title = "Driver Entry"
    redirect_to :controller => "driver", :action => "new"
  end
end
