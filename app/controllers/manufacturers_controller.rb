class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.all
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    if @manufacturer.save
      flash[:alert] = "Fabricante registrado com sucesso"
      redirect_to @manufacturer
    else
      flash[:alert] = @manufacturer.errors[:name]
      render action: 'new'
    end
  end

  def edit
    @manufacturer = Manufacturer.find(params[:id])
  end

  def update
    @manufacturer = Manufacturer.find(params[:id])

    if @manufacturer.update(manufacturer_params)
      redirect_to @manufacturer
    else
      flash[:alert] = @manufacturer.errors[:name]
      render :new
    end
  end

  private

  def manufacturer_params
    params.require(:manufacturer).permit(:name)
  end
end