class CarModelsController < ApplicationController
  def index
    @car_models = CarModel.all
  end

  def show
    @car_model = CarModel.find(params[:id])
  end

  def new
    @car_model = CarModel.new
    @manufacturers = Manufacturer.all
    @car_categories = CarCategory.all
  end

  def create
    @car_model = CarModel.new(car_model_params)
    if @car_model.save
      redirect_to @car_model
    else
      @manufacturers = Manufacturer.all
      @car_categories = CarCategory.all
      render :new
    end
  end

  def edit
    @car_model = CarModel.find(params[:id])
    @manufacturers = Manufacturer.all
    @car_categories = CarCategory.all
  end
  
  def update
    @car_model = CarModel.find(params[:id])
    if @car_model.update(car_model_params)
      redirect_to @car_model
    else
      @manufacturers = Manufacturer.all
      @car_categories = CarCategory.all
      render :edit
    end
  end

  def destroy
    @car_model = CarModel.find(params[:id])
    @car_model.destroy
    redirect_to car_models_path
  end

  private

  def car_model_params
    params.require(:car_model).permit(:name, :year, :manufacturer_id,
                                      :motorization, :car_category_id, :fuel_type)
  end
end