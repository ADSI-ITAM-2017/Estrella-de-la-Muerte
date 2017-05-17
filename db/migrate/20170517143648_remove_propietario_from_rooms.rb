class RemovePropietarioFromRooms < ActiveRecord::Migration[5.1]
  def change
    remove_column :rooms, :propietario, :string
  end
end
