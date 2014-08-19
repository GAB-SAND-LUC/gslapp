class AccountsController < ApplicationController
  before_action :authenticate_user!

  def show
    @account = current_user
  end

  def edit
    @account = current_user
  end

  def update
    @account = current_user
    @account.update(account_params)
    flash[:notice]="Your account is now updated"
    redirect_to account_path
  end

private
  def account_params
    params.require(:user).permit(:email, :last_name, :first_name, :address, :phone, :city)
  end
end
