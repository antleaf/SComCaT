class AddSlugToRoles < ActiveRecord::Migration[6.0]
  def change
    add_column :roles, :slug, :string
    add_index :roles, :slug, unique: true
  end
end
