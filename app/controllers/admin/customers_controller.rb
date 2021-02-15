class Admin::CustomersController < ApplicationController
  
  def index
    @customers = Customer.all
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:success] = '個人情報を編集しました'
      redirect_to admin_customer_path(@customer)
    else
      flash[:danger] = '個人情報の編集に失敗しました'
      render :edit
    end
  end
  
  private
  def customer_params
    params.require(:customer).permit(:name, :name_kana, :phone_namber, :email, :postcode, :prefecture_code, :address_city, :address_street)
  end
  
end
