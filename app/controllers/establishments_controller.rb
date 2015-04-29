class EstablishmentsController < ApplicationController

  before_action :set_establishment, only: [:show, :edit, :update, :destroy]

  def index
    @establishments = Establishment.all
  end

  def show
    @split_url = @establishment.split_url(@establishment.city)
  end

  def new
    @establishment = Establishment.new
  end

  def create
    @establishment = Establishment.new(establishment_params)
    if @establishment.save
      redirect_to @establishment
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @establishment.update(establishment_params)
      redirect_to @establishment
    else
      render :edit
    end
  end

  def destroy
    if @establishment.destroy
      redirect_to root_path
    else
      redirect_to @establishment
    end
  end

  private

  def set_establishment
    @establishment = Establishment.find(params[:id])
  end

  def establishment_params
    params.require(:establishment).permit!
  end

end