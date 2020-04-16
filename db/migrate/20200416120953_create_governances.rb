class CreateGovernances < ActiveRecord::Migration[6.0]
  def change
    create_table :governances do |t|
      t.string :name
      t.string :description
      t.text :notes
      t.string :slug

      t.timestamps
    end
    add_index :governances, :slug, unique: true
  end
end
