class CreateCollections < ActiveRecord::Migration[6.0]
  def change
    create_table :collections do |t|
      t.string :name
      t.string :description
      t.text :notes
      t.string :slug

      t.timestamps
    end
    add_index :collections, :slug, unique: true
  end
end
