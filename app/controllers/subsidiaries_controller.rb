class  SubsidiariesController < ApplicationController
  def index
    @subsidiaries = Subsidiary.all
  end

  def show
    @subsidiary = Subsidiary.find(params[:id])
  end

  def new
    @subsidiary = Subsidiary.new
  end

  def create
    @subsidiary = Subsidiary.create(subsidiary_params)
    if @subsidiary.save
      redirect_to @subsidiary
    else
      render :new
      flash[:alert] = "Você deve informar todos os dados da filial"
    end
  end

  private

  def subsidiary_params
    params.require(:subsidiary).permit(:name, :cnpj , :address)
  end
end