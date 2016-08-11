class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :color, :style, :category, :price, :image, :materials, :product_image

  has_many :sizes
  has_many :sizings


  def product_image
    Refile.attachment_url(object, :product_image)
  end

end
