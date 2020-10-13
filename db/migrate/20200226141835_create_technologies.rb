class CreateTechnologies < ActiveRecord::Migration[6.0]
  def change
    create_table :technologies do |t|
      t.string :name
      t.string :description
      t.string :url
      t.text :notes
      t.references :adoption_level, null: false, foreign_key: true
      t.references :readiness_level, null: false, foreign_key: true
      t.timestamps
    end
  end
end
