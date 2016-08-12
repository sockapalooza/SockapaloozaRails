class Sizing < ApplicationRecord
  belongs_to :size
  belongs_to :product

  def admin_display
    size.size + ": " + quantity.to_s
  end

end
