class OrderingsSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :size, :product_id, :product_image, :unit_price, :productname

  def product_id
    object.product.id
  end

  def product_image
    object.product.product_image_url
  end

  def productname
    object.product.name
  end

end
