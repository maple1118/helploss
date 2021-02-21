class Cart < ApplicationRecord

  belongs_to :customer
  belongs_to :product
  belongs_to :order, optional: true
end
