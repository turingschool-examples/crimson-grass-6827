require 'rails_helper'

RSpec.describe CustomersController, type: :feature do
    it 'displays the customer name and a list of their items' do
        kings = Supermarket.create(name: 'Kings', location: '123 main st')
        customer1 = Customer.create(name: 'Bob')
        bread = Item.create(name: 'Bread', price: 3, supermarket: kings)
        eggs = Item.create(name: 'Eggs', price: 2, supermarket: kings)
        CustomerItem.create(customer: customer1, item: bread)
        CustomerItem.create(customer: customer1, item: eggs)

        visit "/customers/#{customer1.id}"

        expect(page).to have_content("Bob")
        expect(page).to have_content("Bread")
        expect(page).to have_content("Eggs")
        expect(page).to have_content(3)
        expect(page).to have_content(2)
        expect(page).to have_content("Kings")
    end

    it 'can add an item' do
        kings = Supermarket.create(name: 'Kings', location: '123 main st')
        safeway = Supermarket.create(name: 'Safeway', location: '5678 water ln')
        customer1 = Customer.create(name: 'Bob')
        bread = Item.create(name: 'Bread', price: 3, supermarket: kings)
        eggs = Item.create(name: 'Eggs', price: 2, supermarket: kings)
        milk = Item.create(name: 'Milk', price: 5, supermarket: safeway)
        CustomerItem.create(customer: customer1, item: bread)
        CustomerItem.create(customer: customer1, item: eggs)

        visit "/customers/#{customer1.id}"

        fill_in(:item_id, with: milk.id)
        click_button("Add Item")

        expect(page).to have_content(milk.name)
        expect(page).to have_content(milk.price)
    end
end