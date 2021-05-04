class DropTableRelationships < ActiveRecord::Migration[6.0]
  def change
    drop_table :relationships
  end
end
