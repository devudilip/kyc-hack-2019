class ProductBasket
	def self.get_products
		# response = HTTParty.get('http://immense-chamber-19203.herokuapp.com/')
		puts "Herokuuuuu"
		# puts response.body
		res = [
  {
    "name": "Grape",
    "brand": "Nanas",
    "price": 18.02,
    "qty": 6
  },
  {
    "name": "Grape",
    "brand": "kfc",
    "price": 9.01,
    "qty": 2
  },
  {
    "name": "strawberry",
    "brand": "fc",
    "price": 28.95,
    "qty": 10
  },
  {
    "name": "apple",
    "brand": "jd",
    "price": 18.61,
    "qty": 3
  },
  {
    "name": "apple",
    "brand": "fc",
    "price": 9.76,
    "qty": 7
  }
]
	end
end