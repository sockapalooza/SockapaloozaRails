class OrderSerializer < ActiveModel::Serializer
  attributes :id, :status, :orderings

  has_many :orderings, serializer: OrderingsSerializer

  def status
    object.order_status.name
  end
end
