class DefaultRoleonUserGuest < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :role, :string, default: "guest"
  end
end
