class JoinTableTechnologyCollection < ActiveRecord::Migration[6.0]
  def change
    create_join_table :technologies, :collections do |t|
      # t.index [:technology_id, :collection_id]
      # t.index [:collection_id, :technology_id]
    end
  end
end
