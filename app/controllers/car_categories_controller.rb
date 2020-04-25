class  CarCategoriesController < ApplicationController
  def index
    @car_categories = CarCategory.all
  end

  def show
    @car_category = CarCategory.find(params[:id])
    @car_models = CarModel.where(car_category: @car_category)
  end

  def new
    @car_category = CarCategory.new
  end

  def create
    @car_category = CarCategory.create(car_category_params)
    if @car_category.save
      flash[:alert] = "Categoria cadastrada com sucesso"  
      redirect_to @car_category
    else
      render :new
    end
  end

  def edit
    @car_category = CarCategory.find(params[:id])
  end

  def update
    @car_category = CarCategory.find(params[:id])
    if @car_category.update(car_category_params)
      redirect_to @car_category
    else
      render :edit
    end
  end

  def destroy
    @car_category = CarCategory.find(params[:id])
    @car_category.destroy
    redirect_to car_categories_path
  end

  private

  def car_category_params
    params.require(:car_category).permit(:name, :daily_rate , :car_insurance, :third_party_insurance)
  end
end