class CustomersController < ApplicationController
  def index

  end
  
  def show
    @customer = Customer.find(params[:id])

    if request.post? && params[:customer].present? && params[:customer][:item_id].present?
      item_id = params[:customer][:item_id]
      @customer.add_item(item_id)
      redirect_to "/customers/#{@customer.id}"
    end
  end

  private
  def customer_params
    params.permit(:id, :name)
  end
end