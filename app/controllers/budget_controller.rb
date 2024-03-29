class BudgetController < ApplicationController
  
    protect_from_forgery with: :null_session

    def new
        @budget = Budget.new
        @user_prod = UserProduct.new
    end    

    def index
        @budgets = Budget.all
    end    
    
    def create
        Budget.where("user_id = ?", current_user.id).delete_all
        @budget = Budget.new(user_params)
        #@budget.budget = params[:budget][:budget]
        
        if @budget.save
          flash[:notice] = 'Your Basket Is Ready.'
          redirect_to(list_baskets_path)
        else
          render :action => "new" 
        end
    end    
    
  def save_prod
      @products = UserProduct.new
      @products.products = params[:budget][:list_of_items]
      @products.user_id = params[:user_id]
      @products.save
      #redirect_to(new_budget_path)
      redirect_to(new_budget_path)
  end  

  def destroy_prod
      w
      @prod = UserProduct.find_by_products(params[:product])
      @prod.delete
      redirect_to(new_budget_path)
  end  

  def destroy
      @prod = UserProduct.find(params[:product_id])
      @prod.delete
      redirect_to(new_budget_path)
  end  

  def show
  
  end

  private

  def user_params
    params.require(:budget).permit(:budget_price, :user_id, :image)
  end

end
