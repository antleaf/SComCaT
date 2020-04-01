class CreateAdoptionLevels < ActiveRecord::Migration[6.0]
  def change
    create_table :adoption_levels do |t|
      t.string :name
      t.string :description
      t.text :notes

      t.timestamps
    end
  end
end
