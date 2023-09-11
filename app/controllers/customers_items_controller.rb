class CustomersItemsController < ApplicationController
  def create
    CustomersItem.create!(customer_id: params[:id], item_id: params[:item])
    redirect_to "/customers/#{params[:id]}"
  end
end