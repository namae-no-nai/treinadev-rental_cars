class CarsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
    @car_models = CarModel.all
    @subsidiaries = Subsidiary.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def create 
    @car = Car.create(car_params)
    if @car.save
      redirect_to @car
    else
      @car_models = CarModel.all
      @subsidiaries = Subsidiary.all
      render :new
    end
  end

  def edit
    @car = Car.find(params[:id])
    @car_models = CarModel.all
    @subsidiaries = Subsidiary.all
  end
  
  def update
    @car = Car.find(params[:id])
    if @car.update(car_params)
      redirect_to @car
    else
      @car_models = CarModel.all
      @subsidiaries = Subsidiary.all
      render :edit
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to cars_path
  end

  private

  def car_params
    params.require(:car).permit(:license_plate, :color, :car_model_id, :mileage, :subsidiary_id)
  end
end
