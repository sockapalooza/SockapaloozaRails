class OrderSerializer < ActiveModel::Serializer
  attributes :id, :status

  has_many :orderings

  def status
    object.order_status.name
  end
end
