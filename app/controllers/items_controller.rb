class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
  end

  def new
  end

  def create
    item = Item.new({
      name: params[:name],
      price: params[:price]
    })
  end
end
