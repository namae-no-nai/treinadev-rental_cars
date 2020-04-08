class HomeController < ApplicationController
  def index
  end

  def new
  @manufacturer = Manufacturer.new
  end
    
end