class ParcelsController < ApplicationController

  http_basic_authenticate_with name: "log", password: "pass"
  http_basic_authenticate_with name: "destroy", password: "pass", only: :destroy
  def index
    @parcels=Parcel.all
  end

  def new
    @parcel = Parcel.new()
  end

  def create
    @parcel = Parcel.new(parcel_params)
    if @parcel.save
      redirect_to @parcel
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @parcel =   Parcel.find(params[:id])
  end

  def destroy
    @parcel = Parcel.find(params[:id])
    @parcel.destroy
    redirect_to root_path, status: :see_other
  end

  def edit
    @parcel = Parcel.find(params[:id])
  end

  def update
    @parcel = Parcel.find(params[:id])
    if  @parcel.update(parcel_params)
      redirect_to @parcel
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private 
  def parcel_params
    params.require(:parcel).permit(:city, :street, :house, :appartment, :addressee, :value)
  end

end