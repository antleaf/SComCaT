class AddSlugToAdoptionLevels < ActiveRecord::Migration[6.0]
  def change
    add_column :adoption_levels, :slug, :string
    add_index :adoption_levels, :slug, unique: true
  end
end
