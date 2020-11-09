class AddPropertiesToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :forenames, :string
    add_column :users, :lastname, :string
  end
end
