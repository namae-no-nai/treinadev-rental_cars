class RentalsController < ApplicationController

  def index
    @rentals = Rental.all
  end

  def new
    @rental = Rental.new
    @clients = Client.all
    @car_categories = CarCategory.all
  end

  def create
    @rental = Rental.new(rental_params)
    if @rental.save
      redirect_to rentals_path
    else
      @clients = Client.all
      @car_categories = CarCategory.all
      render :new
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :client_id,
                                   :car_category_id)
  end
end