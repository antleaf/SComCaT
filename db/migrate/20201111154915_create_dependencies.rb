class CreateDependencies < ActiveRecord::Migration[6.0]
  def change
    create_table :dependencies do |t|
      t.references :technology, null: false, foreign_key: true
      t.references :dependee, null: false, foreign_key: { to_table: :technologies }
      t.index [:technology_id, :dependee_id], unique: true
      t.timestamps
    end
  end
end
