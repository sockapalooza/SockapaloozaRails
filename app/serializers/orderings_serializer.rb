class OrderingsSerializer < ActiveModel::Serializer
  attributes :id, :quantity

  belongs_to :product

end
