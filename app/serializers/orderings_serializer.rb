class OrderingsSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :size, :product_id, :product_image

  def product_id
    object.product.id
  end

  def product_image
    object.product.product_image_url
  end
  
end
