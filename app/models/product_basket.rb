class ProductBasket  < ApplicationRecord


	def self.get_products(user)
    url = "http://immense-chamber-19203.herokuapp.com/init"
		# response = HTTParty.get('http://immense-chamber-19203.herokuapp.com/')
    budget = Budget.where(user_id: user.id).first

    response = HTTParty.post(url, 
    :body => { 
                "user_id": 1,
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
   product=  ProductBasket.find(product_id)
   product.update_attributes(qty: qty,status: "U")
   get_non_deleted_user_products(user)
  end

  def self.add_and_get_products(name,price,product_id, qty, user)
    ProductBasket.create(user_id: user.id, name: name,price: price, product_id: product_id, qty: qty, status: "U")
    get_non_deleted_user_products(user)
  end


  def self.delete_and_get_products(product_id, user)
   product=  ProductBasket.find(product_id)
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


def self.get_new_product(name)
  result= ActiveRecord::Base.connection.execute("select product_name,product_price,product_id  from customer_data_cube5 where product_name = '#{name}'").first
end

  def self.get_new_product_names
 product_names = []
 results = ActiveRecord::Base.connection.execute("select product_name from customer_data_cube5")
 # results.each do |product|
 #    product_names << product[0].to_s
 # end
 # product_names
# ActiveRecord::Base.connection.execute("CREATE TABLE customer_data_cube5 (
#     product_id integer,
#     product_name varchar(200),
#     product_price double,
#     product_group varchar(200)
# )")

  end

end