class FlatsController < ApplicationController

  before_filter :set_flat, :only => [:show, :edit, :update, :destroy]

  def index
    @flats = Flat.all
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to new_flat_pic_path(@flat)
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @flat.update(flat_params)
      redirect_to new_flat_pic_path(@flat)
    else
      render action: 'edit'
    end
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:address, :description, :surface, :beds, :price)
  end

end
