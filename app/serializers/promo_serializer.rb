class PromoSerializer < ActiveModel::Serializer
  attributes :id, :promo_image, :product_id

  belongs_to :product

  def product_image
    Refile.attachment_url(object, :promo_image)
  end

end
