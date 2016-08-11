class CheckoutSerializer < ActiveModel::Serializer
  attributes :id, :subtotal, :shipping_price, :taxes, :total

  has_many :orderings, serializer: OrderingsSerializer
end
