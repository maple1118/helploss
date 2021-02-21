class Customer::CustomersController < ApplicationController
  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
       redirect_to edit_customer_customer_path(current_customer.id), notice: "登録情報を編集しました"
    else
       render :edit
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :name_kana, :email, :phone_namber, :postcode, :prefecture_code, :address_city, :address_street)
  end
end
