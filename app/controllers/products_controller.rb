class ProductsController < ApplicationController
  def index
    @products = current_user.products
  
  end

  def show
    @product = Product.find(params[:id]) 
   
  end

  def new
	 @product = Product.new
  end

  def create
  	@product = current_user.products.new(product_params)
  	if @product.save
  		redirect_to products_path, notice: "Create Successfuly!"
  	else
  		redirect_to root_path
  	end	
  end
  def destroy
      @product = Product.find(params[:id])
      @product.destroy
      redirect_to products_url,alert: "Delete successfully!"
  end

  private

  def product_params
  	params.require(:product).permit(:title,:description,:date,:file)
  end

  

end
