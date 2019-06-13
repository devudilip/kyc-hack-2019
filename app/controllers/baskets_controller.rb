class BasketsController < ApplicationController

	def list
		# byebug
		if params[:qty] and params[:product_id]
			@products = ProductBasket.edit_and_get_products(params[:product_id],params[:qty],current_user)
		elsif params[:deleted_product]
			@products = ProductBasket.delete_and_get_products(params[:deleted_product],current_user)
		elsif params[:new_product]
			product = ProductBasket.get_new_product(params[:new_product])
			if product 
			 @products = ProductBasket.add_and_get_products(product[0],product[1],product[2],params[:qty],current_user)
			else
			 @products = ProductBasket.add_and_get_products(params[:new_product],10, rand(999),params[:qty],current_user)
			end
		else
    		@products = ProductBasket.get_products(current_user)
		end
		  respond_to do |format|  
		  	format.html
            format.js 
        end  
	end
end
