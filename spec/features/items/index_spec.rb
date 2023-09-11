require 'rails_helper'

RSpec.describe ItemsController, type: :feature do
    it "show a list of all items and the count of customers that bought" do
        kings = Supermarket.create(name: 'Kings', location: '123 main st')
        safeway = Supermarket.create(name: 'Safeway', location: '5678 water ln')

        customer1 = Customer.create(name: 'Bob')
        customer2 = Customer.create(name: 'Lisa')

        bread = Item.create(name: 'Bread', price: 3, supermarket: kings)
        eggs = Item.create(name: 'Eggs', price: 2, supermarket: kings)
        milk = Item.create(name: 'Milk', price: 5, supermarket: safeway)

        CustomerItem.create(customer: customer1, item: bread)
        CustomerItem.create(customer: customer1, item: eggs)
        CustomerItem.create(customer: customer2, item: eggs)
        CustomerItem.create(customer: customer2, item: milk)

        visit "/items"

        expect(page).to have_content(bread.name)
        expect(page).to have_content(bread.price)
        expect(page).to have_content(bread.supermarket)
        expect(page).to have_content(eggs.name)
        expect(page).to have_content(eggs.price)
        expect(page).to have_content(eggs.supermarket)
        expect(page).to have_content(milk.name)
        expect(page).to have_content(milk.price)
        expect(page).to have_content(milk.supermarket)
    end
end
