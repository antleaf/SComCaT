class CreateEditorialStates < ActiveRecord::Migration[6.0]
  def change
    create_table :editorial_states do |t|
      t.string :name
      t.string :description
      t.string :slug
      t.timestamps
    end
  end
end
