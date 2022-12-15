# This file should contain all the record creation needed to seed the database with
# its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database
# with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
if Rails.env.development?
  AdminUser.create!(email: "admin@example.com", password: "password",
                    password_confirmation: "password")
end

require "faker"

10.times do
  customer = Customer.create!(name:    Faker::FunnyName.unique.two_word_name,
                              address: Faker::Address.unique.full_address)

  category = Category.create!(name: Faker::Commerce.unique.department)

  10.times do
    # product1_price = Faker::Number.decimal(l_digits: 2)
    product1 = Product.create!(category_id: category.id, name:  Faker::Commerce.unique.product_name,
                               price: Faker::Number.decimal(l_digits: 2),
                               stock: Faker::Number.number(digits: 3))
    product2 = Product.create!(category_id: category.id, name:  Faker::Commerce.unique.product_name,
                               price: Faker::Number.decimal(l_digits: 2),
                               stock: Faker::Number.number(digits: 3))
    # order = customer.orders.create!(date: Date.today, grandTotal: product1_price,
    #                                 quantity: Faker::Number.number(digits: 1))
    taxes = ((product1.price + product2.price) * 0.11).round(2)
    order = product1.orders.create!(customer_id: customer.id, taxes: taxes,
                                    grandTotal: product1.price + product2.price + taxes,
                                    quantity: Faker::Number.number(digits: 1))
    order.products << product2
    # order.product = product
  end

  # OR
  # order = product.orders.create!(customer_id: customer.id, date: Date.today, price: lastPrice,
  #                                quantity: Faker::Number.number(digits: 1))
end
