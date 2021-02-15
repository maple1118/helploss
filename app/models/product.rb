class Product < ApplicationRecord
  
  attachment :image
  belongs_to :carts, dependent: :destroy
  # has_many :orders, dependent: :destroy
end
