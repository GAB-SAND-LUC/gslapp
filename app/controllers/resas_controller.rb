class ResasController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]

  def new
    @flat = Flat.find(params[:flat_id])
  end

  def create
    @user = current_user
    @resa = @user.resas.create(resa_params)
    UserMailer.sending_resa(@user).deliver
    flat = Flat.find(@resa.flat_id)
    @landlord = flat.user
    @landlord = @resa.landlord
    UserMailer.receiving_resa(@landlord, @resa).deliver
    redirect_to account_path
  end

  def show
    @resa = Resa.find(params[:id])
  end

  def accept
    @resa = Resa.find(params[:id])
    @resa.accepted!
    redirect_to account_path
  end

  def reject
    @resa = Resa.find(params[:id])
    @resa.denied!
    redirect_to account_path
  end


  private
  def resa_params
    params.require(:resa).permit(:message, :checkin, :checkout, :flat_id)
  end

end
