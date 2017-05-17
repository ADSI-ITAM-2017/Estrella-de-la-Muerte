class AddDescripcionToRooms < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :descripcion, :string
  end
end
