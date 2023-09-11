require "rails_helper"

RSpec.describe "Customers show page" do 
  it "Shows customers name and a list of all its items and name of supermarket it belongs to" do 
    aldi = Supermarket.create(name: "Aldi", location: "East")
    
    customer = Customer.create(name: "Kevin")
    
    tomato = Item.create(name: "Tomato Soup", price: 1, supermarket_id: aldi.id)
    bread = Item.create(name: "White Bread", price: 3, supermarket_id: aldi.id)
    cheese = Item.create(name: "Cheddar Cheese Slices", price: 2, supermarket_id: aldi.id)
    
    visit '/customers' 
save_and_open_page 
    expect(page).to have_content(customer.name)
    expect(page).to have_content(tomato.name)
    expect(page).to have_content(tomato.price)
    expect(page).to have_content(bread.name)
    expect(page).to have_content(bread.price)
    expect(page).to have_content(cheese.name)
    expect(page).to have_content(cheese.price)
    expect(page).to have_content("Aldi")
  end
end