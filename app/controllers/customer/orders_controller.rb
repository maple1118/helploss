class Customer::OrdersController < ApplicationController
  def new
    @customer = current_customer
    @customer_form = CustomerForm.new(name: current_customer.name, email: current_customer.email, name_kana: current_customer.name_kana, postcode: current_customer.postcode,phone_namber: current_customer.phone_namber, prefecture_code: current_customer.prefecture_code, address_city: current_customer.address_city, address_street: current_customer.address_street)
    @cart = current_customer.carts
  end

  def create
    order = current_customer.orders.new(order_params)
    current_customer.carts.each do |f|
      order.product_id = f.product_id;
      order.quantity = f.quantity;
      order.price = f.product.price;
      f.destroy
    end
    order.save;
    # order = Order.new(order_params)
    # order.customer_id = current_customer.id
    # order.save
    # current_customer.carts.each do |f|
    #   op = Order.new(product_id: f.product.id , quantity: f.quantity , price: f.product.price)
    #   op.save
    #   f.destroy
    # end
    redirect_to customer_orders_thanks_path
  end

  # 更新処理は行わない
  # 配送先変更ページなどがあれば別
  # あまりサイトで見ないため今回はカット
  def update
    @customer = current_customer
    # @customer = Customer.find(params[:customer_id])

    if @customer.update(customer_params)
      if params[:select_address] == "new_deliverey_address"
        redirect_to customer_orders_confirm_path(new_deliverey_address: true,customer_new_params: customer_new_params)
      else
        redirect_to customer_orders_confirm_path(new_deliverey_address: false)
      end
    else
      redirect_to new_customer_order_path
    end
  end

  # 確認画面なので、データベースにデータは入れない。
  # 表示する項目だけを確認画面へ送る。
  def confirm
    @customer = current_customer
    @cart = current_customer.carts
    # orderオブジェクトがパラメーターになかったため、
    # ここではorder_paramsではなく、直接param[:order]と指定するか、formでorderを送信する必要がある。
    @order = Order.new(params[:order])
    # if params['new_deliverey_address'] == "false"
    #   @order.postcode = current_customer.postcode
    #   @order.email = current_customer.email
    #   @order.name = current_customer.name
    #   @order.name_kana = current_customer.name_kana
    #   @order.phone_namber = current_customer.phone_namber
    #   @order.prefecture_code = current_customer.prefecture_code
    #   @order.address_city = current_customer.address_city
    #   @order.address_street = current_customer.address_street
    # else
    #   @new_address = params[:new_deliverey_address]
    #   @email_new = params[:customer_new_params][:email_new]
    #   @phone_namber_new = params[:customer_new_params][:phone_namber_new]
    #   @name_kana_new = params[:customer_new_params][:name_kana_new]
    #   @name_new = params[:customer_new_params][:name_new]
    #   @postcode_new = params[:customer_new_params][:postcode_new]
    #   @prefecture_code_new = params[:customer_new_params][:prefecture_code_new]
    #   @address_city_new = params[:customer_new_params][:address_city_new]
    #   @address_street_new = params[:customer_new_params][:address_street_new]
    #   @order.postcode = @postcode_new
    #   @order.email = @email_new
    #   @order.name = @name_new
    #   @order.name_kana = @name_kana_new
    #   @order.phone_namber = @phone_namber_new
    #   @order.prefecture_code = @prefecture_code_new
    #   @order.address_city = @address_city_new
    #   @order.address_street = @address_street_new
    # end
    
    if params['new_deliverey_address'] == "true"
      @info_email = params[:customer_new_params][:email_new]
      @info_phone_namber = params[:customer_new_params][:phone_namber_new]
      @info_name_kana = params[:customer_new_params][:name_kana_new]
      @info_name = params[:customer_new_params][:name_new]
      @info_postcode = params[:customer_new_params][:postcode_new]
      @info_prefecture_code = params[:customer_new_params][:prefecture_code_new]
      @info_address_city = params[:customer_new_params][:address_city_new]
      @info_address_street = params[:customer_new_params][:address_street_new]
    else
      @info_email = current_customer.email
      @info_phone_namber = current_customer.phone_namber
      @info_name_kana = current_customer.name_kana
      @info_name = current_customer.name
      @info_postcode = current_customer.postcode
      @info_prefecture_code = current_customer.prefecture_code
      @info_address_city = current_customer.address_city
      @info_address_street = current_customer.address_street
    end
    @order.postcode = @info_postcode
    @order.email = @info_email
    @order.name = @info_name
    @order.name_kana = @info_name_kana
    @order.phone_namber = @info_phone_namber
    @order.prefecture_code = @info_prefecture_code
    @order.address_city = @info_address_city
    @order.address_street = @info_address_street
  end

  def thanks
  end

  def index
    # @orders = current_customer.orders.all
    @orders = Order.where(customer_id: current_customer.id)
  end

  private
  def order_params
    #requireを忘れていたため、orderのオブジェクトが指定されていなかった。
    #viewのinputのnameがaddress_sityになっていたため、エラーでた。
    #プロジェクト内のaddress_sity → address_cityに戻しました
    params.require(:order).permit(:payment_method, :postcode, :name_kana, :name ,:phone_namber, :prefecture_code, :address_city, :address_street, :email)
  end

  def customer_params
    params.require(:customer_form).permit(:postcode, :name_kana, :name ,:phone_namber, :prefecture_code, :address_city, :address_street, :email)
  end

  def customer_new_params
    params.require(:customer_form).permit(:postcode_new, :name_kana_new, :name_new ,:phone_namber_new, :prefecture_code_new, :address_city_new, :address_street_new, :email_new)
  end


end
