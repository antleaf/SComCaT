class AddEditorialStateToTechnologies < ActiveRecord::Migration[6.0]
  def change
    add_reference :technologies, :editorial_state, foreign_key: true
  end
end
