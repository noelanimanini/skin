class ProductsController < ApplicationController
  def index
    @products = Product.all
  end 

  def show
    @product = Product.find(params[:id])
  end 

  def new 
    @product = Product.new
  end 

  def create 
    @product = Product.create(products_params)
      if @product.valid? 
        redirect_to product_path(@product)
      else 
        flash[:errors] = @product.errors.full_messages
        redirect_to new_product_path
      end 
  end 

  def edit
    @product = Product.find(params[:id])
  end 
  
  def update
    @product = Product.create(products_params)
      if @product.valid? 
        redirect_to product_path(@product)
      else 
        flash[:errors] = @product.errors.full_messages
        redirect_to edit_product_path
      end 
  end 

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end 

  private 

  def products_params
    params.require(:product).permit(:name, :description, :image, :price, :brand)
  end 

end
