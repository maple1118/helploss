class Customer::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @cart = Cart.new
  end

  private
  def product_params
    params.require(:product).permit(:image, :name, :introduction, :price )
  end
end
