class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.string :predicate
      t.references :subj, null: false, foreign_key: { to_table: 'technologies' }
      t.references :obj, null: false, foreign_key: { to_table: 'technologies' }

      t.timestamps
    end
  end
end


