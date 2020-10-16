class CreateStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :statuses do |t|
      t.string :name
      t.string :description
      t.string :slug
      t.text :notes

      t.timestamps
    end
  end
end
