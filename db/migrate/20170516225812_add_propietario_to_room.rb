class AddPropietarioToRoom < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :propietario, :string
  end
end
