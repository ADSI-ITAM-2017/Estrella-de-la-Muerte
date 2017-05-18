class AddUsuarioIdToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :usuario_id, :integer
  end
end
