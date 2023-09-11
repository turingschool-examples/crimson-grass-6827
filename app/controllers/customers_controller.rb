class CustomersController < ApplicationController 
  def show 
    @customers = Customer.all  
    require 'pry'; binding.pry
    @items = Items.all 
  end
end