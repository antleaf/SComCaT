class AddSlugToReadinessLevels < ActiveRecord::Migration[6.0]
  def change
    add_column :readiness_levels, :slug, :string
    add_index :readiness_levels, :slug, unique: true
  end
end
