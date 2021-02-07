class Product < ApplicationRecord
  
  attachment :image
  has_many :carts, dependent: :destroy
end
