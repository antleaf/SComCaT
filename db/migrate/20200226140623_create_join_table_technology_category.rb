class CreateJoinTableTechnologyCategory < ActiveRecord::Migration[6.0]
  def change
    create_join_table :technologies, :categories do |t|
      # t.index [:technology_id, :category_id]
      # t.index [:category_id, :technology_id]
    end
  end
end
