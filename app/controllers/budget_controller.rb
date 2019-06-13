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
        @budget = Budget.new(user_params)
        #@budget.budget = params[:budget][:budget]
        
        if @budget.save
          flash[:notice] = 'Budget has been processed.'
          redirect_to(budget_index_path)
        else
          render :action => "new" 
        end
    end    
    
  def save_prod
      @products = UserProduct.new
      @products.products = params[:items]
      @products.user_id = params[:user_id]
      @products.save
      #redirect_to(new_budget_path)
      redirect_to :back
  end  

  def destroy_prod
      @prod = UserProduct.find_by_products(params[:product])
      @prod.delete
      redirect_to(new_budget_path)
  end  


  private

  def user_params
    params.require(:budget).permit(:budget_price, :user_id, :image)
  end

end
