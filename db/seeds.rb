# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "csv"

csv_file = Rails.root.join('db/products.csv')
csv_data = File.read(csv_file)

products = CSV.parse(csv_data, headers: true)

products.each do |product|

    # cat = Category.find(name:product.category);

    # if(cat.count == 0)
    # new_cat = Category.create(product.category)
    # cat  = new_cat
    # end

    cat = Category.find_or_create_by(name:product['category'])

    newProd = cat.products.build(
        title:product['name'],
        price:product['price'],
        description:product['description'],
        stock_quantity:product['stock quantity']
    )

    newProd.save()

  

end



# Part 1
# require 'faker';

# 676.times do
#     title  = Faker::Commerce.product_name
#     price  = Faker::Commerce.price
#     stock  = Faker::Number.number

#     newProd = Product.create(
#         title:title,
#         price:price,
#         stock_quantity:stock
#     )

#     newProd.save()

# end
