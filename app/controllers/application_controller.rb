class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters , if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :name_kana, :postcode, :prefecture_code, :address_city, :address_street, :phone_namber])
  end
end
