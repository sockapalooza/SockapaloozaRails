class Promo < ApplicationRecord
  belongs_to :product

  attachment :promo_image
end
