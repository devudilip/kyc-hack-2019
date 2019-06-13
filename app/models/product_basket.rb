class ProductBasket  < ApplicationRecord


	def self.get_products(user)
    url = "http://immense-chamber-19203.herokuapp.com/init"
		# response = HTTParty.get('http://immense-chamber-19203.herokuapp.com/')
    budget = Budget.where(user_id: user.id).first

    response = HTTParty.post(url, 
    :body => { 
                "user_id": user.id,
                "value": budget.budget_price,
                "list": []
             }.to_json,
    :headers => { 'Content-Type' => 'application/json' } )

    # response = HTTParty.post(url, 
    # :body => { 
    #             "user_id": 1,
    #             "value": 25,
    #             "items": [
    #                 {
    #                     "name": "jam",
    #                     "brand": "nissan",
    #                     "price": 23.6,
    #                     "qty": "1",
    #                     "status":"not_applied"
    #                 }
    #             ]
    #          }.to_json,
    # :headers => { 'Content-Type' => 'application/json' } )

# byebug
		puts "Herokuuuuu"
		puts response.body
# 		res = [
#   {
#     "product_id": 1,
#     "name": "Grape",
#     "brand": "Nanas",
#     "price": 18.02,
#     "qty": 6
#   },
#   {
#     "product_id": 2,
#     "name": "sugar",
#     "brand": "kfc",
#     "price": 9.01,
#     "qty": 2
#   },
#   {
#     "product_id": 3,
#     "name": "strawberry",
#     "brand": "fc",
#     "price": 28.95,
#     "qty": 10
#   },
#   {
#     "product_id": 4,
#     "name": "Onion",
#     "brand": "jd",
#     "price": 18.61,
#     "qty": 3
#   },
#   {
#     "product_id": 5,
#     "name": "apple",
#     "brand": "fc",
#     "price": 9.76,
#     "qty": 7
#   }
# ]

product_list = JSON.parse(response.body)["items"]

 ProductBasket.where(user_id: user.id).delete_all
 save_all_products(product_list,user.id)
 get_non_deleted_user_products(user)
end



  def self.edit_and_get_products(product_id, qty, user)
   product=  ProductBasket.where(user_id: user.id).where(product_id: product_id).first
   product.update_attributes(qty: qty,status: "U")
   get_non_deleted_user_products(user)
  end


  def self.delete_and_get_products(product_id, user)
   product=  ProductBasket.where(user_id: user.id).where(product_id: product_id).first
   product.update_attributes(status: "D")
   get_non_deleted_user_products(user)
  end


  private 
  def self.save_all_products(products, user_id)
    products.each do |product|
      create(product_id: product["productId"], name: product["name"], brand: product["brand"], price: product["price"], qty: product["qty"], user_id: user_id, status: "N")
    end
  end


  def self.get_non_deleted_user_products(user)
    ProductBasket.where("user_id = ? and status != ?", user.id, "D" )
  end

end