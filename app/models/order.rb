class Order < ApplicationRecord
  belongs_to :cart, optional: true
  belongs_to :customer, optional: true
  belongs_to :product, optional: true
end
