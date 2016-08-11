class AddSizingsToOrderings < ActiveRecord::Migration[5.0]
  def change
    add_reference :orderings, :size, index: true
  end
end
