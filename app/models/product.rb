class Product < ApplicationRecord
  
  attachment :image
  has_many :carts, dependent: :destroy
  # has_many :orders, dependent: :destroy
end
