class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :color, :style, :category, :price, :image, :materials

  has_one :product_image


  def product_image
    Refile.attachment_url(object, :note_image)
  end

end
