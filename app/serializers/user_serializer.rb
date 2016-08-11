class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :role

  has_one :order



  def order
    object.current_order
  end

end
