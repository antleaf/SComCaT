class AddGovernancesToTechnology < ActiveRecord::Migration[6.0]
  def change
    add_reference :technologies, :governance, foreign_key: true
  end
end
