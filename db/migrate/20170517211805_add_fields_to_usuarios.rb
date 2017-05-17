class AddFieldsToUsuarios < ActiveRecord::Migration[5.1]
  def change
    add_column :usuarios, :first_name, :string
    add_column :usuarios, :last_name, :string
    add_column :usuarios, :telefono, :integer
  end
end
