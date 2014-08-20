class FlatsController < ApplicationController

  before_filter :set_flat, :only => [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

  def index
    @q = Flat.search(params[:q])
    @flats = @q.result(distinct: true)
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = current_user.flats.new(flat_params)
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
    params.require(:flat).permit(:title, :address, :description, :surface, :beds, :price, :city, :zip_code)
  end

end
