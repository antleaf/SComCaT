class ConvertDescriptionsToTextFields < ActiveRecord::Migration[6.0]
  def change
    change_column :adoption_levels, :description, :text
    change_column :business_forms, :description, :text
    change_column :categories, :description, :text
    change_column :collections, :description, :text
    change_column :functions, :description, :text
    change_column :governances, :description, :text
    change_column :readiness_levels, :description, :text
    change_column :statuses, :description, :text
    change_column :technologies, :description, :text
    change_column :roles, :description, :text
  end
end
