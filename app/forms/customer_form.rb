class CustomerForm
  include ActiveModel::Model
  attr_accessor :name, :name_kana, :phone_namber, :email, :postcode, :prefecture_code, :address_city, :address_street, :payment_method, :name_new, :name_kana_new, :phone_namber_new, :email_new, :postcode_new, :prefecture_code_new, :address_city_new, :address_street_new, :payment_method_new
  # validates :name, presence: true
end