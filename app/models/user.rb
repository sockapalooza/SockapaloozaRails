class User < ApplicationRecord
  has_secure_password validations: false
  has_many :orders
  has_many :shippings

  validates :username, uniqueness: true, presence: true, format: {:with => /\A[a-zA-Z0-9\-_]+\z/},
            unless: :guest?
  validates :password, presence: true, unless: :guest?
  validates :email, uniqueness: true, presence: true,
            format: {:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/}, unless: :guest?


   def active_orders
     orders.includes(:order_status).where(order_statuses: {name: ["In Progress", "Billing"]}).order("orders.created_at DESC")
   end

  def guest?
    role == "guest"
  end

  def current_order
    if active_orders.any?
      active_orders.last
    else
      orders.create!
    end
  end


end
