class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.integer :precio
      t.string :ubicacion
      t.float :lat
      t.float :lon
      t.string :nombre
      t.string :resena

      t.timestamps null: false
    end
  end
end
