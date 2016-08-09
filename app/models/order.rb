class Order < ApplicationRecord
  has_many :products through :orderings
  has_many :orderings

end
