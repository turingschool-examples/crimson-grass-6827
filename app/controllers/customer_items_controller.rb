class CustomerItemsController < ApplicationController
  def create
    @customer = Customer.find(params[:id])
    if params[:item_id] != nil
      CustomerItem.create!(customer_id: params[:id], item_id: params[:item_id])
    end 

    redirect_to "/customers/#{params[:id]}"
  end
end