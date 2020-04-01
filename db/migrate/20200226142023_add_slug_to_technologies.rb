class AddSlugToTechnologies < ActiveRecord::Migration[6.0]
  def change
    add_column :technologies, :slug, :string
    add_index :technologies, :slug, unique: true
  end
end
