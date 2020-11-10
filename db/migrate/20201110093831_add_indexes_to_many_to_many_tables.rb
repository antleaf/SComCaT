class AddIndexesToManyToManyTables < ActiveRecord::Migration[6.0]
  def change
    add_index :functions_technologies, [:technology_id, :function_id], unique: true, name: 'index_func_tech_1'
    add_index :functions_technologies, [:function_id, :technology_id], unique: true, name: 'index_func_tech_2'
    add_index :collections_technologies, [:technology_id, :collection_id], unique: true, name: 'index_coll_tech_1'
    add_index :collections_technologies, [:collection_id, :technology_id], unique: true, name: 'index_coll_tech_2'
    add_index :categories_technologies, [:technology_id, :category_id], unique: true, name: 'index_cat_tech_1'
    add_index :categories_technologies, [:category_id, :technology_id], unique: true, name: 'index_cat_tech_2'
  end
end
