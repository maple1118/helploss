class Customer::OrdersController < ApplicationController
  def new
    @customer = current_customer
    @cart = current_customer.carts
    @order = Order.new
  end
end
