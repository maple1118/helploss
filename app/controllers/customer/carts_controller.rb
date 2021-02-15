class Customer::CartsController < ApplicationController

  def index
    @cart = Cart.where(customer_id: current_customer.id)
  end

  def create
      cart = Cart.new(cart_params)
       if Cart.where(product_id: params[:cart][:product_id] ,customer_id: current_customer.id).present?
       @cart = Cart.find_by(product_id: params[:cart][:product_id] ,customer_id: current_customer.id)
        new_quantity = @cart.quantity + cart.quantity
        @cart.update_attribute(:quantity, new_quantity)
       else
        cart.customer_id = current_customer.id
        cart.save
       end
       redirect_to customer_carts_path
  end

  def update
    cart = Cart.find(params[:id])
    cart.update(cart_params)
    redirect_to customer_carts_path
  end
  
  def destroy
    @products = Cart.find(params[:id])
    @products.destroy
    redirect_to customer_carts_path
  end

  def destroy_all
    @products = current_customer.carts
    @products.each do |f|
    f.destroy
    end
    redirect_to customer_carts_path
  end



  private
  def cart_params
    params.require(:cart).permit(:quantity, :customer_id, :product_id)
  end
end
