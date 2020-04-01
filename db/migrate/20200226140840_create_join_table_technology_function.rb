class CreateJoinTableTechnologyFunction < ActiveRecord::Migration[6.0]
  def change
    create_join_table :technologies, :functions do |t|
      # t.index [:technology_id, :function_id]
      # t.index [:function_id, :technology_id]
    end
  end
end
