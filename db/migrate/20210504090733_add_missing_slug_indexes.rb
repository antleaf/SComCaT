class AddMissingSlugIndexes < ActiveRecord::Migration[6.0]
  def change
    add_index :business_forms, :slug, unique: true
    add_index :editorial_states, :slug, unique: true
    add_index :statuses, :slug, unique: true
  end
end
