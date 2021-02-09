class Cart < ApplicationRecord
  
  belongs_to :customer
  belongs_to :product
  has_many :orders
end
