class AddEditorialToTechnologies < ActiveRecord::Migration[6.0]
  def change
    add_column :technologies, :editorial, :text
  end
end
