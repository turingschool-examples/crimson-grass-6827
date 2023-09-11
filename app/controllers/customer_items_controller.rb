class CustomerItemsController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    customer = Customer.find(params[:customer_id])
    CustomerItem.create!(customer: customer, item: item)

    redirect_to "/customers/#{customer.id}"
  end
end