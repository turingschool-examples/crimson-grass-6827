class SupermarketsController < ApplicationController
  def show
    @supermarket = Supermarket.find(params[:id])
  end

  def new
  end

  def create
    supermarket = Supermarket.new({
      name: params[:name],
      location: params[:location]
    })
  end
end
