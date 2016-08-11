class Size < ApplicationRecord
  has_many :sizings
  has_many :products, through: :sizings
  has_many :orderings
end
