class CustomerItemsController < ApplicationController
  def create
    CustomerItem.create!(item: Item.find(params[:new_item]), customer: Customer.find(params[:id]))
    redirect_to "/customers/#{params[:id]}"
  end
end