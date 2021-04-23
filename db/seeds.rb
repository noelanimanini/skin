require "rest-client"
require 'faker'
Review.destroy_all 
Product.destroy_all 
User.destroy_all

rm = RestClient.get 'http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'
rm_array = JSON.parse(rm)

p1 = Product.create(name: "ultimate mascara", description: "something great")

rm_array.each do |product| 
  Product.create(
    name: product["name"],
    description: product["description"],
    image: product["image_link"],
    price: product["price"],
    brand: product["brand"]
  )
end 

u1 = User.create(username: ENV["USER"], password: 'sample')

50.times do 
  Review.create(comment: "does this work?", rating: rand(1...5), user_id: u1.id, product_id: p1.id)
  end 
  

puts "done"