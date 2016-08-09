class Product < ApplicationRecord
  has_many :orders, through: :orderings
  has_many :orderings
  has_many :sizes, through: :sizings
  has_many :sizings
end
