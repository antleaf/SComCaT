class AddSlugToFunctions < ActiveRecord::Migration[6.0]
  def change
    add_column :functions, :slug, :string
    add_index :functions, :slug, unique: true
  end
end
