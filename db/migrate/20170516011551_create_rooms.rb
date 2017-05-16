class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :nombre
      t.integer :precio
      t.float :lat
      t.float :long
      t.string :ubicacion
      t.string :reseña
      t.string :propietario

      t.timestamps
    end
  end
end
