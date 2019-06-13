class BasketsController < ApplicationController

	def list
		# byebug
		if params[:qty]
			@products = ProductBasket.edit_and_get_products(params[:product_id],params[:qty],current_user)
		elsif params[:deleted_product]
			@products = ProductBasket.delete_and_get_products(params[:deleted_product],current_user)
		else
    		@products = ProductBasket.get_products(current_user)
		end
		  respond_to do |format|  
		  	format.html
            format.js 
        end  
	end
end
