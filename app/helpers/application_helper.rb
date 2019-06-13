module ApplicationHelper

	def calculate_sum_for_products(products)
		price=0
		products.each do |product|
			price += product.price*product.qty.to_i
		end
		price.round(2)
	end
end
