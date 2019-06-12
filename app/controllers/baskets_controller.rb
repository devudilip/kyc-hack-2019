class BasketsController < ApplicationController

	def list
		@products = ProductBasket.get_products
	end
end
