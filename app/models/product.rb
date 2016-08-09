class Product < ApplicationRecord
  has_many :orders through :orderings
  has_many :orderings
end
