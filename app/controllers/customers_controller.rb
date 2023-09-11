class CustomersController < ApplicationController 

  def show
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @item = Item.find(params[:item_id])
    @customer.items <<  @item

    redirect_to "/customers/#{@customer.id}"
  end

end
