class PicsController < ApplicationController
  respond_to :js, :html

  def new
    @pic = Pic.new
    @flat = Flat.find(params[:flat_id])
  end

  def create
    @flat = Flat.find(params[:flat_id])
    @flat.pics.create(pic_params)
    respond_with do |format|
      format.js
      format.html { redirect_to flat_path(@flat) }
    end
  end

  def destroy
    @pic = Pic.find(params[:id])
    @pic.destroy
    render json: {status: "OK"}
  end

  private
  def pic_params
    params.require(:pic).permit(:name, :picture)
  end

end
