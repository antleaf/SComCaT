class CreateReadinessLevels < ActiveRecord::Migration[6.0]
  def change
    create_table :readiness_levels do |t|
      t.string :name
      t.string :description
      t.text :notes

      t.timestamps
    end
  end
end
