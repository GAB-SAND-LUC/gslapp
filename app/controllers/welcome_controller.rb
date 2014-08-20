class WelcomeController < ApplicationController

  def index
    @q = Flat.search(params[:q])
  end

end
