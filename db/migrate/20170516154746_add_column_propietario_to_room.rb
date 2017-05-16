class AddColumnPropietarioToRoom < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :column_propietario, :string
  end
end
