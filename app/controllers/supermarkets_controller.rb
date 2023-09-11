class SupermarketsController < ActionController::Base
  def show
    @supermarket = Supermarket.find(params[:id])
  end
end
