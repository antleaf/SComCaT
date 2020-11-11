class AddEditorialColumnToAllModels < ActiveRecord::Migration[6.0]
  def change
    add_column :business_forms, :editorial, :text
    add_column :adoption_levels, :editorial, :text
    add_column :categories, :editorial, :text
    add_column :collections, :editorial, :text
    add_column :functions, :editorial, :text
    add_column :governances, :editorial, :text
    add_column :readiness_levels, :editorial, :text
    add_column :roles, :editorial, :text
    add_column :statuses, :editorial, :text
    add_column :users, :editorial, :text
  end
end
