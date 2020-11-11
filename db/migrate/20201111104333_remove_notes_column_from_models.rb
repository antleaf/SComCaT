class RemoveNotesColumnFromModels < ActiveRecord::Migration[6.0]
  def change
    remove_column :technologies, :notes
    remove_column :adoption_levels, :notes
    remove_column :business_forms, :notes
    remove_column :categories, :notes
    remove_column :collections, :notes
    remove_column :functions, :notes
    remove_column :governances, :notes
    remove_column :readiness_levels, :notes
    remove_column :statuses, :notes
  end
end
